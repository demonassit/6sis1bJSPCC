/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.DetalleVenta;
import Controlador.Producto;
import Controlador.Usuario;
import Controlador.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author demon
 */
public class FinalizarComprar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession sesionok = request.getSession();
            Date dia = new Date();
            Vector<DetalleVenta> vectorDetalle = (Vector<DetalleVenta>)sesionok.getAttribute("detalleVenta");
            Vector<Producto> stockProducto = (Vector<Producto>)sesionok.getAttribute("stockProducto");
            Producto prod = new Producto();
            double totalPagar = 0;
            
            //necesito recorrer todo el vector del detalle de la venta, para poder calcular cuanto voy a pagar
            for(DetalleVenta dv : vectorDetalle){
                totalPagar += dv.getDetventa_Subtotal();
            }
            
            Usuario usuario = new Usuario();
            Venta venta = new Venta();
            
            //los elementos de la venta
            venta.setUsuario_Codigo(usuario.getUsuario_Codigo());
            venta.setVenta_Fecha(dia.toString());
            venta.setVenta_TotalPagar(totalPagar);
            //ejecuto las ventas y el detalle de la venta para que se actualicen
            boolean registrarVenta = venta.registrarVenta(venta, vectorDetalle);
            boolean actualizarVenta = prod.actualizarStock(stockProducto);
            
            if(registrarVenta != actualizarVenta){
                response.sendRedirect("Mensaje.jsp");
            }else{
                response.sendRedirect("Error.jsp");
            }
                  
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FinalizarComprar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FinalizarComprar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
