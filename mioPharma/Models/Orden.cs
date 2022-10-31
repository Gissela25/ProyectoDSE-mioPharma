using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class Orden
    {
        [Key]
        public int Id { get; set; }

        public string Email { get; set; }

        public string UserId { get; set; }

        public List<OrdenItem> OrdenItems { get; set; }
    }
}
