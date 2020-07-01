using Application.DataTransfer;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.RentCommands
{
    public interface IDeleteRentCommand : ICommand<RentDto>
    {
    }
}
