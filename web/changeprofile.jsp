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
        <title>Profile</title>
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
                <header class="row tm-welcome-section">
                    <c:set var="a" value="${sessionScope.account}"/>
                    <h2 class="col-12 text-center tm-section-title">User ${a.fullname}</h2>
                    <h3 style="color: red">${requestScope.ms}</h3>
                    <a href="profile.jsp" target="_parent" class="tm-register">
                        <i> <-Back </i>
                    </a>
                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <form action="changeprf" >

                        <div class="form-group">
                            <input type="text" name="fullname" class="form-control" value="${a.fullname}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" value="${a.email}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="phonenum" class="form-control" value="${a.phonenum}"  required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" class="form-control" value="${a.address}"  required="" />
                        </div>
                        <input type="hidden" name="user" value="${sessionScope.account.username}"/>
                        <input type="hidden" name="pass" value="${sessionScope.account.password}"/>
                        <input type="submit" class="tm-btn tm-btn-primary tm-btn" value="Change Profile">
                    </form>

                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <h2 class="col-12 text-center tm-section-title"></h2> 
                    <h2 class="col-12 text-center tm-section-title"></h2>  
                </header>

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
            </script>
    </body>
</html>
