using System;
using Sumi;
using Sumi.Util;

namespace Pot
{
    class Program
    {
        public static Runnable Runtime = null;

        static void Main(string[] args)
        {
            Console.WriteLine(System.IO.Directory.GetCurrentDirectory());

            var loader = new Loader();
            Runtime = loader.Load("pot.so");

            try
            {
                while (Runtime.Execute()) { }
            }
            catch (Exception e)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("例外をキャッチしました");
                Console.WriteLine(e.Message);
                Console.ResetColor();
            }
        }
    }
}
