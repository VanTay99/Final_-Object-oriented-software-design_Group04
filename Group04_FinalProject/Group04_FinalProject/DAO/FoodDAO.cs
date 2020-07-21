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
    class FoodDAO : TemplateDAO
    {
        private static FoodDAO instance;

        public static FoodDAO Instance
        {
            get { if (instance == null) instance = new FoodDAO(); return FoodDAO.instance; }
            private set { FoodDAO.instance = value; }
        }

        private FoodDAO() { }
        public List<Food> GetFoodByCategoryID(int id)
        {
            List<Food> list = new List<Food>();

            string query = "select * from Food where idCategory = " + id;

            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                Food food = new FoodBuilder()
                    .AddCategoryID((int)item["idcategory"])
                    .AddFoodID((int)item["id"])
                    .AddName(item["name"].ToString())
                    .AddPrice((float)Convert.ToDouble(item["price"].ToString()))
                    .Build();
                list.Add(food);
            }

            return list;
        }

        public List<Food> GetListFood()
        {
            List<Food> list = new List<Food>();

            string query = "select * from Food";

            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                Food food = new FoodBuilder()
                    .AddCategoryID((int)item["idcategory"])
                    .AddFoodID((int)item["id"])
                    .AddName(item["name"].ToString())
                    .AddPrice((float)Convert.ToDouble(item["price"].ToString()))
                    .Build();
                list.Add(food);
            }

            return list;
        }
        public bool InsertFood(string name, int id, float price)
        {
            string query = string.Format("INSERT dbo.Food ( name, idCategory, price )VALUES  ( N'{0}', {1}, {2})", name, id, price);
            ExecuteNonQuery(query);

            return data > 0;
        }

        public bool UpdateFood(int idFood, string name, int id, float price)
        {
            string query = string.Format("UPDATE dbo.Food SET name = N'{0}', idCategory = {1}, price = {2} WHERE id = {3}", name, id, price, idFood);
            ExecuteNonQuery(query);

            return data > 0;
        }

        public bool DeleteFood(int idFood)
        {
            BillInfoDAO.Instance.DeleteBillInfoByFoodID(idFood);

            string query = string.Format("Delete Food where id = {0}", idFood);
            ExecuteNonQuery(query);

            return data > 0;
        }

        public List<Food> SearchFoodByName(string name)
        {

            List<Food> list = new List<Food>();

            string query = string.Format("SELECT * FROM dbo.Food WHERE dbo.fuConvertToUnsign1(name) LIKE N'%' + dbo.fuConvertToUnsign1(N'{0}') + '%'", name);

            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                Food food = new Food(item);
                list.Add(food);
            }

            return list;
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
