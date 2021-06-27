using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JAG.DeveloperTest.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Test()
        {
            ViewBag.Message = "Let the games begin. >:)";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Need some help?";

            return View();
        }

        public ActionResult Bail()
        {
            ViewBag.Message = "Sorry to see you go. :'( ";

            return View();
        }

        
    }
}