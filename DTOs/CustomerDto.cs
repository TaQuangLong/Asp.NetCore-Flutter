using System.ComponentModel.DataAnnotations;

namespace NetCoreAndFlutterDemo.DTOs;

public class CustomerDto
{
    public string Id { get; set; }
    [Required(ErrorMessage = "First Name is required")]
    [StringLength(50)]
    public string FirstName { get; set; }
    
    [Required(ErrorMessage = "Last Name is required")]
    [StringLength(50)]
    public string LastName { get; set; }
    
    [Required(ErrorMessage = "Email is required")]
    [EmailAddress]
    public string Email { get; set; }
    
    [Phone]
    public string? PhoneNumber { get; set; }
    public string? ZipCode { get; set; }
}