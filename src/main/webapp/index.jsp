<%@page import="com.emergentes.utiles.Fecha"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body {
                margin: 0;
                color: #250af5;
                background: #0cb7f2;
                font: 600 16px/18px 'Open Sans', sans-serif
            }
        </style>
    </head>
    <body>
        <div class="container mt-2">
            <nav class="navbar navbar-expand-lg navbar-blue bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="ProductoControlador?action=view2&id=${cliente.idCliente}" ><img src="https://img.icons8.com/nolan/64/shopping-cart-loaded.png"/><img src="https://img.icons8.com/nolan/64/r.png"/><img src="https://img.icons8.com/nolan/64/d.png"/><img src="https://img.icons8.com/nolan/64/k.png"/>Mi Carrito</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="ProductoControlador?action=view2&id=${cliente.idCliente}">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ProductoControlador?action=ComprasCliente">Mis Compras</a>
                            </li>

                            <li class="nav-item">
                                <a href="ProductoControlador?action=Carrito" class="nav-link">Carrito de Compras <i class="fas fa-cart-plus">(<label style="color: darkorange">${contador}</label>)</i></a>
                            </li>
                        </ul>
                        
                        
                        <u class="navbar-nav">
                            <%
                                Fecha fechaSistema = new Fecha();
                            %>                     
                            <p class="ml-auto"><%= fechaSistema.Fecha()%></p> 
                            <li class="nav-item dropdown">

                                <a role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://img.icons8.com/external-bearicons-gradient-bearicons/64/000000/external-login-call-to-action-bearicons-gradient-bearicons-1.png"/>  
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="login.jsp">Login</a
                                    <a class="dropdown-item" href="ProductoControlador?action=Salir">Cerar Sesion</a>
                                </div>
                            </li>
                        </u>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container mt-2">
            <a>Bienvenido! ${logueo}</a>
            <a>Email: ${correo}</a>

        </div>
        <div class="container mt-2">
            <div class="row">
                <c:forEach var="item" items="${productos}">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <label>${item.nombres}</label> 
                            </div>
                            <div class="card-body">
                                <i>${item.precio} Bs.</i>
                                <img src="${item.foto}" width="200" height="180">
                            </div>
                            <div class="card-footer text-center" >
                                <label>${item.descripcion}</label>
                                <div>
                                    <a href="ProductoControlador?action=AgregarCarrito&id=${item.idProducto}" class="btn btn-outline-info">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>

</html>
