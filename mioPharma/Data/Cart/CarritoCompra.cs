using Microsoft.EntityFrameworkCore;
using mioPharma.Models;

namespace mioPharma.Data.Cart
{
    public class CarritoCompra
    {
        public AppDbContext _context { get; set; }
        public string CarritoCompraId { get; set; }
        public List<CarritoCompraItem> CarritoCompraItems { get; set; }
        public CarritoCompra(AppDbContext context)
        {
            _context = context;
        }

        public static CarritoCompra GetCarritoCompra(IServiceProvider services)
        {
            ISession session = services.GetRequiredService<IHttpContextAccessor>()?.HttpContext.Session;
            var context = services.GetService<AppDbContext>();

            string carritoId = session.GetString("CarritoId")??Guid.NewGuid().ToString();
            session.SetString("CarritoId", carritoId); ;

            return new CarritoCompra(context) { CarritoCompraId = carritoId};
        }

        public void AddItemToCarrito(Medicamento medicamento)
        {
            var carritoCompraItem = _context.CarritoCompraItems.FirstOrDefault(n => n.Medicamento.Id == medicamento.Id && n.CarritoCompraId == CarritoCompraId);

            if (carritoCompraItem == null)
            {
                carritoCompraItem = new CarritoCompraItem()
                {
                    CarritoCompraId = CarritoCompraId,
                    Medicamento = medicamento,
                    Cantidad = 1
                };
                _context.CarritoCompraItems.Add(carritoCompraItem);
            }
            else
            {
                carritoCompraItem.Cantidad++;
            }
            _context.SaveChanges();

           
        }

        public void RemoveItemCarrito(Medicamento medicamento)
        {
            var carritoCompraItem = _context.CarritoCompraItems.FirstOrDefault(n => n.Medicamento.Id == medicamento.Id && n.CarritoCompraId == CarritoCompraId);

            if (carritoCompraItem != null)
            {
                if (carritoCompraItem.Cantidad > 1)
                {
                    carritoCompraItem.Cantidad--;
                }
                else
                {
                    _context.CarritoCompraItems.Remove(carritoCompraItem);
                }
            }
            _context.SaveChanges();
        }

        public List<CarritoCompraItem> GetCarritoCompraItems()
        {
            return CarritoCompraItems ?? (CarritoCompraItems = _context.CarritoCompraItems.Where(n => n.CarritoCompraId == CarritoCompraId)
                .Include(n => n.Medicamento).ToList());
        }
        public double GetCarritoCompraTotal() => _context.CarritoCompraItems.Where(n => n.CarritoCompraId == CarritoCompraId)
        .Select(n => n.Medicamento.Precio * n.Cantidad).Sum();

        public async Task ClearCarritoCompraAsync()
        {
            var items = await _context.CarritoCompraItems.Where(n => n.CarritoCompraId == CarritoCompraId).ToListAsync();
            _context.CarritoCompraItems.RemoveRange(items);
            await _context.SaveChangesAsync();
            CarritoCompraItems = new List<CarritoCompraItem>();
        }

    }
}
