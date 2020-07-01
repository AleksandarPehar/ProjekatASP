using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Encyription;
using Application.Commands.CompanyCommands;
using Application.Commands.ConsoleCommands;
using Application.Commands.GameCommands;
using Application.Commands.GenreCommands;
using Application.Commands.RentCommands;
using Application.Commands.UserCommands;
using Application.Helper;
using Application.Interfaces;
using Application.Querys;
using DataAccess;
using Implementation.EfCompany;
using Implementation.EfConsole;
using Implementation.EfGame;
using Implementation.EfGenre;
using Implementation.EfRent;
using Implementation.EfUser;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            services.AddDbContext<ProjekatContext>();

            services.AddTransient<IGetGenresQuery, EfGetgenresCommand>();
            services.AddTransient<IAddGenreCommand, EfAddGenreCommand>();
            services.AddTransient<IDeleteGenreCommand, EfDeleteGenreCommand>();

            services.AddTransient<IGetCompaniesQuery, EfGetCompaniesCommand>();
            services.AddTransient<IAddCompanyCommand, EfAddCompanyCommand>();
            services.AddTransient<IDeleteCompanyCommand, EfDeleteCompanyCommand>();

            services.AddTransient<IGetConsolesQuery, EfGetConsolesCommand>();
            services.AddTransient<IAddConsoleCommand, EfAddConsoleCommand>();
            services.AddTransient<IDeleteConsoleCommand, EfDeleteConsolecommand>();

            services.AddTransient<IGetUsersQuery, EfGetUsersCommand>();
            services.AddTransient<IAddUserCommand, EfAddUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserComand>();
            services.AddTransient<IEditUserCommand, EfEditUserCommand>();

            services.AddTransient<IGetGamesQuery, EfGetGamesCommand>();
            services.AddTransient<IAddGameCommand, EfAddGameCommand>();
            services.AddTransient<IDeleteGameCommand, EfDeleteGameCommand>();
            services.AddTransient<IEditGameCommand, EfEditGameCommand>();

            services.AddTransient<IGetRentQuery, EfGetRentsCommand>();
            services.AddTransient<IAddRentCommand, EfAddRentCommand>();

            var email = Configuration.GetSection("Email");
            var emailer = new SmtpEmailer("stmp.gmail.com", 587, "randommail@gmail.com", "password");
            services.AddSingleton<IEmailer>(emailer);

            services.AddTransient<ILogInUserCommand, EfLogUserCommand>();
            var key = Configuration.GetSection("Encryption")["key"];
            var enc = new Encryption(key);
            services.AddSingleton(enc);

            services.AddTransient(s => {
                var http = s.GetRequiredService<IHttpContextAccessor>();
                var value = http.HttpContext.Request.Headers["Authorization"].ToString();
                var encryption = s.GetRequiredService<Encryption>();

                try
                {
                    var decoded = encryption.DecryptString(value);
                    decoded = decoded.Replace("\t", "");
                    var user = JsonConvert.DeserializeObject<Logged>(decoded);
                    user.IsLogged = true;
                    return user;
                }
                catch (Exception)
                {
                    return new Logged
                    {
                        IsLogged = false
                    };
                }
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
