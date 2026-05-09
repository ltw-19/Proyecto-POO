<%-- 
    Document   : login
    Created on : 9 may. 2026, 2:46:57 p. m.
    Author     : guill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>MacDigital | Iniciar Sesión / Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .auth-container {
            max-width: 900px;
            margin: 80px auto 40px;
            padding: 0 20px;
            display: flex;
            gap: 40px;
            justify-content: center;
        }
        
        .auth-panel {
            flex: 1;
            max-width: 400px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 40px;
        }
        
        .auth-panel h2 {
            font-family: 'Inter', sans-serif;
            font-weight: 700;
            font-size: 24px;
            color: #1a1a1a;
            margin-bottom: 8px;
            text-align: center;
        }
        
        .auth-panel p {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 500;
            color: #333;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #0071e3;
            box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.1);
        }
        
        .btn-auth {
            width: 100%;
            padding: 14px;
            background: #0071e3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: background 0.3s, transform 0.1s;
            margin-top: 10px;
        }
        
        .btn-auth:hover {
            background: #0064c8;
            transform: translateY(-1px);
        }
        
        .btn-auth:active {
            transform: translateY(0);
        }
        
        .switch-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
        
        .switch-link button {
            background: none;
            border: none;
            color: #0071e3;
            cursor: pointer;
            font-weight: 500;
            font-size: 14px;
            text-decoration: underline;
            padding: 0;
            margin: 0;
        }
        
        .switch-link button:hover {
            color: #005bb5;
        }
        
        .register-panel {
            display: none;
        }
        
        .login-panel {
            display: block;
        }
        
        .auth-panel.show {
            display: block;
        }
        
        .auth-panel.hide {
            display: none;
        }
        
        .forgot-password {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        
        .forgot-password a {
            color: #0071e3;
            font-size: 13px;
            text-decoration: none;
            cursor: pointer;
        }
        
        .forgot-password a:hover {
            text-decoration: underline;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #666;
        }
        
        .remember-me input[type="checkbox"] {
            width: auto;
        }
        
        /* Estilos para el modal de aviso */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        
        .modal-overlay.active {
            display: flex;
        }
        
        .modal-dialog {
            background: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: slideIn 0.3s ease-out;
        }
        
        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
        
        .modal-dialog .modal-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .modal-dialog h3 {
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 10px;
        }
        
        .modal-dialog p {
            color: #666;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .modal-dialog .btn-modal {
            padding: 10px 30px;
            background: #0071e3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .modal-dialog .btn-modal:hover {
            background: #0064c8;
        }
        
        @media (max-width: 768px) {
            .auth-container {
                flex-direction: column;
                align-items: center;
                gap: 0;
            }
            
            .auth-panel {
                width: 100%;
                max-width: none;
            }
        }
    </style>
</head>
<body>
    
    <%@include file="fragmento_chatbot.jsp" %>
    
    <!-- Modal de aviso -->
    <div class="modal-overlay" id="devModal">
        <div class="modal-dialog">
            <div class="modal-icon">🚧</div>
            <h3>Funcionalidad en Desarrollo</h3>
            <p>Esta característica estará disponible próximamente. Nuestro equipo está trabajando para brindarte la mejor experiencia.</p>
            <button class="btn-modal" onclick="closeModal()">Entendido</button>
        </div>
    </div>
    
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/" class="logo-link">MacDigital</a>
        <div class="icon-group">
            <a href="login.jsp" class="login-link">Iniciar sesión / Registro</a>
            <a href="carrito.jsp" style="position:relative; display:inline-block;">
                <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
                <span id="cartCount" class="cart-badge">0</span>
            </a>
        </div>
    </header>

    <div class="auth-container">
        <!-- Panel de Inicio de Sesión -->
        <div class="auth-panel login-panel" id="loginPanel">
            <h2>Iniciar Sesión</h2>
            <p>Bienvenido de nuevo a MacDigital</p>
            
            <!-- CÓDIGO ORIGINAL DEL FORMULARIO DE LOGIN (GUARDADO PARA FUTURA IMPLEMENTACIÓN)
            
            <form action="login" method="post" id="loginForm">
                <div class="form-group">
                    <label for="loginUsuario">Usuario</label>
                    <input type="text" id="loginUsuario" name="usuario" 
                           placeholder="Ingresa tu usuario" required>
                </div>
                
                <div class="form-group">
                    <label for="loginPassword">Contraseña</label>
                    <input type="password" id="loginPassword" name="password" 
                           placeholder="Ingresa tu contraseña" required>
                </div>
                
                <div class="forgot-password">
                    <a href="recuperar-password.jsp">¿Olvidaste tu contraseña?</a>
                </div>
                
                <div class="remember-me">
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">Recordarme</label>
                </div>
                
                <button type="submit" class="btn-auth">Iniciar Sesión</button>
            </form>
            -->
            
            <form onsubmit="event.preventDefault(); showDevModal();">
                <div class="form-group">
                    <label for="loginUsuario">Usuario</label>
                    <input type="text" id="loginUsuario" name="usuario" 
                           placeholder="Ingresa tu usuario">
                </div>
                
                <div class="form-group">
                    <label for="loginPassword">Contraseña</label>
                    <input type="password" id="loginPassword" name="password" 
                           placeholder="Ingresa tu contraseña">
                </div>
                
                <div class="forgot-password">
                    <a onclick="showDevModal()">¿Olvidaste tu contraseña?</a>
                </div>
                
                <div class="remember-me">
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">Recordarme</label>
                </div>
                
                <button type="submit" class="btn-auth">Iniciar Sesión</button>
            </form>
            
            <div class="switch-link">
                ¿No tienes una cuenta? 
                <button onclick="showRegister()">Regístrate aquí</button>
            </div>
        </div>
        
        <!-- Panel de Registro -->
        <div class="auth-panel register-panel" id="registerPanel">
            <h2>Crear Cuenta</h2>
            <p>Únete a MacDigital y disfruta de compras inteligentes</p>
            
            <!-- CÓDIGO ORIGINAL DEL FORMULARIO DE REGISTRO (GUARDADO PARA FUTURA IMPLEMENTACIÓN)
            
            <form action="registro" method="post" id="registerForm">
                <div class="form-group">
                    <label for="regUsuario">Usuario</label>
                    <input type="text" id="regUsuario" name="usuario" 
                           placeholder="Elige un nombre de usuario" required>
                </div>
                
                <div class="form-group">
                    <label for="regEmail">Correo Electrónico</label>
                    <input type="email" id="regEmail" name="email" 
                           placeholder="tu@email.com" required>
                </div>
                
                <div class="form-group">
                    <label for="regPassword">Contraseña</label>
                    <input type="password" id="regPassword" name="password" 
                           placeholder="Crea una contraseña segura" required 
                           minlength="6">
                </div>
                
                <div class="form-group">
                    <label for="regConfirmPassword">Confirmar Contraseña</label>
                    <input type="password" id="regConfirmPassword" name="confirmPassword" 
                           placeholder="Repite tu contraseña" required>
                </div>
                
                <button type="submit" class="btn-auth">Crear Cuenta</button>
            </form>
            -->
            
            <form onsubmit="event.preventDefault(); showDevModal();">
                <div class="form-group">
                    <label for="regUsuario">Usuario</label>
                    <input type="text" id="regUsuario" name="usuario" 
                           placeholder="Elige un nombre de usuario">
                </div>
                
                <div class="form-group">
                    <label for="regEmail">Correo Electrónico</label>
                    <input type="email" id="regEmail" name="email" 
                           placeholder="tu@email.com">
                </div>
                
                <div class="form-group">
                    <label for="regPassword">Contraseña</label>
                    <input type="password" id="regPassword" name="password" 
                           placeholder="Crea una contraseña segura">
                </div>
                
                <div class="form-group">
                    <label for="regConfirmPassword">Confirmar Contraseña</label>
                    <input type="password" id="regConfirmPassword" name="confirmPassword" 
                           placeholder="Repite tu contraseña">
                </div>
                
                <button type="submit" class="btn-auth">Crear Cuenta</button>
            </form>
            
            <div class="switch-link">
                ¿Ya tienes una cuenta? 
                <button onclick="showLogin()">Inicia sesión aquí</button>
            </div>
        </div>
    </div>

    <script>
        
        // Función para mostrar el modal de desarrollo
        function showDevModal() {
            document.getElementById('devModal').classList.add('active');
        }
        
        // Función para cerrar el modal
        function closeModal() {
            document.getElementById('devModal').classList.remove('active');
        }
        
        // Cerrar modal al hacer clic fuera de él
        document.getElementById('devModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });
        
        // Funciones para alternar entre paneles
        function showRegister() {
            document.getElementById('loginPanel').classList.add('hide');
            document.getElementById('loginPanel').classList.remove('show');
            document.getElementById('registerPanel').classList.add('show');
            document.getElementById('registerPanel').classList.remove('hide');
        }
        
        function showLogin() {
            document.getElementById('registerPanel').classList.add('hide');
            document.getElementById('registerPanel').classList.remove('show');
            document.getElementById('loginPanel').classList.add('show');
            document.getElementById('loginPanel').classList.remove('hide');
        }
        
        /*(CÓDIGO ORIGINAL DE VALIDACIÓN (GUARDADO PARA FUTURA IMPLEMENTACIÓN)
        
        // Validación de contraseñas en el registro
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('regPassword').value;
            const confirmPassword = document.getElementById('regConfirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.');
            }
            
            if (password.length < 6) {
                e.preventDefault();
                alert('La contraseña debe tener al menos 6 caracteres.');
            }
        });
        
        // Mostrar mensaje según parámetro URL
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('registro') === 'true') {
            showRegister();
        }
        
        if (urlParams.get('error') === 'credenciales') {
            alert('Usuario o contraseña incorrectos');
        }
        */
    </script>
    
</body>
</html>