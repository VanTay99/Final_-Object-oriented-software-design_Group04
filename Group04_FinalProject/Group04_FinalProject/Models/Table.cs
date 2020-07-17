using Group04_FinalProject.Connect;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.Models
{
    [Table("Table")]
    public class Table
    {

        [Key]
        public int TableID { get; set; }

        [DisplayName("Tên Bàn")]
        [Required]
        [MaxLength(25)]
        public string Name { get; set; }

        [DisplayName("Trạng Thái")]
        [Required]
        [MaxLength(25)]
        public string Status { get; set; }


        public void AddData()
        {
            using (var ctx = new Conntext())
            {
                var table = new Table();
                table.Name = Name;
                table.Status = Status;
                ctx.Tables.Add(table);
                ctx.SaveChanges();
            }
        }

        public void Update()
        {
            using (var ctx = new Conntext())
            {
                var fQuery = (from fd in ctx.Tables
                              where fd.TableID == TableID
                              select fd).SingleOrDefault();
                if (fQuery != null)
                {
                    fQuery.Name = Name;
             
                    fQuery.Status = Status;
                    ctx.SaveChanges();
                }
            }
        }

        public void DeleteData()
        {
            using (var ctx = new Conntext())
            {
                var nvQuery = from fd in ctx.Tables
                              where fd.TableID == TableID
                              select fd;
                ctx.Tables.RemoveRange(nvQuery);
                ctx.SaveChanges();
            }
        }

     

        public List<dynamic> LoadData()
        {
            using (var ctx = new Conntext())
            {
                var result = from c in ctx.Tables
                             select new
                             {
                                 TableID = c.TableID,
                                 Name = c.Name,
                                 Status = c.Status,
                                
                             };
                return result.ToList<dynamic>();
            }
        }    
    }
}
    
