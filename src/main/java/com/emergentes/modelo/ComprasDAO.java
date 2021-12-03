package com.emergentes.modelo;

import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ComprasDAO extends ConexionDB {

    Connection con;
    //Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public int IdCompra() {
        
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

    public int guardarCompra(Compra co) {
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
    public int guardarDetalleCompra(DetalleCompra dc) {
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

    public List misCompras(int id) {
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

    /*public List Detalle(int id) {
        List lista = new ArrayList();
        String sql = "select DC.idDetalle, P.Foto, P.Nombres, DC.idCompras, DC.Cantidad, DC.PrecioCompra FROM detalle_compras DC inner join producto P on P.idProducto = DC.idProducto where idCompras=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompra dcom = new DetalleCompra();
                dcom.setId(rs.getInt(1));
                dcom.setProducto(new Producto());
                dcom.getProducto().setImagen(rs.getString(2));
                dcom.getProducto().setNombres(rs.getString(3));
                dcom.setIdcompra(rs.getInt(4));
                dcom.setCantidad(rs.getInt(5));
                dcom.setPrecioCompra(rs.getDouble(6));
                lista.add(dcom);
            }
        } catch (Exception e) {
        }
        return lista;
    }*/

    public int Pagar(double monto) {
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

    public int IdPago(double tam) {
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
}
