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
        <title>Manager</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <script src="ckeditor/ckeditor.js"></script> 
        <script src="ckfinder/ckfinder.js"></script>
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


                <div class="col-md-4" style="margin-left: 50px">
                    <a href="alist" target="_parent" class="tm-register">
                        <i> <-Back </i>
                    </a>
                </div>
                <div class="tm-paging-links">
                    <nav>
                        <ul>

                            <div class="col-md-6">


                                <form action="addproduct" method="POST" >

                                    <div class="form-group">
                                        <input type="text" name="name"  class="form-control" placeholder="Product name" required="" />
                                    </div>
                                    <div class="form-group">
                                        <input type="number" name="price"  class="form-control" placeholder="Product price" required="" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="describe"  class="form-control" placeholder="Product describe" required="" />
                                    </div>
                                    <div class="form-group">
                                        <input  type="text" name="image"  class="form-control" placeholder="Product image" required="" />
                                    </div>
                                    <div class="form-group tm-d-flex">
                                        <select name="cid">
                                            <c:forEach var="sb" items="${requestScope.catego}">
                                                <option value="${sb.id}"> ${sb.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group tm-d-flex">
                                        <input type="submit" class="tm-btn tm-btn-primary tm-btn" value="Add">
                                    </div>
                                </form>
                            </div>                             
                        </ul>
                    </nav>
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
        </script>
    </body>
    <script >

        CKEDITOR.replace('edit', {
            filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
            filebrowserUploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
        });
    </script>
</html>
