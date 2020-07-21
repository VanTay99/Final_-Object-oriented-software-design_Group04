using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    interface IAccountBuilder
    {
        IAccountBuilder AddUserName(string usn);
        IAccountBuilder AddDisplayName(string dp);
        IAccountBuilder AddType(int t);
        IAccountBuilder AddPassword(string pw);

        Account Buld();

    }
}
