using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DAO
{
    abstract class TemplateDAO
    {
        protected SqlConnection objConnection = null;
        protected SqlCommand objCommand = null;
        public DataTable dataTable = new DataTable();
        public int data;
        public object scalar = 0;
        public SqlDataAdapter adapter = null;
        private void Connect()
        {
            if (objConnection == null)
            {
                objConnection = new SqlConnection(@"Data Source=DESKTOP-6J86EQ5\SQLEXPRESS;Initial Catalog=QuanLyQuanAnDT;Integrated Security=True");
            }
            if (objCommand == null)
            {
                objCommand = new SqlCommand();
                objCommand.Connection = objConnection;
            }
            objConnection.Open();
        }
        private void Disconnect()
        {
            objConnection.Close();
        }
        public void ExecuteQuery(string q)
        {
            Connect();
            ExecuteQuerySql(q);
            Disconnect();
        }
        public void ExecuteNonQuery(string q)
        {
            Connect();
            ExecuteNonQuerySql(q);
            Disconnect();
        }
        public void ExecuteScalar(string q)
        {
            Connect();
            ExecuteScalarSql(q);
            Disconnect();
        }
        public abstract void ExecuteQuerySql(string q);
        public abstract void ExecuteNonQuerySql(string q);
        public abstract void ExecuteScalarSql(string q);

    }
}
