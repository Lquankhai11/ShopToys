using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;
using ShopToys.Models;

namespace ShopToys.Controllers
{
    public class ProductDetailController : Controller
    {
        private readonly ManagerShopPRN211Context _context;

        public ProductDetailController(ManagerShopPRN211Context context)
        {
            _context = context;
        }

        public async Task<IActionResult> Details(int? productID)
        {
            if (productID == null || _context.Products == null)
            {
                return NotFound();
            }
            var products = await _context.Products.Include(p => p.Category).FirstOrDefaultAsync(p => p.ProductId == productID);
            var lsproducts = await _context.Products.Include(p => p.Category).Take(8).ToListAsync();
            ViewBag.Products = lsproducts;
            return View(products);
        }

    }
}
