package com.shopsmart.listener;

import com.shopsmart.model.Inventario;
import com.shopsmart.model.Producto;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Inventario inv = new Inventario();
        
        // Productos existentes
        inv.agregarProducto(new Producto(1, "Laptop Pro 15\"", 1299.0, 10, "prod_laptop_predator300.png"));
        inv.agregarProducto(new Producto(2, "Smartphone X", 899.0, 15, "prod_galaxy_s24.png"));
        inv.agregarProducto(new Producto(3, "Auriculares Wireless", 249.0, 20, "prod_smart_speaker.png"));
        inv.agregarProducto(new Producto(4, "Smartwatch Series 5", 399.0, 8, "prod_connect_watch_series7.png"));
        inv.agregarProducto(new Producto(5, "Auriculares Deportivos", 149.0, 25, "prod_noise_cancel_max.png"));
        inv.agregarProducto(new Producto(6, "Earbuds Mini", 89.0, 30, "prod_sportk_earbuds.png"));
        
        // Nuevos productos (según la captura)
        inv.agregarProducto(new Producto(7, "AirPods Pro 3", 279.0, 18, "prod_airpods_pro3.png"));
        inv.agregarProducto(new Producto(8, "iPhone XR", 599.0, 12, "prod_iphone_xr.png"));
        inv.agregarProducto(new Producto(9, "MacBook Pro M1", 1499.0, 7, "prod_macbook_pro_m1.png"));
        inv.agregarProducto(new Producto(10, "Nintendo Switch 2", 399.0, 5, "prod_nintendo_switch2.png"));
        inv.agregarProducto(new Producto(11, "PlayStation 5", 699.0, 4, "prod_ps5.png"));
        inv.agregarProducto(new Producto(12, "Xiaomi 17", 749.0, 9, "prod_xiaomi17.png"));
        
        sce.getServletContext().setAttribute("inventario", inv);
    }
}