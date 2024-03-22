using System.ComponentModel.DataAnnotations;

namespace ShopToys.ModelViews
{
    public class LoginViewModel
    {

        [MaxLength(100)]
        [Required(ErrorMessage = "Please enter username")]
        [Display(Name = "Username")]
        public string Username { get; set; }
        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please enter password")]
        [MinLength(8, ErrorMessage = "Length of password must be 8 character.")]
        public string Password { get; set; }

    }
}
