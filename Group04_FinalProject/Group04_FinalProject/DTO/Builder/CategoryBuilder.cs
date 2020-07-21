using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    class CategoryBuilder : ICategoryBuilder
    {
        public int id { get; set; }

        public string name { get; set; }
        public ICategoryBuilder AddCategoryID(int Id)
        {
            id = Id;
            return this;
        }

        public ICategoryBuilder AddName(string Name)
        {
            name = Name;
            return this;
        }

        public Category Build()
        {
            return new Category(id, name);
        }
    }
}
