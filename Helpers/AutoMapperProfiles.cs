using AutoMapper;
using NetCoreAndFlutterDemo.Domain;
using NetCoreAndFlutterDemo.DTOs;

namespace NetCoreAndFlutterDemo.Helpers;

public class AutoMapperProfiles: Profile
{
    public AutoMapperProfiles()
    {
        CreateMap<Customer, CustomerDto>();
    }
}