using System;
using System.Collections.Generic;

namespace RWA_Library.Models
{
    [Serializable]
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public override bool Equals(object obj)
        {
            return obj is City city &&
                   Name == city.Name;
        }

        public override int GetHashCode()
        {
            return Name.GetHashCode();
        }

        public override string ToString() => $"{Name}";
    }
}