using Microsoft.AspNetCore.Mvc;
using NetCoreAndFlutterDemo.DTOs;
using NetCoreAndFlutterDemo.Interfaces;
using NetCoreAndFlutterDemo.Models;

namespace NetCoreAndFlutterDemo.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CustomersController : ControllerBase
{
    private readonly ICustomerRepository _customerRepository;

    public CustomersController(ICustomerRepository customerRepository)
    {
        _customerRepository = customerRepository;
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetCustomerById(string id)
    {
        return Ok();
    }
    
    [HttpPost]
    public async Task<IActionResult> CreateCustomer([FromBody] CustomerDto dto)
    {
        return Ok();
    }
    
    [HttpPut]
    public async Task<IActionResult> UpdateCustomers()
    {
        return Ok();
    }
    
    [HttpDelete]
    public async Task<IActionResult> DeleteCustomers()
    {
        return Ok();
    }
}