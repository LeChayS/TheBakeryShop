using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheBakeryShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult SanPham()
        {
            return View();
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