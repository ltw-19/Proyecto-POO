
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
}
