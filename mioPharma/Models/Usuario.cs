using mioPharma.Data.Base;
using mioPharma.Data.Enums;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Usuario:IEntityBase
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "El campo Nombre no puede estar vacío")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage ="El campo Nombre debe llevar solamente letras")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "El campo Apellido no puede estar vacío")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Apellido debe llevar solamente letras")]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "El campo Correo no puede estar vacío")]
        [RegularExpression(@"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$", ErrorMessage = "El correo ingresado es invalido")]
        public string Correo { get; set; }
        [Display(Name ="Contraseña")]
        [Required(ErrorMessage = "El campo Contraseña no puede estar vacío")]
        [RegularExpression(@"^[A-Za-z0-9*-+.\$%&#!_¡¿?()]{8,40}$", ErrorMessage = "Debe contener mínimo 8 caracteres")]
        public string Clave { get; set; }
        [Display(Name = "Estado de Usuario")]
        [Required(ErrorMessage = "Selecciona el Estado del Usuario")]
        public EstadoU EstadoU { get; set; }
        [Display(Name = "Tipo de Usuario")]
        [Required(ErrorMessage = "Selecciona el Tipo de Usuario")]
        public TipoU TipoU { get; set; }

    }
}
