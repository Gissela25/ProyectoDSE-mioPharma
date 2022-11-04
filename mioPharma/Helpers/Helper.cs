using mioPharma.Models;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace mioPharma.Helpers
{
    public class Helper
    {
        public static string GetSHA256(string str)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
        public static bool ValidateEmail(string email)
        {
            return Regex.IsMatch(email, @"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
        }

        public static bool ValidatePhoneNumber(string phone)
        {
            return Regex.IsMatch(phone, @"[267][0-9]{3}-?[0-9]{4}");
        }
        public static string CreateUserNAme(string name, string apellido)
        {
            string tempUserName = name.ToLower() + "." + apellido.ToLower();
            string UserName = tempUserName.Replace(' ', '.');
            return UserName;
        }
    }
}
