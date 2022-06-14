﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace RWA_Public.Controllers
{
    public class LanguageController : Controller
    {
        // GET: Language
        public ActionResult Change(string language)
        {
            if (language != null)
            {
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
                Thread.CurrentThread.CurrentCulture =new CultureInfo(language);
            }

            HttpCookie cookie = new HttpCookie("language");
            cookie.Value = language;
            Response.Cookies.Add(cookie);

            return RedirectToAction("Index", "Apartment");
        }
    }
}