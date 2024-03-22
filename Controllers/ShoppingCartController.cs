using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopToys.Extension;
using ShopToys.Models;
using ShopToys.ModelViews;
using System;

namespace ShopToys.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly ManagerShopPRN211Context _context;
        public INotyfService _notyfService { get; }

        public ShoppingCartController(ManagerShopPRN211Context context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        public List<CartItems> Cart
        {
            get
            {
                var cart = HttpContext.Session.Get<List<CartItems>>("Cart");
                if (cart== default(List<CartItems>))
                {
                    cart = new List<CartItems>();
                }
                return cart;
            }
        }
        [HttpPost]
        [Route("api/cart/add")]
        public IActionResult AddtoCart(int productID, int? amount)
        {
            try
            {
                List<CartItems> cart = Cart;
                CartItems item = Cart.SingleOrDefault(p => p.product.ProductId == productID);
                if (item != null)
                {
                    if (amount.HasValue)
                    {
                        item.amount = amount.Value;
                    }
                    else
                    {
                        item.amount =1;
                    }
                }
                else
                {
                    Product product = _context.Products.SingleOrDefault(p => p.ProductId == productID);
                    item = new CartItems
                    {
                        amount = amount.HasValue ? amount.Value : 1,
                        product = product
                    };
                    cart.Add(item);
                }
                HttpContext.Session.Set<List<CartItems>>("Cart", cart);
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
            return Json(new { success = false });
        }

        [HttpPost]
        [Route("api/cart/update")]
        public IActionResult UpdateCart(int productID,int? amount) {
            var cart = HttpContext.Session.Get<List<CartItems>>("Cart");
            try
            {
                if (cart != null)
                {
                    CartItems item = cart.SingleOrDefault(p=>p.product.ProductId == productID);
                    if(item != null && amount.HasValue) {
                        item.amount = amount.Value;
                    }
                    HttpContext.Session.Set<List<CartItems>>("Cart",cart);
                }
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
        }
        [HttpPost]
        [Route("api/cart/remove")]
        public IActionResult RemoveItemCart(int productID)
        {
            try
            {
                List<CartItems> cart = Cart;
                CartItems item = Cart.SingleOrDefault(p => p.product.ProductId == productID);
                if (item != null)
                {
                    cart.Remove(item);
                }
                HttpContext.Session.Set<List<CartItems>>("Cart", cart);
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
        }
        public IActionResult Index()
        {
            var accountIDString = HttpContext.Session.GetString("AccountID");
            int accountID = Convert.ToInt32(accountIDString);
            List<CartItems> lsCartItems = new List<CartItems>();

            var lsCart = _context.Carts
                .Include(c => c.Customer)
                .Where(c => c.CustomerId == accountID)
                .ToList();

            foreach (var cartItem in lsCart)
            {
                var product = _context.Products.FirstOrDefault(p => p.ProductId == cartItem.ProductId);
                if (product != null)
                {
                    var cartItemModel = new CartItems
                    {
                        product = product,
                        amount = (int)cartItem.Quantity
                    };
                    lsCartItems.Add(cartItemModel);
                }
            }

            return View(lsCartItems); // Return lsCartItems instead of lsCart
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CartId,CustomerId,ProductId,Quantity")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                var accountIDString = HttpContext.Session.GetString("AccountID");
                int accountID = Convert.ToInt32(accountIDString);
                _context.Add(cart);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", cart.CustomerId);
            return View(cart);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CartId,CustomerId,ProductId,Quantity")] Cart cart)
        {
            if (id != cart.CartId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cart);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CartExists(cart.CartId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", cart.CustomerId);
            return View(cart);
        }
        // POST: Carts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Carts == null)
            {
                return Problem("Entity set 'ManagerShopPRN211Context.Carts'  is null.");
            }
            var cart = await _context.Carts.FindAsync(id);
            if (cart != null)
            {
                _context.Carts.Remove(cart);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        private bool CartExists(int id)
        {
            return (_context.Carts?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
