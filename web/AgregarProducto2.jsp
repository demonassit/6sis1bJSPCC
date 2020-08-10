<%-- 
    Document   : AgregarProducto2
    Created on : 10/08/2020, 07:13:05 AM
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
        <title>Agregar Producto</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <% //es la lista de los productos  
        
        Producto prod = new Producto().buscarProducto(Integer.parseInt(request.getParameter("cod")));
        
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
                    <h4> <a href="MostrarProductos.jsp" >Mostrar Productos</a> | <a a href="AgregarCarrito1.jsp" >Agregar al Carrito</a> | <a>Cerrar Sesion</a>      </h4>
                </td>
            </tr>
            <tr></tr>
            <tr align="center" >
                <td colspan="2" >
                    <form method="post" name="frmPrincipal" action="AgregarProducto" >
                        <table width="100%" border="0" >
                            <tr>
                                <td width="17%" bgcolor="#FF0000" >
                                    <span class="Estilo3" >Codigo:</span>
                                </td>
                                <td width="83%"  >
                                    <label> <input type="text" name="txtCodigo" id="txtCodigo" 
                                                   readonly size="10" value="<%=prod.getProducto_Codigo() %>"> </label>
                                </td>
                                <td width="17%" bgcolor="#FF0000" >
                                    <span class="Estilo3" >Producto:</span>
                                </td>
                                <td width="83%"  >
                                    <label> <input type="text" name="txtProducto" id="txtProducto" 
                                                   readonly size="60" value="<%=prod.getProducto_Nombre()%>"> </label>
                                </td>
                                <td width="17%" bgcolor="#FF0000" >
                                    <span class="Estilo3" >Precio:</span>
                                </td>
                                <td width="83%"  >
                                    <label> <input type="text" name="txtPrecio" id="txtPrecio" 
                                                   readonly size="15" value="<%=prod.getProducto_Precio()%>"> </label>
                                </td>
                                <td width="17%" bgcolor="#FF0000" >
                                    <span class="Estilo3" >Stock:</span>
                                </td>
                                <td width="83%"  >
                                    <label> <input type="text" name="txtStock" id="txtStock" 
                                                   readonly size="15" value="<%=prod.getProducto_Stock()%>"> </label>
                                </td>
                                <td width="17%" bgcolor="#FF0000" >
                                    <span class="Estilo3" >Cantidad a pedir:</span>
                                </td>
                                <td width="83%"  >
                                    <label> <input type="text" name="txtCantidad" id="txtCantidad" 
                                                    size="15" value="1"> </label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td><label><input type="submit" name="entrar" value="Registrar" ></label></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="2" ></td>
            </tr>
        </table>
    </body>
</html>
