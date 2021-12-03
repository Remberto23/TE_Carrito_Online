
package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Usuario;
import java.util.List;

public interface UsuarioDAO {
    public Usuario Validar(String email, String pass) throws Exception;
    public List<Usuario> getAll() throws Exception;
    public Usuario getById(int id) throws Exception;
}
