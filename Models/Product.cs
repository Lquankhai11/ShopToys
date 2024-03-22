using System;
using System.Collections.Generic;

namespace ShopToys.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }
        public string? Name { get; set; }
        public int? CategoryId { get; set; }
        public string? Image { get; set; }
        public string? Description { get; set; }
        public double? Price { get; set; }
        public string? Status { get; set; }
        public int QuantityInStock { get; set; }
        public int? Discount { get; set; }
        public string? Image2 { get; set; }
        public string? Image3 { get; set; }
        public string? Image4 { get; set; }

        public virtual Category? Category { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
