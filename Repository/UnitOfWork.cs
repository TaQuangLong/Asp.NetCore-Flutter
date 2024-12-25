using AutoMapper;
using NetCoreAndFlutterDemo.Domain;
using NetCoreAndFlutterDemo.Interfaces;

namespace NetCoreAndFlutterDemo.Repository;

public class UnitOfWork: IUnitOfWork
{
    private readonly ApiDbContext _dbContext;
    private readonly IMapper _mapper;
    public UnitOfWork(ApiDbContext dbContext, IMapper mapper)
    {
        _dbContext = dbContext;
        _mapper = mapper;
    }

    public ICustomerRepository CustomerRepository => new CustomerRepository(_dbContext, _mapper);
    
    public bool HasChanges()
    {
        return _dbContext.ChangeTracker.HasChanges();
    }

    public async Task<bool> Compelte()
    {
        return await _dbContext.SaveChangesAsync() > 0;
    }
}