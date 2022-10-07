
using mioPharma.Data.Base;
using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public class MedicamentosService : EntityBaseRepository<Medicamento>, IMedicamentosService
    {
        public MedicamentosService(AppDbContext context) : base(context)
        {
        }

        public Task AddAsync()
        {
            throw new NotImplementedException();
        }
    }
}
