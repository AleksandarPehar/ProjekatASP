using Application.DataTransfer;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Querys
{
    public interface IGetUsersQuery : IQuery<UserDto, IEnumerable<UserDto>>
    {
    }
}
