using RWA_Public.App_Start;
using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace RWA_Public
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            string error = Server?.GetLastError()?.GetBaseException()?.Message.Trim().Replace("\n", "").Replace("\r", "");
            Response.Redirect("~/Error/Index?message=" + error);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["language"];
            if (cookie != null && cookie.Value != null)
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
            }
            else
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo("eng");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("eng");
            }


        }
    }
}
