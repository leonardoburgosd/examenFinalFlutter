using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace rest_examenfinal_videojuegos.Datos.bd
{
    public interface IdapperHelper
    {
        Task<dynamic> Consultas<T>(string cadenaConexion, string procedimientoAlmacenado, dynamic parametros = null) where T : class;

        Task<T> Insert<T>(string cadenaConexion, string procedimientoAlmacenado, dynamic parametros = null) where T : class;
    }
    public class dapperHelper: IdapperHelper
    {
        public async Task<dynamic> Consultas<T>(string cadenaConexion, string procedimientoAlmacenado, dynamic parametros = null) where T : class
        {
            try
            {
                using (IDbConnection connection = new SqlConnection(cadenaConexion))
                {
                    dynamic response = await connection.QueryAsync<T>(procedimientoAlmacenado, param: (object)parametros, commandType: CommandType.StoredProcedure);
                    return response;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<T> Insert<T>(string cadenaConexion, string procedimientoAlmacenado, dynamic parametros = null) where T : class
        {
            try
            {
                using (IDbConnection connection = new SqlConnection(cadenaConexion))
                {
                    var temp = await connection.QueryAsync<T>(procedimientoAlmacenado, param: (object)parametros, commandType: CommandType.StoredProcedure);
                    return await Task.Run(() => Enumerable.FirstOrDefault<T>(temp));
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
