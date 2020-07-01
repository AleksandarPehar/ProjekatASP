using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.CompanyCommands
{
    public interface IDeleteCompanyCommand : ICommand<int>
    {
    }
}
