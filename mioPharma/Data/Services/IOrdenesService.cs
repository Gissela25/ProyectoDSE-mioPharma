using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public interface IOrdenesService
    {
        Task OrdenOfStoreAsync(List<CarritoCompraItem> items, string userId, string userEmailAddress);
        Task<List<Orden>> GetOrdenByUserIdAndRoleAsync(string userId, string userRole );
    }
}
