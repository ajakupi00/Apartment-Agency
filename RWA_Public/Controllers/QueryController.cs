using RWA_Library.DAL;
using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RWA_Public.Controllers
{
    public class QueryController : Controller
    {
        private IRepo _repo;
        public QueryController()
        {
            _repo = RepoFactory.GetRepo();
        }

        [HttpPost]
        public ActionResult Review(int userid, int aptid, int stars, string details)
        {
            _repo.SendReview(userid, aptid, stars, details);
            ViewBag.msg = RWA_Public.Resources.Lanugage.ReviewMsg;
            return RedirectToAction("Reserve", "Apartment", new {id = aptid});
        }

        [HttpPost]
        public ActionResult ReserveApartment(int aptid, string fname, string lname, string email, string phone, string adults, string children, string fromDate, string toDate)
        {
            User user;
            if (Session["user"] != null)
            {
                user = (User)Session["user"];
            }
            else
            {
                user = new User { UserName = fname + " " + lname, Email = email, PhoneNumber = phone };
            }
            int ad = int.Parse(adults);
            int ch = int.Parse(children);
            _repo.ReserveApartment(aptid, user, ad, ch, DateTime.Parse(fromDate), DateTime.Parse(toDate));
            Session["msg"] = RWA_Public.Resources.Lanugage.ReserveMsg;
            return RedirectToAction("Reserve", "Apartment", new { id = aptid });
        }
    }
}