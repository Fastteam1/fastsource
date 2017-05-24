<%-- 
    Document   : viewEmployee
    Created on : Oct 11, 2016, 9:31:47 AM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>EFinder | Danh sách nhân viên</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- bootstrap datetimepicker -->
        <link rel="stylesheet" href="plugins/datetimepicker/bootstrap-datetimepicker.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <!-- PNotify. -->
        <link href="pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <style>
            /*            .dataTables_wrapper .dataTables_length {
                            float: right;
                        }
                        .dataTables_wrapper .dataTables_filter {
                            float: left;
                            text-align: left;
                        }*/

        </style>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Mẫu game
                        <small>Danh sách mẫu Game</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tiến trình game</a></li>
                        <li class="active">Mẫu game</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <table class="table table-hover" style="width: 35%">
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <a data-toggle="modal" href="#insert-modal" id ="add-form">
                                                            <button type="button" class="btn btn-info" data-toggle="modal" 
                                                                    data-placement="top" title="Xóa" data-target="#objectAdd" >
                                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Thêm mới
                                                            </button>

                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                        <tr>
                                    </table>
                                    <!--                                    <div class="row">
                                                                            <div class="col-sm-6"></div>
                                                                            <div class="col-sm-6"><div id="example1_filter" class="dataTables_filter">
                                                                                    <label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1">
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                    <table id="example1" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Tên nhân viên</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Email</th>
                                                <th>Mô tả</th>
                                                <th>Bộ phận</th>
                                                <th class="edit-actions"></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listEmployees}" var="employee" varStatus="varStatus">
                                                <tr>
                                                    <td>${employee.name}</td>
                                                    <td>${employee.phone}</td>
                                                    <td>${employee.address}</td>
                                                    <td>${employee.email}</td>
                                                    <td>${employee.description}</td>
                                                    <td>${employee.department}</td>

                                                    <td class="center">
                                                        <button type="button" class="btn btn-xs btn-success edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Sửa" onclick="getViaAjax(${employee.id});">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                        </button>

                                                        <button type="button" class="btn btn-xs btn-danger edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Xóa" onclick="deleteViaAjax(${employee.id});" id="delete-employee">
                                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>

                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
            </div>

            <jsp:include page="../include/footer.jsp" />
            <jsp:include page="../include/setting.jsp" />


            <!-- ./wrapper -->
        </div>
        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- PNotify -->
        <script src="pages/js/pnotify.custom.min.js"></script>
        <!-- page script -->

        <!-- InputMask -->
        <script src="plugins/input-mask/jquery.inputmask.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>

        <!-- moment -->
        <script src="plugins/daterangepicker/moment.js"></script>
        <!-- bootstrap datetimepicker -->
        <script src="plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <script>

                                                                    
                                                                    $(function () {
                                                                        $("#example1").DataTable({
                                                                            "paging": true,
                                                                            "lengthChange": true,
                                                                            "ordering": true,
                                                                            "info": true,
                                                                            "autoWidth": true,
                                                                            "searching": true,
                                                                            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                                                                            responsive: true
                                                                        });
                                                                    });
        </script>


        <!-- ADD VIEW FORM -->
        <%@include file="employee_edit.jsp"%>

        <!-- ADD ADD FORM -->
        <%@include file="employee_add.jsp"%>

    </body>
</html>