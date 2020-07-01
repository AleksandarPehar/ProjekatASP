using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Interfaces
{
    public interface ICommand<TRequest>
    {
        void Execute(TRequest request);
    }

    public interface IQuery<TSearch, TResult>
    {
        TResult Execute(TSearch search);
    }
}
