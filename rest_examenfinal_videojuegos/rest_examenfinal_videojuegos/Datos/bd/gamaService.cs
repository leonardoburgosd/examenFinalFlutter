using rest_examenfinal_videojuegos.Datos.entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace rest_examenfinal_videojuegos.Datos.bd
{
    public interface IgamaService
    {
        Task<List<gamaProducto>> listar();
    }
    public class gamaService: IgamaService
    {
        private static string cadenaConexion = "Server=tcp:distribucionp.database.windows.net,1433;Initial Catalog=antaradb;Persist Security Info=False;User ID=DistribucionAC;Password=antaraproyect1.;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        private readonly IdapperHelper dapper;
        public gamaService(IdapperHelper dapper)
        {
            this.dapper = dapper;
        }
        public async Task<List<gamaProducto>> listar()
        {
            return await dapper.Consultas<gamaProducto>(cadenaConexion, "vijap.lista_gama", null);
        }
    }
}
