using System;

namespace ShapesApp.Library
{
    public class ColorCircle : Circle
    {
        // constructors are not inherited
        // every subclass constructor implicitly calls some parent class constructor first
        // by default the zero parameter constructor
        public ColorCircle(double radius, string color) : base(radius)
        {
            Color = color;
        }

        public ColorCircle(double radius) : this(radius, "clear")
        {
            
        }

        public string Color { get; set; }

        public override double GetPerimeter()
        {
            Console.WriteLine("calculating perimeter");
            //return 2 * Math.PI * Radius;
            return base.GetPerimeter();
        }
    }
}