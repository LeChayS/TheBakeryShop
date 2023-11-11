using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;

namespace TheBakeryShop.Controllers
{
    public class ProductController : Controller
    {
        DBBakeryShopEntities db = new DBBakeryShopEntities();
        // GET: Product
        public ActionResult SanPham()
        {
            return View(db.tbProducts.ToList());
        }
        public ActionResult ChiTietSanPham()
        {
            return View();
        }
        public ActionResult GioHang()
        {
            return View();
        }
    }
}