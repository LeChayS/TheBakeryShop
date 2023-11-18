using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;

namespace TheBakeryShop.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        DBBakeryShopEntities db = new DBBakeryShopEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult KQTimKiem(string keys)
        {
            var list = db.tbProducts.Where(n => n.namePro.Contains(keys));
            
            return View(list.OrderBy(n=>n.namePro));
        }
    }
}