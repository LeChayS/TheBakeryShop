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
        public ActionResult ShowCart()
        {
            if (Session["Cart"] == null)
                //return RedirectToAction("ShowCart", "ShoppingCart");
            return View("EmptyCart");
            Cart _cart = Session["Cart"] as Cart;
            return View(_cart);
        }
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        public ActionResult AddToCart(string id)
        {
            var _pro = db.tbProducts.SingleOrDefault(s => s.codePro == id);
            if (_pro != null)
            {
                GetCart().Add_Product_Cart(_pro);
            }
            return RedirectToAction("ShowCart", "ShoppingCart");
        }



        public ActionResult Update_Cart_Quantity(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            string id_pro = form["idPro"];
            int _quantity = int.Parse(form["cartQuantity"]);
            cart.Update_quantity(id_pro, _quantity);
            return RedirectToAction("ShowCart", "ShoppingCart");
        }
        public ActionResult RemoveCart(string id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowCart", "ShoppingCart");
        }
        public PartialViewResult BagCart()
        {
            int total_quantity_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                total_quantity_item = cart.Total_quantity();
            }
            ViewBag.QuantityCart = total_quantity_item;
            return PartialView("BagCart");
        }
        public ActionResult CheckOut(FormCollection form)
        {
            try
            {
                Cart cart = Session["Cart"] as Cart;
                tbBill _order = new tbBill();
                _order.billDate = DateTime.Now;
                _order.idUser = int.Parse(form["Customer"]);
                db.tbBills.Add(_order);
                foreach (var item in cart.Items)
                {
                    tbDetailBill _order_detail = new tbDetailBill();
                    _order_detail.idBill = _order.idBill;
                    _order_detail.codePro = item._product.codePro;
                    _order_detail.priceProBuying = (double)item._product.pricePro;
                    _order_detail.quantityPro = item._quantity;
                    db.tbDetailBills.Add(_order_detail);
                }
                db.SaveChanges();
                cart.clearCart();
                return RedirectToAction("CheckOut_Success", "ShoppingCart");
            }
            catch
            {
                return Content("Error checkout. Please check information of Customer...Thanks");
            }
        }
        public ActionResult CheckOut_Success()
        {
            return View();
        }
    }
}