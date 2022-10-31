using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class OrdenItem
    {
        [Key]
        public int Id { get; set; }

        public int Cantidad { get; set; }
        public double Precio { get; set; }

        public int MedicamentoId { get; set; }
        [ForeignKey("MedicamentoId")]
        public Medicamento Medicamento { get; set; }

        public int OrdenId { get; set; }
        [ForeignKey("OrdenId")]
        public Orden Orden { get; set; }
    }
}
