using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class AlreadyExistsEx : Exception
    {
        public AlreadyExistsEx(string message) : base(message)
        {
        }
    }
}
