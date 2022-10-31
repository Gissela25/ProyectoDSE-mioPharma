using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mioPharma.Migrations
{
    public partial class Update_Models : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CarritoCompraItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MedicamentoId = table.Column<int>(type: "int", nullable: false),
                    Cantidad = table.Column<int>(type: "int", nullable: false),
                    CarritoCompraId = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CarritoCompraItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CarritoCompraItems_Medicamentos_MedicamentoId",
                        column: x => x.MedicamentoId,
                        principalTable: "Medicamentos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Ordens",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ordens", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "OrdenItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Cantidad = table.Column<int>(type: "int", nullable: false),
                    Precio = table.Column<double>(type: "float", nullable: false),
                    MedicamentoId = table.Column<int>(type: "int", nullable: false),
                    OrdenId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrdenItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_OrdenItems_Medicamentos_MedicamentoId",
                        column: x => x.MedicamentoId,
                        principalTable: "Medicamentos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_OrdenItems_Ordens_OrdenId",
                        column: x => x.OrdenId,
                        principalTable: "Ordens",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CarritoCompraItems_MedicamentoId",
                table: "CarritoCompraItems",
                column: "MedicamentoId");

            migrationBuilder.CreateIndex(
                name: "IX_OrdenItems_MedicamentoId",
                table: "OrdenItems",
                column: "MedicamentoId");

            migrationBuilder.CreateIndex(
                name: "IX_OrdenItems_OrdenId",
                table: "OrdenItems",
                column: "OrdenId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CarritoCompraItems");

            migrationBuilder.DropTable(
                name: "OrdenItems");

            migrationBuilder.DropTable(
                name: "Ordens");
        }
    }
}
