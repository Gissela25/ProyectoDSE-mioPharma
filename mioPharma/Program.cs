using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using mioPharma.Data;
using mioPharma.Data.Cart;
using mioPharma.Data.Services;
using mioPharma.Models;
using System;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//DbContext configuration
builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnectionString")));

builder.Services.AddScoped<IUsuariosService, UsuariosService>();
builder.Services.AddScoped<IClientesService, ClientesService>();
builder.Services.AddScoped<IMedicamentosService, MedicamentosService>();
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
builder.Services.AddScoped<IOrdenesService, OrdenesService>();
builder.Services.AddScoped(sc => CarritoCompra.GetCarritoCompra(sc));
builder.Services.AddSession();

builder.Services.AddIdentity<ApplicationUser, IdentityRole>().AddEntityFrameworkStores<AppDbContext>();
builder.Services.AddMemoryCache();
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseSession();

app.UseAuthentication();
app.UseAuthorization();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}/{state?}");
AppDbInitializer.SeedUsersAndRolesAsync(app).Wait();

app.Run();
