using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    interface IBillInfoBuilder
    {
        IBillInfoBuilder AddID(int id);
        IBillInfoBuilder AddBillID(int bid);
        IBillInfoBuilder AddFoodID(int fid);
        IBillInfoBuilder AddCount(int c);
        BillInfo Build();
    }
}
