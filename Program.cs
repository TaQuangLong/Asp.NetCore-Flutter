using NetCoreAndFlutterDemo.Models;
using Microsoft.EntityFrameworkCore;
using NetCoreAndFlutterDemo.Interfaces;
using NetCoreAndFlutterDemo.Repository;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<ApiDbContext>(option => 
    option.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


var app = builder.Build();
//cors: policy 
//authen, authorize 

app.Run();