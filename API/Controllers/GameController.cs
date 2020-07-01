using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands.GameCommands;
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
    public class GameController : ControllerBase
    {
        private readonly ProjekatContext context;
        private readonly IGetGamesQuery getGame;
        private readonly IEditGameCommand editGame;
        private readonly IAddGameCommand createGame;
        private readonly IDeleteGameCommand deleteGame;
        private readonly IGetSingleGameQuery getSingleGame;

        public GameController(IAddGameCommand createGame, IGetGamesQuery getGame, IGetSingleGameQuery getSingleGame, IEditGameCommand editGame, IDeleteGameCommand deleteGame, ProjekatContext context)
        {
            this.getGame = getGame;
            this.editGame = editGame;
            this.createGame = createGame;
            this.deleteGame = deleteGame;
            this.getSingleGame = getSingleGame;
            this.context = context;
        }

        // GET api/Game
        [HttpGet]
        public ActionResult Get([FromQuery] GameSearch dto)
        {
            try
            {
                var consoles = getGame.Execute(dto);
                return Ok(consoles);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // GET api/Game/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/Game
        [HttpPost]
        public IActionResult Post([FromBody] AddGameDto request)
        {
            try
            {
                createGame.Execute(request);
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

        // PUT api/Game/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] EditGameDto dto)
        {
            try
            {
                var user = context.Users.Find(id);
                if (user == null)
                    return NotFound();

                editGame.Execute(dto);
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

        // DELETE api/Game/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                deleteGame.Execute(id);
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
