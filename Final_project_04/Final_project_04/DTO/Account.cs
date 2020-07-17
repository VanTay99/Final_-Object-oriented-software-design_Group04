using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_project_04.DTO
{
    public class Account
    {
       
        public Account(string UserID, string password, string UserRole, DateTime CreatedDate, string Status, string Employee_ID)
        {
        }
        
        public Account(DataRow row)
        {
            this.UserID = row["userID"].ToString();
            this.Password = row["password"].ToString();
            this.UserRole = row["userRole"].ToString();
           this.CreatedDate = (DateTime)row["createdDate"];
            this.Status = row["status"].ToString();
            this.Employee_ID = row["employee_ID"].ToString();
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status= value; }
        }

        private string employee_ID;

        public string Employee_ID
        {
            get { return employee_ID; }
            set { employee_ID= value; }
        }

        private string userRole;

        public string UserRole
        {
            get { return userRole; }
            set { userRole = value; }
        }

        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        private DateTime createdDate;

        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }

        private string userID;

        public string UserID
        {
            get { return userID; }
            set { userID = value; }
        }
    }
    

}
