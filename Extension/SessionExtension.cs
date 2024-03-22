using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;
namespace ShopToys.Extension
{
    public static class SessionExtension
    {
        public static void Set<T>(this ISession seession, string key,  T value)
        {
            seession.SetString(key, JsonConvert.SerializeObject(value));
        }
        public static T Get<T>(this ISession session, string key)
        {
            var value = session.GetString(key);
            return value == null ? default(T) :
                JsonConvert.DeserializeObject<T>(value);
        }
    }
}
