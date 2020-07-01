using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Helper
{
    public class PageResponse<T>
    {
        public int TotalCount { get; set; }
        public int PageCount { get; set; }
        public int CurrentPage { get; set; }

        public IEnumerable<T> Data { get; set; }
    }
}
