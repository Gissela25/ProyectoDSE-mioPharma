using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace mioPharma.Data.ViewModels
{
    public class ChangePasswordVM
    {
        [Display(Name ="Password Actual")]
        [Required(ErrorMessage = "Password Actual es requerido")]
        [DataType(DataType.Password)]
        public string CurrentPassword { get; set; }

        [Required(ErrorMessage = "Password es requerido")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Confirmar Password")]
        [Required(ErrorMessage = "Confirm password es requerido")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Passwords no coincidentes")]
        public string ConfirmPassword { get; set; }
    }
}
