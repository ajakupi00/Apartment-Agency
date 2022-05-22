using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using RWA_Library;
using RWA_Library.DAL;
using RWA_Library.Models;

namespace RWA_Admin
{
    public partial class Masterpage : System.Web.UI.MasterPage
    {
        private IRepo repo = RepoFactory.GetRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void lblLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }


        
    }
}