using NetCoreAndFlutterDemo.Interfaces;
using NetCoreAndFlutterDemo.Models;

namespace NetCoreAndFlutterDemo.Repository;

public class UnitOfWork: IUnitOfWork
{
    private readonly ApiDbContext _dbContext;

    public UnitOfWork(ApiDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public ICustomerRepository CustomerRepository => new CustomerRepository(_dbContext);
    
    public bool HasChanges()
    {
        return _dbContext.ChangeTracker.HasChanges();
    }

    public async Task<bool> Compelte()
    {
        return await _dbContext.SaveChangesAsync() > 0;
    }
}