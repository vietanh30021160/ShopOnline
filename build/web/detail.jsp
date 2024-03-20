<%-- 
    Document   : contact
    Created on : 14-Oct-2022, 21:47:03
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Detail</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
    </head>
    <!--
    
    Simple House
    
    https://templatemo.com/tm-539-simple-house
    
    -->
    <body> 

        <div class="container">
            <!-- Top box -->
            <jsp:include page="./header.jsp"/>


            <main> 
                <c:set var="p" value="${requestScope.prod}" />

                <h3></h3>
                <div class="col-md-4" style="margin-left: 50px">
                    <a href="products?cid=${p.cid}&page=1"  target="_parent" class="tm-register"  >
                        <i> <-Back </i>
                    </a>
                </div>
                <input type="hidden" name="cid" value="${p.cid}" readonly="readonly" />
                <h3></h3>
                <form action="buy" method="post" id="myform">
                    <div class="tm-container-inner-2 tm-contact-section">
                        <div class="row">

                            <div class="col-md-4">

                                <figure>
                                    <img src="img/${p.image}" alt="Image" class="img-fluid tm-gallery-img" />
                                </figure>
                            </div>

                            <div class="col-md-6">
                                <div class="tm-address-box">

                                    <h4 class="tm-info-title tm-text-success">${p.name}</h4>
                                    <address>
                                        Price: ${p.price}
                                    </address>
                                    <address>
                                        Describe: ${p.describe}
                                    </address>

                                    <div class="form-group tm-d-flex">
                                        <div class="form-group">
                                            <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                            <input type="hidden" name="id" value="${p.id}"/>
                                        </div>
                                        <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${p.id}')"  value="Buy now!">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
                <h2 class="tm-register" style="margin-left: 50px">Relative</h2>





                <div class="row tm-gallery">
                    <div id="tm-gallery-page-pizza" class="tm-gallery-page">

                        <c:forEach items="${requestScope.relativeproducts}" var="rp">
                            <article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item" >
                                <form action="buy" method="post" id="myform">
                                    <figure><a cursor-p href="detail?id=${rp.id}">
                                            <img src="img/${rp.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                        <figcaption>
                                            <h4 class="tm-gallery-title">${rp.name}</h4>
                                            <p class="tm-gallery-price">${rp.price} đ</p>
                                            <div class="form-group tm-d-flex">
                                                <div class="form-group">
                                                    <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                    <input type="hidden" name="id" value="${rp.id}"/>
                                                </div>
                                                <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${p.id}')"  value="Buy now!">
                                            </div>
                                        </figcaption>
                                    </figure>
                                </form>
                            </article>
                        </c:forEach>                           
                    </div> 
                </div>


                <!-- How to change your own map point
                        1. Go to Google Maps
                        2. Click on your location point
                        3. Click "Share" and choose "Embed map" tab
                        4. Copy only URL and paste it within the src="" field below
                -->


            </main>

            <div class="tm-container-inner tm-featured-image">
                <div class="row">
                    <div class="col-12">
                        <div class="placeholder-2">
                            <div class="parallax-window-2" data-parallax="scroll" data-image-src="img/simple-house-01.jpg"></div>		
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="./footer.jsp"/>

        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        var acc = document.getElementsByClassName("accordion");
                                                        var i;

                                                        for (i = 0; i < acc.length; i++) {
                                                            acc[i].addEventListener("click", function () {
                                                                this.classList.toggle("active");
                                                                var panel = this.nextElementSibling;
                                                                if (panel.style.maxHeight) {
                                                                    panel.style.maxHeight = null;
                                                                } else {
                                                                    panel.style.maxHeight = panel.scrollHeight + "px";
                                                                }
                                                            });
                                                        }
                                                    });
                                                    function buy(id) {
                                                        document.f.action = "buy?id=" + id;
                                                        document.f.submit();
//                                                          document.getElementById('myform').submit();
                                                    }
        </script>
    </body>
</html>
