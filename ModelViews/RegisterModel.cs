using System.ComponentModel.DataAnnotations;

namespace ShopToys.ModelViews
{
    public class RegisterViewModel
    {
        [MaxLength(100)]
        [Required(ErrorMessage = "Please enter username")]
        [Display(Name = "Username")]
        public string Username { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please enter password")]
        [MinLength(8, ErrorMessage = "Password length must be at least 8 characters.")]
        public string Password { get; set; }

        [Display(Name = "Confirm Password")]
        [Required(ErrorMessage = "Please confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }
}
