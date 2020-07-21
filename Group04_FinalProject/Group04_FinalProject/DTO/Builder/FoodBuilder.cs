using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group04_FinalProject.DTO.Builder
{
    class FoodBuilder : IFoodBuilder
    {
        public float price { get; set; }
        public int foodId {get;set;}
        public string name { get; set; }
        public int categoryID { get; set; }

        public IFoodBuilder AddCategoryID(int CategoryID)
        {
            categoryID = CategoryID;
            return this;
        }
        public IFoodBuilder AddFoodID(int id)
        {
            foodId = id;
            return this;
        }
        public IFoodBuilder AddName(string Name)
        {
            name = Name;
            return this;
        }
        public IFoodBuilder AddPrice(float Price)
        {
            price = Price;
            return this;
        }
        public Food Build()
        {
            return new Food(foodId, name, categoryID, price);
        }
    }
}
