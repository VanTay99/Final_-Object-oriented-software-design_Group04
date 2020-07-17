using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_project_04.DTO
{
   public class Employee
    {
        public Employee(string emPloyeeID, string cMND, string name, string sex,string phone)
        {
            this.EmPloyeeID = employeeID;
            this.CMND = cMND;
            this.Name = name;
            this.Sex = sex;
            this.Phone = phone;
        }

        public Employee(DataRow row)
        {
            this.EmPloyeeID = row["employeeID"].ToString();

            this.Name = row["name"].ToString();

            this.CMND = row["cMND"].ToString();

            this.Sex = row["sex"].ToString();

            this.Phone = row["phone"].ToString();
        }

        private string  employeeID;

        public string EmPloyeeID
        {
            get { return employeeID; }
            set { employeeID = value; }
        }

        private string cMND;

        public string CMND
        {
            get { return cMND; }
            set { cMND = value; }
        }

        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string sex;

        public string Sex 
        {
            get { return sex; }
            set { sex = value; }
        }
        private string phone;
        public string Phone
        {
            get { return phone;}
            set { phone = value; }
        }
    }
}
