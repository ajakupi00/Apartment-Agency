﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_Library.Models
{
    [Serializable]
    public class ApartmentPicture
    {
        public int Id { get; set; }
        public string Path { get; set; }
        public Apartment Apartment { get; set; }
        public string Name { get; set; }
        public bool IsRepresentative { get; set; }
    }
}
