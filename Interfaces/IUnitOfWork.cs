namespace NetCoreAndFlutterDemo.Interfaces;

public interface IUnitOfWork
{
    ICustomerRepository CustomerRepository { get; }
    bool HasChanges();
    Task<bool> Compelte();
}