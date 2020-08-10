<%-- 
    Document   : MostrarProductos
    Created on : 7/08/2020, 09:07:56 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*" session="true" %>
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
        <title>Consultar Productos</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <% //es la lista de los productos  
        
        Vector<Producto> vecPro = new Producto().listaProductos();
        
        %>
        
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
                    <h4> <a href="MostrarProductos.jsp" >Mostrar Productos</a> | <a href="AgregarCarrito1.jsp" >Agregar al Carrito</a> | <a>Cerrar Sesion</a>      </h4>
                </td>
            </tr>
            <tr></tr>
            <tr align="center" >
                <td colspan="2" >
                    <table width="100%" border="0" >
                        <tr bgcolor="#FF6600" style="color:#FFFFFF" >
                            <td width="68%" ><h4>Nombre:</h4></td>
                            <td width="16%" align="right" valing="top" ><h4><span class="Estilo3" >Stock</span></h4></td>
                            <td width="16%" align="right" valing="top" ><h4><span class="Estilo3" >Precio</span></h4></td>
                        </tr>
                        <% //vamos a imprimir lso productos en la tabla
                            for(Producto prod : vecPro){ %>
                            <tr>
                                <td> <%=prod.getProducto_Nombre()%> </td>
                                <td width="16" align="right" valing="top" > <%=prod.getProducto_Stock()%> </td>
                                <td width="16" align="right" valing="top" > <%=prod.getProducto_Precio()%> </td>
                            </tr>
                        <% } %>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
        </table>
    </body>
</html>
