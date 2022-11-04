using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mioPharma.Models;

namespace mioPharma.Data.Services
{
    public class OrdenesService : IOrdenesService
    {

        private  readonly AppDbContext _context;
        public OrdenesService(AppDbContext context)
        {
            _context = context;
        }

        

        public async Task<List<Orden>> GetOrdenByUserIdAndRoleAsync(string userId, string userRole)
        {
           var ordenes = await _context.Ordens.Include(n => n.OrdenItems).ThenInclude(n => n.Medicamento).Include( n => n.User).ToListAsync();
            if(userRole != "Admin")
            {
                ordenes = ordenes.Where(n => n.UserId == userId).ToList();
            }
            return ordenes;
        }

        public async Task OrdenOfStoreAsync(List<CarritoCompraItem> items, string userId, string userEmailAddress)
        {
            var orden = new Orden()
            {
                UserId = userId,
                Email = userEmailAddress,
            };
            await _context.Ordens.AddAsync(orden);
            await _context.SaveChangesAsync();

            foreach(var item in items)
            {
                var ordenItem = new OrdenItem()
                {
                    Cantidad = item.Cantidad,
                    MedicamentoId = item.Medicamento.Id,
                    OrdenId = orden.Id,
                    Precio = item.Medicamento.Precio
                };
                await _context.OrdenItems.AddAsync(ordenItem);
            }
            await _context.SaveChangesAsync();
        }
    }
}
