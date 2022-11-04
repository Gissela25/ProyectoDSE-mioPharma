using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace mioPharma.Data.ViewModels
{
    public class RegisterVM
    {
        [Display(Name = "Nombre(s)")]
        [Required(ErrorMessage ="El campo Nombre es obligatorio")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Nombre debe llevar solamente letras")]
        public string Nombre { get; set; }

        [Display(Name = "Apellido(s)")]
        [Required(ErrorMessage = "El campo Apellido es obligatorio")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Apellido debe llevar solamente letras")]
        public string Apellido { get; set; }

        [Display(Name = "Teléfono")]
        [Required(ErrorMessage = "Teléfono es requerido")]
        [RegularExpression("[267][0-9]{3}-?[0-9]{4}", ErrorMessage = "El número no cumple con el formato requerido")]
        public string PhoneNumber { get; set; }

        [Display(Name = "Dirección")]
        [Required(ErrorMessage = "El campo Dirección no puede estar vacío")]
        [MinLength(5, ErrorMessage = "Direccion Inválida")]
        [RegularExpression("^([0-9A-Za-z#/\\()&._*,&!¡?¿|°-]+[ ]?[0-9A-Za-z#/\\()&._*,&!¡?¿|°-])+$", ErrorMessage = "Caracter especial desconocido o direccion demasiado larga")]
        [StringLength(250, ErrorMessage = "Número máximo de letras superado")]
        public string Address { get; set; }

        [Display(Name = "Email Address")]
        [Required(ErrorMessage = "Email address es requerido")]
        [RegularExpression(@"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$", ErrorMessage = "El correo ingresado es invalido")]
        public string EmailAddress { get; set; }

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
