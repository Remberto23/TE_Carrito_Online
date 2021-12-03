package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.utiles.ConexionDB;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAOimpl extends ConexionDB implements ProductoDAO {

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO producto (idUsuario, nombres, foto, descripcion, precio, stock) values (1,?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            
            ps.setString(1, producto.getNombres());
            ps.setString(2, producto.getFoto());
            ps.setString(3, producto.getDescripcion());
            ps.setDouble(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE producto SET idUsuario = ?, nombres = ?, foto = ?, descripcion= ?, precio = ?, stock = ? where idProducto = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, producto.getIdCliente());
            ps.setString(2, producto.getNombres());
            ps.setString(3, producto.getFoto());
            ps.setString(4, producto.getDescripcion());
            ps.setDouble(5, producto.getPrecio());
            ps.setInt(6, producto.getStock());
            ps.setInt(7, producto.getIdProducto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE from producto where idProducto = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Producto getById(int id) throws Exception {
        Producto pro = new Producto();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM producto where idProducto = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                pro.setIdProducto(rs.getInt("idProducto"));
                pro.setIdCliente(rs.getInt("idUsuario"));
                pro.setNombres(rs.getString("nombres"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setFoto(rs.getString("foto"));
                pro.setPrecio(rs.getDouble("precio"));
                pro.setStock(rs.getInt("stock"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM producto");
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Producto>();

            while (rs.next()) {
                Producto pro = new Producto();
                pro.setIdProducto(rs.getInt("idProducto"));
                pro.setIdCliente(rs.getInt("idUsuario"));
                pro.setNombres(rs.getString("nombres"));
                pro.setFoto(rs.getString("foto"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setStock(rs.getInt("stock"));

                lista.add(pro);
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
    public void listarImg(int id, HttpServletResponse response) throws Exception {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            this.conectar();
            String sql = "SELECT * FROM producto where idProducto = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);

            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Producto listarId(int id) throws Exception {
        Producto pro = new Producto();
        try {
            this.conectar();
            String sql = "SELECT * FROM producto where idProducto = ?";

            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            //ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pro.setIdProducto(rs.getInt("idProducto"));
                pro.setNombres(rs.getString("nombres"));
                pro.setFoto(rs.getString("foto"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setStock(rs.getInt("stock"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pro;
    }

}
