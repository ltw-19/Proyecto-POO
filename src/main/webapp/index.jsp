<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopSmart AI | Tienda Inteligente</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .navbar { background-color: #ffffff; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .product-card { border: none; border-radius: 15px; transition: transform 0.3s, box-shadow 0.3s; }
        .product-card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .btn-primary { background-color: #4361ee; border: none; border-radius: 10px; }
        
        /* Estilo del Chatbot */
        #chat-widget { position: fixed; bottom: 20px; right: 20px; z-index: 1000; }
        .chat-button { width: 60px; height: 60px; border-radius: 50%; background: #4361ee; color: white; display: flex; align-items: center; justify-content: center; font-size: 24px; cursor: pointer; box-shadow: 0 4px 15px rgba(67, 97, 238, 0.4); }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#">ShopSmart <span class="text-dark">AI</span></a>
            <div class="d-flex align-items-center">
                <a href="#" class="nav-link me-3"><i class="fa-solid fa-cart-shopping"></i></a>
                <a href="#" class="nav-link"><i class="fa-solid fa-circle-user"></i></a>
            </div>
        </div>
    </nav>

    <header class="bg-primary text-white text-center py-5 mb-5" style="background: linear-gradient(135deg, #4361ee 0%, #7209b7 100%);">
        <div class="container">
            <h1 class="display-4 fw-bold">Tu compra, asistida por IA</h1>
            <p class="lead">Encuentra exactamente lo que necesitas en segundos.</p>
            <a href="tienda" class="btn btn-light btn-lg text-primary mt-3 fw-bold">Ver Catálogo de Productos</a>
        </div>
    </header>

    <div class="container">
        <div class="row g-4">
            <c:forEach var="prod" items="${productos}">
                <div class="col-md-4 col-lg-3">
                    <div class="card product-card h-100 p-3">
                        <img src="https://via.placeholder.com/200" class="card-img-top rounded" alt="${prod.nombre}">
                        <div class="card-body text-center">
                            <h5 class="card-title fw-semibold">${prod.nombre}</h5>
                            <p class="text-primary fw-bold fs-5">$${prod.precio}</p>
                            <p class="text-muted small">Stock: ${prod.stock}</p>
                            <form action="tienda" method="POST">
                                <input type="hidden" name="idProducto" value="${prod.id}">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fa-solid fa-plus me-2"></i>Agregar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <c:set var="prueba" value="¡JSTL funcionando!" />
    <p>${prueba}</p>

    <div id="chat-widget">
        <div class="chat-button" onclick="alert('Aquí abrirás tu ventana de chat inteligente')">
            <i class="fa-solid fa-comment-dots"></i>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
</body>