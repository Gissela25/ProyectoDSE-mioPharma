using Microsoft.AspNetCore.Identity;
using mioPharma.Data.Static;
using mioPharma.Models;

namespace mioPharma.Data
{
    public class AppDbInitializer
    {

        public static async Task SeedUsersAndRolesAsync(IApplicationBuilder applicationBuilder)
        {
            using (var serviceScope = applicationBuilder.ApplicationServices.CreateScope())
            {

                //Roles
                var roleManager = serviceScope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();

                if (!await roleManager.RoleExistsAsync(UserRoles.Admin))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Admin));
                if (!await roleManager.RoleExistsAsync(UserRoles.User))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.User));

                //Users
                var userManager = serviceScope.ServiceProvider.GetRequiredService<UserManager<ApplicationUser>>();
                string adminUserEmail = "admin@miopharma.com";

                var adminUser = await userManager.FindByEmailAsync(adminUserEmail);
                if (adminUser == null)
                {
                    var newAdminUser = new ApplicationUser()
                    {
                        Nombre = "Admin User",
                        UserName = "admin.user",
                        Email = adminUserEmail,
                        EmailConfirmed = true,
                        Apellido = "-",
                        Address = ""
                    };
                    await userManager.CreateAsync(newAdminUser, "P4$$w0rd");
                    await userManager.AddToRoleAsync(newAdminUser, UserRoles.Admin);
                }


                string appUserEmail = "test_user@miopharma.com";

                var appUser = await userManager.FindByEmailAsync(appUserEmail);
                if (appUser == null)
                {
                    var newAppUser = new ApplicationUser()
                    {
                        Nombre = "Application User",
                        UserName = "app.user",
                        Email = appUserEmail,
                        EmailConfirmed = true,
                        Apellido= "-",
                        Address = ""
                    };
                    await userManager.CreateAsync(newAppUser, "P4$$w0rd");
                    await userManager.AddToRoleAsync(newAppUser, UserRoles.User);
                }
            }
        }
    }
}
