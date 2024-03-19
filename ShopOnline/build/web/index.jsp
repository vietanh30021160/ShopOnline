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
            <!-- Top box -->
            <!-- Logo & Site Name -->

            <jsp:include page="./header.jsp"/>

            <main>
                <div style="margin-top:15px;display: flex; flex-direction: row; justify-content: space-around; ">
                    <div class="tm-container-inner-2 tm-contact-section ">
                        <div class="row">
                            <h3 >Search by name</h3>
                            <div class="col-md-12"><h3 style="color: red">${requestScope.error}</h3>
                                <form action="searchprodbyname" method="get" class="tm-contact-form">
                                    <div class="form-group" style="display: flex; flex-direction: row; justify-content: center; align-items: center; text-align: center;">
                                        <input  name="search" type="text" class="form-control" placeholder="Search by name" required="" />
                                        <input type="submit" class="tm-btn tm-btn-primary tm-btn" style="margin-left: 15px;" value="Search">
                                    </div>
                                </form>
                            </div><!-- comment -->
                        </div>
                    </div>
                    <div class="tm-container-inner-2 tm-contact-section " style="width: 900px;height: auto;" >
                        <h3 style="text-align: center">Search by Category and price</h3>

                        <form action="searchby"  style="margin-top:15px;display: flex;  justify-content: space-around;align-items: center; ">
                            <select class="form-select" name="searchbyprice" style="height: 37.8px;width: 200px;">
                                <option  value="1">10000→30000 </option>
                                <option  value="2">30000→50000</option>
                                <option  value="3">50000↑</option>
                            </select>
                            <select class="form-select" name="searchbycid" style="height: 37.8px;width: 200px;">
                                <c:forEach var="sb" items="${requestScope.categories}">
                                    <option value="${sb.id}">${sb.name}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" class="tm-btn tm-btn-primary tm-btn" value="Search">
                        </form>
                    </div>
                </div>




                <!--                <div class="row tm-gallery">
                                    <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                <c:forEach items="${requestScope.random}" var="ra">
                    <form action="buy" method="post" id="myform">
                        <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item" >
                            <figure><a cursor-p href="detail?id=${ra.id}&?cid=${param.cid}">
                                    <img src="img/${ra.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                <figcaption>
                                    <h4 class="tm-gallery-title">${ra.name}</h4>

                                    <p class="tm-gallery-price">${ra.price} đ</p>

                                    <div class="form-group tm-d-flex">
                                        <div class="form-group">
                                            <input type="number" name="num" value="" class="form-control" placeholder="Quantity" required="" />
                                            <input type="hidden" name="id" value="${ra.id}"/>
                                        </div>
                                        <input type="submit" class="tm-btn tm-btn-primary tm-btn" onclick="buy('${ra.id}')"  value="Buy now!">
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </form>
                </c:forEach>   
            </div> 
        </div>-->
                <div class="tm-paging-links">
                    <nav>
                        <ul>
                            <c:set var="maxPage" value="${requestScope.maxPage}"/>

                            <c:forEach items="${requestScope.categories}" var="c">
                                <li    class="tm-paging-item" style="border-radius: 15px;" > <a style="padding: 10px 30px;
                                                                   display: flex;
                                                                   align-items: center;
                                                                   justify-content: center;
                                                                   text-decoration: none;
                                                                   color: #2F956D;
                                                                   background-color: transparent; font-weight: 500;" href="products?cid=${c.id}&page=1 " class="btn-link active">${c.name}</a></li>

                            </c:forEach>
                        </ul>
                    </nav>
                </div>
                <c:if test="${param.cid!=null}">
                    <div class="tm-container-inner-2 tm-contact-section">
                        <div class="row">
                            <div class="col-md-4">
                                <form action="sort"  class="tm-contact-form">

                                    <div class="form-group">
                                        <input type="hidden" name="cid" value="${param.cid}"/>
                                        <div class=" tm-d-flex" >
                                            <select name="sortby"> 
                                                <option value="prup">Price ↑</option> 
                                                <option value="prdown">Price ↓</option>
                                                <option value="nameup">A to Z</option>
                                                <option value="namedown">Z to A</option>
                                            </select>
                                            <div class="form-group tm-d-flex">
                                                <input type="submit" class="tm-btn tm-btn-primary tm-btn" value="Sort">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div><!-- comment -->
                        </div>
                    </div>
                </c:if>






                <!-- Pagination -->
                <div>
                    <nav aria-label="Page navigation" >
                        <ul class="pagination" >

                            <% String cid = (String) request.getAttribute("cateid"); 
                                if(cid!=null){
                            %>

                            <li class="page-item"><a class="page-link" href="products?cid=${param.cid}&page=1">${param.page ==1 ||param.page ==0  ? "" : "<<<"}</a></li>
                            <li class="page-item"><a class="page-link" href="products?cid=${param.cid}&page=${param.page-1}">${param.page ==1 ||param.page ==0 ? "" : "<"}</a></li>
                            <li class="page-item-detail" ><a  class="page-link-detail" href="products?cid=${param.cid}&page=${param.page}">${param.page}</a></li>

                            <li class="page-item"><a class="page-link" href="products?cid=${param.cid}&page=${param.page+1}">${param.page == maxPage ? "" : ">"}</a></li>
                            <li class="page-item"><a class="page-link" href="products?cid=${param.cid}&page=${maxPage}">${param.page ==maxPage ? "" : ">>>"}</a></li>
                                <% } %>
                        </ul>
                    </nav>
                </div>

                <h2 style="text-align: center; color: #319966">${param.cid==null? "Please select a category": ""}</h2>




                <div class="row tm-gallery">
                    <div id="tm-gallery-page-pizza" class="tm-gallery-page">


                        <!-- show list products -->
                        <c:forEach items="${requestScope.products}" var="n">

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
                            </form>

                        </c:forEach>   

                    </div> 
                </div>

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
