﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Static;
using mioPharma.Data.ViewModels;
using mioPharma.Data;
using mioPharma.Models;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using mioPharma.Helpers;
namespace mioPharma.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly AppDbContext _context;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, AppDbContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _context = context;
        }
        // Admins only
        [Authorize(Roles = UserRoles.Admin)]
        public async Task<IActionResult> Usuarios()
        {
            var users = await _context.Users.ToListAsync();
            return View(users);
        }
        // Admins only
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<IActionResult> UpdateState(string IdUser)
        {
            var user = await _userManager.FindByIdAsync(IdUser);
            if(user.UserState == 1)
            {
                user.UserState = 0;
            }
            else
            {
                user.UserState = 1;
            }
           
            var result = await _userManager.UpdateAsync(user);
            if (result.Succeeded)
            {
                return RedirectToAction("Usuarios", "Account");
            }
            else
            {
                ViewBag.Error = "Ha ocurrido un error";
                return RedirectToAction("Usuarios","Account");
            }

        }
        // Only for authenticated users
        public IActionResult ChangePassword() => View(new ChangePasswordVM());
        // Only for authenticated users
        [HttpPost]
        public async Task<IActionResult> ChangePassword(string IdUser, ChangePasswordVM changePasswordVM)
        {
            var user = await _userManager.FindByIdAsync(IdUser);
            if (!ModelState.IsValid) return View(changePasswordVM);
            var newUserResponse = await _userManager.ChangePasswordAsync(user, changePasswordVM.CurrentPassword, changePasswordVM.Password);
            if(newUserResponse.Succeeded)
            {
                return RedirectToAction("Index","Medicamentos");
            }
            List<IdentityError> errorList = newUserResponse.Errors.ToList();
            var errors = string.Join(", ", errorList.Select(e => e.Description));
            TempData["Error"] = errors;
            return View(changePasswordVM);
        }
        // Admins only
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult AddUser() => View(new RegisterVM());
        // Admins only
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public async Task<IActionResult> AddUser(RegisterVM registerVM)
        {
            if (!ModelState.IsValid) return View(registerVM);

            var user = await _userManager.FindByEmailAsync(registerVM.EmailAddress);
            if (user != null)
            {
                TempData["Error"] = "Este correo electrónico ya está en uso";
                return View(registerVM);
            }

            var newUser = new ApplicationUser()
            {
                Nombre = registerVM.Nombre,
                Email = registerVM.EmailAddress,
                UserName = registerVM.Nombre.ToLower() + "." + registerVM.Apellido.ToLower(),
                Apellido = registerVM.Apellido,
                PhoneNumber = registerVM.PhoneNumber,
                Address = registerVM.Address,
                UserLvl = 1,
                UserState = 1
            };
            var newUserResponse = await _userManager.CreateAsync(newUser, registerVM.Password);

            if (newUserResponse.Succeeded)
            {
                await _userManager.AddToRoleAsync(newUser, UserRoles.Admin);

                return RedirectToAction("Usuarios");
            }
            List<IdentityError> errorList = newUserResponse.Errors.ToList();
            var errors = string.Join(", ", errorList.Select(e => e.Description));
            TempData["Error"] = errors;
            return View(registerVM);

        }
        // Only for authenticated users
        [HttpGet]
        public async Task<IActionResult> Edit(string Id)
        {
            var users = await _userManager.Users.Where(u => u.Id == Id).FirstOrDefaultAsync();
            return View(users);
        }
        // Only for authenticated users
        [HttpPost]
        public async Task<IActionResult> Edit(ApplicationUser applicationUser)
        {
            if (!ModelState.IsValid) return View(applicationUser);
            if (applicationUser.Email == null || applicationUser.PhoneNumber == null)
            {
                TempData["Error"] = "Parece que te falta algún campo por completar :)";
                return View(applicationUser);
            }
            else if (!Helper.ValidateEmail(applicationUser.Email))
            {
                TempData["Error_Email"] = "Parece que tu Email Address no cumple con el formato :(";
                return View(applicationUser);
            }
            else if (!Helper.ValidatePhoneNumber(applicationUser.PhoneNumber))
            {
                TempData["Error_Phone"] = "Parece que tu Teléfono no cumple con el formato :(";
                return View(applicationUser);
            }
            var user = await _userManager.FindByIdAsync(applicationUser.Id);
            user.Nombre = applicationUser.Nombre;
            user.Apellido = applicationUser.Apellido;
            user.Email = applicationUser.Email;
            user.PhoneNumber = applicationUser.PhoneNumber;
            user.Address = applicationUser.Address;
            user.UserName = Helper.CreateUserNAme(applicationUser.Nombre, applicationUser.Apellido);
          
            var result = await _userManager.UpdateAsync(user);
            if(result.Succeeded)
            {
                return RedirectToAction("Index","Medicamentos");
            }
            TempData["Error"] = "Ops! Hubo un problema al intentar actualizar tu cuenta";
            return View(applicationUser);
        }
        // Any user
        [AllowAnonymous]
        public IActionResult Login() => View(new LoginVM());
        // Any user
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
           
            if (!ModelState.IsValid) return View(loginVM);

            var user = await _userManager.FindByEmailAsync(loginVM.EmailAddress);
            if (user != null)
            {
                if (user.UserState != 0)
                {
                    var passwordCheck = await _userManager.CheckPasswordAsync(user, loginVM.Password);
                    if (passwordCheck)
                    {
                        var result = await _signInManager.PasswordSignInAsync(user, loginVM.Password, false, false);
                        if (result.Succeeded)
                        {
                            return RedirectToAction("Index", "Medicamentos");
                        }
                        TempData["Error"] = "Credenciales incorrectas. Inténtalo de nuevo";
                        return View(loginVM);

                    }
                }
                else
                {
                    TempData["Error"] = "Cuenta deshabilitada";
                    return View(loginVM);
                }
            }
            TempData["Error"] = "Credenciales incorrectas. Inténtalo de nuevo";
            return View(loginVM);

        }
        // Any user
        [AllowAnonymous]
        public IActionResult Register() => View(new RegisterVM());
        // Any user
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            if (!ModelState.IsValid) return View(registerVM);

            var user = await _userManager.FindByEmailAsync(registerVM.EmailAddress);
            if (user != null)
            {
                TempData["Error"] = "This email address is already in use";
                return View(registerVM);
            }

            var newUser = new ApplicationUser()
            {
                Nombre = registerVM.Nombre,
                Email = registerVM.EmailAddress,
                UserName = registerVM.Nombre.ToLower() + "." + registerVM.Apellido.ToLower(),
                Apellido = registerVM.Apellido,
                PhoneNumber = registerVM.PhoneNumber,
                Address = registerVM.Address,
                UserLvl = 0,
                UserState = 1
            };
            var newUserResponse = await _userManager.CreateAsync(newUser, registerVM.Password);

            if (newUserResponse.Succeeded)
            {
                await _userManager.AddToRoleAsync(newUser, UserRoles.User);

                return View("RegisterCompleted");
            }
            List<IdentityError> errorList = newUserResponse.Errors.ToList();
            var errors = string.Join(", ", errorList.Select(e => e.Description));
            TempData["Error"] = errors;
            return View(registerVM);

        }
        // Only for authenticated users
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Medicamentos");
        }
        // Any user
        [AllowAnonymous]
        public IActionResult AccessDenied(string ReturnUrl)
        {
            return View();
        }


    }
}
