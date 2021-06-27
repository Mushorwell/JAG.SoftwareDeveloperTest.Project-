using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace JAG.DeveloperTest.Models
{
    public static class QuestionHelper
    {
        public static decimal ParallelPartitionerPi(long steps)
        {
            decimal sum = (decimal)0.0;
            decimal step = (decimal)1.0 / (decimal)steps;
            object obj = new object();

            Parallel.ForEach(
                Partitioner.Create(0, steps),
                () => (decimal)0.0,
                (range, state, partial) =>
                {
                    for (long i = range.Item1; i < range.Item2; i++)
                    {
                        decimal x = (i - (decimal)0.5) * step;
                        partial += (decimal)4 / ((decimal)1.0 + x * x);
                    }

                    return partial;
                },
                partial => { lock (obj) sum += partial; });

            return step * sum;
        }
    }
}