using Application.DataTransfer;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Querys
{
    public interface IGetRentQuery : IQuery<RentDto, IEnumerable<RentDto>>
    {
    }
}
