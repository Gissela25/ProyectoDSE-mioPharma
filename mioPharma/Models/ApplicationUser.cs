using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class ApplicationUser:IdentityUser
    {
        [Display(Name = "Nombre(s)")]
        [Required(ErrorMessage = "El campo Nombre es obligatorio")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Nombre debe llevar solamente letras")]
        public string Nombre { get; set; }

        [Display(Name = "Apellido(s)")]
        [Required(ErrorMessage = "El campo Apellido es obligatorio")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Apellido debe llevar solamente letras")]
        public string Apellido { get; set; }

        [Display(Name = "Dirección")]
        [Required(ErrorMessage = "El campo Dirección no puede estar vacío")]
        [MinLength(5, ErrorMessage = "Direccion Inválida")]
        [RegularExpression("^([0-9A-Za-z#/\\()&._*,&!¡?¿|°-]+[ ]?[0-9A-Za-z#/\\()&._*,&!¡?¿|°-])+$", ErrorMessage = "Caracter especial desconocido o direccion demasiado larga")]
        [StringLength(250, ErrorMessage = "Número máximo de letras superado")]
        public string Address { get; set; }

        public int UserLvl { get; set; }

        public int UserState { get; set; }
    }
}
