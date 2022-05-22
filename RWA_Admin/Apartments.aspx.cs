using RWA_Library.DAL;
using RWA_Library.Models;
using rwaLib.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RWA_Admin
{
    public partial class Login : System.Web.UI.Page
    {
        private const string ddlCityDefaultValue = "-- Choose city --";
        private const string ddlStatusDefaultValue = "-- Choose status --";
        private IList<Apartment> _apartments;
        private IList<City> _city;
        private IList<ApartmentStatus> _status;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            InitData();

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void InitData()
        {
            Session["ApartmentID"] = null;
            _apartments = ((DBRepo)Application["database"]).GetAllApartments();
            _city = ((DBRepo)Application["database"]).GetAllCities();
            _status = ((DBRepo)Application["database"]).GetAllStatuses();
        }

        private void LoadData()
        {
            ddlCity.DataSource = _city;
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, ddlCityDefaultValue);

            ddlStatus.DataSource = _status;
            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, ddlStatusDefaultValue);


            rptApartments.DataSource = _apartments;
            rptApartments.DataBind();

            divAction.Visible = false;
            if (Session["lblAction"] != null)
            {
               divAction.InnerHtml = Session["lblAction"].ToString();
                divAction.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);
            Session["ApartmentID"] = id;
            Response.Redirect("ViewApartment.aspx");
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string cityName = ddlCity.SelectedItem.ToString();
            string statusName = ddlStatus.SelectedItem.ToString();
            if (cityName != ddlCityDefaultValue)
            {
                if (statusName != ddlStatusDefaultValue)
                {
                    rptApartments.DataSource = _apartments.Where(a => a.Status.Name == statusName && a.City.Name == cityName);
                }
                else
                {
                    rptApartments.DataSource = _apartments.Where(a => a.City.Name == cityName);

                }
                rptApartments.DataBind();
            }
            else
            {
                InitData();
                LoadData();
            }

        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string statusName = ddlStatus.SelectedItem.ToString();
            string cityName = ddlCity.SelectedItem.ToString();
            if (statusName != ddlStatusDefaultValue)
            {
                if (cityName != ddlCityDefaultValue)
                {
                    rptApartments.DataSource = _apartments.Where(a => a.City.Name == cityName && a.Status.Name == statusName);
                }
                else
                {
                    rptApartments.DataSource = _apartments.Where(a =>  a.Status.Name == statusName);

                }
                rptApartments.DataBind();
            }
            else
            {
                InitData();
                LoadData();
            }
        }
    }
}