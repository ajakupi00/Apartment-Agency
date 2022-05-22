using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_Library.Models
{
    [Serializable]
    public class Tag
    {
        public int Id { get; set; }
        public DateTime CreatedAt{ get; set; }
        public TagType Type{ get; set; }
        public string Name { get; set; }
        public string NameEng { get; set; }
        public int ApartmentsHave { get; set; }

        public override bool Equals(object obj)
        {
            return obj is Tag tag &&
                   Id == tag.Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        public override string ToString() => Name;

    }
}
