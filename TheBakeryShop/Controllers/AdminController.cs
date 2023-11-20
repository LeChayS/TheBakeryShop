using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheBakeryShop.Models;
using PagedList;
using PagedList.Mvc;

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


        public ActionResult NguoiDung()
        {
            return View(db.tbUsers.ToList());
        }
        public ActionResult CreateND()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateND(tbUser user)
        {
            db.tbUsers.Add(user);
            db.SaveChanges();
            return RedirectToAction("NguoiDung");
        }
        public ActionResult DetailND(int id)
        {
            return View(db.tbUsers.Where(s => s.idUser == id).FirstOrDefault());
        }
        public ActionResult EditND(int id)
        {
            return View(db.tbUsers.Where(s => s.idUser == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult EditND(int id, tbUser user)
        {
            db.Entry(user).State=System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("NguoiDung");
        }
        public ActionResult DeleteND(int id)
        {
            return View(db.tbUsers.Where(s => s.idUser == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult DeleteND(int id, tbUser user)
        {
            try
            {
                user = db.tbUsers.Where(s => s.idUser==id).FirstOrDefault();
                db.tbUsers.Remove(user);
                db.SaveChanges();
                return RedirectToAction("NguoiDung");
            }
            catch
            {
                return Content("Không thể xóa người dùng");
            }
        }


        public ActionResult SanPham(/*string _style, int? page, double min = double.MinValue, double max = double.MaxValue*/)
        {
            return View(db.tbProducts.ToList());
            //int pageSize = 12;
            //int pageNum = (page ?? 1);
            //if (_style == null)
            //{
            //    var productList = db.tbProducts.OrderByDescending(x => x.namePro);
            //    return View(productList.ToPagedList(pageNum, pageSize));
            //}
            //else
            //{
            //    var productList = db.tbProducts.OrderByDescending(x => x.namePro)
            //        .Where(p => p.codeStyle == _style);
            //    return View(productList);
            //}
        }
        public ActionResult CreateSP()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateSP(tbProduct product)
        {
            db.tbProducts.Add(product);
            db.SaveChanges();
            return RedirectToAction("SanPham");
        }
        public ActionResult DetailSP(string code)
        {
            return View(db.tbProducts.Where(s => s.codePro == code).FirstOrDefault());
        }
        public ActionResult EditSP(string code)
        {
            return View(db.tbProducts.Where(s => s.codePro == code).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult EditSP(string code,tbProduct product)
        {
            db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("SanPham");
        }
        public ActionResult DeleteSP(string code)
        {
            return View(db.tbProducts.Where(s => s.codePro == code).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult DeleteSP(string code, tbProduct product)
        {
            try
            {
                product = db.tbProducts.Where(s => s.codePro == code).FirstOrDefault();
                db.tbProducts.Remove(product);
                db.SaveChanges();
                return RedirectToAction("SanPham");
            }
            catch
            {
                return Content("Không thể xóa sản phẩm");
            }
        }





        public ActionResult DonHang()
        {
            return View(db.tbDetailBills.ToList());
        }
        public ActionResult CreateDH()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateDH(tbDetailBill bill)
        {
            db.tbDetailBills.Add(bill);
            db.SaveChanges();
            return RedirectToAction("DonHang");
        }
        public ActionResult DetailDH(int idB)
        {
            return View(db.tbDetailBills.Where(s => s.idBill == idB).FirstOrDefault());
        }
        public ActionResult EditDH(int idB)
        {
            return View(db.tbDetailBills.Where(s => s.idBill == idB).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult EditDH(int idB, tbDetailBill bill)
        {
            db.Entry(bill).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("DonHang");
        }
        public ActionResult DeleteDH(int idB)
        {
            return View(db.tbDetailBills.Where(s => s.idBill == idB).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult DeleteDH(int idB, tbDetailBill bill)
        {
            try
            {
                bill = db.tbDetailBills.Where(s => s.idBill == idB).FirstOrDefault();
                db.tbDetailBills.Remove(bill);
                db.SaveChanges();
                return RedirectToAction("DonHang");
            }
            catch
            {
                return Content("Không thể xóa đơn hàng");
            }
        }
    }
}