package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.CompraDAO;
import com.emergentes.dao.CompraDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Carrito;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Compra;
import com.emergentes.modelo.DetalleCompra;
import com.emergentes.modelo.Pago;
import com.emergentes.modelo.Producto;
import com.emergentes.utiles.Fecha;
import com.emergentes.utiles.Validate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int idcompra;
    int idpago;
    double montopagar;
    int idProducto = 0;

    Pago pago = new Pago();
    Cliente cl = new Cliente();
    ClienteDAO cldao = new ClienteDAOimpl();
    CompraDAO cdao = new CompraDAOimpl();

    Fecha fechaSistem = new Fecha();

    String logueo = "Iniciar Sesion";
    String correo = "Iniciar Sesion";
    int idC = 0;

    Carrito car;
    List<Carrito> listaCarrito = new ArrayList<Carrito>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("logueo", logueo);
        session.setAttribute("correo", correo);
        try {

            Compra com = new Compra();
            CompraDAO daoc = new CompraDAOimpl();
            List<Producto> lista = null;
            List<Compra> listaC = null;

            Producto pro = new Producto();
            Cliente cli = new Cliente();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    request.setAttribute("productos", pro);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pro = dao.getById(id);
                    request.setAttribute("productos", pro);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    session.setAttribute("logueo", logueo);
                    session.setAttribute("correo", correo);
                    lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "view2":
                    session.setAttribute("logueo", logueo);
                    session.setAttribute("correo", correo);
                    lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "AgregarCarrito":
                    int pos = 0;
                    cantidad = 1;
                    id = Integer.parseInt(request.getParameter("id"));

                    pro = dao.listarId(id);

                    if (listaCarrito.size() > 0) {
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if (id == listaCarrito.get(i).getIdProducto()) {
                                pos = i;
                            }
                        }
                        if (id == listaCarrito.get(pos).getIdProducto()) {
                            cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                            double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                            listaCarrito.get(pos).setCantidad(cantidad);
                            listaCarrito.get(pos).setSubTotal(subtotal);
                        } else {
                            item = item + 1;
                            car = new Carrito();
                            car.setItem(item);
                            car.setIdProducto(pro.getIdProducto());
                            car.setNombres(pro.getNombres());
                            car.setDescripcion(pro.getDescripcion());
                            car.setFoto(pro.getFoto());
                            car.setPrecioCompra(pro.getPrecio());
                            car.setCantidad(cantidad);
                            car.setSubTotal(cantidad * pro.getPrecio());

                            listaCarrito.add(car);
                        }

                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(pro.getIdProducto());
                        car.setNombres(pro.getNombres());
                        car.setDescripcion(pro.getDescripcion());
                        car.setFoto(pro.getFoto());
                        car.setPrecioCompra(pro.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * pro.getPrecio());

                        listaCarrito.add(car);
                    }

                    //Obtener la lista de objetos
                    request.setAttribute("contador", listaCarrito.size());
                    request.getRequestDispatcher("ProductoControlador?action=view").forward(request, response);
                    break;
                case "Carrito":
                    totalPagar = 0.0;
                    request.setAttribute("carrito", listaCarrito);
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                    }
                    request.setAttribute("totalPagar", totalPagar);
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                    break;
                case "Comprar":
                    totalPagar = 0.0;
                    id = Integer.parseInt(request.getParameter("id"));
                    pro = dao.listarId(id);
                    item = item + 1;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(pro.getIdProducto());
                    car.setNombres(pro.getNombres());
                    car.setDescripcion(pro.getDescripcion());
                    car.setFoto(pro.getFoto());
                    car.setPrecioCompra(pro.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(cantidad * pro.getPrecio());
                    listaCarrito.add(car);

                    for (int i = 0; i < listaCarrito.size(); i++) {
                        totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                    }
                    request.setAttribute("totalPagar", totalPagar);
                    request.setAttribute("carrito", listaCarrito);
                    //Obtener la lista de objetos
                    request.setAttribute("contador", listaCarrito.size());
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                    break;
                case "Validar":
                    String email = request.getParameter("email");
                    String pass = request.getParameter("password");
                    String user = request.getParameter("usuario");
                    if (user.equals("Cliente")) {
                        cl = cldao.Validar(email, pass);
                        if (cl.getIdCliente() != 0) {
                            System.out.println("Correcto");
                            HttpSession ses = request.getSession();
                            ses.setAttribute("login", "OK");
                            logueo = cl.getNombres();
                            correo = cl.getEmail();
                            idC = cl.getIdCliente();

                            request.getRequestDispatcher("ProductoControlador?action=view").forward(request, response);
                        } else {
                            System.out.println("Incorrecto");
                            response.sendRedirect("login.jsp");
                        }

                    }
                    if (user.equals("Administrador")) {
                        Validate v = new Validate();
                        if (v.checkUser(email, pass)) {
                            System.out.println("Correcto");
                            HttpSession ses = request.getSession();
                            ses.setAttribute("login", "OKAdmin");

                            response.sendRedirect("ProductoCont");
                        } else {
                            System.out.println("Incorrecto");
                            response.sendRedirect("login.jsp");
                        }
                    }

                    break;
                case "RealizarPago":
                    double monto = Double.parseDouble(request.getParameter("monto"));
                    montopagar = monto;
                    request.setAttribute("montopagar", montopagar);
                    request.getRequestDispatcher("tarjeta.jsp").forward(request, response);
                    
                    break;
                case "pagar":
                    double pago = Double.parseDouble(request.getParameter("pago"));
                    montopagar = pago;
                    if (montopagar > 0) {
                        cdao.Pagar(montopagar);
                        request.getRequestDispatcher("ProductoControlador?action=Carrito").forward(request, response);
                    } else {
                        montopagar = 0;
                        request.getRequestDispatcher("ProductoControlador?action=Carrito").forward(request, response);
                    }

                    break;
                case "GenerarCompra":
                    idpago = cdao.IdPago(montopagar);
                    if (idC != 0 && listaCarrito.size() != 0 && montopagar > 0) {
                        if (totalPagar > 0.0) {
                            Compra co = new Compra();
                            co.setIdCliente(cl.getIdCliente());
                            co.setFecha(fechaSistem.FechaBD());
                            co.setMonto(totalPagar);
                            co.setIdPago(idpago);
                            co.setEstado("Cancelado - En Proceso de Envio");
                            cdao.guardarCompra(co);
                            montopagar = 0;
                            idcompra = cdao.IdCompra();
                            for (int i = 0; i < listaCarrito.size(); i++) {
                                DetalleCompra dc = new DetalleCompra();
                                dc.setIdcompra(idcompra);
                                dc.setIdproducto(listaCarrito.get(i).getIdProducto());
                                dc.setCantidad(listaCarrito.get(i).getCantidad());
                                dc.setPrecioCompra(listaCarrito.get(i).getPrecioCompra());
                                cdao.guardarDetalleCompra(dc);
                            }
                            listaCarrito = new ArrayList<>();
                            List compra = cdao.misCompras(cl.getIdCliente());
                            request.setAttribute("myCompras", compra);
                            request.getRequestDispatcher("compras.jsp").forward(request, response);
                        } else {
                            response.sendRedirect("ProductoControlador");
                        }
                    } else {
                        request.getRequestDispatcher("ProductoControlador?action=Carrito").forward(request, response);
                    }
                    break;
                
                case "deleteProducto":
                    idProducto = Integer.parseInt(request.getParameter("id"));
                    if (listaCarrito != null) {
                        for (int j = 0; j < listaCarrito.size(); j++) {
                            if (listaCarrito.get(j).getIdProducto() == idProducto) {
                                listaCarrito.remove(j);
                            }
                        }
                    }
                    request.getRequestDispatcher("ProductoControlador?action=Carrito").forward(request, response);
                    break;
                case "verDetalle":
                    totalPagar = 0.0;
                    int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                    List<DetalleCompra> detalle = cdao.Detalle(idcompras);
                    request.setAttribute("myDetalle", detalle);
                    for (int i = 0; i < detalle.size(); i++) {
                        totalPagar = totalPagar + (detalle.get(i).getPrecioCompra() * detalle.get(i).getCantidad());
                    }
                    request.setAttribute("montoPagar", totalPagar);
                    request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response);
                    break;
                case "verDetalleCliente":
                    totalPagar = 0.0;
                    int idcomprass = Integer.parseInt(request.getParameter("idcompra"));
                    List<DetalleCompra> detalleC = cdao.Detalle(idcomprass);
                    request.setAttribute("myDetalle", detalleC);
                    for (int i = 0; i < detalleC.size(); i++) {
                        totalPagar = totalPagar + (detalleC.get(i).getPrecioCompra() * detalleC.get(i).getCantidad());
                    }
                    request.setAttribute("montoPagar", totalPagar);
                    request.getRequestDispatcher("DetalleCompraCliente.jsp").forward(request, response);
                    break;
                case "Salir":
                    listaCarrito = new ArrayList();
                    cl = new Cliente();
                    session.invalidate();
                    logueo = "Iniciar Sesion";
                    correo = "Iniciar Sesion";
                    request.getRequestDispatcher("ProductoControlador?action=view").forward(request, response);
                    break;
                case "ComprasCliente":
                    //Obtener la lista de objetos
                    listaC = cdao.getAllCliente(idC);
                    request.setAttribute("compras", listaC);
                    request.getRequestDispatcher("comprasUsuario.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error  " + ex.getMessage());
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
