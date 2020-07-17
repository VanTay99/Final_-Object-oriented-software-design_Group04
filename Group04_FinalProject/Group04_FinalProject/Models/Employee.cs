using Group04_FinalProject.Connect;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.Models
{

    [Table("Employee")]

    public class Employee : Person
    {
        public DateTime HireDate { get; set; }
        public string CMND { get; set; }
        public List<Employee> LoadData()
        {
            using (var ctx = new Conntext())
            {
                return ctx.Employees.ToList();
            }
        }
        public void AddData()
        {
            using (var ctx = new Conntext())
            {
                var employee = new Employee();
                employee.Name = Name;
                employee.DOB = DOB;
                employee.CMND = CMND;
                employee.Address = Address;
                employee.Phone = Phone;
                employee.Sex = Sex;
                employee.HireDate = HireDate;
                employee.Image = Image;
                ctx.Employees.Add(employee);
                ctx.SaveChanges();
            }
        }

        public void Update()
        {
            using (var ctx = new Conntext())
            {
                var khQuery = (from emp in ctx.Employees
                               where emp.ID == ID
                               select emp).SingleOrDefault();
                if (khQuery != null)
                {
                    khQuery.Name = Name;
                    khQuery.DOB = DOB;
                    khQuery.Address = Address;
                    khQuery.CMND = CMND;
                    khQuery.Phone = Phone;
                    khQuery.Sex = Sex;
                    khQuery.HireDate = HireDate;
                    khQuery.Image = Image;
                    ctx.SaveChanges();
                }
            }

        }

        public void DeleteData()
        {
            using (var ctx = new Conntext())
            {
                var nvQuery = from emp in ctx.Employees
                              where emp.ID == ID
                              select emp;
                ctx.Employees.RemoveRange(nvQuery);
                ctx.SaveChanges();
            }

        }

        public List<dynamic> FindSDT()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Employees
                            where b.Phone.Contains(Phone)
                            select new
                            {
                                b.ID,
                                b.Name,
                                b.Address,
                                b.DOB,
                                b.CMND,
                                b.Phone,
                                b.Sex,
                                b.HireDate,
                                b.Image
                            });
                return list.ToList<dynamic>();
            }
        }
        public List<dynamic> FindName()
        {
            using (var ctx = new Conntext())
            {
                var list = (from b in ctx.Employees
                            where b.Name.Contains(Name)
                            select new
                            {
                                b.ID,
                                b.Name,
                                b.Address,
                                b.DOB,
                                b.CMND,
                                b.Phone,
                                b.Sex,
                                b.HireDate,
                                b.Image
                            });
                return list.ToList<dynamic>();
            }
        }
    }
}
