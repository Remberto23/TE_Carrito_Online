
package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOimpl extends ConexionDB implements UsuarioDAO {

    @Override
    public Usuario Validar(String email, String pass) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        
    }
    @Override
    public List<Usuario> getAll() throws Exception {
        List<Usuario> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Usuario>();

            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNombre(rs.getString("nombre"));
                usu.setApellidos(rs.getString("apellidos"));
                usu.setCargo(rs.getString("cargo"));
                usu.setEmail(rs.getString("email"));
                usu.setPassword(rs.getString("password"));

                lista.add(usu);
            }
            rs.close();;
            ps.close();;

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    @Override
    public Usuario getById(int id) throws Exception {
        Usuario usu = new Usuario();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios where idUsuario = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNombre(rs.getString("nombre"));
                usu.setApellidos(rs.getString("apellidos"));
                usu.setCargo(rs.getString("cargo"));
                usu.setEmail(rs.getString("email"));
                usu.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return usu;
    }
    
}
