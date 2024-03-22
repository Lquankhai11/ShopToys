using ShopToys.Models;

namespace ShopToys.ModelViews
{
    public class CartItems
    {
        public Product product { get; set; }
        public int amount { get; set; }
        public double TotalMoney => amount * (product.Price.Value);

    }
}
