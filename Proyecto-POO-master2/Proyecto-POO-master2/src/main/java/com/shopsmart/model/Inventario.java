
package com.shopsmart.model;

import java.util.ArrayList;
import java.util.List;

public class Inventario {
    private List<Producto> listaProductos;

    public Inventario() {
        this.listaProductos = new ArrayList<>();
    }

    public void agregarProducto(Producto p) {
        listaProductos.add(p);
    }

    public List<Producto> getListaProductos() {
        return listaProductos;
    }

    // Lógica para reducir stock al comprar
    public boolean procesarVenta(int idProducto, int cantidad) {
        for (Producto p : listaProductos) {
            if (p.getId() == idProducto) {
                if (p.getStock() >= cantidad) {
                    p.setStock(p.getStock() - cantidad);
                    return true; // Venta exitosa
                }
            }
        }
        return false; // No hay stock suficiente o no existe
    }
    
    public List<Producto> buscarProductos(String filtro) {
    List<Producto> resultado = new ArrayList<>();
    if (filtro == null || filtro.trim().isEmpty()) {
        return getListaProductos();
    }
    String q = filtro.toLowerCase();
    for (Producto prod : getListaProductos()) {
        if (prod.getNombre().toLowerCase().contains(q) || 
            prod.getDescripcion().toLowerCase().contains(q)) {
            resultado.add(prod);
        }
    }
    return resultado;
}
}
