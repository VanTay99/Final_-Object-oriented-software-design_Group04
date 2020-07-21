using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    interface IFoodBuilder
    {
        IFoodBuilder AddFoodID(int id);
        IFoodBuilder AddName(string name);
        IFoodBuilder AddCategoryID(int categoryID);
        IFoodBuilder AddPrice(float price);
        Food Build();
    }
}
