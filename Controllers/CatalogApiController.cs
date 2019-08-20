using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CatalogApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogApiController : ControllerBase
    {
        [HttpGet]
        [Route("GetAllItems")]
        public async Task<IActionResult> ItemsAsync()
        {
            try
            {
               
                return Ok("All ItemList");
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }

        }
    }
}