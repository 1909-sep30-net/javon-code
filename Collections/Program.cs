using System;
using System.Collections;
using System.Collections.Generic;

namespace Collections
{
    class Program
    {
        static void Main(string[] args)
        {
            Arrays();
        }

        static void Arrays()
        {
            // arrays are the most basic way to group many values of the same type together
            int[] intArray = new int[4]; // all entries initialized to default 0
            // arrays are fixed-size from once they are created
            intArray[0] = 3;
            intArray[1] = 5;
            // now array looks like: 3, 5, 0, 0

            // software called "debugger"
            // breakpoint
            // inferred to be size 5
            // this type of syntax is called collection initializer
            int[] intArray2 = new int[] {1,2,3,4,12};

            //get console input from the user
            //Console.WriteLine("Enter a length: ");
            //string input = Console.ReadLine();
            //int length = int.Parse(input);
            //int[] array3 = new int[length];

            // ways to have more than one dimension in the arrays called jagged arrays
            int[][] twoD = new int[3][];
            twoD[0] = new int[] {1, 2};
            twoD[1] = new int[] {1, 2, 3};

            // multi dimensional array
            int[,] twoDMulti = new int[3, 5];
            twoDMulti[0,0] = 3;
            int[,,] threeDMulti = new int[,,] {
                {{1, 2}, {1, 3}},
                {{2, 3}, {4, 5}}
            };
        }
        static void Lists()
        {
            // ArrayList is a dynamic length collection of type object
            ArrayList list = new ArrayList();
            list.Add(3);
            list.Add(3.1);

            // C# gives you "indexing operator" on any collection type
            Console.WriteLine(list[0]);

            // compared to arrays - I've gained the ability to grow and shrink
            // i've lost the ability to be confident about the type of the contents of that collection
            int number = (int)list[0];
            // potentially "unsafe" conversions must be explicit using the casting operator ()
            // later versions of C# introduced generic types
            // and generic collections like List
            List<int> intList = new List<int>();
            intList.Add(1);
            int num = intList[0];
            // no conversion needed, the compiler knows it's an int
            // write it like this instead: var intList = new List<int> {1};
        }
        static void OtherCollections()
        {
            // a set has no defined order and no concept of duplicates
            // add something twice is the same as adding it once
            var set = new HashSet<string> {"a", "b", "c"};
            Console.WriteLine(set.Count);
            // checking for membership in a list is slow
            // in a set it is very fast
            // also insert and remove in a set are faster

            // also maps aka dictionary
            var dict = new Dictionary<int, int>
            {
                [1] = 1,
                [2] = 4,
                [3] = 9,
                [10] = 100
            };
            var hundred = dict[10];
            var dict2 = new Dictionary<string, string>
            {
                ["abc"] = "def",
                ["def"] = "qwe"
            };
            var qwe = dict2["def"];

            // in C# string equality is based on value, not reference
            // you can operator overload in C#
            // there are Stack and Queue types
        }
    }
}
