using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Encyription;
using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Helper;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogInController : ControllerBase
    {

        private readonly Encryption enc;
        private ILogInUserCommand login;

        public LogInController(Encryption enc, ILogInUserCommand login)
        {
            this.enc = enc;
            this.login = login;
        }

        // POST api/LogIn
        [HttpPost]
        public IActionResult Post([FromBody] LogInDto request)
        {
            try
            {
                var user = login.Execute(request);
                var stringObj = JsonConvert.SerializeObject(user);
                var enced = enc.EncryptString(stringObj);

                return Ok(new { token = enced });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("decode")]
        public IActionResult Decode(string enced)
        {
            var decoded = enc.DecryptString(enced);
            decoded = decoded.Replace("\u000e", "");
            var user = JsonConvert.DeserializeObject<Logged>(decoded);

            return NoContent();
        }
    }
}
