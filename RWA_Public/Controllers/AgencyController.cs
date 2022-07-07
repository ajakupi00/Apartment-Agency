using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RWA_Public.Controllers
{
    public class AgencyController : Controller
    {
      [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }


    }
}