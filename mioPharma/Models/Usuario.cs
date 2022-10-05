using mioPharma.Data.Enums;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Usuario
    {
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }
        public EstadoU EstadoU { get; set; }
        public TipoU TipoU { get; set; }

    }
}
