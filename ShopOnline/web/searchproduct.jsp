<%-- 
    Document   : index
    Created on : 14-Oct-2022, 21:47:53
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
        <title>Maura Diner</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
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

                <h3></h3>
                <div class="tm-container-inner-4 tm-contact-section">
                    <div class="row">
                        <div class="col-md-12" style="margin-left: 50px">
                            <a href="list" target="_parent" class="tm-register">
                                <i> <-Back </i>
                            </a>
                        </div>

                    </div>
                </div>




                <div  style="text-align:  center"><h3 style="color: red">${requestScope.error}</h3></div>
                <!-- Gallery -->
                <div class="row tm-gallery">
                    <div id="tm-gallery-page-pizza" class="tm-gallery-page">

                        <c:forEach items="${requestScope.prod}" var="p">

                            <article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item" >
                                <form action="buy" method="post" id="myform">

                                    <figure><a cursor-p href="detail?id=${p.id}">
                                            <img src="img/${p.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                        <figcaption>
                                            <h4 class="tm-gallery-title">${p.name}</h4>

                                            <p class="tm-gallery-price">${p.price} đ</p>
                                            <div class="form-group tm-d-flex">
                                                <div class="form-group">
                                                    <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                    <input type="hidden" name="id" value="${p.id}"/>
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
            <jsp:include page="./footer.jsp"/>

        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        // Handle click on paging links
                                                        $('.tm-paging-link').click(function (e) {
                                                            e.preventDefault();

                                                            var page = $(this).text().toLowerCase();
                                                            $('.tm-gallery-page').addClass('hidden');
                                                            $('#tm-gallery-page-' + page).removeClass('hidden');
                                                            $('.tm-paging-link').removeClass('active');
                                                            $(this).addClass("active");
                                                        });
                                                    });
                                                    function buy(id) {
                                                        document.f.action = "buy?id=" + id;
                                                        document.f.submit();
//                                                          document.getElementById('myform').submit();
                                                    }
        </script>
    </body>
</html>
