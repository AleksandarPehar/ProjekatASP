using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.RentCommands;
using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RentController : ControllerBase
    {
        private readonly IGetRentQuery getRent;
        private readonly IAddRentCommand addRent;

        public RentController(IGetRentQuery getRent, IAddRentCommand addRent)
        {
            this.getRent = getRent;
            this.addRent = addRent;
        }

        // GET: api/Rent
        [HttpGet]
        public ActionResult Get([FromQuery] RentDto dto)
        {
            try
            {
                var consoles = getRent.Execute(dto);
                return Ok(consoles);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET api/Rent/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/Rent
        [HttpPost]
        public IActionResult Post([FromBody] RentDto request)
        {
            try
            {
                addRent.Execute(request);
                return StatusCode(201);
            }
            catch (AlreadyExistsEx ex)
            {
                return StatusCode(409, ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // PUT api/Rent/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/Rent/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
