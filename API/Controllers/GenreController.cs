using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.GenreCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly IGetGenresQuery getGenre;
        private readonly IAddGenreCommand createGenre;
        private readonly IDeleteGenreCommand deleteGenre;

        // GET: api/Genre
        [HttpGet]
        public IActionResult Get([FromQuery] GenreDto dto)
        {
            try
            {
                var genres = getGenre.Execute(dto);
                return Ok(genres);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET: api/Genre/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Genre
        [HttpPost]
        public IActionResult Post([FromBody] AddGenreDto request)
        {
            try
            {
                createGenre.Execute(request);
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

        // PUT: api/Genre/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                deleteGenre.Execute(id);
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
