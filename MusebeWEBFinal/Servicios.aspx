<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="MusebeWEBFinal.Servicios" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
 <!-- Full Width Image Header with Logo -->
    <!-- Image backgrounds are set within the full-width-pics.css file. -->
    <!--<header class="image-bg-fluid-height">-->
    <!--<img class="img-responsive img-center" src="../Images/MUSEBE Multi-Servicios Bear v3.1.jpg" alt="">-->
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="Imagenes/HomeGaleria/taquizas.jpg" alt="taquizas" style="width: 100%;">
                    <div class="carousel-caption">
                        <h3>Taquizas</h3>
                        <a href="#" class="btn btn-danger">Ver Mas...</a>

                    </div>
                </div>

                <div class="item">
                    <img src="Imagenes/HomeGaleria/CoffeBreak.jpg" alt="Coffe Break" style="width: 100%;">
                    <div class="carousel-caption">
                        <h3>Coffe Break</h3>
                        <a href="#" class="btn btn-danger">Ver Mas...</a>

                    </div>
                </div>

                <div class="item">
                    <img src="Imagenes/HomeGaleria/Bocadillos.jpg" alt="Bocadillos" style="width: 100%;">
                    <div class="carousel-caption">
                        <h3>Bocadillos</h3>
                        <a href="#" class="btn btn-danger">Ver Mas...</a>

                    </div>
                </div>
                <div class="item">
                    <img src="Imagenes/HomeGaleria/banquetes.jpg" alt="Banquetes" style="width: 100%;">
                    <div class="carousel-caption">
                        <h3>Banquetes</h3>
                        <a href="#" class="btn btn-danger">Ver Mas...</a>

                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!-- </header>-->

    <!-- Content Section -->
    <!--<section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="section-heading">Sección para publicaciones</h1>
                    <p class="lead section-lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p class="section-paragraph">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, suscipit, rerum quos facilis repellat architecto commodi officia atque nemo facere eum non illo voluptatem quae delectus odit vel itaque amet.</p>
                </div>
            </div>
        </div>
    </section>-->

    <!-- Fixed Height Image Aside -->
    <!-- Image backgrounds are set within the full-width-pics.css file. -->
    <!--<aside class="image-bg-fixed-height"></aside>-->

    <!-- Content Section -->
    <!--<section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="section-heading">Sección para Videos</h1>
                    <p class="lead section-lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p class="section-paragraph">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, suscipit, rerum quos facilis repellat architecto commodi officia atque nemo facere eum non illo voluptatem quae delectus odit vel itaque amet.</p>
                </div>
            </div>
        </div>
    </section>-->
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
	<style>
		body {
			margin: 0;
		}

		.topnav {
			overflow: hidden;
			background-color: #333;
		}

			.topnav a {
				float: left;
				display: block;
				color: #f2f2f2;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 17px;
			}

				.topnav a:hover {
					background-color: #ddd;
					color: black;
				}

			.topnav .icon {
				display: none;
			}

		@media screen and (max-width: 600px) {
			.topnav a:not(:first-child) {
				display: none;
			}

			.topnav a.icon {
				float: right;
				display: block;
			}
		}

		@media screen and (max-width: 600px) {
			.topnav.responsive {
				position: relative;
			}

				.topnav.responsive .icon {
					position: absolute;
					right: 0;
					top: 0;
				}

				.topnav.responsive a {
					float: none;
					display: block;
					text-align: left;
				}
		}
	</style>

	<body>
		<div class="topnav" id="myTopnav">
			<a href="Index.aspx">Home</a><a href="Servicios.aspx">Servicios</a> <a href="ProductosWeb.aspx">Productos</a> <a href="Somos.aspx">&iquest;Quienes Somos?</a> <a href="Contacto.aspx">Contactanos</a> <a href="Login.aspx">Login</a> <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		<div class="pull-right">
			<p style="color: white" class="d-inline pull-right">
				&#9742;4499996662
			</p>
			<br />
			<p style="color: white" class="d-inline pull-right">
				&#9993;ventas@musebe.com.mx
			</p>
		</div>



		<script>
			function myFunction() {
				var x = document.getElementById("myTopnav");
				if (x.className === "topnav") {
					x.className += " responsive";
				} else {
					x.className = "topnav";
				}
			}
		</script>

	</body>
</asp:Content>


