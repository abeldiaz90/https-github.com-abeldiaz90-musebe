<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="MusebeWEBFinal.Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>

