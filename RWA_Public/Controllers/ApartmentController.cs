using Newtonsoft.Json;
using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json.Converters;
using System.Text;

namespace RWA_Public.Controllers
{
    public class ApartmentController : Controller
    {
        private IRepo _repo;
        private Apartment[] apt;
        public ApartmentController()
        {
            _repo = RepoFactory.GetRepo();
            apt = _repo.GetAllApartments().ToArray();
        }

        [HttpGet]
        public ActionResult Index(string search)
        {
            Response.Cookies.Add(new HttpCookie("city", ""));
            Response.Cookies.Add(new HttpCookie("rooms", "0"));
            Response.Cookies.Add(new HttpCookie("children", "0"));
            Response.Cookies.Add(new HttpCookie("adults", "0"));

            ViewBag.user = Session["user"];
            ViewBag.cities = _repo.GetAllCities();

            if (search is null) search = "";

            string language = HttpContext.Request.Cookies["language"].Value;
            ViewBag.lang = language;
            Response.Cookies.Add(new HttpCookie("search", search));
            return View("Index");
        }

        [HttpPost]
        public ActionResult Filter(string rooms, string children, string adults, string city)
        {
            ViewBag.user = Session["user"];
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            string language = HttpContext.Request.Cookies["language"].Value;
            ViewBag.lang = language;
            Request.Cookies["city"].Value = city;
            Request.Cookies["children"].Value = children;
            Request.Cookies["adults"].Value = adults;
            Request.Cookies["rooms"].Value = rooms;
            GetApartments();


            return View("Index");
        }

        [HttpGet]
        public ActionResult Reserve(int id)
        {

            ViewBag.apt = _repo.GetApartmentByID(id);
            if (ViewBag.apt is null)
            {
                throw new Exception("Apartment with that ID does not exists!");
            }

            string language = HttpContext.Request.Cookies["language"].Value;
            ViewBag.lang = language;
            ViewBag.user = Session["user"];
            ViewBag.pictures = _repo.GetPicturesByApartmentID(id);
            ViewBag.tags = _repo.GetTagsByApartmentID(id);
            return View();
        }


        public JsonResult GetApartments()
        {
            string search = Request.Cookies["search"].Value;
            if (HttpContext.Request.Cookies["language"].Value == "hr")
            {
                return Json(apt.Where(a => a.Name.ToLower().Contains(search.ToLower())).ToArray(), JsonRequestBehavior.AllowGet);
            }
            return Json(apt.Where(a => a.NameEng.ToLower().Contains(search.ToLower())).ToArray(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRPicturesByApartment(int id)
        {
            ApartmentPicture picture = (ApartmentPicture)_repo.GetPicturesByApartmentID(id).FirstOrDefault(p => p.IsRepresentative);
            return Json(picture, JsonRequestBehavior.AllowGet);
        }
    }
}