using System;
using Sumi;
using Sumi.Util;

namespace Pot
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(System.IO.Directory.GetCurrentDirectory());

            var loader = new Loader();
            var main = loader.Load("pot.so");

            try
            {
                while (main.Execute()) { }
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
