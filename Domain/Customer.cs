using System.ComponentModel.DataAnnotations;

namespace NetCoreAndFlutterDemo.Domain;

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

    public Customer(string firstName, string lastName, string email, string? phoneNumber, string? zipCode)
    {
        Id = Guid.NewGuid().ToString();
        FirstName = firstName;
        LastName = lastName;
        Email = email;
        PhoneNumber = phoneNumber;
        ZipCode = zipCode;
    }
}