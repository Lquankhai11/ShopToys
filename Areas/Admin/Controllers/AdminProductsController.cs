using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopToys.Helper;
using ShopToys.Models;
using System.IO;


namespace ShopToys.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminProductsController : Controller
    {
        private readonly ManagerShopPRN211Context _context;
		public INotyfService _notyfService { get; }
		public AdminProductsController(ManagerShopPRN211Context context, INotyfService notyfService)
        {
            _context = context;
			_notyfService = notyfService;   
		}

        // GET: Admin/AdminProducts
        public async Task<IActionResult> Index(int catID = 0)
        {
            ViewData["Categories"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            if (catID != 0)
            {
                var products = await _context.Products.Include(p => p.Category).Where(x=>x.CategoryId==catID).ToListAsync();
                ViewBag.Products = products;
            }
            else
            {
                var products = await _context.Products.Include(p => p.Category).ToListAsync();
                ViewBag.Products = products;
            }
            var lsCategory = await _context.Categories.ToListAsync();
            ViewBag.Category = lsCategory;
            ViewBag.SelectedCategory = catID == 0 ? 0 : catID;
            return View();
        }

        // GET: Admin/AdminProducts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Admin/AdminProducts/Create
        public IActionResult Create()
        {
            ViewData["Categories"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View();
        }

        // POST: Admin/AdminProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,Name,CategoryId,Image,Description,Price,Status,QuantityInStock,Discount,Image2,Image3,Image4")] Product product, Microsoft.AspNetCore.Http.IFormFile fImage,
			Microsoft.AspNetCore.Http.IFormFile fImage2, Microsoft.AspNetCore.Http.IFormFile fImage3, Microsoft.AspNetCore.Http.IFormFile fImage4)
        {
            if (ModelState.IsValid)
            {
    //            if(fImage != null)
    //            {
    //                string extension = Path.GetExtension(fImage.FileName);
    //                string image = Utilities.SEOUrl(product.Name) + extension;
    //                product.Image = await Utilities.UploadFile(fImage, @"Products", image.ToLower());
    //            }if (string.IsNullOrEmpty(product.Image)) product.Image = "default.jpg";
				//if (fImage2 != null)
				//{
				//	string extension = Path.GetExtension(fImage2.FileName);
				//	string image2 = Utilities.SEOUrl(product.Name) + extension;
				//	product.Image2 = await Utilities.UploadFile(fImage2, @"Products", image2.ToLower());
				//}
				//if (string.IsNullOrEmpty(product.Image2)) product.Image2 = "default.jpg";
				//if (fImage3 != null)
				//{
				//	string extension = Path.GetExtension(fImage3.FileName);
				//	string image3 = Utilities.SEOUrl(product.Name) + extension;
				//	product.Image3 = await Utilities.UploadFile(fImage3, @"Products", image3.ToLower());
				//}
				//if (string.IsNullOrEmpty(product.Image3)) product.Image3 = "default.jpg";
				//if (fImage4 != null)
				//{
				//	string extension = Path.GetExtension(fImage4.FileName);
				//	string image4 = Utilities.SEOUrl(product.Name) + extension;
				//	product.Image4 = await Utilities.UploadFile(fImage4, @"Products", image4.ToLower());
				//}
				//if (string.IsNullOrEmpty(product.Image4)) product.Image4 = "default.jpg";
				_context.Add(product);
                await _context.SaveChangesAsync();
                _notyfService.Success("Add successfully.");
				return RedirectToAction(nameof(Index));
			}
			ViewData["Categories"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View(product);
        }

        // GET: Admin/AdminProducts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["Categories"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
			var categories = ViewBag.Category as List<Category>;
			return View(product);
        }

        public IActionResult FilterCategory(int catID = 0)
        {
            var url = $"/Admin/AdminProducts?catID={catID}";
            if (catID == 0)
            {
                url = $"/Admin/AdminProducts";
            }
            var selectedCategory = catID;
            return Json(new { status = "success", redirectUrl = url, selectedCategory = selectedCategory });
        }

        // POST: Admin/AdminProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,Name,CategoryId,Image,Description,Price,Status,QuantityInStock,Discount,Image2,Image3,Image4")] Product product, Microsoft.AspNetCore.Http.IFormFile fImage,
			Microsoft.AspNetCore.Http.IFormFile fImage2, Microsoft.AspNetCore.Http.IFormFile fImage3, Microsoft.AspNetCore.Http.IFormFile fImage4)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
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
            ViewData["Categories"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // GET: Admin/AdminProducts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Admin/AdminProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'ManagerShopPRN211Context.Products'  is null.");
            }
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
          return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
