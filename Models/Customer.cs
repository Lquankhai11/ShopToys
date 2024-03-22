using System;
using System.Collections.Generic;

namespace ShopToys.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Carts = new HashSet<Cart>();
            Orders = new HashSet<Order>();
        }

        public int CustomerId { get; set; }
        public string? Email { get; set; }
        public string? FullName { get; set; }
        public DateTime? BirthDay { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? AvatarImage { get; set; }
        public bool Active { get; set; }
        public int? AccountId { get; set; }

        public virtual Account? Account { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
