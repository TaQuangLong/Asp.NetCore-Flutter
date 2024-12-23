using System.ComponentModel.DataAnnotations;

namespace NetCoreAndFlutterDemo.Models;

public class Customer
{
    [Key]
    public string Id { get; set; }
    [Required]
    public string FirstName { get; set; }
    [Required]
    public string LastName { get; set; }
    [Required]
    [EmailAddress]
    public string Email { get; set; }
    public string? PhoneNumber { get; set; }
    public string? ZipCode { get; set; }
}