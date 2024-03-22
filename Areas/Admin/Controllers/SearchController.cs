using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopToys.Models;

namespace ShopToys.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SearchController : Controller
    {
     
        private readonly ManagerShopPRN211Context _context;
        public SearchController(ManagerShopPRN211Context context)
        {
            _context = context;
        } 
        //Search Product
        public IActionResult SearchProduct(string keyword)
        {
            List<Product> ls = new List<Product>();
            if(string.IsNullOrEmpty(keyword)|| keyword.Length<1) {
                return PartialView("ListProductSearchPartial", null);
            }
            ls = _context.Products.AsNoTracking().Include(c=>c.CategoryId).Where(p=>p.Name == keyword).ToList();
            if (ls == null)
            {
                return PartialView("ListProductSearchPartial", null);
            }
            else
            {
                return PartialView("ListProductSearchPartial", ls);
            }
        }
    }
}
