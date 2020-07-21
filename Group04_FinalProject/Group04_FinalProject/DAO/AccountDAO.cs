using Group04_FinalProject.DTO;
using Group04_FinalProject.DTO.Builder;
using System.Data;
using System.Data.SqlClient;


namespace Group04_FinalProject.DAO
{
    class AccountDAO : TemplateDAO
    {
        private static AccountDAO instance;
        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO();return instance; }
            private set { instance = value; }
        }
        private AccountDAO() { }

        public bool Login(string userName,string passWord)
        {
            string query =string.Format("USP_Login N'{0}' , N'{1}'", userName, passWord);
            ExecuteQuery(query);
            return dataTable.Rows.Count>0;
        }
        public bool UpdateAccount(string userName, string displayName, string pass, string newPass)
        {
            string query = string.Format("exec USP_UpdateAccount N'{0}' , N'{1}' ,N'{2}' , N'{3}'", userName, displayName, pass, newPass);
            ExecuteNonQuery(query);
            return data > 0;
        }

        public DataTable GetListAccount()
        {
            ExecuteQuery("SELECT UserName, DisplayName, Type FROM dbo.Account");
            return dataTable;
        }

        public Account GetAccountByUserName(string userName)
        {
            string query = string.Format("Select * from account where userName = N'{0}'", userName);
            ExecuteQuery(query);

            foreach (DataRow item in dataTable.Rows)
            {
                return new AccountBuilder()
                    .AddDisplayName(item["displayName"].ToString())
                    .AddPassword(item["password"].ToString())
                    .AddUserName(item["userName"].ToString())
                    .AddType((int)item["type"]).Buld();
            }

            return null;
        }

        public bool InsertAccount(string name, string displayName, int type)
        {
            string query = string.Format("INSERT dbo.Account ( UserName, DisplayName, Type, password )VALUES  ( N'{0}', N'{1}', {2}, N'{3}')", name, displayName, type, "1962026656160185351301320480154111117132155");
            ExecuteNonQuery(query);

            return data > 0;
        }


        public bool DeleteAccount(string name)
        {
            string query = string.Format("Delete Account where UserName = N'{0}'", name);
            ExecuteNonQuery(query);

            return data > 0;
        }

        public bool ResetPassword(string name)
        {
            string query = string.Format("update account set password = N'1962026656160185351301320480154111117132155' where UserName = N'{0}'", name);
            ExecuteNonQuery(query);

            return data > 0;
        }
        public bool UpdateAccount(string name, string displayName, int type)
        {
            string query = string.Format("UPDATE dbo.Account SET DisplayName = N'{1}', Type = {2} WHERE UserName = N'{0}'", name, displayName, type);
            ExecuteNonQuery(query);
            return data > 0;
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
