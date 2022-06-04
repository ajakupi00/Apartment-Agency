using RWA_Library.DAL;
using RWA_Library.Models;
using System;
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
        public ActionResult Login(string username, string password, string language)
        {
            User user = _repo.AuthUser(username, rwaLib.Models.Cryptography.HashPassword(password));
            if (user is null)
            {
                throw new Exception("You entered something wrong with your user!");
            }
            SetLanguage(language);

            ViewBag.user = user;
            Session["user"] = user;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.lang = language;
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
            ViewBag.lang = language;
            return View();
        }

        private static void SetLanguage(string language)
        {
            if (language is null) language = "eng";
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        }

        [HttpGet]
        public ActionResult Index(string language)
        {
            SetLanguage(language);
            ViewBag.user = Session["user"];
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.lang = language;
            return View();
        }
    }
}