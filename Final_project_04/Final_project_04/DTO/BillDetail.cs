using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Final_project_04.DTO
{
    class BillDetail
    {
        public BillDetail(string id, string billID, string foodID, int count)
        {
            this.ID = id;
            this.BillID = billID;
            this.FoodID = foodID;
            this.Count = count;
        }

        public BillDetail(DataRow row)
        {
            this.ID = row["id"].ToString();
            this.BillID = row["idbill"].ToString();
            this.FoodID = row["idfood"].ToString();
            this.Count = (int)row["count"];
        }

        private int count;

        public int Count
        {
            get { return count; }
            set { count = value; }
        }

        private string foodID;

        public string FoodID
        {
            get { return foodID; }
            set { foodID = value; }
        }

        private string billID;

        public string BillID
        {
            get { return billID; }
            set { billID = value; }
        }

        private string iD;

        public string ID
        {
            get { return iD; }
            set { iD = value; }
        }

    }
}
