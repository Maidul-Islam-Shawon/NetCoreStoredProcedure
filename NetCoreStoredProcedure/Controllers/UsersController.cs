using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreStoredProcedure.Models.DB;
using NetCoreStoredProcedure.Repositories;

namespace NetCoreStoredProcedure.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserRepository _repository;

        public UsersController(IUserRepository repository)
        {
            this._repository = repository ?? throw new NullReferenceException(nameof(repository));
        }

        [HttpPost, Route("GetOrCreate")]
        public async Task<IActionResult> GetOrCreate([FromBody] UserProfile userProfile)
        {
            return Ok(await _repository.GetOrCreateUserAsync(userProfile));
        }
    }
}
