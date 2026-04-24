
package com.shopsmart.model;

public class Producto {
    private int id;
    private String nombre;
    private double precio;
    private int stock;

    public Producto(int id, String nombre, double precio, int stock) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        if(this.stock >= 0){
            this.stock = stock;
            
        }
    }
    
    public void mostrarInformacion(){
        System.out.println("Nombre: "+nombre);
        System.out.println("Precio: "+precio+"$");
        System.out.println("Stock: "+stock+" unidades");
    }
    
    
}
