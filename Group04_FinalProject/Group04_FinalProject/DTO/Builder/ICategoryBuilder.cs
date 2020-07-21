using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    interface ICategoryBuilder
    {
        ICategoryBuilder AddCategoryID(int id);
        ICategoryBuilder AddName(string name);
        Category Build();
    }
}
