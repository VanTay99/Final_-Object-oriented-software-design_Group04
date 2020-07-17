using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Group04_FinalProject.Models;
namespace Group04_FinalProject.Connect
{
    class Conntext : DbContext
    {
        public Conntext() : base(@"Server=DESKTOP-24UPI8J\SQLEXPRESS;Database=Cafeteria;Trusted_Connection=True")
        {

        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Food> Foods { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Bill> Bills { get; set; }
        public DbSet<BillDeatail> BillDetails { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Table> Tables { get; set; }
        
    }
}
