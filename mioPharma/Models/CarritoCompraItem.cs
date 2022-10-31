using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class CarritoCompraItem
    {
        [Key]
        public int Id { get; set; }

        public Medicamento Medicamento { get; set; }
        public int Cantidad { get; set; }


        public string CarritoCompraId { get; set; }
    }
}
