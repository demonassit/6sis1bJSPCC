<%-- 
    Document   : MostrarCarrito
    Created on : 10/08/2020, 07:44:14 AM
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
        <% //es la lista de los productos del detalle de la venta
        
        Vector<DetalleVenta> vectorDetalle = (Vector<DetalleVenta>)session.getAttribute("detalleVenta");
        Vector<Producto> vectorStock =null;
        
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
                            <td width="16%" align="right" valing="top" ><h4><span class="Estilo3" >Cantidad</span></h4></td>
                            <td width="16%" align="right" valing="top" ><h4><span class="Estilo3" >SubTotal</span></h4></td>
                            
                        </tr>
                        <% //vamos a imprimir lso productos en la tabla
                            for(DetalleVenta det : vectorDetalle){
                            Producto prod = new Producto().buscarProducto(det.getProducto_Codigo());
                        %>
                            <tr>
                                <td> <%=prod.getProducto_Nombre()%> </td>
                                <td width="16" align="right" valing="top" > <%=det.getDetventa_Cantidad() %> </td>
                                <td width="16" align="right" valing="top" > <%=det.getDetventa_Subtotal() %> </td>
                               
                            </tr>
                        <% } %>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="FinalizarComprar" >FINALIZAR COMPRA</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" ></td>
            </tr>
        </table>
    </body>
</html>
