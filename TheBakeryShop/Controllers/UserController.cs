using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheBakeryShop.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult ThongTin()
        {
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        public ActionResult DangKy()
        {
            return View();
        }
    }
}