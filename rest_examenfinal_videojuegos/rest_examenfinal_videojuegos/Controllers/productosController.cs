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
    [Route("api/productos")]
    [ApiController]
    public class productosController : Controller
    {
        private readonly IproductosService iproductosService;
        public productosController(IproductosService iproductosService) {
            this.iproductosService = iproductosService;
        }

        [HttpGet]
        public async Task<List<productos>> lista()
        {
            return await iproductosService.listar();
        }

        [HttpPost]
        public async Task<ActionResult> agregar([FromBody] productos producto)
        {
            await iproductosService.agregar(producto);
            return StatusCode(200);
        }

        [HttpGet("{idProducto}")]
        public async Task<List<detalleVenta>> detalleAcumulado(int idProducto)
        {
            return await iproductosService.ventaTotal(idProducto);
        }
    }
}
