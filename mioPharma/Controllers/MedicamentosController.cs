using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mioPharma.Data;
using mioPharma.Data.Services;
using mioPharma.Data.Static;
using mioPharma.Models;

namespace mioPharma.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
    public class MedicamentosController : Controller
    {
        private readonly IMedicamentosService _service;

        public MedicamentosController(IMedicamentosService service)
        {
            _service = service;
        }
        // Any user
        [AllowAnonymous]
      
        public async Task<IActionResult> Index()
        {
            var allMedicamentos = await _service.GetAllAsync();
            return View(allMedicamentos);
        }
        // Admins only
        public async Task<IActionResult> Index2()
        {
            var allMedicamentos = await _service.GetAllAsync();
            return View(allMedicamentos);
        }
        // Admins only
        public IActionResult Create()
        {
            return View();
        }
        // Admins only
        [HttpPost]
        public async Task<IActionResult> Create([Bind("Nombre,Precio,Presentacion,Existencias,Descripcion,Img_Composicion,Img_Medicamento,EstadoM")]Medicamento medicamento)
        {
            if (!ModelState.IsValid) return View(medicamento);

            await _service.AddAsync(medicamento);
            return RedirectToAction(nameof(Index2));
        }
        // Any user
        [AllowAnonymous]
        public async Task<IActionResult> Details(int id)
        {
            var medicamentoDetails = await _service.GetByIdAsync(id);
            if (medicamentoDetails == null) return View("NotFound");
            return View(medicamentoDetails);
        }
        // Admins user
        public async Task<IActionResult> Edit(int id)
        {
            var medicamentoDetails = await _service.GetByIdAsync(id);
            if (medicamentoDetails == null) return View("NotFound");
            return View(medicamentoDetails);
        }
        // Admins user
        [HttpPost]
        public async Task<IActionResult> Edit(int id,[Bind("Id,Nombre,Precio,Presentacion,Existencias,Descripcion,Img_Composicion,Img_Medicamento,EstadoM")] Medicamento medicamento)
        {
            if (!ModelState.IsValid) return View(medicamento);

            if (id == medicamento.Id)
            {
                await _service.UpdateAsync(id, medicamento);
                return RedirectToAction(nameof(Index2));
            }
            return View(medicamento);
          
        }
        // Any user
        [AllowAnonymous]
        public async Task <IActionResult> Filter(string searchString)
        {
            var AllMedicamentos = await _service.GetAllAsync();
            if (!string.IsNullOrEmpty(searchString))
            {
                var filteredResult = AllMedicamentos.Where(n =>string.Equals(n.Nombre, searchString, StringComparison.CurrentCultureIgnoreCase)
                || string.Equals(n.Presentacion, searchString, StringComparison.CurrentCultureIgnoreCase)).ToList();
                return View("Index", filteredResult);
            }
            return View("Index", AllMedicamentos);
        }
        // Admins only
        [HttpGet]
        public async Task<IActionResult> EditState(int id, string state)
        {
            var clientesDetails = await _service.GetByIdAsync(id);
            if (clientesDetails == null) return View("NotFound");
            ViewBag.State = state;
            return View(clientesDetails);
        }
        // Admins only
        [HttpPost, ActionName("EditState")]
        public async Task<IActionResult> EditConfirmed(int id, [Bind("Id,Nombre,Precio,Presentacion,Existencias,Descripcion,Img_Composicion,Img_Medicamento,EstadoM")] Medicamento medicamento)
        {
            await _service.UpdateStateAsync(id, medicamento);
            return RedirectToAction(nameof(Index2));
        }
    }
}
