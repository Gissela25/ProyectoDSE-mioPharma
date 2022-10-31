using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Cart;

namespace mioPharma.Data.ViewComponents
{
    public class ResumenCarritoCompra:ViewComponent
    {
        private readonly CarritoCompra _carritoCompra;

        public ResumenCarritoCompra(CarritoCompra carritoCompra)
        {
            _carritoCompra = carritoCompra;
        }

        public IViewComponentResult Invoke()
        {
            var items = _carritoCompra.GetCarritoCompraItems();

            return View(items.Count);
        }

    }
}
