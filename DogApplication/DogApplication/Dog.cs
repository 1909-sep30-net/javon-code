using System;
using System.Collections.Generic;
using System.Text;

namespace DogApplication
{
    internal class Dog
    {
        // access modifiers
        // public - everyone can see
        // internal - everyone in the same assembly can see
        // protected - everyone who is a subclass of Dog can see
        // private - only this class can see
        // private protected
        // protected internal

        // for class members, private is default
        // for classes, internal is default (only public and internal are possible)

        // constructor - special method that you call to get an instance of this class
        // there is always at least one constructor that is default if you dont write one
        public Dog(string name, int age)
        {
            // within a class, "this" is a way to refer to the current instance of that class


        }

        // fields
        private string name;

        // better than public fields, is getter and setters like java
        // but better than that (at least to use and look at) is properties
        // this is what we call an auto property
        // public int Age { get; set; }
        private int age;
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                if (value < 0)
                {
                    throw new ArgumentOutOfRangeException(nameof(value));
                }
                age = value;
            }
        }


        public string GetName()
        {
            return name;
        }

        public void SetName(string name)
        {
            // validation goes here - this is public, field is private
            // all the consumers of this class dont have to worry about validation changes to the fields
            if (name == null)
            {
                throw new ArgumentNullException("name");
            }
            this.name = name;
        }
    }
}
