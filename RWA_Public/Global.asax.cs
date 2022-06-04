using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RWA_Public
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_Error()
        {
            string error = Server?.GetLastError()?.GetBaseException()?.Message.Trim().Replace("\n", "").Replace("\r", "");
            Response.Redirect("~/Error/Index?message=" + error);
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            var languageSession = "en";
            if (context != null && context.Session != null)
                languageSession = context.Session["lang"] != null ? context.Session["lang"].ToString() : "en";
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(languageSession);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(languageSession);
            
        }
    }
}
