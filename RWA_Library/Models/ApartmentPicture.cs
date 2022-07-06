using System;
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
        public string DATA { get; set; }
        public string SRC { get => "data:image/jpeg;base64," + DATA; }

        public override bool Equals(object obj)
        {
            return obj is ApartmentPicture picture &&
                   Name == picture.Name;
        }

        public override int GetHashCode()
        {
            return 539060726 + EqualityComparer<string>.Default.GetHashCode(Name);
        }
    }
}
