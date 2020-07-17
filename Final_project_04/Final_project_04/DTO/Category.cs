using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_project_04.DTO
{
    public class Category
    {
        public Category(string categoryID, string name,string description)
        {
            this.CategoryID = categoryID;
            this.Name = name;
            this.Description = description;
        }
       

        public Category(DataRow row)
        {
            this.categoryID = row["id"].ToString();
            this.Name = row["name"].ToString();
        }
        private string description;
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string categoryID;

        public string CategoryID
        {
            get { return categoryID; }
            set { categoryID = value; }
        }
    }
}
