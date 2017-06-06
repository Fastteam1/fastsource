<%-- 
    Document   : company_info
    Created on : Jun 6, 2017, 10:56:15 AM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>EFinder | Thông tin doanh nghiệp</title>
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

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Quản lý
                        <small>Thông tin doanh nghiệp</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
                        <li><a href="#">Quản lý</a></li>
                        <li class="active">Doanh nghiệp</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Horizontal Form -->
                            <div class="box box-info">

                                <!-- /THÔNG TIN TÀI KHOẢN -->

                                <div class="box-header with-border">
                                    <h3 class="box-title">THÔNG TIN TÀI KHOẢN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal" id="systemConfigurationForm">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="txtID" class="col-sm-2 control-label">Tên đăng nhập</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="txtID" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group" style="">
                                            <label for="questionID" class="col-sm-2 control-label">Mật khẩu</label>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control" id="questionID" disabled="disabled">
                                            </div>
                                            <div class="col-sm-2">
                                                <button class="btn btn-info">Đổi mật khẩu</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txaContent" class="col-sm-2 control-label">Tên doanh nghiệp</label>
                                            <div class="col-sm-6">
                                                <textarea class="form-control" id="txaContent"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="txaNote" class="col-sm-2 control-label">Địa chỉ trụ sở chính</label>
                                            <div class="col-sm-6">
                                                <textarea class="form-control" id="txaNote"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtID" class="col-sm-2 control-label">Số giấy phép DKKD</label>
                                            <div class="col-sm-6">
                                                <input type="number" class="form-control" id="txtID">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtID" class="col-sm-2 control-label">Mã số thuế</label>
                                            <div class="col-sm-6">
                                                <input type="number" class="form-control" id="txtID" >
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->

                                    <!-- /THÔNG TIN ĐẠI LÝ -->
                                    <div class="box-header with-border">
                                        <h3 class="box-title">THÔNG TIN ĐẠI LÝ</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <div class="form-horizontal" id="systemConfigurationForm">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="txtID" class="col-sm-2 control-label">Đại lý</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="txtID" disabled="disabled">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                    </div>


                                    <!-- GỬI GÓP Ý -->
                                    <div class="box-header with-border">
                                        <h3 class="box-title">GỬI GÓP Ý ĐẾN DỊCH VỤ EFINDER </h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <div class="form-horizontal" id="systemConfigurationForm">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="txtID" class="col-sm-3 control-label">Tổng đài 18001260 (hỗ trợ 24/24h, miễn phí)</label>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtID" class="col-sm-2 control-label">Gửi góp ý</label>
                                                <div class="col-sm-6">
                                                    <textarea class="form-control" id="txaNote" placeholder="Tôi muốn góp ý..."></textarea>
                                                </div>
                                                <div class="col-sm-2">
                                                    <button class="btn btn-info">Send</button>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                        
                                    </div>


                                </div>
                            </div>
                            <!-- /.box -->



                            <!-- /.box -->
                        </div>
                    </div>
                </section>
                <!-- /.content -->

            </div>

            <jsp:include page="../include/footer.jsp" />
            <jsp:include page="../include/setting.jsp" />

            <!-- ./wrapper -->
        </div>
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
        <script>
                                                        document.getElementById("manager-company").className = "active";
                                                        document.getElementById("info-company").className = "active";
        </script>

    </body>
</html>