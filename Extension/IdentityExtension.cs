using System.Security.Claims;

namespace ShopToys.Extension
{
	public static class IdentityExtension
	{
		public static string GetSpecification(this ClaimsPrincipal claimsPrincipal,string claimType)
		{
			var claim = claimsPrincipal.Claims.FirstOrDefault(x=>x.Type==claimType);
			return (claim!=null)?claim.Value:string.Empty;
		}
	}
}
