using RWA_Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_Library.DAL
{
    public interface IRepo
    {
        IList<User> LoadUsers();
       IList<Apartment> GetAllApartments();
        int DeleteTagByID(int id);
        Apartment GetApartmentByID(int id);
        int DeleteApartmentByID(int id);
        ApartmentStatus GetStatusByName(string name);
        void UpdateApartmentWithUser(Apartment apartment, User user, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove);
        void UpdateApartment(Apartment apartment, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove);
    }
}
