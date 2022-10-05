using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Medicamento
    {
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }
        public string Presentacion { get; set; }
        public double Existencias { get; set; }
        public string Descripcion { get; set; }
        public string Img_Composicion { get; set; }
        public string Img_Medicamento { get; set; }

    }
}
