using NetCoreAndFlutterDemo.DTOs;
using NetCoreAndFlutterDemo.Interfaces;
using NetCoreAndFlutterDemo.Models;

namespace NetCoreAndFlutterDemo.Repository;

public class CustomerRepository: ICustomerRepository
{
    private readonly ApiDbContext _context;

    public CustomerRepository(ApiDbContext context)
    {
        _context = context;
    }

    public Task<CustomerDto> GetCustomerById(string id)
    {
        throw new NotImplementedException();
    }

    public Task Update(CustomerDto customer)
    {
        throw new NotImplementedException();
    }

    public Task Create(CustomerDto customer)
    {
        throw new NotImplementedException();
    }

    public Task Delete(string id)
    {
        throw new NotImplementedException();
    }
}