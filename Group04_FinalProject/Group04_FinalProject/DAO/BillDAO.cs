using Group04_FinalProject.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Group04_FinalProject.DAO
{
    class BillDAO: TemplateDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }
        public int GetUncheckBillIDByTableID(int id)
        {
            ExecuteQuery("SELECT * FROM dbo.Bill WHERE idTable = " + id + " AND status = 0");

            if (dataTable.Rows.Count > 0)
            {
                Bill bill = new Bill(dataTable.Rows[0]);
                return bill.ID;
            }
            return -1;
        }
        public void CheckOut(int id, int discount,float totalPrice)
        {
            string query = "UPDATE dbo.Bill SET dateCheckOut = GETDATE(), status = 1, " + "discount = " + discount + ", totalPrice = " + totalPrice + " WHERE id = " + id;
            ExecuteNonQuery(query);
        }
        public void InsertBill(int id)
        {
            string query = string.Format("exec USP_InsertBill {0}", id);
            ExecuteNonQuery(query);
        }

        public DataTable GetBillListByDate(DateTime checkIn, DateTime checkOut)
        {
            string query = string.Format("exec USP_GetListBillByDate N'{0}',N'{1}'", checkIn, checkOut);
            ExecuteQuery(query);
            return dataTable;
        }

        public DataTable GetBillListByDateAndPage(DateTime checkIn, DateTime checkOut, int pageNum)
        {
            string query = string.Format("exec USP_GetListBillByDateAndPage N'{0}' , N'{1}' ,N'{2}'", checkIn, checkOut, pageNum);
            ExecuteQuery(query);
            return dataTable;
        }

        public int GetNumBillListByDate(DateTime checkIn, DateTime checkOut)
        {
            string query = string.Format("exec USP_GetNumBillByDate N'{0}' ,N'{1}'", checkIn, checkOut);
            ExecuteScalar(query);
            return (int)scalar;
        }

        public int GetMaxIDBill()
        {
            try
            {
                ExecuteScalar("SELECT MAX(id) FROM dbo.Bill");
                return (int)scalar;
            }
            catch
            {
                return 1;
            }
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
