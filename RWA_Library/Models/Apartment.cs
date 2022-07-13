using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_Library.Models
{
    [Serializable]
    public class Apartment : IComparable<Apartment>
    {

        public int Id { get; set; }
        public DateTime CreatedAt{ get; set; }
        public DateTime DeletedAt{ get; set; }
        public ApartmentOwner Owner { get; set; }
        public ApartmentStatus Status{ get; set; }
        public City City{ get; set; }
        public string Address { get; set; }
        public string Name { get; set; }
        public string NameEng { get; set; }
        public float Price{ get; set; }
        public int MaxAdults{ get; set; }
        public int MaxChildren{ get; set; }
        public int TotalRooms{ get; set; }
        public int BeachDistance{ get; set; }
        public int NumberOfPictures { get; set; }
        public string Representative { get; set; }
        public int Stars { get; set; }

        public int CompareTo(Apartment other)
        {
            return Id.CompareTo(other.Id);
        }

        public override bool Equals(object obj)
        {
            return obj is Apartment apartment &&
                   Id == apartment.Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }
    }
}
