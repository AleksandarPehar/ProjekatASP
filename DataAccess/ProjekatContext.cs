using Domain;
using Microsoft.EntityFrameworkCore;
using System;

namespace DataAccess
{
    public class ProjekatContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Domain.Console> Consoles { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Game> Games { get; set; }
        public DbSet<Game_Console> Game_Consoles { get; set; }
        public DbSet<Game_Genre> Game_Genres { get; set; }
        public DbSet<Rent> Rent { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=ACA-MACHINA\SQLEXPRESS;Initial Catalog=GameProjekat;Integrated Security=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }
    }
}
