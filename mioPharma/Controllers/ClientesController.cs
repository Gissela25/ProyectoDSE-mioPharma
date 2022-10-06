using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Services;
using mioPharma.Helpers;
using mioPharma.Models;

namespace mioPharma.Controllers
{
    public class ClientesController : Controller
    {
        private readonly IClientesService _service;

        public ClientesController(IClientesService service)
        {
            _service = service;
        }

        public async Task<IActionResult> Index()
        {
            var allClients = await _service.GetAllAsync();
            return View(allClients);
        }

        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create([Bind("Nombre, Apellido, Telefono, Direccion, Correo, Clave, EstadoC")] Cliente cliente)
        {

            if (ModelState.IsValid)
            {
                cliente.Clave = Encrypt.GetSHA256(cliente.Clave);
                await _service.AddAsync(cliente);
                return RedirectToAction("Index");
            }
            return View(cliente);
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var clientesDetails = await _service.GetByIdAsync(id);
            if (clientesDetails == null) return View("NotFound");
            return View(clientesDetails);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind("Id, Nombre, Apellido, Telefono, Direccion, Correo, Clave, EstadoC ")] Cliente cliente)
        {

                if (ModelState.IsValid)
                {
                    
                    await _service.UpdateAsync(id, cliente);
                    return RedirectToAction("Index");
                }
            return View(cliente);
        }
        [HttpGet]
        public async Task<IActionResult> EditPassword(int id)
        {
            var clientesDetails = await _service.GetByIdAsync(id);
            if (clientesDetails == null) return View("NotFound");
            return View(clientesDetails);
        }
        [HttpPost, ActionName("EditPassword")]
        public async Task<IActionResult> EditPassswordConfirmed(int id, [Bind("Id, Nombre, Apellido, Telefono, Direccion, Correo, Clave, EstadoC")] Cliente user, string currentPassword, string newPassword)
        {
            if(ModelState.IsValid)
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
            var clientesDetails = await _service.GetByIdAsync(id);
            if(clientesDetails == null) return View("NotFound");
            ViewBag.State = state;
            return View(clientesDetails);
        }

        [HttpPost, ActionName("EditState")]
        public async Task<IActionResult> EditConfirmed(int id, [Bind("Id, Nombre, Apellido, Telefono, Direccion, Correo, Clave, EstadoC")] Cliente user)
        {
            await _service.UpdateStateAsync(id, user);
            return RedirectToAction(nameof(Index));
        }

    }
}
