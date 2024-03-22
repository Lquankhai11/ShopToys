using System;
using System.Collections.Generic;

namespace ShopToys.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public int EmployeeId { get; set; }
        public int? TransactStatusId { get; set; }
        public bool? Cannel { get; set; }
        public bool? Paid { get; set; }
        public DateTime? PayDate { get; set; }
        public int? PaymentId { get; set; }
        public string? Note { get; set; }
        public int? ShipperId { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual Employee Employee { get; set; } = null!;
        public virtual Shipper? Shipper { get; set; }
        public virtual TransactStatus? TransactStatus { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
