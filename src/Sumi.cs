using System;
using System.Collections.Generic;
using Sumi;

namespace Pot
{
    public static class Sumi
    {
        public static string Input()
        {
            Console.Write("> ");
            var text = Console.ReadLine();
            return text;
        }

        public static void Reload(Value[] args)
        {
            Log.Assert(args.Length > 0, "引数が足りません");
            var loader = new Loader();
            var fileName = args[0].Object as string;
            Program.Runtime = loader.Load(fileName);
        }
    }
}
