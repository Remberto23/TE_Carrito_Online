
package com.emergentes.dao;

import com.emergentes.modelo.Carrito;
import com.emergentes.modelo.Compra;
import com.emergentes.modelo.DetalleCompra;
import com.emergentes.modelo.Producto;
import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompraDAOimpl extends ConexionDB implements CompraDAO {

    int r = 0;
    PreparedStatement ps;
    ResultSet rs;
    Connection con;

    @Override
    public int GenerarCompra(Compra compra) throws Exception {
        
        return r;
    }

    @Override
    public int IdCompra() throws Exception {
        int idc = 0;
        String sql = "select max(idCompras) from compras";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idc = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idc;
    }

    @Override
    public int guardarCompra(Compra co) throws Exception {
        String sql = "insert into compras(idCliente,idPago, fechaCompras,monto,estado)values(?,?,?,?,?)";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, co.getIdCliente());
            ps.setInt(2, co.getIdPago());
            ps.setString(3, co.getFecha());
            ps.setDouble(4, co.getMonto());
            ps.setString(5, co.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public int guardarDetalleCompra(DetalleCompra dc) throws Exception {
        String sql = "insert into detalle_compras(idProducto,idCompras, Cantidad, PrecioCompra)values(?,?,?,?)";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, dc.getIdproducto());
            ps.setInt(2, dc.getIdcompra());
            ps.setInt(3, dc.getCantidad());
            ps.setDouble(4, dc.getPrecioCompra());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public List misCompras(int id) throws Exception {
        List lista = new ArrayList();
        String sql = "select * from compras where idCliente=" + id;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra com = new Compra();
                com.setId(rs.getInt(1));
                com.setIdCliente(rs.getInt(2));
                com.setIdPago(rs.getInt(3));
                com.setFecha(rs.getString(4));
                com.setMonto(rs.getDouble(5));
                com.setEstado(rs.getString(6));
                lista.add(com);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    @Override
    public int Pagar(double monto) throws Exception {
        System.out.println("ENTRO");
        String sql = "insert into pago(Monto)values(?)";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setDouble(1, monto);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    @Override
    public int IdPago(double tam) throws Exception {
        System.out.println("ENTRO ID COMPRAS****************************************************************************");
        int idpago = 0;
        String sql = "select max(idPago) from pago";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpago = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        System.out.println(tam);
        return idpago;
    }

    @Override
    public List Detalle(int id) throws Exception {
        List lista = new ArrayList();
        String sql = "select DC.idDetalle, P.foto, P.nombres, DC.idCompras, DC.Cantidad, DC.PrecioCompra FROM detalle_compras DC inner join producto P on P.idProducto = DC.idProducto where idCompras=?";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompra dcom = new DetalleCompra();
                dcom.setId(rs.getInt(1));
                dcom.setProducto(new Producto());
                dcom.getProducto().setFoto(rs.getString(2));
                dcom.getProducto().setNombres(rs.getString(3));
                dcom.setIdcompra(rs.getInt(4));
                dcom.setCantidad(rs.getInt(5));
                dcom.setPrecioCompra(rs.getDouble(6));
                lista.add(dcom);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    @Override
    public List<Compra> getAll() throws Exception {
        List<Compra> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM compras";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Compra>();

            while (rs.next()) {
                Compra com = new Compra();
                com.setId(rs.getInt("idCompras"));
                com.setIdCliente(rs.getInt("idCliente"));
                com.setIdPago(rs.getInt("idPago"));
                com.setFecha(rs.getString("fechaCompras"));
                com.setMonto(rs.getDouble("monto"));
                com.setEstado(rs.getString("estado"));

                lista.add(com);
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
    public List<Compra> getAllCliente(int idC) throws Exception {
        System.out.println(idC);
        List<Compra> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM compras where idCliente = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, idC);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Compra>();

            while (rs.next()) {
                Compra com = new Compra();
                com.setId(rs.getInt("idCompras"));
                com.setIdCliente(rs.getInt("idCliente"));
                com.setIdPago(rs.getInt("idPago"));
                com.setFecha(rs.getString("fechaCompras"));
                com.setMonto(rs.getDouble("monto"));
                com.setEstado(rs.getString("estado"));

                lista.add(com);
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
    
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE from compras where idCompras = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    
    @Override
    public Compra getById(int id) throws Exception {
        Compra com = new Compra();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM compras where idCompras = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                com.setId(rs.getInt("idCompras"));
                com.setIdCliente(rs.getInt("idCliente"));
                com.setIdPago(rs.getInt("idPago"));
                com.setFecha(rs.getString("fechaCompras"));
                com.setMonto(rs.getDouble("monto"));
                com.setEstado(rs.getString("estado"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return com;
    }

}
