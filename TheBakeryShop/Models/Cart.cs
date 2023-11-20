using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheBakeryShop.Models
{
    public class CartItem
    {
        public tbProduct _product { get; set; }
        public int _quantity { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();
        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }
        public void Add_Product_Cart(tbProduct _pro, int _quan = 1)
        {
            var item = Items.FirstOrDefault(s => s._product.codePro == _pro.codePro);
            if (item == null)
                items.Add(new CartItem
                {
                    _product = _pro,
                    _quantity = _quan
                });
            else
                item._quantity += _quan;
        }
        public int Total_quantity()
        {
            return items.Sum(s => s._quantity);
        }
        public decimal Total_money()
        {
            var total = items.Sum(s => s._quantity * s._product.pricePro);
            return (decimal)total;
        }
        public void Update_quantity(string code, int _new_quan)
        {
            var item = items.Find(s => s._product.codePro == code);
            if (item != null)
                item._quantity = _new_quan;
        }
        public void Remove_CartItem(string code)
        {
            items.RemoveAll(s => s._product.codePro == code);
        }
        public void clearCart()
        {
            items.Clear();
        }
    }
}