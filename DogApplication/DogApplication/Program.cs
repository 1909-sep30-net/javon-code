using System;

namespace DogApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            Dog dog;
            try
            {
                // in the try block you put the code that you think may throw an exception that you can handle here
                dog = new Dog("Spot", -4);

                // in C#, we have "block scope"
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine("error, recovering");
                dog = new Dog("Spot", 4);
            }
            catch (ArgumentNullException ex)
            {
                // catch more specific exception types BEFORE less specific
                Console.WriteLine("error, recovering");
                dog = new Dog("Spot", 4);
            }
        }
    }
}
