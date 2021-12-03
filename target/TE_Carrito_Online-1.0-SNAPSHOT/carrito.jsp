<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : carrito
    Created on : 12 nov. 2021, 11:01:01 p. m.
    Author     : rmbrt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
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
                    <a class="navbar-brand" href="ProductoControlador?action=view2&id=${cliente.idCliente}"><img src="https://img.icons8.com/nolan/64/shopping-cart-loaded.png"/><img src="https://img.icons8.com/nolan/64/r.png"/><img src="https://img.icons8.com/nolan/64/d.png"/><img src="https://img.icons8.com/nolan/64/k.png"/>Mi Carrito</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="ProductoControlador?action=view2&id=${cliente.idCliente}">Home</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="ProductoControlador?action=view2&id=${cliente.idCliente}">Seguir Comprando</a>
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
        <div class="container mt-4">
            <h3>Carrito</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Nombres</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Sub Total</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="item" items="${carrito}">
                                <tr>
                                    <td>${item.getItem()}</td>
                                    <td>${item.getNombres()}</td>
                                    <td>${item.getDescripcion()}<br>
                                        <img src="${item.getFoto()}" width="100" height="100">
                                    </td>
                                    <td>${item.getPrecioCompra()}</td>
                                    <td>${item.getCantidad()}</td>
                            <input type="hidden" id="item1" value="${item.getIdProducto()}">
                            <td>${item.getSubTotal()}</td>

                            <td>
                                <input type="hidden" id="codigo" value="${item.getIdProducto()}">
                                <a id="deleteItem" href="ProductoControlador?action=deleteProducto&id=${item.getIdProducto()}" class="btn" onclick="return(confirm('Esta seguro???'))"> <img src="https://img.icons8.com/external-kiranshastry-gradient-kiranshastry/64/000000/external-delete-multimedia-kiranshastry-gradient-kiranshastry.png"/></a>
                            </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3 style="color:#0008ff">Generar Compra</h3>
                        </div>
                        <div class="card-dark">
                            <label style="color:#0008ff">  SubTotal</label>
                            <input type="text" value="${totalPagar} Bs" readonly="" class="form-control">
                            
                            <label style="color:#0008ff">  Total a Pagar</label>
                            <input type="text" value="${totalPagar} Bs." readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="ProductoControlador?action=GenerarCompra" class="btn btn-info btn-block">Generar Compra</a>
                            <a href="ProductoControlador?action=RealizarPago&monto=${totalPagar}" class="btn btn-info btn-block">Realizar Pago</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>
    </body>
</html>
