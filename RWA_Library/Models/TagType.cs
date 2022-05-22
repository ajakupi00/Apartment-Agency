using System;

namespace RWA_Library.Models
{
    [Serializable]
    public class TagType
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string NameEng { get; set; }

        public override string ToString() => $"{Name}";

    }
}