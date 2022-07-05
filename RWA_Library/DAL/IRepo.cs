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
        void RegisterUser(User user, string password);
        User AuthUser(string username, string password);
        IList<User> LoadUsers();
       IList<Apartment> GetAllApartments();
        int DeleteTagByID(int id);
        Apartment GetApartmentByID(int id);
        int DeleteApartmentByID(int id);
        ApartmentStatus GetStatusByName(string name);
        void UpdateApartmentWithUser(Apartment apartment, User user, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove);
        void UpdateApartment(Apartment apartment, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove);
        Tag GetTagByTagName(string tagName);
        void CreateApartment(Apartment apartment, IList<ApartmentPicture> pictures, IList<Tag> tags);
        IList<ApartmentPicture> GetPicturesByApartmentID(int id);
        IList<Tag> GetTagsByApartmentID(int id);
        IList<City> GetAllCities();

        void SendReview(int user, int apartment, int stars, string details);

        void ReserveApartment(int apartment, User user, int adults, int children, DateTime from, DateTime to);
    }

}
