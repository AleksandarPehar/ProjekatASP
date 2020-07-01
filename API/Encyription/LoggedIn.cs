using Application.Helper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;

namespace API.Encyription
{
    public class LoggedIn : Attribute, IResourceFilter
    {
        private readonly string role;
        public LoggedIn(string role)
        {
            this.role = role;
        }

        public LoggedIn()
        {

        }
        //nakon akcije kontrolera se poziva
        public void OnResourceExecuted(ResourceExecutedContext context)
        {

        }
        //poziva se pre akcije kontrolera
        public void OnResourceExecuting(ResourceExecutingContext context)
        {
            var user = context.HttpContext.RequestServices.GetService<Logged>();

            if (!user.IsLogged)
            {
                context.Result = new UnauthorizedResult();
            }
            else
            {
                if (role != null)
                {
                    if (user.RoleName != role)
                    {
                        context.Result = new UnauthorizedResult();
                    }
                }
            }
        }
    }
}
