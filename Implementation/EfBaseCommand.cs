using DataAccess;
using System;

namespace Implementation
{
    public abstract class EfBaseCommand
    {
        protected readonly ProjekatContext context;

        public EfBaseCommand(ProjekatContext context)
        {
            this.context = context;
        }
    }
}
