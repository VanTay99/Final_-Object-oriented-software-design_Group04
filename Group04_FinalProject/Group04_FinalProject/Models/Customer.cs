using Group04_FinalProject.Connect;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.Models
{
    public class Customer :Person
    {
        public int Wallet { get; set; }

        public void AddData()
        {
            using (var ctx = new Conntext())
            {
                var customer = new Customer();
                customer.Name = Name;
                customer.DOB = DOB;
                customer.Address = Address;
                customer.Phone = Phone;
                customer.Sex = Sex;
                customer.Wallet = Wallet;
                customer.Image = Image;
                ctx.Customers.Add(customer);
                ctx.SaveChanges();
            }
        }

        public void Update()
        {
            using (var ctx = new Conntext())
            {
                var khQuery = (from cus in ctx.Customers
                               where cus.ID == ID
                               select cus).SingleOrDefault();
                if (khQuery != null)
                {
                    khQuery.Name = Name;
                    khQuery.DOB = DOB;
                    khQuery.Address = Address;
                    khQuery.Phone = Phone;
                    khQuery.Sex = Sex;
                    khQuery.Wallet = Wallet;
                    khQuery.Image = Image;
                    ctx.SaveChanges();
                }
            }

        }
        public void DeleteData()
        {
            using (var ctx = new Conntext())
            {
                var nvQuery = from cus in ctx.Customers
                              where cus.ID == ID
                              select cus;
                ctx.Customers.RemoveRange(nvQuery);
                ctx.SaveChanges();
            }

        }
        public static int GetWallet(int CustomerID)
        {
            using (var ctx = new Conntext())
            {
                var dt = ctx.Customers.Where(x => x.ID == CustomerID).FirstOrDefault();
                return dt.Wallet;
            }
        }
        public static List<dynamic> LoadData()
        {
            using (Conntext db = new Conntext())
            {
                var result = from c in db.Customers
                             select new
                             {
                                 ID = c.ID,
                                 Name = c.Name,
                                 Address = c.Address,
                                 DOB = c.DOB,
                                 Phone = c.Phone,
                                 Sex = c.Sex,
                                 Wallet = c.Wallet,
                                 Image = c.Image
                             };
                return result.ToList<dynamic>();
            }
        }

        public List<dynamic> FindName()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Customers
                            where b.Name.Contains(Name)
                            select new
                            {
                                b.ID,
                                b.Name,
                                b.Address,
                                b.DOB,
                                b.Phone,
                                b.Sex,
                                b.Wallet,
                                b.Image
                            });
                return list.ToList<dynamic>();
            }
        }
        public List<dynamic> FindSDT()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Customers
                            where b.Phone.Contains(Phone)
                            select new
                            {
                                b.ID,
                                b.Name,
                                b.Address,
                                b.DOB,
                                b.Phone,
                                b.Sex,
                                b.Wallet,
                                b.Image
                            });
                return list.ToList<dynamic>();
            }
        }
    }
}
