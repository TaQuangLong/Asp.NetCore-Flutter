using NetCoreAndFlutterDemo.DTOs;
using NetCoreAndFlutterDemo.Models;

namespace NetCoreAndFlutterDemo.Interfaces;

public interface ICustomerRepository
{
    Task<CustomerDto> GetCustomerById(string id);
    Task Update(CustomerDto customer);
    Task Create(CustomerDto customer);
    Task Delete(string id);
}