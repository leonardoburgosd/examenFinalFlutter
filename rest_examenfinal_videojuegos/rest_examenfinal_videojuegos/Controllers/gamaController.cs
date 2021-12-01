using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using rest_examenfinal_videojuegos.Datos.bd;
using rest_examenfinal_videojuegos.Datos.entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace rest_examenfinal_videojuegos.Controllers
{
    [Route("api/gama")]
    [ApiController]
    public class GamaController : ControllerBase
    {
        private readonly IgamaService igamaService;
        public GamaController(IgamaService igamaService)
        {
            this.igamaService = igamaService;
        }

        [HttpGet]
        public async Task<List<gamaProducto>> lista()
        {
            return await igamaService.listar();
        }
    }
}
