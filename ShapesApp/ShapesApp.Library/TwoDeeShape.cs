namespace ShapesApp.Library
{
    public abstract class TwoDeeShape : IShape
    {
        public int Dimensions => 2;

        public abstract int Sides { get; }
        public abstract double Area { get; }

        public abstract double GetPerimeter();
    }
}