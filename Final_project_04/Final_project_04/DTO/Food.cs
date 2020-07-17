using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_project_04.DTO
{
    public class Food
    {
        public Food(string id, string name, string categoryID, float price)
        {
            this.ID = id;
            this.Name = name;
            this.CategoryID = categoryID;
            this.Price = price;
        }

        public Food(DataRow row)
        {
            this.ID = row["id"].ToString();
            this.Name = row["name"].ToString();
            this.CategoryID = row["categoryID"].ToString();
            this.Price = (float)Convert.ToDouble(row["price"].ToString());
        }

        private float price;

        public float Price
        {
            get { return price; }
            set { price = value; }
        }

        private string categoryID;

        public string CategoryID
        {
            get { return categoryID; }
            set { categoryID = value; }
        }

        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string iD;

        public string ID
        {
            get { return iD; }
            set { iD = value; }
        }
    }

}
