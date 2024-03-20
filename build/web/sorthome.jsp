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
        <link href="css/all.min.css" rel="stylesheet" />
    </head>

    <body> 

        <div class="container">
            <jsp:include page="./header.jsp"/>

        </div>
        <div class="container">
            <!-- Top box -->


            <main>

                <h1 style="text-align: center;margin: 15px;">Home page</h1>
                <div class="tm-container-inner-2 tm-contact-section">
                    <div class="row">
                        <h3 style="text-align: center;">Select days to show</h3>

                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <form action="shophome" class="tm-contact-form">
                                <div class="form-group">
                                    <!--<input type="hidden" name="cid" value="${param.cid}"/>-->
                                    <div class=" tm-d-flex" >
                                        <select class="form-select" name="sortbyday" onchange="this.form.submit();"> 
                                            <option value="today" ${param.sortbyday=="today"?"selected":""}>Today</option> 
                                            <option value="3dayslast"  ${param.sortbyday=="3dayslast"?"selected":""}>Last 3 days</option>
                                            <option value="7dayslast" ${param.sortbyday=="7dayslast"?"selected":""}>last 7 days</option>
                                            <option value="all"  ${param.sortbyday=="all"?"selected":""}>All</option>
                                        </select>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <c:if test="${requestScope.sortby!=null}">  
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp; Feature Products</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodRevenue}" var="n">
                                <form action="buy" method="post" id="myform" class="col-md-3"  style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center;">
                                    <a cursor-p href="detail?id=${n.id}&?cid=${n.cid}">
                                        <img src="img/${n.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                    <div style="width: 100%">
                                        <h4 >${n.name}</h4>

                                        <p >${n.price} đ</p>

                                        <div class="form-group tm-d-flex" style="width: 90%;display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                            <div class="form-group">
                                                <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                <input type="hidden" name="id" value="${n.id}"/>
                                            </div>
                                            <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${n.id}')"  value="Buy now!">
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                    <h2 class="form-group" style="text-align: center">New Product</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza " class="tm-gallery-page">
                            <c:forEach items="${requestScope.newp}" var="n">
                                <form action="buy" method="post" id="myform" class="col-md-3"  style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center;">
                                    <a cursor-p href="detail?id=${n.id}&?cid=${n.cid}">
                                        <img src="img/${n.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                    <div style="width: 100%">
                                        <h4 >${n.name}</h4>

                                        <p >${n.price} đ</p>

                                        <div class="form-group tm-d-flex" style="width: 90%;display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                            <div class="form-group">
                                                <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                <input type="hidden" name="id" value="${n.id}"/>
                                            </div>
                                            <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${n.id}')"  value="Buy now!">
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp; Most Sold</h2>
                    <div class="row tm-gallery">
                        <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodQuantity}" var="m">
                                <form action="buy" method="post" id="myform" class="col-md-3"  style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center;">
                                    <a cursor-p href="detail?id=${n.id}&?cid=${n.cid}">
                                        <img src="img/${n.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                    <div style="width: 100%">
                                        <h4 >${n.name}</h4>

                                        <p >${n.price} đ</p>

                                        <div class="form-group tm-d-flex" style="width: 90%;display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                            <div class="form-group">
                                                <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                                <input type="hidden" name="id" value="${n.id}"/>
                                            </div>
                                            <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${n.id}')"  value="Buy now!">
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                </c:if> 


                <style>
                    .page-link {
                        padding: 0.375rem 0.75rem;
                    }
                    .pagination {
                        display: flex;
                        padding-left: 0;
                        list-style: none;
                        justify-content: center
                    }
                    .page-link-detail{
                        background-color: #319966;
                        color: white;
                        padding: 5px
                    }
                    .page-item-detail{

                    }
                    .page-item.active .page-link {
                        z-index: 3;
                        text-decoration: none;
                        color: #319966;
                        background-color: transparent
                    }
                    .page-item.disabled .page-link {

                        pointer-events: none;
                        color: #319966;
                        background-color: transparent;
                        border-color: #dee2e6;
                    }
                    .pagination-lg .page-item:first-child .page-link {
                        border-top-left-radius: 0.3rem;
                        border-bottom-left-radius: 0.3rem;
                    }
                    .pagination-lg .page-item:last-child .page-link {
                        border-top-right-radius: 0.3rem;
                        border-bottom-right-radius: 0.3rem;
                    }
                </style>

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
