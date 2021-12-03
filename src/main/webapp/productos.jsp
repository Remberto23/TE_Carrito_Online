<%
    if (session.getAttribute("login") != "OKAdmin") {
        response.sendRedirect("login.jsp");
    }
%>
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
            <h1>Productos</h1>
            <a href="ProductoCont?action=add" class="btn btn-primary btm-sm"><img src="https://img.icons8.com/ultraviolet/40/000000/plus.png"/>  Nuevo Producto</a>
            <br><br>
            <div class="row">
                <table class="table table-dark table-hover">
                    <thead class="thead-light">
                        <tr class="text-center">
                            <th>id Producto</th>
                            <th>id Usuario</th>
                            <th>Nombres</th>
                            <th>Descripcion</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Eliminar</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${productos}">
                            <tr class="text-center">
                                <td>${item.idProducto}</td>
                                <td>${item.idCliente}</td>
                                <td>${item.nombres}</td>
                                <td>${item.descripcion}<br><br>
                                    <img src="${item.foto}" width="100" height="100">
                                </td>
                                <td>${item.precio}</td>
                                <td>${item.stock}</td>
                                <td><a id="deleteItem" href="ProductoCont?action=delete&id=${item.idProducto}" class="btn" onclick="return(confirm('Esta seguro???'))"><img src="https://img.icons8.com/external-kiranshastry-gradient-kiranshastry/64/000000/external-delete-multimedia-kiranshastry-gradient-kiranshastry.png"/></a></td>
                                <td><a href="ProductoCont?action=edit&id=${item.idProducto}&idu=${item.idCliente}" class="btn" ><img src="https://img.icons8.com/external-kiranshastry-gradient-kiranshastry/64/000000/external-edit-interface-kiranshastry-gradient-kiranshastry-1.png"/></a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
