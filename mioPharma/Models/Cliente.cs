using mioPharma.Data.Base;
using mioPharma.Data.Enums;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Cliente:IEntityBase
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "El campo Nombre no puede estar vacío")]
        [StringLength(45, ErrorMessage = "Maximo de carácteres : 45")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Nombre deb" +
            "e llevar solamente letras")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "El campo Apellido no puede estar vacío")]
        [StringLength(45, ErrorMessage = "Maximo de carácteres : 45")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Apellido debe llevar solamente letras")]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "El campo Apellido no puede estar vacío")]
        [RegularExpression("[267][0-9]{3}-?[0-9]{4}", ErrorMessage = "El número no cumple con el formato")]
        public string Telefono { get; set; }
        [Required(ErrorMessage ="El campo Direccion no puede estar vacío")]
        [MinLength(5,ErrorMessage ="Direccion Inválida")]
        [RegularExpression("^([0-9A-Za-z#/\\()&._*,&!¡?¿|°-]+[ ]?[0-9A-Za-z#/\\()&._*,&!¡?¿|°-])+$", ErrorMessage ="Caracter especial desconocido o direccion demasiado larga")]
        [StringLength(250, ErrorMessage ="Número máximo de letras superado")]
        public string Direccion { get; set; }
        [Display(Name ="Dirección")]
        [Required(ErrorMessage = "El campo Correo no puede estar vacío")]
        [RegularExpression(@"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$", ErrorMessage = "El correo ingresado es invalido")]
        public string Correo { get; set; }
        [Display(Name = "Contraseña")]
        [Required(ErrorMessage = "El campo Contraseña no puede estar vacío")]
        [RegularExpression(@"^[A-Za-z0-9*-+.\$%&#!_¡¿?()]{8,100}$", ErrorMessage = "Debe contener mínimo 8 caracteres")]
        public string Clave { get; set; }
        [Display(Name ="Estado de Cliente")]
        public EstadoU EstadoC { get; set; }
    }
}
