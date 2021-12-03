<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                margin: 0;
                color: #73b4f0;
                background: #0cb7f2;
                font: 600 16px/18px 'Open Sans', sans-serif
            }

            .login-box {
                color: #73b4f0;
                width: 100%;
                margin: auto;
                max-width: 525px;
                min-height: 670px;
                position: relative;
                background: #044a8a;
                box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0 rgba(0, 0, 0, .19)
            }

            .login-snip {
                width: 100%;
                height: 100%;
                position: absolute;
                padding: 90px 70px 50px 70px;
                background: rgba(0, 77, 77, .9)
            }

            .login-snip .login,
            .login-snip .sign-up-form {
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                position: absolute;
                transform: rotateY(180deg);
                backface-visibility: hidden;
                transition: all .4s linear
            }

            .login-snip .sign-in,
            .login-snip .sign-up,
            .login-space .group .check {
                display: none
            }

            .login-snip .tab,
            .login-space .group .label,
            .login-space .group .button {
                text-transform: uppercase
            }

            .login-snip .tab {
                font-size: 22px;
                margin-right: 15px;
                padding-bottom: 5px;
                margin: 0 15px 10px 0;
                display: inline-block;
                border-bottom: 2px solid transparent
            }

            .login-snip .sign-in:checked+.tab,
            .login-snip .sign-up:checked+.tab {
                color: #fff;
                border-color: #1161ee
            }

            .login-space {
                min-height: 345px;
                position: relative;
                perspective: 1000px;
                transform-style: preserve-3d
            }

            .login-space .group {
                margin-bottom: 15px
            }

            .login-space .group .label,
            .login-space .group .input,
            .login-space .group .button {
                width: 100%;
                color: #fff;
                display: block
            }

            .login-space .group .input,
            .login-space .group .button {
                border: none;
                padding: 15px 20px;
                border-radius: 25px;
                background: rgba(255, 255, 255, .1)
            }

            .login-space .group input[data-type="password"] {
                text-security: circle;
                -webkit-text-security: circle
            }

            .login-space .group .label {
                color: #aaa;
                font-size: 12px
            }

            .login-space .group .button {
                background: #1161ee
            }

            .login-space .group label .icon {
                width: 15px;
                height: 15px;
                border-radius: 2px;
                position: relative;
                display: inline-block;
                background: rgba(255, 255, 255, .1)
            }

            .login-space .group label .icon:before,
            .login-space .group label .icon:after {
                content: '';
                width: 10px;
                height: 2px;
                background: #fff;
                position: absolute;
                transition: all .2s ease-in-out 0s
            }

            .login-space .group label .icon:before {
                left: 3px;
                width: 5px;
                bottom: 6px;
                transform: scale(0) rotate(0)
            }

            .login-space .group label .icon:after {
                top: 6px;
                right: 0;
                transform: scale(0) rotate(0)
            }

            .login-space .group .check:checked+label {
                color: #fff
            }

            .login-space .group .check:checked+label .icon {
                background: #1161ee
            }

            .login-space .group .check:checked+label .icon:before {
                transform: scale(1) rotate(45deg)
            }

            .login-space .group .check:checked+label .icon:after {
                transform: scale(1) rotate(-45deg)
            }

            .login-snip .sign-in:checked+.tab+.sign-up+.tab+.login-space .login {
                transform: rotate(0)
            }

            .login-snip .sign-up:checked+.tab+.login-space .sign-up-form {
                transform: rotate(0)
            }

            *,
            :after,
            :before {
                box-sizing: border-box
            }

            .clearfix:after,
            .clearfix:before {
                content: '';
                display: table
            }

            .clearfix:after {
                clear: both;
                display: block
            }

            a {
                color: inherit;
                text-decoration: none
            }

            .hr {
                height: 2px;
                margin: 60px 0 50px 0;
                background: rgba(255, 255, 255, .2)
            }

            .foot {
                text-align: center
            }

            .card {
                width: 500px;
                left: 100px
            }

            ::placeholder {
                color: #b3b3b3
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 mx-auto p-0">
                <div class="card">
                    <div class="login-box">
                        <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label> <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                            <div class="login-space">
                                <form action="ProductoControlador">
                                    <div class="login">
                                        <div class="group"> 
                                            <label for="user" class="label">Username</label> 
                                            <input id="user" type="email" name="email" class="input" placeholder="Enter your username"> 
                                        </div>

                                        <div class="group"> 
                                            <label for="pass" class="label">Password</label> 
                                            <input id="pass" type="password" name="password" class="input" data-type="password" placeholder="Enter your password"> 
                                        </div>

                                        <div class="group">
                                            <label for="pass" class="label">Tipo de Usuario</label>
                                            <select name="usuario" class="form-control" >
                                                <option value="Cliente">Cliente</option>
                                                <option value="Administrador">Administrador</option>
                                            </select>
                                        </div><br>

                                        <div class="group"> 
                                            <input type="submit" class="button" name="action" value="Validar"> 
                                        </div>
                                        
                                    </div>
                                </form>
                                <form action="ClienteControlador" method="post">
                                    <div class="sign-up-form">

                                        <input type="hidden" name="idCliente" value="0">

                                        <div class="group"> 
                                            <label for="user" class="label">CI</label> 
                                            <input name="ci" id="user" type="number" class="input" placeholder="Escriba su CI"> 
                                        </div>

                                        <div class="group"> 
                                            <label for="nombre" class="label">Nombre</label> 
                                            <input name="nombres" id="nombre" type="text" class="input" placeholder="Escriba su nombre"> 
                                        </div>
                                        <div class="group"> 
                                            <label for="dir" class="label">Direccion</label> 
                                            <input name="direccion" id="dir" type="text" class="input" placeholder="Escriba su Direccion"> 
                                        </div>

                                        <div class="group"> 
                                            <label for="email" class="label">Correo Electronico</label> 
                                            <input name="email" id="email" type="email" class="input" placeholder="Ingrese su Email"> 
                                        </div>

                                        <div class="group"> 
                                            <label for="pass" class="label">Password</label> 
                                            <input name="password" id="pass" type="password" class="input" data-type="password" placeholder="Ingrese su Contraseña">
                                        </div>

                                        <div class="group"> 
                                            <input type="submit" class="button" value="Sign Up"> 
                                        </div>

                                        <div class="hr"></div>
                                        <div class="foot"> <label for="tab-1">Already Member?</label> </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>
