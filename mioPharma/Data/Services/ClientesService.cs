using mioPharma.Data.Base;
using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public class ClientesService : EntityBaseRepository<Cliente>, IClientesService
    {
        public ClientesService(AppDbContext context) : base(context)
        {
        }
    }
}
