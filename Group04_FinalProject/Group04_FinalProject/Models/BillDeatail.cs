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
    [Table("BillDeatail")]
    public class BillDeatail
    {
        [Key]
        public int ID { get; set; }
        public int Amount { get; set; }

        public int Bill_ID { get; set; }

        [ForeignKey("Bill_ID")]
        public virtual Bill Bill { get; set; }

        public int Food_ID { get; set; }

        [ForeignKey("Food_ID")]
        public virtual Food Food { get; set; }

        public static int AddOrUpdateDetail(int IDFood, int IDBill, int SoLuong)
        {
            using (var ctx = new Conntext())
            {
                var dt = ctx.BillDetails.Where(x => x.Food_ID == IDFood).Where(x => x.Bill_ID == IDBill).FirstOrDefault();
                if (dt != null)
                {
                    dt.Amount = SoLuong;
                    ctx.SaveChanges();
                    return dt.ID;
                }
                else
                {
                    var dtAdd = new BillDeatail()
                    {
                        Food_ID = IDFood,
                        Bill_ID = IDBill,
                        Amount = SoLuong
                    };
                    ctx.BillDetails.Add(dtAdd);
                    ctx.SaveChanges();
                    return dtAdd.ID;

                }
            }
        }
        public static void DeleteDetail(int ID_Food, int ID_Bill)
        {
            using (var ctx = new Conntext())
            {
                var dt = ctx.BillDetails.Where(x => x.Food_ID == ID_Food).Where(x => x.Bill_ID == ID_Bill).FirstOrDefault();
                ctx.BillDetails.Remove(dt);
                ctx.SaveChanges();
            }
        }
    }
}
