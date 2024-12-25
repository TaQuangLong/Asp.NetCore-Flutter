using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using NetCoreAndFlutterDemo.Domain;
using NetCoreAndFlutterDemo.DTOs;
using NetCoreAndFlutterDemo.Interfaces;

namespace NetCoreAndFlutterDemo.Repository;

public class CustomerRepository : ICustomerRepository
{
    private readonly ApiDbContext _dbContext;
    private readonly IMapper _mapper;

    public CustomerRepository(ApiDbContext dbContext, IMapper mapper)
    {
        _dbContext = dbContext;
        _mapper = mapper;
    }

    public async Task<IEnumerable<CustomerDto>> GetAllCutomers()
    {
        var customers = await _dbContext.Customers
                                                .ProjectTo<CustomerDto>(_mapper.ConfigurationProvider)
                                                .ToListAsync();
        return customers;
    }

    public async Task<CustomerDto> GetCustomerByIdOrEmail(string key)
    {
        var customer = await _dbContext.Customers
            .Where(x => x.Email.Contains(key) || x.Id == key)
            .ProjectTo<CustomerDto>(_mapper.ConfigurationProvider).FirstOrDefaultAsync();
        
        return customer;
    }

    public async Task<CustomerDto> GetCustomerById(string id)
    {
        var customer = await _dbContext.Customers.FindAsync(id);

        if (customer == default)
        {
            throw new Exception($"Customer not found with Id: {id}");
        }

        var customerDto = _mapper.Map<CustomerDto>(customer);

        return customerDto;
    }

    public async Task Update(string id, CustomerDto customer)
    {
        var customerToUpdate = await _dbContext.Customers.FindAsync(id);
        if (customerToUpdate == default)
        {
            throw new Exception($"Customer not found with Id: {id}");
        }

        customerToUpdate.FirstName = customer.FirstName;
        customerToUpdate.LastName = customer.LastName;
        customerToUpdate.Email = customer.Email;
        customerToUpdate.PhoneNumber = customer.PhoneNumber;
        customerToUpdate.ZipCode = customer.ZipCode;
    }

    public async Task Create(CustomerDto dto)
    {
        var customer = new Customer(dto.FirstName, dto.LastName, dto.Email, dto.PhoneNumber, dto.ZipCode);
        
        await _dbContext.Customers.AddAsync(customer);
    }

    public async Task Delete(string id)
    {
        var customer = await _dbContext.Customers.FindAsync(id);

        _dbContext.Customers.Remove(customer);
    }
}