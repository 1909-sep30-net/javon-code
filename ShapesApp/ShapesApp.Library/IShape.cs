namespace ShapesApp.Library
{
    public interface IShape
    {
        int Dimensions { get; }
        int Sides { get; }
        double Area { get; }
        double GetPerimeter();
    }
}