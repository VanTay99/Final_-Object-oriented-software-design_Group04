using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_project_04.DTO
{
   public  class Bill
    {
        public Bill (string billID,string tableID,string userID,float total, DateTime DateCreate)
        {
            this.BillID = billID;
            this.TableID = tableID;
            this.UserID = userID;
            this.Total = total;
            this.Datecreate = datecreate;

        }
        public Bill(DataRow row)
        {
            this.BillID = row["billID"].ToString();
            this.TableID = row["tableID"].ToString();
            this.UserID = row["userID"].ToString();
            this.Total = (float)Convert.ToDouble(row["total"].ToString());
            this.Datecreate = (DateTime)row["dateCreate"];

        }


        private string billID;
        public string BillID
        {
            get { return billID; }
            set { billID = value; }
        }

        private string tableID;
        public string TableID
        {
            get { return tableID; }
            set { tableID = value; }
        }

        private string userID;
        public string UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        private float total;
        public float Total
        {
            get { return total; }
            set { total = value; }
        }

        private DateTime datecreate;
        public DateTime Datecreate
        {
            get { return datecreate; }
            set { datecreate = value; }
        }
    }
}
