using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;

namespace TheBakeryShop.Controllers
{
    public class AdminController : Controller
    {
        DBBakeryShopEntities db = new DBBakeryShopEntities();
        // GET: Admin
        public ActionResult TrangChinh()
        {
            return View();
        }
    }
}