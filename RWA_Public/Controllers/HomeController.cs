using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Threading;
using System.Web.Mvc;

namespace RWA_Public.Controllers
{
    public class HomeController : Controller
    {
        private IRepo _repo;
        public HomeController()
        {
            _repo = RepoFactory.GetRepo();
        }


        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string email, string username, string pnumber, string address, string password)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(pnumber) || string.IsNullOrEmpty(address)) return View("Login");
            User user = new User
            {
                Email = email,
                UserName = username,
                PhoneNumber = pnumber,
                Address = address
            };
            _repo.RegisterUser(user, password);
            ViewBag.user = user;
            Session["user"] = user;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            return View("Index");
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            User user = _repo.AuthUser(username, rwaLib.Models.Cryptography.HashPassword(password));
            if (user is null)
            {
                throw new Exception("You entered something wrong with your user!");
            }

            ViewBag.user = user;
            Session["user"] = user;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            return View("Index");
        }



        [HttpGet]
        public ActionResult Reserve(int id, string language)
        {

            ViewBag.apt = _repo.GetApartmentByID(id);
            if (ViewBag.apt is null)
            {
                throw new Exception("Apartment with that ID does not exists!");
            }

            SetLanguage(language);

            ViewBag.user = Session["user"];
            ViewBag.pictures = _repo.GetPicturesByApartmentID(id);
            ViewBag.tags = _repo.GetTagsByApartmentID(id);
            Response.Cookies["lang"].Value = language;
            return View();
        }


        private static void SetLanguage(string language)
        {
            if (language is null) language = "eng";
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        }

        public JsonResult GetApartments()
        {
            var apt = _repo.GetAllApartments();
            var aptNames = new List<string>();
            foreach (var a in apt)
            {
                aptNames.Add(a.Name);
            }
            return Json(aptNames, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Logout(string language)
        {
            ViewBag.user = null;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            SetLanguage(language);
            Response.Cookies["lang"].Value = language;
            return View("Index");
        }


        [HttpGet]
        public ActionResult Index(string language)
        {
            SetLanguage(language);
            ViewBag.user = Session["user"];
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            Response.Cookies["lang"].Value = language;
            return View();
        }
    }
}