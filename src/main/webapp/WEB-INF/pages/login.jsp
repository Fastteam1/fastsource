
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>EFinder | Đăng nhập</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${urlProject}/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${urlProject}/plugins/datatables/dataTables.bootstrap.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${urlProject}/dist/css/AdminLTE.css">
        <!-- bootstrap datetimepicker -->
        <link rel="stylesheet" href="${urlProject}/plugins/datetimepicker/bootstrap-datetimepicker.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
                     folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${urlProject}/dist/css/skins/_all-skins.css">
        <!-- PNotify. -->
        <link href="${urlProject}/pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >
        <!-- daterange picker -->
        <link rel="stylesheet" href="${urlProject}/plugins/daterangepicker/daterangepicker.css">

        <!-- owl carouse -->
        <link href="${urlProject}/plugins/ass/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="${urlProject}/plugins/ass/owl.theme.default.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../pages/include/header.jsp" /> 
            <div class="banner">
                <div class="owl-carousel owl-theme">
                    <div class="item">
                        <span class="frame_banner">
                            <img src="${urlProject}/pages/image/efinder/frame1.jpg" alt="FRAME1" class="center-block">
                        </span>
                    </div>
                    <div class="item">
                        <span class="frame_banner">
                            <img src="${urlProject}/pages/image/efinder/frame2.jpg" alt="FRAME2" class="center-block">
                        </span>
                    </div>

                    <div class="item">
                        <span class="frame_banner">
                            <img src="${urlProject}/pages/image/efinder/frame3.jpg" alt="FRAME3" class="center-block">
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper-login">
            <div class="box-login">
                <div class="img-login pull-left">
                    <img src="${urlProject}/pages/image/efinder/login.png" alt="LOGIN">
                </div>

                <form class="text-login pull-left" id="loginForm" method="post">
                    <h3 class="header-login">ĐĂNG NHẬP</h3>
                    <div class="form-login">
                        <input type="text" class="form-control pull-left" placeholder="UserName" name="username" id="txtUserName">
                    </div>
                    <div class="form-login">
                        <input type="password" class="form-control pull-left" placeholder="Password" name="password" id="txtPassword">
                    </div>
                    <div class="form-login">
                        <input type="number" class="form-control pull-left" placeholder="Số thuê bao (đối với tài khoản chi nhánh )" name="msisdn" id="txtMsisdn" >
                    </div>

                    <div><input type="checkbox"> Tôi đồng ý với các điều khoản sử dụng</div>
                    <div><input type="checkbox"> Nhớ mật khẩu  <a href="#" class="pull-right"> Quên mật khẩu</a></div>
                    <div class="btn-login">
                        <button type="submit">Đăng nhập</button>
                    </div>
                </form>




            </div>
        </div>

        <jsp:include page="../pages/include/footer.jsp" />
        <jsp:include page="../pages/include/setting.jsp" />

        <!-- ./wrapper -->

        <!-- jQuery 2.2.3 -->
        <script src="${urlProject}/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="${urlProject}/bootstrap/js/bootstrap.min.js"></script>
        <!-- DataTables -->
        <script src="${urlProject}/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${urlProject}/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="${urlProject}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="${urlProject}/plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="${urlProject}/dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${urlProject}/dist/js/demo.js"></script>
        <!-- PNotify -->
        <script src="${urlProject}/pages/js/pnotify.custom.min.js"></script>
        <!-- page script -->

        <!-- InputMask -->
        <script src="${urlProject}/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="${urlProject}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="${urlProject}/plugins/input-mask/jquery.inputmask.extensions.js"></script>

        <!-- moment -->
        <script src="${urlProject}/plugins/daterangepicker/moment.js"></script>
        <!-- bootstrap datetimepicker -->
        <script src="${urlProject}/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>

        <!-- owl carouse -->
        <script src="${urlProject}/plugins/ass/owl.carousel.min.js" type="text/javascript"></script>

        <script>
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 0,
                items: 1,
                autoplay: true,
                autoplayTimeout: 5000
            });

            $(document).ready(function () {
                /* Setting toast popup */
                //toastr.options.timeOut = 1000;
                // toastr.options.positionClass = 'toast-top-center';

                $("#txtUserName").focus();

                /*
                 * - Log In
                 */
                $("#loginForm").submit(function (e) {

                    var username = $("#txtUserName").val().trim();
                    var password = $("#txtPassword").val().trim();
                    var json = {
                        "username": username,
                        "password": password
                    };

                    $.ajax({
                        url: "login",
                        type: "POST",
                        data: json,
                        success: function (response) {
                            console.log(response.length !== 0);
                            if (response.length !== 0) {
                                //console.log(username + "-----" + password);
                                alert("Đăng nhập thành công");
                                window.location.href = "/SpringMVC_EFinder/companyInfo";
                            } else {
                                alert("Đăng nhập thất bại");
                            }
                        },
                        error: function () {
                            alert("Đăng nhập xảy ra lỗi");
                        }
                    });

                    e.preventDefault(); // avoid to execute the actual submit of the form.

                });

            });
        </script>

    </body>
</html>
