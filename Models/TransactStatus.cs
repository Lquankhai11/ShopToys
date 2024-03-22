﻿using System;
using System.Collections.Generic;

namespace ShopToys.Models
{
    public partial class TransactStatus
    {
        public TransactStatus()
        {
            Orders = new HashSet<Order>();
        }

        public int TransactStatusId { get; set; }
        public string? Status { get; set; }
        public string? Note { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}