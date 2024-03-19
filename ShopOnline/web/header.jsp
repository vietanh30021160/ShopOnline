<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : header
    Created on : Mar 14, 2023, 9:42:59 AM
    Author     : DUCHIEUPC.COM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>

        <c:set var="size" value="${sessionScope.size}"/>
        <header class="p-3 bg-dark text-white">
            <div class="container bg-dark">
                <div class=" d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none" style="margin-right: 15px;">
                        <img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" />
                        <h6 class="tm-site-description">HOLA </h6>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <c:set var="a" value="${sessionScope.account}"/>
                        <li><a  href="${a.role == 1 && a.id!=null ? "" : "shophome"}" class="nav-link px-2 text-white">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                        <li><a href="list"class="nav-link px-2 text-white">Shop</a></li>
                        <!--<li><a href="cart.jsp" class="nav-link px-2 text-white">Cart  ${size}</a></li>-->
                        <li class="tm-nav-li"><a href="${a.role == 1 ? "getorderbydate" : ""} " class="nav-link   px-2 text-white">${a.role == 1 && a.id!=null ? "Statistic detail" : ""}</a></li>
                        <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart.jsp"}" class="nav-link  px-2 text-white">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart" } ${size}</a></li>
                        <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile.jsp"} " class="nav-link  px-2 text-white">${a.id == null ? "Login" : "Profile"}</a></li>
                        <li class="tm-nav-li"><a href="${a.role == 1 ? "alist" : "list"} " class="nav-link  px-2 text-white">${a.role == 1 && a.id!=null ? "Manager" : ""}</a></li>
                        <li class="tm-nav-li"><a href="logout" class="nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                    </ul>

<!--                    <form  action="searchprodbyname" method="get"  class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" style="display: flex; justify-content: space-between">
                        <input   name="search" type="text"  class="form-control form-control-dark" placeholder="Search by name..." aria-label="Search" style="margin-right: 10px;">
                        <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Search">
                    </form>-->

                </div>
            </div>
        </header>

    </body>
</html>
