package com.shopsmart.model;

public class Producto {
    private int id;
    private String nombre;
    private double precio;
    private int stock;
    private String imagen;

    public Producto(int id, String nombre, double precio, int stock, String imagen) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
        this.imagen = imagen;
    }

    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public double getPrecio() { return precio; }
    public int getStock() { return stock; }
    public String getImagen() { return imagen; }
    public void setStock(int stock) { this.stock = stock; }
}