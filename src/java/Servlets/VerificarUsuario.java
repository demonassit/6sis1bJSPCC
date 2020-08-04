/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author demon
 */
public class VerificarUsuario extends HttpServlet {

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
            
            //obtener los parametros del formulario
            String user, clave;
            
            user = request.getParameter("txtUsuario");
            clave = request.getParameter("txtClave");
            
            //instancia del usuario
            Usuario u = new Usuario();
            //mandar a llamar a verificar usuario
            u = u.verificarUsuario(user, clave);
            
            //ahora tenemos que saber si es administrador o cliente
            
            if(u!=null){
                //que si existe en la bD, y solo tenemos que averiguar si privilegio
                //necesitamos una sesion
                HttpSession sesion = request.getSession(true);
                //enviamos el atributo de la session
                sesion.setAttribute("usuario", u);
                
                //obtener una segunda sesion para enviar el parametro del usuario
                HttpSession sessionok = request.getSession();
                sessionok.setAttribute("usuario", user);
                
                //ya que obtuvimos las sesiones ahora comparar el privilengio
                
                if(u.getUsuario_Privilegio() == 0){
                    //es un cliente
                    response.sendRedirect("MostrarProductos.jsp");
                }else{
                    //es un admin
                    response.sendRedirect("MostrarProductosEmpleado.jsp");
                }
            }else{
                //no existe en la bd o la constraseña es incorrecta
                response.sendRedirect("Error.jsp");
            }
            
            
            
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
