﻿using Microsoft.AspNetCore.Mvc;

namespace mioPharma.Controllers
{
    public class UsuariosController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
