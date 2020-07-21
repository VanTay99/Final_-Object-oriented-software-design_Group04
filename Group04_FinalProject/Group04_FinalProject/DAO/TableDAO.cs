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
    class TableDAO : TemplateDAO
    {
        private static TableDAO instance;

        public static TableDAO Instance
        {
            get { if (instance == null) instance = new TableDAO(); return instance; }
            private set { instance = value; }
        }
        public static int TableWidth = 80;
        public static int TableHeight = 80;
        private TableDAO() { }
        public void SwitchTable(int id1, int id2)
        {
            string query = string.Format("USP_SwitchTable N'{0}' ,N'{1}'", id1, id2);
            ExecuteQuery(query);
        }
        public List<Table> LoadTableList()
        {
            List<Table> tablelist = new List<Table>();
            ExecuteQuery("USP_GetTableList");
            foreach(DataRow item in dataTable.Rows)
            {
                Table table = new Table(item);
                tablelist.Add(table);
            }
            return tablelist;
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
