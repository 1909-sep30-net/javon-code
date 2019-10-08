using System.Collections.Generic;

namespace Sequences.Library
{
    class StringSequence
    {
        private readonly List<string> _list = new List<string>();

        public void Add(string item)
        {
            _list.Add(item);
        }

        public void Remove(string item)
        {
            _list.Remove(item);
        }

        public string this[int index]
        {
            get => _list[index];
            set => _list[index] = value;
        }
    }
}
