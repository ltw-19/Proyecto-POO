package com.shopsmart.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<CartItem> getItems() { return items; }

    public void addItem(Producto p, int cantidad) {
        for (CartItem item : items) {
            if (item.getProducto().getId() == p.getId()) {
                int nuevaCant = item.getCantidad() + cantidad;
                if (nuevaCant <= p.getStock()) {
                    item.setCantidad(nuevaCant);
                } else {
                    item.setCantidad(p.getStock()); // límite por stock
                }
                return;
            }
        }
        // nuevo producto
        if (cantidad > p.getStock()) cantidad = p.getStock();
        items.add(new CartItem(p, cantidad));
    }

    public void removeItem(int productId) {
        items.removeIf(i -> i.getProducto().getId() == productId);
    }

    public void updateQuantity(int productId, int cantidad) {
        for (CartItem item : items) {
            if (item.getProducto().getId() == productId) {
                if (cantidad <= 0) {
                    removeItem(productId);
                } else {
                    Producto p = item.getProducto();
                    int max = p.getStock();
                    item.setCantidad(Math.min(cantidad, max));
                }
                return;
            }
        }
    }

    public int getTotalItems() {
        return items.stream().mapToInt(CartItem::getCantidad).sum();
    }

    public double getTotalPrice() {
        return items.stream().mapToDouble(CartItem::getSubtotal).sum();
    }

    public void clear() { items.clear(); }
}