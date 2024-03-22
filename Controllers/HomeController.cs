using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using ShopToys.Models;
using System.Diagnostics;

namespace ShopToys.Controllers
{
    public class HomeController : Controller
    {
        private readonly ManagerShopPRN211Context _context;
        public INotyfService _notyfService { get; }
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger,ManagerShopPRN211Context context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            var products = await _context.Products.Include(p => p.Category).Take(8).ToListAsync();
            ViewBag.Products = products;
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}