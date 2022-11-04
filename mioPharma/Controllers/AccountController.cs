using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using mioPharma.Data.Static;
using mioPharma.Data.ViewModels;
using mioPharma.Data;
using mioPharma.Models;
using Microsoft.EntityFrameworkCore;

namespace mioPharma.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
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
        public async Task<IActionResult> Usuarios()
        {
            var users = await _context.Users.ToListAsync();
            return View(users);
        }
        [AllowAnonymous]
        public IActionResult Login() => View(new LoginVM());
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid) return View(loginVM);

            var user = await _userManager.FindByEmailAsync(loginVM.EmailAddress);
            if (user != null)
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
            TempData["Error"] = "Credenciales incorrectas. Inténtalo de nuevo";
            return View(loginVM);

        }
        [AllowAnonymous]
        public IActionResult Register() => View(new RegisterVM());
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
        [AllowAnonymous]

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Medicamentos");
        }
        [AllowAnonymous]
        public IActionResult AccessDenied(string ReturnUrl)
        {
            return View();
        }
    }
}
