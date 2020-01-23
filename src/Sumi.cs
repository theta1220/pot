using System;
using System.Collections.Generic;
using Sumi;

namespace Pot
{
    public static class Sumi
    {
        public static void Log(Value[] args)
        {
            var list = new List<object>();
            var text = "";
            var count = 0;
            foreach (var arg in args)
            {
                count++;
                if (count == 1)
                {
                    text = arg.Object.ToString();
                    continue;
                }
                list.Add((arg as Value).Object);
            }
            Console.WriteLine(string.Format("{0}{1}", "[Sumi]:", text), list.ToArray());
        }
    }
}
