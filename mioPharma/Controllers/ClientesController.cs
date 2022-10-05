using Microsoft.AspNetCore.Mvc;

namespace mioPharma.Controllers
{
    public class ClientesController : Controller
    {
        public IActionResult Index()
        {
            return RedirectToAction("Index","Home");
        }
    }
}
