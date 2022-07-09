using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class ViewApartment : System.Web.UI.Page
    {
        private IRepo repo;
        private IList<ApartmentPicture> _pictures;
        private IList<TextBox> _userFields;
        private IList<RequiredFieldValidator> _errors;
        private IList<User> _users;
        private Apartment _apartment;
        private IList<Tag> _apartmentTags;
        private IList<Tag> _apartmentMissingTags;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ApartmentID"] == null)
            {
                Response.Redirect("Apartments.aspx");
            }
            if (!IsPostBack)
            {
                InitFields();
                LoadData();
            }
            else
            {
                SessionData();

            }

            InitUserField();

        }

        private void SessionData()
        {
            repo = RepoFactory.GetRepo();
            _apartment = ((DBRepo)Application["database"]).GetApartmentByID((int)Session["ApartmentID"]);
            _apartmentTags = (IList<Tag>)ViewState["tags"];
            _apartmentMissingTags = (IList<Tag>)ViewState["missingTags"];
            _pictures = (IList<ApartmentPicture>)ViewState["pictures"];
            _users = (IList<User>)ViewState["users"];

        }

        private void InitFields()
        {
            repo = RepoFactory.GetRepo();
            _pictures = ((DBRepo)Application["database"]).GetPicturesByApartmentID((int)Session["ApartmentID"]);
            _apartment = ((DBRepo)Application["database"]).GetApartmentByID((int)Session["ApartmentID"]);
            _users = ((DBRepo)Application["database"]).LoadUsers();
            _apartmentTags = ((DBRepo)Application["database"]).GetTagsByApartmentID((int)Session["ApartmentID"]);
            _apartmentMissingTags = ((DBRepo)Application["database"]).GetAllTags(); ;

            ViewState["pictures"] = _pictures;
            ViewState["tags"] = _apartmentTags;
            ViewState["missingTags"] = _apartmentMissingTags;
            ViewState["users"] = _users;
        }

        private void InitUserField()
        {
            _userFields = new List<TextBox>();
            _errors = new List<RequiredFieldValidator>();
            foreach (Control control in pnlUnregistered.Controls)
            {
                if (control is TextBox tb)
                {
                    _userFields.Add(tb);
                }
                else if (control is RequiredFieldValidator rfv)
                {
                    rfv.Visible = false;
                    _errors.Add(rfv);
                }
            }

            pnlTags.Controls.Clear();
            foreach (Tag tag in _apartmentTags)
            {
                Button btn = new Button
                {
                    Text = tag.Name,
                    CssClass = "btn btn-dark m-1"
                };
                btn.CausesValidation = false;
                btn.Click += ButtonTagRemove;
                pnlTags.Controls.Add(btn);
            }


        }

        private void LoadData()
        {
            rptImgs.DataSource = _pictures;
            rptImgs.DataBind();

            rptRegisteredUsers.DataSource = _users;
            rptRegisteredUsers.DataBind();

            rptRepresentativePictures.DataSource = _pictures;
            rptRepresentativePictures.DataBind();

            foreach (Tag tag in _apartmentTags)
            {
                _apartmentMissingTags.Remove(tag);
            }

            ddlTags.DataSource = _apartmentMissingTags;
            ddlTags.DataBind();
            ddlTags.Items.Insert(0, "-- Choose new tag --");

            for (int i = 0; i < rptRepresentativePictures.Controls.Count; i++)
            {
                if (rptRepresentativePictures.Controls[i].Controls[1] is CheckBox cb)
                {
                    cb.Checked = _pictures[i].IsRepresentative;
                }
            }

            

            AppendText();
        }

        private void checkPictures()
        {
            for (int i = 0; i < rptRepresentativePictures.Controls.Count; i++)
            {
                if (rptRepresentativePictures.Controls[i].Controls[1] is CheckBox c && c.Checked == false)
                {
                    c.Enabled = false;
                }
                else if(rptRepresentativePictures.Controls[i].Controls[1] is CheckBox cb && cb.Checked == true)
                {
                    cb.Enabled = true;
                }
            }
            
        }

        private void AppendText()
        {
            txtAptName.Text = _apartment.Name;
            txtAdults.Text = _apartment.MaxAdults.ToString();
            txtChildren.Text = _apartment.MaxChildren.ToString();
            txtPrice.Text = _apartment.Price.ToString();
            txtRooms.Text = _apartment.TotalRooms.ToString();

            switch (_apartment.Status.Name)
            {
                case "Slobodno":
                    ddlStatus.SelectedIndex = 2;
                    break;
                case "Rezervirano":
                    ddlStatus.SelectedIndex = 0;
                    break;
                case "Zauzeto":
                    ddlStatus.SelectedIndex = 1;
                    break;
                default:
                    ddlStatus.SelectedIndex = 2;
                    break;
            }
        }

        private void ButtonTagRemove(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            Tag tag = ((DBRepo)Application["database"]).GetTagByTagName(button.Text);
            _apartmentTags.Remove(tag);
            _apartmentMissingTags.Add(tag);
            SessionData();


        }


        protected void ApartmentStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string selectedValue = ddl.SelectedValue;
            switch (selectedValue)
            {
                case "R":
                    pnl.Visible = true;
                    break;
                case "Z":
                    pnl.Visible = true;
                    break;
                case "S":
                    pnl.Visible = false;
                    break;
                default:
                    break;
            }
            RestartInputs();
            SessionData();
        }

        private void RestartInputs()
        {
            foreach (var textBox in _userFields)
            {
                textBox.Text = "";
            }
            ViewState["user"] = null;
            pnlUser.Visible = false;
        }
        protected void btnRegUser_Click(object sender, EventArgs e)
        {
            pnlUnregistered.Visible = false;
            pnlRegistered.Visible = true;
            RestartInputs();
            SessionData();
        }

        protected void btnUnregUser_Click(object sender, EventArgs e)
        {
            if (pnlUnregistered.Visible == false)
            {
                RestartInputs();
                pnlUnregistered.Visible = true;
                SessionData();
            }

        }


        private bool UserValidationValid()
        {
            bool ok = true;
            for (int i = 0; i < _userFields.Count; i++)
            {
                ok &= !String.IsNullOrEmpty(_userFields[i].Text);
                _errors[i].Text = "* Required field";
            }
            return ok;
        }

        protected void btnSubmitUser_Click(object sender, EventArgs e)
        {
            if (UserValidationValid())
            {
                pnl.Visible = false;
                ddlStatus.Enabled = false;
                ViewState["user"] = new User
                {
                    UserName = txtFName.Text + " " + txtLName.Text,
                    Email = txtEmail.Text,
                    PhoneNumber = txtPhone.Text,
                    Address = txtPhone.Text
                };
                ShowUser();
                pnlUser.Visible = true;
            }
            SessionData();
        }

        protected void btnChooseUser_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            User u = ((DBRepo)Application["database"]).GetUserByID(int.Parse(btn.CommandArgument));
            ViewState["user"] = u;
            pnlRegistered.Visible = false;
            ShowUser();
            pnlUser.Visible = true;
            SessionData();
        }

        private void ShowUser()
        {
            User u = (User)ViewState["user"];
            uFName.Text = u.FName + " " + u.LName;
            uPhone.Text = u.PhoneNumber;
            uAddress.Text = u.Address;

        }


        protected void ddlTags_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string tagName = ddl.SelectedItem.Value;
            Tag tag = ((DBRepo)Application["database"]).GetTagByTagName(tagName);
            _apartmentTags.Add(tag);
            _apartmentMissingTags.Remove(tag);
            ddl.Items.Remove(ddl.SelectedItem);
            ViewState["tags"] = _apartmentTags;
            ViewState["missingTags"] = _apartmentMissingTags;
            LoadData();
            InitUserField();

        }

        

        protected void btnDeleteApt_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["ApartmentID"].ToString());
            repo.DeleteApartmentByID(id);
            Session["ApartmentID"] = null;
            Session["lblAction"] = $"<label class='alert alert-danger w-75'>{_apartment.Name} succesfully deleted!</label>";
            Response.Redirect("Apartments.aspx");
        }

        protected void btnSaveApartment_Click(object sender, EventArgs e)
        {
            if (FormValid())
            {
                Apartment apartment = new Apartment
                {
                    Id = (int)Session["ApartmentID"],
                    Name = txtAptName.Text,
                    Price = float.Parse(txtPrice.Text),
                    TotalRooms = int.Parse(txtRooms.Text),
                    MaxAdults = int.Parse(txtAdults.Text),
                    MaxChildren = int.Parse(txtChildren.Text),
                    Status = getStatus(ddlStatus.SelectedValue)
                };
                if (ViewState["user"] == null && ddlStatus.SelectedValue == "S")
                {
                    repo.UpdateApartment(apartment, _pictures, _apartmentTags, _apartmentMissingTags);
                }
                else if (ViewState["user"] != null)
                {
                    User user = (User)ViewState["user"];
                    repo.UpdateApartmentWithUser(apartment, user, _pictures, _apartmentTags, _apartmentMissingTags);
                }
                Session["lblAction"] = $"<label class='alert alert-success w-75'>{_apartment.Name} succesfully updated!</label>";
                Response.Redirect("Apartments.aspx");
                
            }

        }

        private ApartmentStatus getStatus(string selectedValue)
        {
            SessionData();
            switch (selectedValue)
            {
                case "S":
                    return repo.GetStatusByName("Slobodno");
                case "R":
                    return repo.GetStatusByName("Rezervirano");
                case "Z":
                    return repo.GetStatusByName("Zauzeto");
                default:
                    return null;
            }
        }

        private bool FormValid()
        {
            bool ok = false;
            if (ddlStatus.SelectedValue != "S" && ViewState["user"] == null)
            {
                return false;
            }
            if (String.IsNullOrEmpty(txtAptName.Text))
            {
                return false;
            }
            foreach (ApartmentPicture picture in _pictures)
            {
                if (picture.IsRepresentative)
                {
                    ok = true;
                }
            }

            return ok;
        }

        protected void Number_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            if (int.Parse(tb.Text) < 1 && tb.ID == txtAdults.ID)
            {
                tb.Text = "1";
                return;
            }
            else if (int.Parse(tb.Text) < 0)
            {
                tb.Text = "0";
            }
        }

        protected void cbChoosenImage_CheckedChanged(object sender, EventArgs e)
        {
           
            CheckBox cb = (CheckBox)sender;
            if (cb.Checked)
            {
                for (int i = 0; i < rptRepresentativePictures.Controls.Count; i++)
                {
                    if (rptRepresentativePictures.Controls[i].Controls[1] is CheckBox c && c != cb)
                    {
                        c.Enabled = false;
                        _pictures[i].IsRepresentative = false;
                    }
                    else
                    {
                        _pictures[i].IsRepresentative = true;
                    }
                }
                ViewState["images"] = _pictures;
                LoadData();
                checkPictures();
            }
            else
            {
                for (int i = 0; i < rptRepresentativePictures.Controls.Count; i++)
                {
                    if (rptRepresentativePictures.Controls[i].Controls[1] is CheckBox c && c != cb)
                    {
                        c.Enabled = true;
                    }
                    _pictures[i].IsRepresentative = false;
                }
                ViewState["images"] = _pictures;
                LoadData();
            }
           
            
        }
    }
}