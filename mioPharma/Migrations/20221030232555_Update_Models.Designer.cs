﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using mioPharma.Data;

#nullable disable

namespace mioPharma.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20221030232555_Update_Models")]
    partial class Update_Models
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.9")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("mioPharma.Models.CarritoCompraItem", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<string>("CarritoCompraId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("MedicamentoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("MedicamentoId");

                    b.ToTable("CarritoCompraItems");
                });

            modelBuilder.Entity("mioPharma.Models.Cliente", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasMaxLength(45)
                        .HasColumnType("nvarchar(45)");

                    b.Property<string>("Clave")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Correo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Direccion")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.Property<int>("EstadoC")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(45)
                        .HasColumnType("nvarchar(45)");

                    b.Property<string>("Telefono")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Clientes");
                });

            modelBuilder.Entity("mioPharma.Models.Medicamento", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.Property<int>("EstadoM")
                        .HasColumnType("int");

                    b.Property<double>("Existencias")
                        .HasColumnType("float");

                    b.Property<string>("Img_Composicion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Img_Medicamento")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(45)
                        .HasColumnType("nvarchar(45)");

                    b.Property<double>("Precio")
                        .HasColumnType("float");

                    b.Property<string>("Presentacion")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("Id");

                    b.ToTable("Medicamentos");
                });

            modelBuilder.Entity("mioPharma.Models.Orden", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Ordens");
                });

            modelBuilder.Entity("mioPharma.Models.OrdenItem", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<int>("MedicamentoId")
                        .HasColumnType("int");

                    b.Property<int>("OrdenId")
                        .HasColumnType("int");

                    b.Property<double>("Precio")
                        .HasColumnType("float");

                    b.HasKey("Id");

                    b.HasIndex("MedicamentoId");

                    b.HasIndex("OrdenId");

                    b.ToTable("OrdenItems");
                });

            modelBuilder.Entity("mioPharma.Models.Usuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasMaxLength(45)
                        .HasColumnType("nvarchar(45)");

                    b.Property<string>("Clave")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Correo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("EstadoU")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(45)
                        .HasColumnType("nvarchar(45)");

                    b.Property<int>("TipoU")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Usuarios");
                });

            modelBuilder.Entity("mioPharma.Models.CarritoCompraItem", b =>
                {
                    b.HasOne("mioPharma.Models.Medicamento", "Medicamento")
                        .WithMany()
                        .HasForeignKey("MedicamentoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Medicamento");
                });

            modelBuilder.Entity("mioPharma.Models.OrdenItem", b =>
                {
                    b.HasOne("mioPharma.Models.Medicamento", "Medicamento")
                        .WithMany()
                        .HasForeignKey("MedicamentoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("mioPharma.Models.Orden", "Orden")
                        .WithMany("OrdenItems")
                        .HasForeignKey("OrdenId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Medicamento");

                    b.Navigation("Orden");
                });

            modelBuilder.Entity("mioPharma.Models.Orden", b =>
                {
                    b.Navigation("OrdenItems");
                });
#pragma warning restore 612, 618
        }
    }
}