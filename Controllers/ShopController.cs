using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopToys.Models;

namespace ShopToys.Controllers
{
    public class ShopController : Controller
    {
        private readonly ManagerShopPRN211Context _context;
        public INotyfService _notyfService { get; }
        private readonly ILogger<HomeController> _logger;

        public ShopController(ILogger<HomeController> logger, ManagerShopPRN211Context context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
            _logger = logger;
        }
        public async Task<IActionResult> Shop()
        {
            var products = await _context.Products.Include(p => p.Category).Take(8).ToListAsync();
            ViewBag.Products = products;
            var lsCategory = await _context.Categories.ToListAsync();
            ViewBag.Category = lsCategory;
            return View();
        }
        [HttpGet] // Xác định phương thức HTTP
        [Route("Shop/ProductDetail/{productID}")]
        public async Task<IActionResult> ProductDetail(int? productID)
        {
            if (productID == null || _context.Products == null)
            {
                return NotFound();
            }
            var products = await _context.Products.Include(p => p.Category).FirstOrDefaultAsync(p=>p.ProductId==productID);
            var lsproducts = await _context.Products.Include(p => p.Category).Take(4).ToListAsync();
            ViewBag.Products = lsproducts;
            return View(products);
        }
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Employees == null)
            {
                return NotFound();
            }

            var employee = await _context.Employees.FindAsync(id);
            if (employee == null)
            {
                return NotFound();
            }
            ViewData["AccountId"] = new SelectList(_context.Accounts, "AccountId", "AccountId", employee.AccountId);
            return View(employee);
        }
    }
}
