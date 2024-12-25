using Microsoft.AspNetCore.Mvc;
using NetCoreAndFlutterDemo.DTOs;
using NetCoreAndFlutterDemo.Interfaces;

namespace NetCoreAndFlutterDemo.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CustomersController : ControllerBase
{
    private readonly IUnitOfWork _unitOfWork;

    public CustomersController(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }
    
    [HttpGet()]
    public async Task<IActionResult> GetAllCustomers()
    {
        var customer = await _unitOfWork.CustomerRepository.GetAllCutomers();
        
        return Ok(customer);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetCustomerById(string id)
    {
        var customer = await _unitOfWork.CustomerRepository.GetCustomerByIdOrEmail(id);
        
        return Ok(customer);
    }
    
    [HttpPost]
    public async Task<IActionResult> CreateCustomer([FromBody] CustomerDto dto)
    {
        await _unitOfWork.CustomerRepository.Create(dto);

        if (!await _unitOfWork.Compelte())
        {
            return BadRequest("Cannot create customer");
        }

        return Created();
    }
    
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateCustomers(string id, CustomerDto dto)
    {
        await _unitOfWork.CustomerRepository.Update(id, dto);

        if (!await _unitOfWork.Compelte())
        {
            return BadRequest("Update customer failed");
        }

        return Ok();
    }
    
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteCustomers(string id)
    {
        await _unitOfWork.CustomerRepository.Delete(id);
        
        if (!await _unitOfWork.Compelte())
        {
            return BadRequest("Delete customer failed");
        }
        
        return Ok();
    }
}