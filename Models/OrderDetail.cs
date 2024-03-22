using System;
using System.Collections.Generic;

namespace ShopToys.Models
{
    public partial class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public int? OrderId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public int? Discount { get; set; }
        public decimal? Total { get; set; }
        public DateTime? ShippedDate { get; set; }

        public virtual Order? Order { get; set; }
        public virtual Product? Product { get; set; }
    }
}
