using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using mioPharma.Models;

namespace mioPharma.Data
{
    public class AppDbContext:IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Medicamento> Medicamentos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }

        public DbSet<Orden> Ordens { get; set; }
        public DbSet<OrdenItem> OrdenItems { get; set; }
        public DbSet<CarritoCompraItem> CarritoCompraItems { get; set; }

    }
}
