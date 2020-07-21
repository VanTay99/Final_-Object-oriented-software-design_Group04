using Group04_FinalProject.DTO;
using Group04_FinalProject.DTO.Builder;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DAO
{
    class CategoryDAO: TemplateDAO
    {
        private static CategoryDAO instance;

        public static CategoryDAO Instance
        {
            get { if (instance == null) instance = new CategoryDAO(); return CategoryDAO.instance; }
            private set { CategoryDAO.instance = value; }
        }

        private CategoryDAO() { }

        public List<Category> GetListCategory()
        {
            List<Category> list = new List<Category>();

            string query = "select * from FoodCategory";

            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                Category category = new CategoryBuilder()
                    .AddCategoryID((int)item["id"])
                    .AddName(item["name"].ToString())
                    .Build();
                list.Add(category);
            }

            return list;
        }

        public Category GetCategoryByID(int id)
        {
            Category category = null;

            string query = "select * from FoodCategory where id = " + id;

            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                category = new CategoryBuilder()
                    .AddCategoryID((int)item["id"])
                    .AddName(item["name"].ToString())
                    .Build();
                return category;
            }

            return category;
        }

        public override void ExecuteQuerySql(string q)
        {
            if (adapter == null)
            {
                adapter = new SqlDataAdapter(objCommand);
            }
            objCommand.CommandText = q;
            dataTable.Columns.Clear();
            dataTable.Rows.Clear();
            adapter.Fill(dataTable);
        }
        public override void ExecuteNonQuerySql(string q)
        {
            data = 0;
            objCommand.CommandText = q;
            data = objCommand.ExecuteNonQuery();
        }
        public override void ExecuteScalarSql(string q)
        {
            scalar = 0;
            objCommand.CommandText = q;
            scalar = objCommand.ExecuteScalar();
        }
    }
}
