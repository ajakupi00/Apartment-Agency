using RWA_Library.DAL;
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
            Session["msg"] = RWA_Public.Resources.Lanugage.ReviewMsg;
            return RedirectToAction("Reserve", "Apartment", new {id = aptid});
        }
    }
}