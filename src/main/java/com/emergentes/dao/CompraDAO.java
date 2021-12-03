package com.emergentes.dao;

import com.emergentes.modelo.Compra;
import com.emergentes.modelo.DetalleCompra;
import java.util.List;

public interface CompraDAO {

    public int GenerarCompra(Compra compra) throws Exception;

    public int IdCompra() throws Exception;

    public int guardarCompra(Compra co) throws Exception;

    public int guardarDetalleCompra(DetalleCompra dc) throws Exception;

    public List misCompras(int id) throws Exception;

    public int Pagar(double monto) throws Exception;

    public int IdPago(double tam) throws Exception;

    public List Detalle(int id) throws Exception;
    
    public List<Compra> getAll() throws Exception;
    
    public List<Compra> getAllCliente(int idC) throws Exception;
    
    public void delete(int id) throws Exception;
    
    public Compra getById(int id) throws Exception;
}
