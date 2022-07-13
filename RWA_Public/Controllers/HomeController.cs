using Newtonsoft.Json;
using RWA_Library.DAL;
using RWA_Library.Models;
using RWA_Public.Models;
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
        public ActionResult Register(UserModel model)
        {
            if (ModelState.IsValid)
            {
                User user = new User
                {
                    Email = model.Email,
                    UserName = model.Username,
                    PhoneNumber = model.PhoneNumber,
                    Address = model.Address
                };
                string password = model.Password;
                _repo.RegisterUser(user, password);
                ViewBag.user = user;
                Session["user"] = user;
                ViewBag.apt = _repo.GetAllApartments();
                ViewBag.repo = _repo;
                ViewBag.cities = _repo.GetAllCities();
                return RedirectToAction("Index", "Apartment");
            }
            return View("Login");
            
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            User user = _repo.AuthUser(username, rwaLib.Models.Cryptography.HashPassword(password));
            if (user is null)
            {
                return View("Login");
            }

            ViewBag.user = user;
            Session["user"] = user;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            return RedirectToAction("Index", "Apartment");
        }

    

        [HttpGet]
        public ActionResult Logout(string language)
        {
            Session["user"] = null;
            ViewBag.apt = _repo.GetAllApartments();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();
            Response.Cookies["lang"].Value = language;
            return RedirectToAction("Index", "Apartment");
        }


    }
}