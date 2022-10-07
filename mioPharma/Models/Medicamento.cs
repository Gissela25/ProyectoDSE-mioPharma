using mioPharma.Data.Base;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Medicamento:IEntityBase
    {
        [Key]
        public int Id { get; set; }
        [Display(Name ="Nombre")]
        [Required(ErrorMessage = "El campo Nombre no puede estar vacío")]
        [StringLength(45, ErrorMessage = "Maximo de carácteres : 45")]
        [RegularExpression(@"^[a-zA-Z'\s]*$", ErrorMessage = "El campo Nombre deb" +
            "e llevar solamente letras")]
        public string Nombre { get; set; }
        [Display(Name = "Precio")]
        [Required(ErrorMessage = "El campo Precio no puede estar vacío")]
        [RegularExpression(@"^([0-9]+).?([0-9]+)?$", ErrorMessage = "No es el formato correcto")]
        public double Precio { get; set; }
        [Display(Name = "Presentacion")]
        [Required(ErrorMessage = "El campo Presentacion no puede estar vacío")]
        [RegularExpression("^([0-9A-Za-z#/\\()&._*,&!¡?¿|°-]+[ ]?[0-9A-Za-z#/\\()&._*,&!¡?¿|°-])+$", ErrorMessage = "Caracter especial desconocido o direccion demasiado larga")]
        [StringLength(250, ErrorMessage = "Número máximo de letras superado")]
        public string Presentacion { get; set; }
        [Display(Name = "Existencias")]
        [Required(ErrorMessage = "El campo Existencias no puede estar vacío")]
        [RegularExpression(@"^[0-9]+$", ErrorMessage = "El campo Existencias deb" +
            "e llevar solamente Números")]

        public double Existencias { get; set; }
        [Display(Name = "Descripcion")]
        [Required(ErrorMessage = "El campo Descripcion no puede estar vacío")]
        [MinLength(5, ErrorMessage = "Descripcion Inválida")]
        [RegularExpression("^([0-9A-Za-z#/\\()&._*,&!¡?¿|°-]+[ ]?[0-9A-Za-z#/\\()&._*,&!¡?¿|°-])+$", ErrorMessage = "Caracter especial desconocido o direccion demasiado larga")]
        [StringLength(250, ErrorMessage = "Número máximo de letras superado")]
        public string Descripcion { get; set; }
        [Display(Name = "Composicion")]
        [Required(ErrorMessage = "El campo Composicion no puede estar vacío")]
        public string Img_Composicion { get; set; }
        [Display(Name = "Medicamento")]
        [Required(ErrorMessage = "El campo Medicamento no puede estar vacío")]
        public string Img_Medicamento { get; set; }

    }
}
