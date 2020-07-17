using Group04_FinalProject.Connect;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.Models
{
    
        [Table("Bill")]
        public class Bill
        {
            [Key]
            public int BillID { get; set; }
            public DateTime DateCreate { get; set; }

            public int? Total { get; set; }

            public int? Customer_ID { get; set; }

            [ForeignKey("Customer_ID")]
            public virtual Customer Customer { get; set; }

            public int Employee_ID { get; set; }

            [ForeignKey("Employee_ID")]
            public virtual Employee Employee { get; set; }

            [ForeignKey("User_ID")]
            public virtual Account Account { get; set; }

            [ForeignKey("Table_ID")]
            public virtual Table Table { get; set; }

            public static int AddBill(int EmployeeID)
            {
                using (var ctx = new Conntext())
                {
                    var bill = new Bill()
                    {
                        DateCreate = DateTime.Now,
                        Employee_ID = EmployeeID,
                        Total = 0,
                    };
                    ctx.Bills.Add(bill);
                    ctx.SaveChanges();
                    return bill.BillID;
                }
            }
            public static List<dynamic> GetBill(int ID_Bill)
            {
                using (var ctx = new Conntext())
                {

                    var list = (from dt in ctx.BillDetails.AsEnumerable()
                                join b in ctx.Bills on dt.Bill_ID equals b.BillID
                                join f in ctx.Foods.AsEnumerable() on dt.Food_ID equals f.ID
                                where b.BillID == ID_Bill
                                select new
                                {
                                    f.Name,
                                    f.Unit,
                                    f.Price,
                                    dt.Amount,
                                    Total = Convert.ToInt32(f.Price) * Convert.ToInt32(dt.Amount)
                                }).Distinct();
                    return list.ToList<dynamic>();
                }
            }
            public static int TotalByBill(int Bill_ID)
            {
                using (var ctx = new Conntext())
                {
                    var dt = ctx.Bills.Where(x => x.BillID == Bill_ID).FirstOrDefault();
                    if (dt.Total == null) return 0;
                    return dt.Total.GetValueOrDefault();
                }
            }
            public static void DeleteBillIfNotExist(int ID_Bill)
            {
                using (var ctx = new Conntext())
                {
                    var dt = ctx.BillDetails.Where(x => x.Bill_ID == ID_Bill).FirstOrDefault();
                    if (dt == null)
                    {
                        var bill = ctx.Bills.FirstOrDefault(x => x.BillID == ID_Bill);
                        ctx.Bills.Remove(bill);
                        ctx.SaveChanges();
                    }
                }
            }


            public static List<dynamic> LietKe(DateTime start, DateTime end)
            {
                using (var ctx = new Conntext())
                {
                    var list = (from b in ctx.Bills
                                join nv in ctx.Employees on b.Employee_ID equals nv.ID
                                where b.DateCreate >= start && b.DateCreate <= end
                                select new
                                {
                                    b.BillID,
                                    b.DateCreate,
                                    nv.Name,
                                    b.Total
                                }).Distinct();
                    return list.ToList<dynamic>();
                }
            }
            public static int? ThongKe(DateTime start, DateTime end)
            {
                using (var ctx = new Conntext())
                {
                    var total = ctx.Bills.Where(t => t.DateCreate >= start).Where(t => t.DateCreate <= end).Sum(t => t.Total);
                    return total;
                }
            }
            public static void AddCustomerToBill(int CustomerID, int Bill_ID)
            {
                using (var ctx = new Conntext())
                {
                    var dt = ctx.Bills.Where(x => x.BillID == Bill_ID).FirstOrDefault();
                    if (dt != null)
                    {
                        dt.Customer_ID = CustomerID;
                        ctx.SaveChanges();
                    }
                }
            }
            public static void ThanhToan(int ToTal, int Customer_ID)
            {
                using (var ctx = new Conntext())
                {
                    var dt = ctx.Customers.Where(x => x.ID == Customer_ID).FirstOrDefault();
                    if (dt != null)
                    {
                        dt.Wallet = dt.Wallet - ToTal;
                        ctx.SaveChanges();
                    }
                }
            }
        }
}
