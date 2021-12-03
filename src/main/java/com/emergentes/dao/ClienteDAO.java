
package com.emergentes.dao;

import com.emergentes.modelo.Cliente;
import java.util.List;

public interface ClienteDAO {
    public Cliente listarCliente(String email, String password) throws Exception;
    public Cliente Cliente(int id) throws Exception;
    public Cliente Validar(String email, String pass) throws Exception;
    public List<Cliente> getAll() throws Exception;
    public Cliente getById(int id) throws Exception;
    public void delete(int id) throws Exception;
    public void update(Cliente cliente) throws Exception;
    public void insert(Cliente cliente) throws Exception;
}
