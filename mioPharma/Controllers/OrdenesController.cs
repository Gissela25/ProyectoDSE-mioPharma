using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Cart;
using mioPharma.Data.Services;
using mioPharma.Data.ViewModels;

namespace mioPharma.Controllers
{
    public class OrdenesController : Controller
    {
        private readonly IMedicamentosService _medicamentosService;
        private readonly CarritoCompra _carritoCompra;
        private readonly IOrdenesService _ordenesService;
        public OrdenesController(IMedicamentosService medicamentosService, CarritoCompra carritoCompra, IOrdenesService ordenesService)
        {
            _medicamentosService = medicamentosService;
            _carritoCompra = carritoCompra;
            _ordenesService = ordenesService;
        }
        public async Task<IActionResult> Index()
        {
            string userId = "";
            var ordenes = await _ordenesService.GetOrdenByUserIdAsync(userId);
            return View(ordenes);
        }

        public IActionResult Carrito()
        {
            var items = _carritoCompra.GetCarritoCompraItems();
            _carritoCompra.CarritoCompraItems = items;
            var response = new CarritoCompraVM()
            {
                CarritoCompra = _carritoCompra,
                CarritoCompraTotal = _carritoCompra.GetCarritoCompraTotal(),
            };

            return View(response);
        }

        public async  Task<IActionResult> AddItemToCarritoOfCompras(int id)
        {
            var item =  _medicamentosService.GetByIdAsync(id);
            if(item != null)
            {
                _carritoCompra.AddItemToCarrito(await item);
            }
            return RedirectToAction(nameof(Carrito));
        }

        public async Task<IActionResult> RemoveItemFromCarritoOfCompras(int id)
        {
            var item = _medicamentosService.GetByIdAsync(id);
            if (item != null)
            {
                _carritoCompra.RemoveItemCarrito(await item);
            }
            return RedirectToAction(nameof(Carrito));
        }

        public async Task<IActionResult> CompletarOrden()
        {
            var items = _carritoCompra.GetCarritoCompraItems();
            string userId = "";
            string userEmailAddress = "";

            await _ordenesService.OrdenOfStoreAsync(items, userId, userEmailAddress);
            await _carritoCompra.ClearCarritoCompraAsync();
            return View("OrdenCompletada");
        }
    }
}
