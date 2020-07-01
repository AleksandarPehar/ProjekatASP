using Application.DataTransfer;
using Application.Helper;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.UserCommands
{
    public interface ILogInUserCommand : IQuery<LogInDto, Logged>
    {
    }
}
