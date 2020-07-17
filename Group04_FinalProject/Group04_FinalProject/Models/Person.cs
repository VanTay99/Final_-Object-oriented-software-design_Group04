using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
namespace Group04_FinalProject.Models
{
   public class Person
    {
        [Key]
        public int ID { get; set; }

        [DisplayName("Họ tên")]
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [DisplayName("Địa chỉ")]
        [Required]
        public string Address { get; set; }

        [DisplayName("Ngày sinh")]
        [Required]
        public DateTime DOB { get; set; }

        [DisplayName("SĐT")]
        [Required]
        [MaxLength(25)]
        public string Phone { get; set; }

        [DisplayName("Giới tính")]
        [Required]
        [MaxLength(3)]
        public string Sex { get; set; }

        [DisplayName("Hình ảnh")]
        public string Image { get; set; }
    }
}
