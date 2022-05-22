using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_Library.Models
{
    [Serializable]
    public class User
    {
        private const char DEL = '|';
        public int Id { get; set; }
        public string Email{ get; set; }
        public string PhoneNumber{ get; set; }
        public string UserName{ get; set; }
        public string Address{ get; set; }
        public string FName { get { 
                return UserName.Split(' ')[0];
            } }
        public string LName
        {
            get
            {
                return UserName.Split(' ')[1];
            }
        }
        public override string ToString() => $"{Id}{DEL}{UserName}";
    }
}
