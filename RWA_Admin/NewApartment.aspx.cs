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
        }

        protected void Number_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            if (int.Parse(tb.Text) < 1 && tb.ID == txtPrice.ID)
            {
                tb.Text = "1";
                return;
            }
            else if (int.Parse(tb.Text) < 0)
            {
                tb.Text = "0";
            }
        }

        protected void btnChooseFile_Click(object sender, EventArgs e)
        {

            string name = FileUpload.FileName.ToString();
            string path = "/Images/" + name;
            if (!File.Exists(Request.PhysicalApplicationPath + path))
            {
                return;
            }
            FileUpload.SaveAs(Request.PhysicalApplicationPath + path);
            _pictures.Add(new ApartmentPicture
            {
                Name = name,
                Path = path
            });
            ViewState["pictures"] = _pictures;
            LoadData();
        }

        private void LoadData()
        {
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
            foreach (Tag tag in _tags)
            {
                tags.Controls.Add(new Button
                {
                    Text = tag.Name,
                    CssClass = "btn btn-light btn-tag mr-1"
                });
            }


        }
    }
}