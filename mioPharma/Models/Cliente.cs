using mioPharma.Data.Enums;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Cliente
    {
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }
        public EstadoU EstadoC { get; set; }
    }
}
