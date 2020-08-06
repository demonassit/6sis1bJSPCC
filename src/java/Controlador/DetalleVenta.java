/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author demon
 */
public class DetalleVenta {
    
    private int venta_Codigo, detventa_Item, producto_Codigo, detventa_Cantidad;
    private double detventa_Subtotal;
    
    public DetalleVenta(){
    
    }

    public int getVenta_Codigo() {
        return venta_Codigo;
    }

    public void setVenta_Codigo(int venta_Codigo) {
        this.venta_Codigo = venta_Codigo;
    }

    public int getDetventa_Item() {
        return detventa_Item;
    }

    public void setDetventa_Item(int detventa_Item) {
        this.detventa_Item = detventa_Item;
    }

    public int getProducto_Codigo() {
        return producto_Codigo;
    }

    public void setProducto_Codigo(int producto_Codigo) {
        this.producto_Codigo = producto_Codigo;
    }

    public int getDetventa_Cantidad() {
        return detventa_Cantidad;
    }

    public void setDetventa_Cantidad(int detventa_Cantidad) {
        this.detventa_Cantidad = detventa_Cantidad;
    }

    public double getDetventa_Subtotal() {
        return detventa_Subtotal;
    }

    public void setDetventa_Subtotal(double detventa_Subtotal) {
        this.detventa_Subtotal = detventa_Subtotal;
    }
    
    
    
}
