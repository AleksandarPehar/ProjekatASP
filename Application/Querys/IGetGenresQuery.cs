using Application.DataTransfer;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Querys
{
    public interface IGetGenresQuery : IQuery<GenreDto, IEnumerable<GenreDto>>
    {
    }
}
