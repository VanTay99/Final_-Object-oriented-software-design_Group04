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
    [Table("Account")]
    public class Account
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]

        [Required]
        [MaxLength(100)]
        public string Username { get; set; }

        [Required]
        [MinLength(8)]

        public string Password { get; set; }
        [Required]
        [MaxLength(100)]
        public string Openned { get; set; }

        [Required]
        [MaxLength(100)]
        public string Status { get; set; }

        [Required]
        public bool IsAdmin { get; set; }

        public int Employee_ID { get; set; }

        [ForeignKey("Employee_ID")]
        public virtual Employee Employee { get; set; }

        public bool IsUser(ref int EmployeeID)
        {
            using (var ctx = new Conntext())
            {
                var q = (from p in ctx.Accounts
                         where p.Username == Username
                         && p.Password == Password && p.IsAdmin == IsAdmin
                         select p).SingleOrDefault();
                if (q != null)
                {
                    EmployeeID = q.Employee_ID;
                    return true;
                }
                else return false;
            }

        }

        public void AddData()
        {
            using (var ctx = new Conntext())
            {
                var account = new Account();
                account.Username = Username;
                account.Password = Password;
                account.IsAdmin = IsAdmin;
                account.Employee_ID = Employee_ID;
                ctx.Accounts.Add(account);
                ctx.SaveChanges();
            }
        }

        public void Update()
        {
            using (var ctx = new Conntext())
            {
                var khQuery = (from ac in ctx.Accounts
                               where ac.Username == Username
                               select ac).SingleOrDefault();
                if (khQuery != null)
                {
                    khQuery.Password = Password;
                    khQuery.Employee_ID = Employee_ID;
                    khQuery.IsAdmin = IsAdmin;
                    ctx.SaveChanges();
                }
            }


        }

        public void DeleteData()
        {
            using (var ctx = new Conntext())
            {
                var nvQuery = from ac in ctx.Accounts
                              where ac.Username == Username
                              select ac;
                ctx.Accounts.RemoveRange(nvQuery);
                ctx.SaveChanges();
            }

        }

        public List<dynamic> LoadData()
        {
            using (var ctx = new Conntext())
            {
                var result = from c in ctx.Accounts
                             select new
                             {
                                 Username = c.Username,
                                 Password = c.Password,
                                 IsAdmin = c.IsAdmin,
                                 Employee_ID = c.Employee_ID
                             };
                return result.ToList<dynamic>();
            }
        }

        public List<dynamic> FindUserName()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Accounts
                            where b.Username.Contains(Username)
                            select new
                            {
                                b.Username,
                                b.Password,
                                b.IsAdmin,
                                b.Employee_ID,
                            });
                return list.ToList<dynamic>();
            }
        }

        public List<dynamic> FindID()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Accounts
                            where b.Employee_ID == Employee_ID
                            select new
                            {
                                b.Username,
                                b.Password,
                                b.IsAdmin,
                                b.Employee_ID,
                            });
                return list.ToList<dynamic>();
            }
        }

    }
}

