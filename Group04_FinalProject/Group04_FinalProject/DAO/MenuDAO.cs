using Group04_FinalProject.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DAO
{
    class MenuDAO :TemplateDAO
    {
        private static MenuDAO instance;

        public static MenuDAO Instance
        {
            get { if (instance == null) instance = new MenuDAO(); return MenuDAO.instance; }
            private set { MenuDAO.instance = value; }
        }

        private MenuDAO() { }

        public List<Menu> GetListMenuByTable(int id)
        {
            List<Menu> listMenu = new List<Menu>();

            string query = "SELECT f.name, bi.count, f.price, f.price*bi.count AS totalPrice FROM dbo.BillInfo AS bi, dbo.Bill AS b, dbo.Food AS f WHERE bi.idBill = b.id AND bi.idFood = f.id AND b.status = 0 AND b.idTable = " + id;
            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                Menu menu = new Menu(item);
                listMenu.Add(menu);
            }

            return listMenu;
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
