<%-- 
    Document   : Mensaje
    Created on : 11/08/2020, 10:19:31 AM
    Author     : demon
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<% 

    //esto es java carga la pagina de errores y se redireccione al index
    String usuario = "";
    HttpSession sesion = request.getSession();
    
    if(session.getAttribute("usuario") == null ){
        //significa que no existe
%>

<jsp:forward page="index.html" >    
    <jsp:param name="error" value="Es obligatorio autenticarse con su usuario" /> 
</jsp:forward>

<%
    }else{
        usuario =(String)sesion.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Productos</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <table border="0" width="800" align="center" >
            <tr>
                <td width="84" bgcolor="#FFFFFF"  > <img src="img/imagen01.jpg" width="84" height="77" > </td>
                <td width="716" bgcolor="#FFFFFF"  > <h1 style="color:#FFFFFF" >Carrito de Compras</h1> </td>        
            </tr>
            <tr align="center" >
                <td colspan="2" ></td>
            </tr>
            <tr align="center" >
                <td colspan="2" >
                    <h4> <a href="MostrarProductos.jsp" >Mostrar Productos</a> | <a a href="AgregarCarrito1.jsp" >Agregar al Carrito</a> | <a>Cerrar Sesion</a>      </h4>
                </td>
            </tr>
            <tr></tr>
            <tr align="center" >
                <td colspan="2" >
                    <h1>SE REGISTRO LA COMPRA DE FORMA CORRECTA</h1>        
                </td>
            </tr>
        </table>
    </body>
</html>
