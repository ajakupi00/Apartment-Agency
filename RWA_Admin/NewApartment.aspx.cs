using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class NewApartment : System.Web.UI.Page
    {
        private IList<ApartmentPicture> _pictures;
        private IList<Tag> _tags;

        private IRepo _repo;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                InitList();
                FileUpload.Controls.Clear();
            }
            else
            {
                LoadFromViewState();
            }
        }


        private void InitList()
        {
            _pictures = new List<ApartmentPicture>();
            ViewState["pictures"] = _pictures;

            _repo = RepoFactory.GetRepo();

            ddlTags.DataSource = ((DBRepo)Application["database"]).GetAllTags();
            ddlTags.DataBind();
            ddlTags.Items.Insert(0, "-- Select tag -- ");
            _tags = new List<Tag>();
            ViewState["tags"] = _tags;
        }

        private void LoadFromViewState()
        {
            _pictures = (IList<ApartmentPicture>)ViewState["pictures"];
            _tags = (IList<Tag>)ViewState["tags"];
            _repo = RepoFactory.GetRepo();
        }

        protected void Number_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            if (float.Parse(tb.Text) < 1 && tb.ID == txtPrice.ID)
            {
                tb.Text = "1";
                return;
            }
            else if (float.Parse(tb.Text) < 0)
            {
                tb.Text = "0";
            }
        }

        protected void btnChooseFile_Click(object sender, EventArgs e)
        {

            string name = FileUpload.FileName.ToString();
            byte[] imgBytes = FileUpload.FileBytes;

            _pictures.Add(new ApartmentPicture
            {
                Name = name,
                Path = name,
                DATA = Convert.ToBase64String(imgBytes)
            });
            ViewState["pictures"] = _pictures;
            LoadData();
        }

        private void LoadData()
        {

            rptTags.DataSource = _tags;
            rptTags.DataBind();

            rptImages.DataSource = _pictures;
            rptImages.DataBind();
        }



        protected void ddlTags_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string tagName = ddl.SelectedValue;
            Tag selectedTag = ((DBRepo)Application["database"]).GetTagByTagName(tagName);
            _tags.Add(selectedTag);
            ddl.Items.Remove(selectedTag.Name);
            ViewState["tags"] = _tags;
            LoadData();


        }

        protected void Tag_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Tag tag = _repo.GetTagByTagName(btn.Text);
            ddlTags.Items.Add(tag.Name);
            _tags.Remove(tag);
            LoadData();
        }

        protected void btnRemovePicture_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            btn.Parent.Controls.Clear();
            _pictures.Remove(new ApartmentPicture { Name = btn.CommandArgument });
            LoadData();
        }

        protected void cbSelectedImg_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;
            IList<CheckBox> checks = new List<CheckBox>();
            foreach (Control rctl in cb.Parent.Parent.Controls)
            {
                foreach (Control ctl in rctl.Controls)
                {
                    if (ctl is CheckBox c)
                    {
                        if (c != cb)
                        {
                            checks.Add(c);
                        }
                    }
                }

            }
            if (cb.Checked)
            {
                ManageOtherCheckBoxs(checks, cb);

            }
            else
            {
                ManageOtherCheckBoxs(checks, cb);
            }

            ViewState["pictures"] = _pictures;
        }

        private void ManageOtherCheckBoxs(IList<CheckBox> checks, CheckBox cb)
        {
            for (int i = 0; i < checks.Count; i++)
            {
                if (cb.Checked)
                {
                    checks[i].Checked = false;
                    checks[i].Enabled = false;
                }
                else
                {
                    checks[i].Checked = false;
                    checks[i].Enabled = true;
                }
            }

            foreach (Control rctl in cb.Parent.Parent.Controls)
            {
                int i = 0;
                foreach (Control control in rctl.Controls)
                {
                    if (control is CheckBox)
                    {
                        i++;
                    }
                }

                for (int j = 0; j < i; j++)
                {

                    if (rctl.Controls[i] is CheckBox c)
                    {
                        if (c != cb)
                        {
                            c = checks[i];
                            _pictures[i].IsRepresentative = false;
                        }
                        else
                        {
                            _pictures[i].IsRepresentative = true;
                        }
                    }
                }

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Session["lblAction"] = null;
            Response.Redirect("Apartments.aspx");


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                City city = ((DBRepo)Application["database"]).GetCityByName(txtCity.Text);
                int bd;
                if (!string.IsNullOrEmpty(txtBD.Text))
                {
                    bd = int.Parse(txtBD.Text);
                }

                Apartment apartment = new Apartment
                {
                    Name = txtName.Text,
                    NameEng = txtEngName.Text,
                    Price = float.Parse(txtPrice.Text),
                    TotalRooms = int.Parse(txtTotalRooms.Text),
                    MaxAdults = int.Parse(txtAdults.Text),
                    MaxChildren = int.Parse(txtChildren.Text),
                    Address = txtAddress.Text,
                    City = city,
                    BeachDistance = (!string.IsNullOrEmpty(txtBD.Text)) ? int.Parse(txtBD.Text) : 0,
                    Owner = new ApartmentOwner
                    {
                        Name = txtOwner.Text
                    }
                };
                _repo.CreateApartment(apartment, _pictures, _tags);
                Session["lblAction"] = $"<label class='alert alert-success w-75'>{apartment.Name} succesfully added!</label>";
                Response.Redirect("Apartments.aspx");
            }
        }


    }
}