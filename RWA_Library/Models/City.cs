﻿using System;

namespace RWA_Library.Models
{
    [Serializable]
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public override string ToString() => $"{Name}";
    }
}