using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;

namespace TheBakeryShop.Controllers
{
    public class ShoppingCartController : Controller
    {
        DBBakeryShopEntities db = new DBBakeryShopEntities();
        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }
    }
}