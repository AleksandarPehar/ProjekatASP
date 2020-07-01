using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using Application.Searches;
using DataAccess;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ProjekatContext context;
        private readonly IGetUsersQuery getUser;
        private readonly IEditUserCommand editUser;
        private readonly IAddUserCommand createUser;
        private readonly IDeleteUserCommand deleteUser;

        public UserController(IAddUserCommand createUser, IGetUsersQuery getUser, IEditUserCommand editUser, IDeleteUserCommand deleteUser, ProjekatContext context)
        {
            this.createUser = createUser;
            this.getUser = getUser;
            this.editUser = editUser;
            this.deleteUser = deleteUser;
            this.context = context;
        }

        // GET api/User
        [HttpGet]
        public ActionResult Get([FromQuery] UserDto dto)
        {
            try
            {
                var consoles = getUser.Execute(dto);
                return Ok(consoles);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET api/User/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/User
        [HttpPost]
        public IActionResult Post([FromBody] AddUserDto request)
        {
            try
            {
                createUser.Execute(request);
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

        // PUT api/User/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] EditUserDto dto)
        {
            try
            {
                var user = context.Users.Find(id);
                if (user == null)
                    return NotFound();

                editUser.Execute(dto);
                return NoContent();

            }
            catch (NotFoundEx e)
            {
                return UnprocessableEntity(e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        // DELETE api/User/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                deleteUser.Execute(id);
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