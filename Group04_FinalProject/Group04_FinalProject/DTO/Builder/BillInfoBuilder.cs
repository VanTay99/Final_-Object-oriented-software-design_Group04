using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    class BillInfoBuilder : IBillInfoBuilder
    {
        public int id { get; set; }
        public int BillID {get;set;}
        public int FoodID { get; set; }
        public int Count { get; set; }

        public IBillInfoBuilder AddBillID(int bid)
        {
            BillID = bid;
            return this;
        }

        public IBillInfoBuilder AddCount(int c)
        {
            Count = c;
            return this;
        }

        public IBillInfoBuilder AddFoodID(int fid)
        {
            FoodID = fid;
            return this;
        }

        public IBillInfoBuilder AddID(int Id)
        {
            id = Id;
            return this;
        }

        public BillInfo Build()
        {
            return new BillInfo(id, BillID, FoodID, Count);
        }
    }
}
