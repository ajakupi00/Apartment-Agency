using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class Tags : System.Web.UI.Page
    {
        private IList<Tag> _tags;
        private IList<TagType> _types;
        private IRepo _repo = RepoFactory.GetRepo();


        protected void Page_Load(object sender, EventArgs e)
        {
            _tags = ((DBRepo)Application["database"]).GetAllTags();
            _types = ((DBRepo)Application["database"]).GetAllTagTypes();
            if (!IsPostBack)
            {
                LoadData();
            }

        }

        private void LoadData()
        {
            _tags = ((DBRepo)Application["database"]).GetAllTags();
            tagGrid.DataSource = _tags;
            tagGrid.DataBind();

            _types = ((DBRepo)Application["database"]).GetAllTagTypes();
            ddlType.DataSource = _types;
            ddlType.DataBind();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            LoadData();

        }

        protected void tagGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tagGrid.DataKeys[e.RowIndex].Value);

            int row = _repo.DeleteTagByID(id);
            if (row != 0)
            {
                LoadData();
            }
        }

        protected void tagGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tagGrid.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void tagGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string n = Convert.ToString(DataBinder.Eval(e.Row.DataItem, nameof(Tag.ApartmentsHave)));
                Button lnkbtnresult = (Button)e.Row.FindControl("btnDelete");
                if (lnkbtnresult != null && n != "0")
                {
                    lnkbtnresult.Visible = false;
                }
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells.Clear();
                TableCell cell = new TableCell();
                cell.ColumnSpan = 5;
                cell.Controls.Add(new HtmlAnchor { InnerHtml = "<button type='button' class='btn btn-outline-primary w-100' data-toggle='modal' data-target='#exampleModal'>Add new Tag</button>" });
                cell.Style.Add(HtmlTextWriterStyle.Width, "100%");
                e.Row.Cells.Add(cell);
            }
        }

        protected void btnSaveTag_Click(object sender, EventArgs e)
        {
            TagType tagType = _types.FirstOrDefault(t => t.Name == ddlType.SelectedValue);
            Tag tag = new Tag
            {
                Name = txtName.Text,
                NameEng = txtEngName.Text,
                Type = tagType
            };
            _tags.Add(tag);
            ((DBRepo)Application["database"]).CreateTag(tag);
            LoadData();

        }
    }
}
