using Application.DataTransfer;
using Application.Helper;
using Application.Interfaces;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Querys
{
    public interface IGetGamesQuery : IQuery<GameSearch, PageResponse<GameDto>>
    {
    }
}
