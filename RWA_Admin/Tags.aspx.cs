using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class Tags : System.Web.UI.Page
    {
        private IList<Tag> _tags;
        private IRepo _repo = RepoFactory.GetRepo();

        public SortDirection direction
        {
            get
            {
                if (ViewState["directionState"] == null)
                {
                    ViewState["directionState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["directionState"];
            }
            set
            {
                ViewState["directionState"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _tags = ((DBRepo)Application["database"]).GetAllTags();
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
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells.Clear();
                TableCell cell = new TableCell();
                cell.ColumnSpan = 5;
                //cell.Text =  "<button class='bnt btn-primary'>Add</button>";
                cell.Controls.Add(new Button
                {
                    ID = "addBtn",
                    Text = "Add",
                    CssClass = "btn btn-outline-primary footer-button"
                    
                });
                cell.Style.Add(HtmlTextWriterStyle.Width, "100%");
                e.Row.Cells.Add(cell);
            }
        }
    }
}
