using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopToys.Extension;
using ShopToys.ModelViews;

namespace ShopToys.Controllers.Components
{
    public class NumberCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var cart = HttpContext.Session.Get<List<CartItems>>("Cart");
            int amount = 0;
            if(cart != null)
            {
                amount = cart.Count;
            }
            return View(amount);
        }
    }
    
    
}
