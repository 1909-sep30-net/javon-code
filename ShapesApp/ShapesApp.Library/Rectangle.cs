namespace ShapesApp.Library
{
    // this class has implementations for all the methods that IShape specifies
    public class Rectangle : TwoDeeShape, IShape
    {
        public double Length { get; set; }
        public double Width { get; set; }

        // not all properties have to be based on 1 field - could be 0, 2, or more
        public double Area
        {
            get
            {
                return Length * Width;
            }
        }

        // shorthand for one-line get-only property
        public int Sides => 4;
        public int Dimensions => 2;

        public double GetPerimeter()
        {
            return Length * 2 + Width * 2;
        }

        public bool Validate()
        {
            if (Length <= 0)
            {
                return false;
            }
            if (Width <= 0)
            {
                return false;
            }
            return true;
        }
    }
}