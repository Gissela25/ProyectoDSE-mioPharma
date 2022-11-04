using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace mioPharma.Models
{
    public class ApplicationUser:IdentityUser
    {
        [Display(Name = "Nombre(s)")]
        public string Nombre { get; set; }
        [Display(Name = "Apellido(s)")]
        public string Apellido { get; set; }

        [Display(Name = "Dirección")]
        public string Address { get; set; }
    }
}
