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
    public partial class Users : System.Web.UI.Page
    {
        private IList<User> _users;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            LoadData();
        }

        private void LoadData()
        {
            _users = ((DBRepo)Application["database"]).LoadUsers();
            usersGrid.DataSource = _users;
            usersGrid.DataBind();
        }

        protected void usersGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            usersGrid.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}