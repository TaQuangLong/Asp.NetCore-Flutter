using Microsoft.EntityFrameworkCore;

namespace NetCoreAndFlutterDemo.Models;

public class ApiDbContext: DbContext
{
    public ApiDbContext(DbContextOptions<ApiDbContext> options): base(options)
    {
        
    }
    
    public DbSet<Customer> Customers { get; set; }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
            
    }
}