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
        public ActionResult DonHang()
        {
            return View(db.tbDetailBills.ToList());
        }
    }
}