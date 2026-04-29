package com.shopsmart.controller;

import com.shopsmart.model.Cart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cart-count")
public class CarritoCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        int count = 0;
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("carrito");
            if (cart != null) count = cart.getTotalItems();
        }
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        out.print("{\"count\":" + count + "}");
        out.flush();
    }
}