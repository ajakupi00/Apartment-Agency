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

namespace RWA_Public.Controllers
{
    public class ApartmentController : Controller
    {
        private IRepo _repo;
        public ApartmentController()
        {
            _repo = RepoFactory.GetRepo();
        }

        [HttpGet]
        public ActionResult Index(string search)
        {
            ViewBag.user = Session["user"];
            IList<Apartment> apartments = new List<Apartment>();
            ViewBag.repo = _repo;
            ViewBag.cities = _repo.GetAllCities();

            if (search is null) search = "";

            string language = HttpContext.Request.Cookies["language"].Value;
            ViewBag.lang = language;
            if (language == "hr")
            {
                apartments = ((List<Apartment>)_repo.GetAllApartments()).FindAll(a => a.Name.ToLower().Contains(search.ToLower()));
            }
            else
            {
                apartments = ((List<Apartment>)_repo.GetAllApartments()).FindAll(a => a.NameEng.ToLower().Contains(search.ToLower()));
            }
            ViewBag.apt = apartments;
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
            IList<Apartment> apartments = new List<Apartment>();

            apartments = ((List<Apartment>)_repo.GetAllApartments());
            if(city != "")
                apartments = apartments.Where(a => a.City.Name == city).ToList();
            if (rooms != "0")
                apartments = apartments.Where(a => a.TotalRooms.ToString() == rooms).ToList();
            if (children != "0")
                apartments = apartments.Where(a => a.MaxChildren.ToString() == children).ToList();
            if (adults != "0")
                apartments = (List<Apartment>)apartments.Where(a => a.MaxAdults.ToString() == adults).ToList();
            ViewBag.apt = apartments;
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
            var apt = _repo.GetAllApartments();
            var aptNames = new List<Apartment>();
            foreach (var a in apt)
            {
                //if (a.Status.Name == "Slobodno")
                //{
                aptNames.Add(a);

                //}


            }
            return Json(aptNames, JsonRequestBehavior.AllowGet);
        }
    }
}