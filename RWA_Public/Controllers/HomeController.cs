using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.IO;
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
            return View("Index");
        }



        [HttpGet]
        public ActionResult Reserve(int id)
        {
            ViewBag.user = Session["user"];
            ViewBag.apt = _repo.GetApartmentByID(id);
            ViewBag.pictures = _repo.GetPicturesByApartmentID(id);
            ViewBag.tags = _repo.GetTagsByApartmentID(id);
            return View();
        }

        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            return View();
        }
    }
}