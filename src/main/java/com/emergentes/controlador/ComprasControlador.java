
package com.emergentes.controlador;

import com.emergentes.dao.CompraDAO;
import com.emergentes.dao.CompraDAOimpl;
import com.emergentes.modelo.Compra;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ComprasControlador", urlPatterns = {"/ComprasControlador"})
public class ComprasControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Compra com = new Compra();
            int id;
            CompraDAO dao = new CompraDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    com = dao.getById(id);
                    request.setAttribute("compras", com);
                    request.getRequestDispatcher("frmcliente.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ComprasControlador");
                    break;
                case "view":
                    //Obtener la lista de objetos
                    List<Compra> lista = dao.getAll();
                    request.setAttribute("compras", lista);
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
