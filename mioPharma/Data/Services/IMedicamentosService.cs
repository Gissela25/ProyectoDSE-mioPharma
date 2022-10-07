using mioPharma.Data.Base;
using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public interface IMedicamentosService : IEntityBaseRepository<Medicamento>
    {
        Task AddAsync();
    }
}