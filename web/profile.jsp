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

            <c:set var="a" value="${sessionScope.account}"/>

            <main>
                <header class="row ">
                    <h3 class="col-12 text-center tm-section-title">Welcome ${a.role == 1? "Admin" : "User"}  </h3>
                    <h3 class="col-6 text-center tm-section-title">Name: <input class="form-control" value="${a.fullname}"></h3>
                    <h3 class="col-6 text-center tm-section-title">Email:<input class="form-control" value="${a.email}"></h3>
                    <h3 class="col-6 text-center tm-section-title">Phone Number: <input class="form-control" value="${a.phonenum}"></h3> 
                    <h3 class="col-6 text-center tm-section-title">Address: <input class="form-control" value="${a.address}"></h3> 
                </header>
                <a href="changepass.jsp" class="tm-register">
                    <i>Change password</i>
                </a><br/>
                <a href="changeprofile.jsp" class="tm-register">
                    <i>Change profile information</i>
                </a>
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
        </script>
    </body>
</html>
