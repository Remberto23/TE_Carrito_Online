package com.emergentes.dao;

import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Cliente;
import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAOimpl extends ConexionDB implements ClienteDAO {
    
    ResultSet rs;

    @Override
    public Cliente listarCliente(String email, String password) throws Exception {

        Connection con = this.conectar();
        PreparedStatement pr;
        
        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("select * from cliente where email = ? and password = sha1(?)");
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setCi(rs.getInt("ci"));
                cli.setNombres(rs.getString("nombres"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setEmail(rs.getString("email"));
                cli.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;

    }

    @Override
    public Cliente Cliente(int id) throws Exception {
        Connection con = this.conectar();
        PreparedStatement pr;

        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("select * from cliente where idCliente = ? ");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setCi(rs.getInt("ci"));
                cli.setNombres(rs.getString("nombres"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setEmail(rs.getString("email"));
                cli.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;
    }

    @Override
    public Cliente Validar(String email, String pass) throws Exception {
        System.out.println(email);
        System.out.println(pass);
        String sql = "select * from cliente where email=? and password=?";

        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setCi(rs.getInt("ci"));
                cli.setNombres(rs.getString("nombres"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setEmail(rs.getString("email"));
                cli.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
        }
        return cli;
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE from cliente where idCliente = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Cliente getById(int id) throws Exception {
        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM cliente where idCliente = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setCi(rs.getInt("ci"));
                cli.setNombres(rs.getString("nombres"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setEmail(rs.getString("email"));
                cli.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;
    }

    @Override
    public List<Cliente> getAll() throws Exception {
        List<Cliente> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM cliente";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Cliente>();

            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setCi(rs.getInt("ci"));
                cli.setNombres(rs.getString("nombres"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setEmail(rs.getString("email"));
                cli.setPassword(rs.getString("password"));

                lista.add(cli);
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
    public void insert(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO cliente (ci, nombres, direccion, email, password) values (?,?,?,?,?)");
            ps.setInt(1, cliente.getCi());
            ps.setString(2, cliente.getNombres());
            ps.setString(3, cliente.getDireccion());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getPassword());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE cliente SET ci = ?, nombres = ?, direccion = ?, email= ?, password = ? where idCliente = ?");
            ps.setInt(1, cliente.getCi());
            ps.setString(2, cliente.getNombres());
            ps.setString(3, cliente.getDireccion());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getPassword());
            ps.setInt(6, cliente.getIdCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
}
