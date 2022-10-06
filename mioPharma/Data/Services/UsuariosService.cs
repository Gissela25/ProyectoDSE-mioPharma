using mioPharma.Data.Base;
using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public class UsuariosService : EntityBaseRepository<Usuario>, IUsuariosService
    {
        public UsuariosService(AppDbContext context) : base(context)
        {

        }
    }
}
