using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Services;
using mioPharma.Helpers;
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
           
            if (ModelState.IsValid)
            {
                user.Clave = Encrypt.GetSHA256(user.Clave);
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
        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind("Id, Nombre, Apellido, Correo, Clave, EstadoU, TipoU")] Usuario user)
        {
            if (ModelState.IsValid)
            {
                await _service.UpdateAsync(id, user);
                return RedirectToAction("Index");
            }
            return View(user);
        }

        [HttpGet]
        public async Task<IActionResult> EditPassword(int id)
        {
            var userDetails = await _service.GetByIdAsync(id);
            if (userDetails == null) return View("NotFound");
            return View(userDetails);
        }

        [HttpPost, ActionName("EditPassword")]
        public async Task<IActionResult> EditPassswordConfirmed(int id, [Bind("Id, Nombre, Apellido, Correo, Clave, EstadoU, TipoU")] Usuario user, string currentPassword, string newPassword)
        {
            if (ModelState.IsValid)
            {

                currentPassword = Encrypt.GetSHA256(currentPassword);
                if (currentPassword == user.Clave)
                {
                    user.Clave = Encrypt.GetSHA256(newPassword);
                    await _service.UpdateStateAsync(id, user);
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ViewBag.MessageError = "Ups, parece que hubo un problema al intentar actualizar tu contraseña";
                }
            }
            return View(user);

        }

        [HttpGet]
        public async Task<IActionResult> EditState(int id, string state)
        {
            var userDetails = await _service.GetByIdAsync(id);
            if(userDetails == null) return View("NoutFound");
            ViewBag.State = state;
            return View(userDetails);
        }

        [HttpPost , ActionName("EditState")]
        public async Task<IActionResult> EditConfirmed(int id, [Bind("Id, Nombre, Apellido,Clave, TipoU, Correo, EstadoU")] Usuario user)
        {

            await _service.UpdateStateAsync(id, user);
            return RedirectToAction(nameof(Index));
        }
    }
}
