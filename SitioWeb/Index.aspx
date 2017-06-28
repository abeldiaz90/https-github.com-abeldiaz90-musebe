<%@ Page Title="Pagina Web" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SitioWeb.Index" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <div id="fh5co-header">
                    <div class="top">
                        <div class="container">
                            <span><a href="#"><i>ventas@musebe.com.mx</i></a></span> <span><a href="tel://+529383876417"><i class="icon-mobile3"></i>9383876417</a></span>
                        </div>
                    </div>
                    <!-- end:top -->
                    <header id="fh5co-header-section">
                        <div class="container">
                            <div class="nav-header">
                                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                                <h1 id="fh5co-logo"><a href="index.html">
                                    <img src="images/logomultiservicios.png" /></a></h1>
                                <!-- START #fh5co-menu-wrap -->
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li class="active"><a href="index.html">Inicio</a> </li>
                                        <li><a href="#">¿Quienes Somos?</a> </li>
                                        <li><a href="#" class="fh5co-sub-ddown">Servicios</a>
                                            <ul class="fh5co-sub-menu">
                                                <li><a href="#">Cafeteria</a></li>
                                                <!--<li><a href="right-sidebar.html">Desechables Convencionales</a></li>-->
                                                <li><a href="#" class="fh5co-sub-ddown">Desechables</a>
                                                    <ul class="fh5co-sub-menu">
                                                        <li><a href="#" target="_blank">Convencionales</a></li>
                                                        <li><a href="#" target="_blank">Biodegradables</a></li>
                                                        <!--<li><a href="http://freehtml5.co/preview/?item=light-free-html5-template-bootstrap" target="_blank">Light</a></li>
                                                    <li><a href="http://freehtml5.co/preview/?item=relic-free-html5-template-using-bootstrap" target="_blank">Relic</a></li>
                                                    <li><a href="http://freehtml5.co/preview/?item=display-free-html5-template-using-bootstrap" target="_blank">Display</a></li>
                                                    <li><a href="http://freehtml5.co/preview/?item=sprint-free-html5-template-bootstrap" target="_blank">Sprint</a></li>-->
                                                    </ul>
                                                </li>
                                                <!--<li><a href="#">UI Animation</a></li>
                                            <li><a href="#">Copywriting</a></li>
                                            <li><a href="#">Photography</a></li>-->
                                            </ul>
                                        </li>
                                        <li><a href="#">Pedidos</a></li>
                                        <li><a href="#">Nuestros Clientes</a></li>
                                        <li><a href="#">Contactenos</a></li>
                                        <li><a href="#">Login</a></li>
                                        -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </header>
                </div>
                <div class="fh5co-hero">
                    <div class="fh5co-overlay">
                        <div class="fh5co-cover text-center" style="background-image: url(images/work-1.jpg); background-repeat: repeat">
                            <h2>Multi-Servicios BEAR</h2>
                            <div class="desc animate-box">
                                <span>Servicios de <a href="#" target="_blank" class="fh5co-site-name">Coffee Break</a></span> <span><a class="btn btn-primary" href="#">Leer Mas</a></span>
                                <video width="500" controls>
                                    <source src="/videos/biodegradables.mp4" type="video/mp4">
                                    <source src="/videos/biodegradables.ogg" type="video/ogg">Your browser does not support HTML5 video.
                                </video>
                                <p>
                                    Video Cortesia de Multi-Servicios BEAR
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end:header-top -->

                <dx:ASPxImageSlider ID="sliderImagenes" runat="server" ImageSourceFolder="~/images/galeriaimagenes/" Width="100%">
                    <SettingsAutoGeneratedImages ImageCacheFolder="~\Thumb\" />
                </dx:ASPxImageSlider>

                <div id="fh5co-work-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 animate-box">
                                <h3 class="heading-section">Desechables Biodegradables</h3>
                                <p>
                                    Estamos comprometidos con el medio ambiente , por lo que ofrecemos una alta gama de productos que cuidan la ecologia
                                </p>
                            </div>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="fh5co-grid animate-box" style="background-image: url(images/work-2.jpg);">
                                            <a class="image-popup text-center" href="#">
                                                <div class="prod-title">
                                                    <h3>productos Biodegradables</h3>
                                                    <span>Ver galeria de productos biodegradables</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-sm-8">
                                        <div class="fh5co-grid animate-box" style="background-image: url(images/work-3.jpg);">
                                            <a class="image-popup text-center" href="#">
                                                <div class="prod-title">
                                                    <h3>Servicios de Cafeteria</h3>
                                                    <span>Ver nuestros servicios</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-sm-8">
                                        <div class="fh5co-grid animate-box" style="background-image: url(images/work-4.jpg);">
                                            <a class="image-popup text-center" href="#">
                                                <div class="prod-title">
                                                    <h3>Desechables convencionales</h3>
                                                    <span>Galeria de Productos</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="fh5co-grid animate-box" style="background-image: url(images/work-5.jpg);">
                                            <a class="image-popup text-center" href="#">
                                                <div class="prod-title">
                                                    <h3>Otros Productos y servicios</h3>
                                                    <span>Visite la Galeria</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- fh5co-work-section -->
                <div id="fh5co-services-section" class="border-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 animate-box">
                                <h3 class="heading-section">La calidad de nuestros servicios</h3>
                                <p>
                                    Conozca lo que nuestros clientes opinan de nuestros servicios
                                </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-browser"></i></span>
                                            <h3>Cafeteria</h3>
                                            <p>
                                                Nuestros servicios de Cafeteria incluyen productos de la mas alta calidad
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-mobile"></i></span>
                                            <h3>Proveduria de insumos</h3>
                                            <p>
                                                proveemos insumos y servicios para sus reuniones y eventos
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-tools"></i></span>
                                            <h3>Paquetes y Servicios</h3>
                                            <p>
                                                Ingrese a esta sección para ver nuestros paquetes y servicios , contactenos con todo gusto elaboramos un presupiuesto a su medida.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-video"></i></span>
                                            <h3>Demostraciones Online</h3>
                                            <p>
                                                Observe nuestra galeria de videos , conozca mas de nuestros servicios
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-search"></i></span>
                                            <h3>Nuestras oficinas</h3>
                                            <p>
                                                Ingrese a nuestro directorio para ubicarnos
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="services animate-box">
                                            <span><i class="icon-cloud"></i></span>
                                            <h3>Visitenos en nuestras redes sociales</h3>
                                            <p>
                                                Visitenos en Facebook Twitter Google
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- fh5co-services-section -->
                <div id="fh5co-content-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="fh5co-testimonial text-center animate-box">
                                    <h2>La historia del Café</h2>
                                    <figure>
                                        <img src="images/user-1.jpg" alt="user">
                                    </figure>
                                    <blockquote>
                                        <p>
                                            “La historia del café se remonta al siglo XIII, aunque el origen del café sigue sin esclarecerse. Se cree que los ancestros etíopes del actual pueblo oromo fueron los primeros en descubrir y reconocer el efecto energizante de los granos de la planta del café;1 sin embargo, no se ha hallado evidencia directa que indique en qué parte de África crecía o qué nativos lo habrían usado como un estimulante o incluso conocieran su existencia antes del siglo XVII.1
