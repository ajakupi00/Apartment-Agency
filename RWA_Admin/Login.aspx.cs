using RWA_Library.Models;
using rwaLib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.ToString().Trim();
            string password = txtPassword.Text.ToString().Trim();
            if (String.IsNullOrEmpty(username) || String.IsNullOrEmpty(password))
            {
                return;
            }
            User user = ((RWA_Library.DAL.DBRepo)Application["database"]).AuthUser(username, Cryptography.HashPassword(password));
            if (user == null)
            {
                txtUsername.Text = "";
                txtPassword.Text = "";
                return;
            }

            Session["user"] = user;
            Response.Redirect("Apartments.aspx");
        }


    }
}