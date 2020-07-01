using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.ConsoleCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsoleController : ControllerBase
    {
        private readonly IGetConsolesQuery getConsole;
        private readonly IAddConsoleCommand createConsole;
        private readonly IDeleteConsoleCommand deleteConsole;

        // GET api/Console
        [HttpGet]
        public ActionResult Get([FromQuery] ConsoleDto dto)
        {
            try
            {
                var consoles = getConsole.Execute(dto);
                return Ok(consoles);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET api/Console/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/Console
        [HttpPost]
        public IActionResult Post([FromBody] AddConsoleDto request)
        {
            try
            {
                createConsole.Execute(request);
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

        // PUT api/Console/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/Console/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                deleteConsole.Execute(id);
                return NoContent();
            }
            catch (NotFoundEx ex)
            {
                return UnprocessableEntity(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
