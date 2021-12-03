
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
                color: #ffffff;
                background: #0cb7f2;
                font: 600 16px/18px 'Open Sans', sans-serif
            }
        </style>
    </head>
    <body>
        <div class="container mt-2">
            <nav class="navbar navbar-expand-lg navbar-blue bg-dark">

                <div class="container-fluid">
                    <a class="navbar-brand" href="#"><img src="https://img.icons8.com/nolan/64/shopping-cart-loaded.png"/><img src="https://img.icons8.com/nolan/64/r.png"/><img src="https://img.icons8.com/nolan/64/d.png"/><img src="https://img.icons8.com/nolan/64/k.png"/>Mi Carrito</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="ProductoCont">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ClienteControlador">Clientes</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="ComprasControlador">Compras</a>
                            </li>

                        </ul>
                        
                        <u class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://img.icons8.com/external-bearicons-gradient-bearicons/64/000000/external-login-call-to-action-bearicons-gradient-bearicons-1.png"/>  
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="login.jsp">Login</a>
                                    <a class="dropdown-item" href="ProductoControlador?action=Salir">Cerar Sesion</a>
                                </div>
                            </li>
                        </u>
                    </div>
                </div>

            </nav>
        </div>
        <div class="container">
            <h1>Compras</h1>            
            <table class="table table-dark table-hover">
                <thead class="thead-light">
                <tr class="thead-light">
                    <th>Codigo de Compra</th>
                    <th>Codigo de Cliente</th>
                    <th>Fecha de Compra</th>
                    <th>Monto</th>                                                   
                    <th>Codigo de Pago</th>                                                   
                    <th>Estado</th>                                                   
                    <th></th>
                </tr>
                </thead>
                <c:forEach var="item" items="${compras}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.idCliente}</td>
                        <td>${item.fecha}</td>
                        <td>${item.monto}</td>
                        <td>${item.idPago}</td>
                        <td>${item.estado}</td>
                        <td><a href="ProductoControlador?action=verDetalle&idcompra=${item.id}">Ver Detalle</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>