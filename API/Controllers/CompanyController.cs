using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.CompanyCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : ControllerBase
    {
        private readonly IGetCompaniesQuery getCompany;
        private readonly IAddCompanyCommand createCompany;
        private readonly IDeleteCompanyCommand deleteCompany;

        // GET api/Company
        [HttpGet]
        public ActionResult Get([FromQuery] CompanyDto dto)
        {
            try
            {
                var consoles = getCompany.Execute(dto);
                return Ok(consoles);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET api/Company/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/Company
        [HttpPost]
        public IActionResult Post([FromBody] AddCompanyDto request)
        {
            try
            {
                createCompany.Execute(request);
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

        // PUT api/Company/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/Company/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                deleteCompany.Execute(id);
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
