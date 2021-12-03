
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
                <h1>Detalle</h1>
                <div class="row">
                    <table class="table table-dark table-hover">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th>CODIGO COMPRA</th>                               
                                <th>Articulo</th>
                                <th>Cantidad</th>
                                <th>Precio Compra</th>                                                   
                            </tr>
                        </thead>
                            <c:forEach var="p" items="${myDetalle}">
                                <tr class="text-center">
                                    <td>C00${p.getIdcompra()}</td> 
                                    <td>                                        
                                        <label><i>${p.producto.nombres}</i></label><br><br>                                      
                                        <img src="${p.producto.foto}" width="80" height="60">
                                    </td>                                                                
                                    <td>${p.getCantidad()}</td>
                                    <td>${p.getPrecioCompra()}</td>                                                                                                      

                                </tr>
                            </c:forEach>
                    </table> 
                </div>
                <div class="card-footer d-flex">
                    <label class="col-sm-9 text-right mt-1">Monto Total de la Compra</label>
                    <input type="text" class=" text-center form-control " readonly="" value="$.${montoPagar}0" style="font-size: 20px; font-family: monospace">
                </div>
        </div> 

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
