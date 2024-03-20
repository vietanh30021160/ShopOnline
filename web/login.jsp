

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <!-- Top box -->
            <jsp:include page="./header.jsp"/>

            <main>
                <h2 class=" text-center " style="margin: 20px;"> Login your account</h2>                   
                <h3 style="color: red; text-align: center">${requestScope.ms}</h3>
                <div >
                    <div class="row">
                        <div class="col-md-4"></div>

                        <div class="col-md-4" style="padding-left: 40px;">
                            <form action="login" method="POST" class="tm-contact-form">
                                <h3 style="color: red">${requestScope.error}</h3>

                                <div class="form-group">
                                    <input type="text" name="name"  class="form-control" placeholder="Username" required="" />
                                </div>

                                <div class="form-group">
                                    <input type="password" name="pass"  class="form-control" placeholder="Password" required="" />
                                </div>

                                <!--					        <div class="form-group">
                                                                                  <textarea rows="5" name="message" class="form-control" placeholder="Message" required=""></textarea>
                                                                                </div>-->
                                <input type="checkbox" name="remember me" ${(cookie.crem.value!=null?'checked':'')} value="on"/> Remember me <br/>
                                <h3></h3>
                                <div class="form-group tm-d-flex">

                                    <input type="submit" class="tm-btn tm-btn-primary tm-btn" value="Login"/>


                                </div>

                                <!--<h5.5>Haven't have account yet?</h5.5>--> 
                                <!--                                <form action="login" method="POST">
                                                                <div class="form-group tm-d-flex">
                                                                    <button type="submit" class="tm-btn tm-btn-primary tm-btn-left">
                                                                        Register
                                                                    </button>
                                                                </div> -->
                            </form>
                            <!--                            <form action="register" method="POST">
                                                            <a href="register.jsp" class="tm-register">
                                                                <i>Haven't have account yet?</i>
                                                            </a>
                                                            </form>-->

                            <h3></h3>
                            <a href="register.jsp" class="tm-register">
                                <i>Haven't have account yet?</i>
                            </a>

                        </div>


                        <!-- How to change your own map point
                                1. Go to Google Maps
                                2. Click on your location point
                                3. Click "Share" and choose "Embed map" tab
                                4. Copy only URL and paste it within the src="" field below
                        -->

                        <div class="tm-container-inner-2 tm-map-section">

                            <div class="row">
                                <div class="col-12">
                                    <div class="tm-map">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59584.16344816163!2d105.55262083359368!3d21.03227725056066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1665770215510!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </main>

                   

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
                    </script>



                    </body>
                    </html>
