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

        public static void Assert(Value[] args)
        {
            if (!(bool)args[0].Object) return;

            var list = new List<object>();
            var text = "";
            var count = 0;
            foreach (var arg in args)
            {
                count++;
                if (count == 1)
                {
                    continue;
                }
                else if (count == 2)
                {
                    text = arg.Object.ToString();
                    continue;
                }
                list.Add((arg as Value).Object);
            }
            Console.ForegroundColor = ConsoleColor.DarkRed;
            Console.WriteLine(string.Format("{0}{1}", "[Sumi Error]:", text), list.ToArray());
            Console.ResetColor();
        }

        public static string Input()
        {
            var text = Console.ReadLine();
            return text;
        }
    }
}
