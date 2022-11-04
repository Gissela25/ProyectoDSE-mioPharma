using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace mioPharma.Data.ViewModels
{
    public class LoginVM
    {
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Email es un campo requerido")]
        public string EmailAddress { get; set; }

        [Required(ErrorMessage = "Password es un campo requerido")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
