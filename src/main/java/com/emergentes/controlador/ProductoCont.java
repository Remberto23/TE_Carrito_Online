
package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoCont", urlPatterns = {"/ProductoCont"})
public class ProductoCont extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Producto pro = new Producto();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();
            List<Usuario> lista_usuarios = null;
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    request.setAttribute("productos", pro);
                    request.getRequestDispatcher("frmproducto2.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pro = dao.getById(id);
                    request.setAttribute("productos", pro);
                    request.getRequestDispatcher("frmproducto2.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoCont");
                    break;
                case "view":
                    //Obtener la lista de objetos
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error  " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String nombres = request.getParameter("nombres");
        String foto = request.getParameter("foto");
        String descripcion = request.getParameter("descripcion");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        System.out.println("*********************************");
        System.out.println(idCliente);
        System.out.println("*********************************");

        Producto pro = new Producto();

        pro.setIdProducto(idProducto);
        pro.setIdCliente(idCliente);
        pro.setNombres(nombres);
        pro.setFoto(foto);
        pro.setDescripcion(descripcion);
        pro.setPrecio(precio);
        pro.setStock(stock);

        ProductoDAO dao = new ProductoDAOimpl();

        if (idProducto == 0) {
            try {
                dao.insert(pro);
            } catch (Exception ex) {
                System.out.println("Error al insertar" + ex.getMessage());
            }
        } else {
            try {
                dao.update(pro);
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
        response.sendRedirect("ProductoControlador");
    }

}
