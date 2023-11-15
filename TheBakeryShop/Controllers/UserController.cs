using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;

namespace TheBakeryShop.Controllers
{
    public class UserController : Controller
    {
        DBBakeryShopEntities db = new DBBakeryShopEntities();
        // GET: User
        public ActionResult ThongTin()
        {
            return View();
        }

        public ActionResult DangNhap()
        {
            return View();
        }
        public ActionResult AuthenDangNhap(tbUser user)
        {
            try
            {
                var check_Name = db.tbUsers.Where(s => s.userName == user.userName).FirstOrDefault();
                var check_Pass = db.tbUsers.Where(s => s.userPass == user.userPass).FirstOrDefault();
                if (check_Name == null || check_Pass == null)
                {
                    if (check_Name == null)
                        ViewBag.ErrorName = "Sai tên đăng nhập";
                    if (check_Pass == null)
                        ViewBag.ErrorPass = "Sai mật khẩu";
                    return View("DangNhap");
                }
                else
                {
                    Session["userName"] = user.userName;
                    return RedirectToAction("TrangChu","Home");
                }
            }   
            catch 
            {
                return View("DangNhap");
            }
        }
        public ActionResult DangKy()
        {
            return View();
        }
        public ActionResult AuthenDangKy(tbUser _user)
        {
            try
            {
                db.tbUsers.Add(_user);
                db.SaveChanges();
                return RedirectToAction("TrangChu", "Home");
            }
            catch
            {
                return View("DangKy");
            }
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("TrangChu","Home");
        }
    }
}