using System;

namespace CSharpIntro
{
    class Program
    {
        static void Main(string[] args)
        {
            // Console.WriteLine("Hello World!");

            // make bool, string, and int variables (with values)
            bool b = false;
            string s = "Hello World";
            int i = 5;
            // change their values to something else
            b = true;
            s = "Hello Revature";
            i = 3;

            // whole numbers
            // byte, short, int, long
            // 1 byte, 2 byte, 4 byte, 8 byte

            // fractional numbers
            // float, double, decimal
            // 4 byte, 8 byte, 16 byte

            // "Intellisense"

            // print their values with Console
            Console.WriteLine(b);
            Console.WriteLine(s);
            Console.WriteLine(i);
            // do something in a for loop
            for (int itr = 0; itr < 10; itr++)
            {
                Console.WriteLine(itr);
            }
            // do something in a while loop
            while (i < 10)
            {
                Console.WriteLine(i);
                i++;
            }
            // do something with a switch statement
            switch (s)
            {
                case "Hello World":
                    Console.WriteLine("String was hello world");
                    break;
                case "Hello Revature":
                    Console.WriteLine("String was hello revature");
                    break;
                default:
                    Console.WriteLine("String was neither hello world nor hello revature");
                    break;
            }
            // do something with if, else if, else
            if (i == 8)
            {
                Console.WriteLine("i is 8");
            }
            else if (i == 9)
            {
                Console.WriteLine("i is 9");
            }
            else
            {
                Console.WriteLine("i is neither 8 nor 9");
            }
            // figure out how to make multi-line comments in C#
            /* 
             * This is a
             * multi line
             * comment.
             */
            // figure out how to format your document in VS Code
            // alt+shift+f

            // string interpolation syntax
            // return $"\"{s.ToLower()}\""

            // extra: make a new static method to do something and call it
            Console.WriteLine(Quote("hello"));
            // extra: learn what "var" means in C# and try it out.
            var a = 20;
            Console.WriteLine(a);
        }
        static string Quote(string s)
        {
            return $"\"{s.ToLower()}\"";
        }
    }
}
