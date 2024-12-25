using NetCoreAndFlutterDemo.Domain;
using NetCoreAndFlutterDemo.DTOs;

namespace NetCoreAndFlutterDemo.Interfaces;

public interface ICustomerRepository
{
    Task<IEnumerable<CustomerDto>> GetAllCutomers();
    Task<CustomerDto> GetCustomerByIdOrEmail(string key);
    Task<CustomerDto> GetCustomerById(string id);
    Task Update(string id, CustomerDto customer);
    Task Create(CustomerDto customer);
    Task Delete(string id);
}