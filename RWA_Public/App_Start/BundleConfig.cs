using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace RWA_Public.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/Content").Include(
               "~/Content/bootstrap.min.css",
                    "~/Content/font-awesome.min.css"
           ));

            bundles.Add(new ScriptBundle("~/Scripts").Include(
                "~/Scripts/jquery-3.6.0.js",
                "~/Scripts/bootstrap.js"
            ));
        }
    }
}