La historia de Kaldi, un criador de cabras etíope del siglo IX que habría descubierto el café, no apareció escrita hasta 1671 y es probablemente apócrifa.2 Se cree que, desde Etiopía, el café fue propagado a Egipto y Yemen.3 La evidencia creíble más temprana de cualquier bebida de café o conocimiento del árbol del café aparece a mediados del siglo XV, en los monasterios sufi de Yemen.1 Fue allí, en Arabia, donde los granos de café fueron tostados y molidos por primera vez en una forma similar a como son preparados en la actualidad. Para el siglo XVI, se había expandido por el resto del Medio Oriente, Persia, Turquía y África del Norte. Luego, el café se extendió a Italia y el resto de Europa hasta Indonesia y el continente americano.4
La palabra "café" proviene del término turco qahve, a su vez, procedente del árabe, qahwa, a través del italiano.5 El término árabe sería una abreviación de la expresión qahhwat al-bun o vino de la habichuela. Un posible origen de la palabra se encontraría en el Reino de Kaffa en Etiopía, de donde procedería la planta del café; su nombre allí es bunn o bunna..”
                                        </p>
                                    </blockquote>
                                    <span>Wikipedia</span>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="fh5co-about-us animate-box">
                                    <h2 class="text-center">Contactenos</h2>
                                    <img src="images/about-image.jpg" alt="About Us">
                                    <p>
                                        Si desea obtener mayores informes de nuestros servicios, o desea le coticemos nuestros servicios puede contactarnos al telefono 9383876417 o bien escribirnos al correo abeldiaz90@hotmail.com con gusto le atenderemos.
                                        <br>
                                        <a href="#">Mayores Informes</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- fh5co-content-section -->
                <div id="fh5co-blog-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-sm-12 animate-box">
                                <h3 class="heading-section">Ultimas Publicaciones</h3>
                                <p>
                                    Visite los articulos que constantemente publicamos en la internet
                                </p>
                            </div>
                            <div class="col-lg-9 col-sm-12">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="fh5co-blog animate-box" style="background-image: url(images/blog-1.jpg);">
                                            <a class="image-popup" href="#">
                                                <div class="prod-title">
                                                    <span>Publicación</span>
                                                    <h3>Ventajas de los Biodegradables</h3>
                                                    <p>
                                                        Una de las grandes ventajas de los materiales biodegarbales es que en 180 dias estos pueden biodegradarse
                                                    </p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="fh5co-blog animate-box" style="background-image: url(images/blog-2.jpg);">
                                            <a class="image-popup" href="#">
                                                <div class="prod-title">
                                                    <span>Publicación</span>
                                                    <h3>Haga mas amenas sus reuniones</h3>
                                                    <p>
                                                        Segun estudios de la OMS , el tener cafe y galletas en las reuniones mejora el ambiente social y las reuniones a menudo son mas amenas.
                                                    </p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="fh5co-blog animate-box" style="background-image: url(images/blog-3.jpg);">
                                            <a class="image-popup" href="#">
                                                <div class="prod-title">
                                                    <span>Publicación</span>
                                                    <h3>Haga ejercicio viva mas</h3>
                                                    <p>
                                                        Esta clinicamentre comprabado que el realizar ejercicio mejora la calidad de vida de las personas, reduce el estres y proporciona grandes ventajas.
                                                    </p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- fh5co-blog-section -->
                <footer>
                    <div id="footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        Copyright 2016 Abel Diaz Gonzalez <a href="#">ADG </a>. All Rights Reserved.
                                        <br>
                                        Hecho por:<a href="ADG">ADG</a> / Demo Images: <a href="#">Abel Diaz Gonzalez</a>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <ul class="footer-menu">
                                        <li><a href="#">Inicio</a></li>
                                        <li><a href="#">¿Quienes Somos?</a></li>
                                        <li><a href="#">Servicios</a></li>
                                        <li><a href="#">Pedidos</a></li>
                                        <li><a href="#">Nuestros Clientes</a></li>
                                        <li><a href="#">Contactenos</a></li>
                                        <li><a href="#">Login</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- END fh5co-page -->
        </div>
    </form>
</asp:Content>


