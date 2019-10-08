using System;
using ShapesApp.Library;

namespace ShapesApp.App
{
    static class Program
    {
        static void Main(string[] args)
        {
            double length = 3;
            string input;
            
            do
            {
                Console.WriteLine("Enter a length:");
                input = Console.ReadLine();
            }
            while (!double.TryParse(input, out length));
            // C# has something alled "out" parameters
            // an out parameter cannot have a value before you pass it
            double width;
            do
            {
                Console.WriteLine("Enter a width:");
                input = Console.ReadLine();
            }
            while (!double.TryParse(input, out width));

            // similar to collection initializer, we have property intializer
            var rectangle = new Rectangle()
            {
                Length = length,
                Width = width
            };

            //PrintRectangle(rectangle);
            rectangle.PrintRectangle();
        }
        // extension method
        // these are used very frequently with a library called LINQ
        public static void PrintRectangle(this Rectangle r)
        {
            Console.WriteLine($"{r.Length}x{r.Width} rectangle ({ShapeDetails(r)})");
        }

        public static string ShapeDetails(IShape shape)
        {
            return $"area {shape.Area}, {shape.Sides}";
        }
    }
}
