using Microsoft.EntityFrameworkCore;
using mioPharma.Models;

namespace mioPharma.Data
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Medicamento> Medicamentos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
       
    }
}
