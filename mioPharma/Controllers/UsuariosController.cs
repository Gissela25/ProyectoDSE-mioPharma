using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Services;
using mioPharma.Models;

namespace mioPharma.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly IUsuariosService _service;
        public UsuariosController(IUsuariosService service)
        {
            _service = service;
        }

        public async Task<IActionResult> Index()
        {
            var allUsers = await _service.GetAllAsync();
            return View(allUsers);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("Nombre, Apellido, Correo, Clave, EstadoU, TipoU")] Usuario user) 
        {
            if(ModelState.IsValid)
            {
                await _service.AddAsync(user);
                return RedirectToAction("Index");
            }
            return View(user);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var usuarioDetails = await _service.GetByIdAsync(id);
            if (usuarioDetails == null) return View("NotFound");
            return View(usuarioDetails);
        }
        public async Task<IActionResult> Edit(int id, [Bind("Id, Nombre, Apellido, Correo, Clave, EstadoU, TipoU")] Usuario user)
        {
            if(ModelState.IsValid)
            {
                await _service.UpdateAsync(id, user);
                return RedirectToAction("Index");
            }
            return View(user);
        }

        public async Task<IActionResult> EditState(int id, string newState)
        {
            var userDetails = await _service.GetByIdAsync(id);
            if(userDetails == null) return View("NoutFound");
            return View(userDetails);
        }

        [HttpPost , ActionName("EditState")]
        public async Task<IActionResult> EditConfirmed(int id, [Bind("Id, EstadoU")] Usuario user)
        {
            var userDetails = await _service.GetByIdAsync(id);
            if (userDetails == null) return View("NoutFound");
            await _service.UpdateAsync(id, user);
            return RedirectToAction(nameof(Index));
        }
    }
}
