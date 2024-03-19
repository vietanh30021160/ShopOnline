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
    <script type="text/javascript">
        function doDeleteCate(id) {
            if (confirm("Are you sure to delete this category!?")) {
                window.location = "deletecategory?id=" + id;
            }
        }
    </script>
    <script type="text/javascript">
        function doDeleteProd(id) {
            if (confirm("Are you sure to delete this product!?")) {
                window.location = "deleteproduct?id=" + id;
            }
        }
    </script>
    <body> 

        <div class="container">
            <!-- Top box -->
            <jsp:include page="./header.jsp"/>

            <main>

                <div class="col-md-6" style="padding: 15px;">
                    <a href="addproduct"  class="tm-register btn btn-primary" style="margin-right: 22px;">
                        <i>Add Product</i>
                    </a>
                    <a href="addcategory.jsp" class="tm-register btn btn-primary"> Add Category </a>
                </div>
                <div class="tm-paging-links">
                    <nav>
                        <ul>
                            <c:forEach items="${requestScope.categories}" var="c">

                                <li    class="tm-paging-item"><a style="padding: 10px 30px;
                                                                 display: flex;
                                                                 align-items: center;
                                                                 justify-content: center;
                                                                 text-decoration: none;
                                                                 color: #2F956D;
                                                                 background-color: transparent;" href="aproducts?cid=${c.id}" class="btn-link active">${c.name}</a>
                                    <img src="img/delete.jpg" height="17px" width="17px"  href="#" onclick="doDeleteCate('${c.id}')"  alt="alt"/>
                                    <a href="updatecategory?id=${c.id}"><img src="img/update.png" height="17px" width="17px"   alt="alt"/></a>
                                </li>

                            </c:forEach>
                        </ul>
                    </nav>
                </div>


                <!-- Gallery -->
                <table class="table table-stripe">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Img</th>
                            <th>Name</th>
                            <th>describe</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.products}" var="p">
                            <tr>
                                <td>${p.id}</td>

                                <td> <img src="img/${p.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" />
                                </td>

                                <td><h4 class="tm-gallery-title">${p.name}</h4></td>
                                <td>${p.price}</td>
                                <td>${p.describe}</td>
                                <td><img src="img/delete.jpg" height="17px" width="17px"  href="#" onclick="doDeleteProd('${p.id}')"  alt="alt"/></td>
                                <td>                            <a href="updateproduct?id=${p.id}"><img src="img/update.png" height="17px" width="17px"   alt="alt"/></a></td>
                            </tr>
                        </c:forEach>         
                    </tbody>
                </table>
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
