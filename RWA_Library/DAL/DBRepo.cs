using Microsoft.ApplicationBlocks.Data;
using RWA_Library.Models;
using rwaLib.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace RWA_Library.DAL
{
    public class DBRepo : IRepo
    {
        private static string CS = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        private const char UPDATE_FLAG = 'U';
        private const char DELETE_FLAG = 'D';

        public User AuthUser(string username, string password)
        {
            var tableAuth = SqlHelper.ExecuteDataset(CS, nameof(AuthUser), username, password).Tables[0];
            if (tableAuth.Rows.Count == 0) return null;
            DataRow row = tableAuth.Rows[0];
            return new User
            {
                Id = (int)row[nameof(User.Id)],
                Email = row[nameof(User.Email)].ToString(),
                PhoneNumber = row[nameof(User.PhoneNumber)].ToString(),
                Address = row[nameof(User.Address)].ToString(),
                UserName = row[nameof(User.UserName)].ToString()
            };

        }

        public IList<TagType> GetAllTagTypes()
        {
            var tblTypes = SqlHelper.ExecuteDataset(CS, nameof(GetAllTagTypes)).Tables[0];
            if (tblTypes.Rows.Count == 0) return null;
            IList<TagType> types = new List<TagType>();
            for (int i = 0; i < tblTypes.Rows.Count; i++)
            {
                DataRow row = tblTypes.Rows[i];
                types.Add(new TagType
                {
                    Id = (int)row[nameof(TagType.Id)],
                    Name = row[nameof(TagType.Name)].ToString(),
                    NameEng = row[nameof(TagType.NameEng)].ToString(),
                });
            }
            return types;
        }

        public IList<City> GetAllCities()
        {
            var tableCty = SqlHelper.ExecuteDataset(CS, nameof(GetAllCities)).Tables[0];
            if (tableCty.Rows.Count == 0) return null;
            IList<City> cities = new List<City>();
            for (int i = 0; i < tableCty.Rows.Count; i++)
            {
                DataRow row = tableCty.Rows[i];
                cities.Add(new City
                {
                    Id = (int)row[nameof(City.Id)],
                    Name = row[nameof(City.Name)].ToString()
                });
            }
            return cities;
        }

        public IList<Tag> GetTagsByApartmentID(int id)
        {
            var tblTags = SqlHelper.ExecuteDataset(CS, nameof(GetTagsByApartmentID), id).Tables[0];
            if (tblTags.Rows.Count == 0) return null;
            IList<Tag> tags = new List<Tag>();
            for (int i = 0; i < tblTags.Rows.Count; i++)
            {
                DataRow row = tblTags.Rows[i];
                tags.Add(new Tag
                {
                    Id = (int)row[nameof(Tag.Id)],
                    Type = GetTypeById((int)row["TypeId"]),
                    Name = row[nameof(Tag.Name)].ToString(),
                    NameEng = row[nameof(Tag.NameEng)].ToString()
                });
            }
            return tags;
        }

        public IList<ApartmentStatus> GetAllStatuses()
        {
            var tblStatus = SqlHelper.ExecuteDataset(CS, nameof(GetAllStatuses)).Tables[0];
            if (tblStatus.Rows.Count == 0) return null;
            IList<ApartmentStatus> status = new List<ApartmentStatus>();
            for (int i = 0; i < tblStatus.Rows.Count; i++)
            {
                DataRow row = tblStatus.Rows[i];
                status.Add(new ApartmentStatus
                {
                    Id = (int)row[nameof(ApartmentStatus.Id)],
                    Name = row[nameof(ApartmentStatus.Name)].ToString(),
                    NameEng = row[nameof(ApartmentStatus.NameEng)].ToString()
                });
            }
            return status;
        }

        public void CreateTag(Tag tag)
        {
            SqlHelper.ExecuteDataset(CS, nameof(CreateTag), tag.Name, tag.NameEng, tag.Type.Id);
        }

        public IList<ApartmentPicture> GetPicturesByApartmentID(int id)
        {
            var tablePict = SqlHelper.ExecuteDataset(CS, nameof(GetPicturesByApartmentID), id).Tables[0];
            if (tablePict.Rows.Count == 0) return null;
            IList<ApartmentPicture> pictures = new List<ApartmentPicture>();
            for (int i = 0; i < tablePict.Rows.Count; i++)
            {
                DataRow row = tablePict.Rows[i];
                pictures.Add(new ApartmentPicture
                {
                    Id = (int)row[nameof(ApartmentPicture.Id)],
                    Path = row[nameof(ApartmentPicture.Path)].ToString(),
                    Apartment = GetApartmentByID(id),
                    IsRepresentative = (bool)row[nameof(ApartmentPicture.IsRepresentative)],
                    DATA = row["Base64Content"].ToString()
                });

            }
            return pictures;
        }

        public Apartment GetApartmentByID(int id)
        {
            var tableApt = SqlHelper.ExecuteDataset(CS, nameof(GetApartmentByID), id).Tables[0];
            if (tableApt.Rows.Count == 0) return null;
            DataRow row = tableApt.Rows[0];
            return new Apartment
            {
                Id = (int)row[nameof(Apartment.Id)],
                CreatedAt = (DateTime)row[nameof(Apartment.CreatedAt)],
                Owner = GetAparmtentOwnerByID((int)row["OwnerId"]),
                Status = GetApartmentStatusByID((int)row["StatusId"]),
                City = GetCityByID((int)row["CityId"]),
                Address = row[nameof(Apartment.Address)].ToString(),
                Name = row[nameof(Apartment.Name)].ToString(),
                NameEng = row[nameof(Apartment.NameEng)].ToString(),
                Price = float.Parse(row[nameof(Apartment.Price)].ToString()),
                MaxAdults = (int)row[nameof(Apartment.MaxAdults)],
                MaxChildren = (int)row[nameof(Apartment.MaxChildren)],
                TotalRooms = (int)row[nameof(Apartment.TotalRooms)],
                BeachDistance = (int)row[nameof(Apartment.BeachDistance)],
                NumberOfPictures = GetNumberOfPicturesByApartmentID(row[nameof(Apartment.Id)]),
                Stars = ApartmentStars((int)row[nameof(Apartment.Id)])
            };
        }

        public int ApartmentStars(int id)
        {
            var tableApt = SqlHelper.ExecuteDataset(CS, nameof(ApartmentStars), id).Tables[0];
            if (tableApt.Rows.Count == 0) return 5;
            DataRow row = tableApt.Rows[0];
            try
            {
                return (int)row[nameof(Apartment.Stars)];
            }
            catch (Exception)
            {

                return 5;
            }
        }

        public IList<Tag> GetAllTags()
        {
            var tblTags = SqlHelper.ExecuteDataset(CS, nameof(GetAllTags)).Tables[0];
            if (tblTags.Rows.Count == 0) return null;
            IList<Tag> tags = new List<Tag>();
            for (int i = 0; i < tblTags.Rows.Count; i++)
            {
                DataRow row = tblTags.Rows[i];
                tags.Add(new Tag
                {
                    Id = (int)row[nameof(Tag.Id)],
                    CreatedAt = (DateTime)row[nameof(Tag.CreatedAt)],
                    Type = GetTypeById((int)row["TypeId"]),
                    Name = row[nameof(Tag.Name)].ToString(),
                    NameEng = row[nameof(Tag.NameEng)].ToString(),
                    ApartmentsHave = (int)row[nameof(Tag.ApartmentsHave)]
                });
            }
            return tags;
        }

        public Tag GetTagByTagName(string tagName)
        {
            var tblTag = SqlHelper.ExecuteDataset(CS, nameof(GetTagByTagName), tagName).Tables[0];
            if (tblTag.Rows.Count == 0) return null;
            DataRow row = tblTag.Rows[0];
            return new Tag
            {
                Id = (int)row[nameof(Tag.Id)],
                Name = row[nameof(Tag.Name)].ToString(),
                NameEng = row[nameof(Tag.NameEng)].ToString(),
            };
        }

        public TagType GetTypeById(int id)
        {
            var tblType = SqlHelper.ExecuteDataset(CS, nameof(GetTypeById), id).Tables[0];
            if (tblType.Rows.Count == 0) return null;
            DataRow row = tblType.Rows[0];
            return new TagType
            {
                Id = (int)row[nameof(TagType.Id)],
                Name = row[nameof(TagType.Name)].ToString(),
                NameEng = row[nameof(TagType.NameEng)].ToString(),
            };
        }

        public City GetCityByName(string city)
        {
            var tbl = SqlHelper.ExecuteDataset(CS, nameof(GetCityByName), city).Tables[0];
            if (tbl.Rows.Count == 0) return null;
            DataRow row = tbl.Rows[0];
            return new City
            {
                Id = (int)row[nameof(City.Id)],
                Name = row[nameof(City.Name)].ToString(),
            };
        }

        public IList<Apartment> GetAllApartments()
        {
            var tableApt = SqlHelper.ExecuteDataset(CS, nameof(GetAllApartments)).Tables[0];
            if (tableApt.Rows.Count == 0) return null;
            IList<Apartment> apartments = new List<Apartment>();
            for (int i = 0; i < tableApt.Rows.Count; i++)
            {
                DataRow row = (DataRow)tableApt.Rows[i];

                apartments.Add(new Apartment
                {
                    Id = (int)row[nameof(Apartment.Id)],
                    CreatedAt = (DateTime)row[nameof(Apartment.CreatedAt)],
                    Owner = GetAparmtentOwnerByID((int)row["OwnerId"]),
                    Status = GetApartmentStatusByID((int)row["StatusId"]),
                    City = GetCityByID((int)row["CityId"]),
                    Address = row[nameof(Apartment.Address)].ToString(),
                    Name = row[nameof(Apartment.Name)].ToString(),
                    NameEng = row[nameof(Apartment.NameEng)].ToString(),
                    Price = float.Parse(row[nameof(Apartment.Price)].ToString()),
                    MaxAdults = (int)row[nameof(Apartment.MaxAdults)],
                    MaxChildren = (int)row[nameof(Apartment.MaxChildren)],
                    TotalRooms = (int)row[nameof(Apartment.TotalRooms)],
                    BeachDistance = (int)row[nameof(Apartment.BeachDistance)],
                    NumberOfPictures = GetNumberOfPicturesByApartmentID(row[nameof(Apartment.Id)]),
                    Stars = ApartmentStars((int)row[nameof(Apartment.Id)])
                });
            }
            return apartments;
        }

        public User GetUserByID(int id)
        {
            var tblUser = SqlHelper.ExecuteDataset(CS, nameof(GetUserByID), id).Tables[0];
            if (tblUser.Rows.Count == 0)
                return null;
            DataRow row = tblUser.Rows[0];
            return new User
            {
                Id = (int)row[nameof(User.Id)],
                Email = row[nameof(User.Email)].ToString(),
                UserName = row[nameof(User.UserName)].ToString(),
                PhoneNumber = row[nameof(User.PhoneNumber)].ToString(),
                Address = row[nameof(User.Address)].ToString()
            };
        }

        public int GetNumberOfPicturesByApartmentID(object id)
        {
            var tablePict = SqlHelper.ExecuteDataset(CS, nameof(GetNumberOfPicturesByApartmentID), id).Tables[0];
            if (tablePict.Rows.Count == 0) return 0;
            DataRow row = tablePict.Rows[0];
            return (int)row[0];
        }

        public City GetCityByID(int id)
        {
            var tableCty = SqlHelper.ExecuteDataset(CS, nameof(GetCityByID), id).Tables[0];
            if (tableCty.Rows.Count == 0) return null;
            DataRow row = tableCty.Rows[0];
            return new City
            {
                Id = (int)row[nameof(City.Id)],
                Name = row[nameof(City.Name)].ToString()
            };
        }

        public ApartmentStatus GetApartmentStatusByID(int id)
        {
            var tableSt = SqlHelper.ExecuteDataset(CS, nameof(GetApartmentStatusByID), id).Tables[0];
            if (tableSt.Rows.Count == 0) return null;
            DataRow row = tableSt.Rows[0];
            return new ApartmentStatus
            {
                Id = (int)row[nameof(ApartmentStatus.Id)],
                Name = row[nameof(ApartmentStatus.Name)].ToString(),
                NameEng = row[nameof(ApartmentStatus.NameEng)].ToString()
            };
        }

        public ApartmentOwner GetAparmtentOwnerByID(int id)
        {
            var tableOwn = SqlHelper.ExecuteDataset(CS, nameof(GetAparmtentOwnerByID), id).Tables[0];
            if (tableOwn.Rows.Count == 0) return null;
            DataRow row = tableOwn.Rows[0];
            return new ApartmentOwner
            {
                Id = (int)row[nameof(ApartmentOwner.Id)],
                Name = row[nameof(ApartmentOwner.Name)].ToString(),
                CreatedAt = (DateTime)row[nameof(ApartmentOwner.CreatedAt)]
            };
        }

        public IList<User> LoadUsers()
        {
            var tblUsers = SqlHelper.ExecuteDataset(CS, "GetAllUsersProcedure").Tables[0];
            if (tblUsers.Rows.Count == 0)
                return null;
            IList<User> users = new List<User>();
            for (int i = 0; i < tblUsers.Rows.Count; i++)
            {
                DataRow row = tblUsers.Rows[i];
                users.Add(new User
                {
                    Id = (int)row[nameof(User.Id)],
                    Email = row[nameof(User.Email)].ToString(),
                    Address = row[nameof(User.Address)].ToString(),
                    PhoneNumber = row[nameof(User.PhoneNumber)].ToString(),
                    UserName = row[nameof(User.UserName)].ToString()
                });
            }
            return users;
        }

        public int DeleteTagByID(int id)
        {
            var tblDeleted = SqlHelper.ExecuteDataset(CS, nameof(DeleteTagByID), id).Tables[0];
            if (tblDeleted.Rows.Count > 0)
            {
                return 1;
            }
            return 0;

        }

        public int DeleteApartmentByID(int id)
        { 
            var tblDeleted = SqlHelper.ExecuteDataset(CS, nameof(DeleteApartmentByID), id).Tables[0];
            if (tblDeleted.Rows.Count > 0)
            {
                return 1;
            }
            return 0;
        }

        public ApartmentStatus GetStatusByName(string name)
        {
            var tblSt = SqlHelper.ExecuteDataset(CS, nameof(GetStatusByName), name).Tables[0];
            if (tblSt.Rows.Count == 0) return null;
            DataRow row = tblSt.Rows[0];
            return new ApartmentStatus
            {
                Id = (int)row[nameof(ApartmentStatus.Id)],
                Name = row[nameof(ApartmentStatus.Name)].ToString(),
                NameEng = row[nameof(ApartmentStatus.NameEng)].ToString()
            };
        }

        public void UpdateApartmentWithUser(Apartment apartment, User user, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove)
        {
            ApartmentPicture representativePicture = pictures.FirstOrDefault(p => p.IsRepresentative);
            SqlHelper.ExecuteDataset(CS, nameof(UpdateApartmentWithUser), 
                apartment.Id, apartment.Name, apartment.Price, apartment.TotalRooms, 
                apartment.MaxAdults, apartment.MaxChildren, user.Id, representativePicture.Id, apartment.Status.Name);
                UpdateApartmentTags(apartment, apartmentTags, UPDATE_FLAG);
            apartmentTags.Select(t => tagsToRemove.Remove(t));
            UpdateApartmentTags(apartment, tagsToRemove, DELETE_FLAG);
            
        }

        private void UpdateApartmentTags(Apartment apartment, IList<Tag> apartmentTags, char flag)
        {
            foreach (Tag tag in apartmentTags)
            {
                SqlHelper.ExecuteDataset(CS, nameof(UpdateApartmentTags), apartment.Id, tag.Id, flag);
            }
        }

        public void UpdateApartment(Apartment apartment, IList<ApartmentPicture> pictures, IList<Tag> apartmentTags, IList<Tag> tagsToRemove)
        {
            ApartmentPicture representativePicture = pictures.FirstOrDefault(p => p.IsRepresentative);
            SqlHelper.ExecuteDataset(CS, nameof(UpdateApartment),
                apartment.Id, apartment.Name, apartment.Price, apartment.TotalRooms,
                apartment.MaxAdults, apartment.MaxChildren, representativePicture.Id, apartment.Status.Name);
            UpdateApartmentTags(apartment, apartmentTags, UPDATE_FLAG);
            apartmentTags.Select(t => tagsToRemove.Remove(t));
            UpdateApartmentTags(apartment, tagsToRemove, DELETE_FLAG);
        }

        public void CreateApartment(Apartment apartment, IList<ApartmentPicture> pictures, IList<Tag> tags)
        {
            var tbl = SqlHelper.ExecuteDataset(CS, nameof(CreateApartment), apartment.Name, apartment.NameEng, apartment.Owner.Name, apartment.City.Id, apartment.Address, apartment.BeachDistance ,apartment.Price, apartment.TotalRooms, apartment.MaxAdults, apartment.MaxChildren).Tables[0];
            DataRow row = tbl.Rows[0];
            int ApartmentID = (int)row[nameof(Apartment.Id)];
            CreateTagForApartment(ApartmentID, tags);
            CreatePictureForApartment(ApartmentID, pictures);

        }

        private void CreatePictureForApartment(int apartmentID, IList<ApartmentPicture> pictures)
        {
            foreach (ApartmentPicture picture in pictures)
            {
                SqlHelper.ExecuteDataset(CS, nameof(CreatePictureForApartment), apartmentID, picture.Name, picture.Path, picture.IsRepresentative, picture.DATA);
            }
        }

        private void CreateTagForApartment(int apartmentID, IList<Tag> tags)
        {
            foreach (Tag tag in tags)
            {
                SqlHelper.ExecuteDataset(CS, nameof(CreateTagForApartment), apartmentID, tag.Id);
            }
        }

        public void RegisterUser(User user, string password)
        {
            SqlHelper.ExecuteNonQuery(CS, nameof(RegisterUser), user.Email, user.UserName, user.PhoneNumber, user.Address, Cryptography.HashPassword(password));
        }

        public void SendReview(int user, int apartment, int stars, string details)
        {
            SqlHelper.ExecuteNonQuery(CS, nameof(SendReview), user, apartment, stars, details);

        }

        public void ReserveApartment(int apartment, User user, int adults, int children, DateTime from, DateTime to)
        {
            SqlHelper.ExecuteNonQuery(CS, nameof(ReserveApartment), apartment, user.FName, user.LName, user.Email, user.PhoneNumber, adults, children, from, to);
        }

        public void DeleteApartmentPicture(int apartmentid, int pictureid)
        {
            SqlHelper.ExecuteNonQuery(CS, nameof(DeleteApartmentPicture), apartmentid, pictureid);
        }
    }
}
