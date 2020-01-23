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

            while (main.Execute())
            {

            }
        }
    }
}
