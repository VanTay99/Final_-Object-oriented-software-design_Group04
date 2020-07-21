using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    class AccountBuilder : IAccountBuilder
    {

        public string username { get; set; }
        public string displayname { get; set; }
        public string password { get; set; }
        public int type { get; set; }
        public IAccountBuilder AddDisplayName(string dp)
        {
            displayname = dp;
            return this;
        }

        public IAccountBuilder AddPassword(string pw)
        {
            password = pw;
            return this;
        }

        public IAccountBuilder AddType(int t)
        {
            type = t;
            return this;
        }

        public IAccountBuilder AddUserName(string usn)
        {
            username = usn;
            return this;
        }

        public Account Buld()
        {
            return new Account(username, displayname, type, password);
        }
    }
}
