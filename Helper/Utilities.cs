using System.Text.RegularExpressions;
using System.IO;
namespace ShopToys.Helper
{
	public static class Utilities
	{
		public static void CreateIfMissing(string path)
		{
			bool folderExists = Directory.Exists(path);
			if(!folderExists)
			{
				Directory.CreateDirectory(path);
			}
		}
		public static string SEOUrl(string url)
		{
			url = url.ToLower();
			url = Regex.Replace(url, @"[ậẩầấâặằắăạàảá]", "a");
			url = Regex.Replace(url, @"[ẻèẹéệềểếê]", "e");
			url = Regex.Replace(url, @"[ựửừứưụùủú]", "u");
			url = Regex.Replace(url, @"[ộồổốôọòỏó]", "o");
			url = Regex.Replace(url, @"[ịìỉí]", "i");
			url = Regex.Replace(url, @"[ỳỷỵý]", "y");
			url = Regex.Replace(url, @"[đ]", "d");
			url = Regex.Replace(url.Trim(),@"[^0-9a-z-\s]","").Trim();
			url = Regex.Replace(url.Trim(), @"\s+", "-");
			url = Regex.Replace(url, @"\s", "-");
			while (true)
			{
				if (url.IndexOf("--") != -1)
				{
					url = url.Replace("--", "-");
				}
				else
				{
					break;
				}
			}
			return url;
		}
		public static async Task<string> UploadFile(Microsoft.AspNetCore.Http.IFormFile file, string sDirectory, string newname)
		{
			try
			{
				if (newname == null) newname = file.FileName;
				string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", sDirectory);
				CreateIfMissing(path);
				string pathFile = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", sDirectory, newname);
				var supportedTypes = new[] { "jpg", "jpeg", "png", "gif" };
				var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
				if (!supportedTypes.Contains(fileExt.ToLower()))
				{
					return null;
				}
				else
				{
					using (var stream = new FileStream(pathFile, FileMode.Create))
					{
						await file.CopyToAsync(stream);
					}
					return newname;
				}
			}catch (Exception ex)
			{
				return null;
			}
		}
	}
}
