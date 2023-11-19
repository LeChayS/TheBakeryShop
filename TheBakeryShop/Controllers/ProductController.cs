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
    public class ProductController : Controller
    {
        DBBakeryShopEntities db = new DBBakeryShopEntities();
        // GET: Product
        public ActionResult SanPham(string style, int? page)
        {
            if (style != null)
                return View(db.tbProducts.Where(s => s.codeStyle == style));
            else
                return View(db.tbProducts.ToList());
            ////Phân trang
            //int pageSize = 10;
            //int pageNumber = (page ?? 1);
            //return View(db.tbProducts.OrderBy(n => n.codePro).ToPagedList(pageNumber,pageSize));
            
        }
        public ActionResult ChiTietSanPham(string codeP)
        {
            var product = db.tbProducts.Where(m =>m.codePro == codeP).FirstOrDefault() ;
            return View(product);
        }
        public ActionResult GioHang()
        {
            return View();
        }
        public ActionResult Style()
        {
            var list = db.tbStyles.ToList();
            ViewBag.listStyle = list;
            return PartialView(list);
        }
        public ActionResult DMSanPham(string style, int? page, double min = double.MinValue, double max = double.MaxValue)
        {
            int pageSize = 12;
            int pageNum = (page ?? 1);
            if (style == null)
            {
                var productList = db.tbProducts.OrderByDescending(x => x.namePro);
                return View(productList.ToPagedList(pageNum, pageSize));
            }
            else
            {
                var productList = db.tbProducts.OrderByDescending(x => x.namePro)
                    .Where(p => p.codeStyle == style);
                return View(productList);
            }
        }
    }
}
