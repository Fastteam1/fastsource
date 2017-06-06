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
        <title>EFinder | Danh sách thiết bị</title>
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
        <link href="${urlProject}/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="${urlProject}/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${urlProject}/plugins/bootstrap-duallistbox/bootstrap-duallistbox.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Thiết bị
                        <small>Danh sách thiết bị</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
                        <li><a href="#">Quản lý</a></li>
                        <li class="active">Thiết bị</li>
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

                                    <table id="example1" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Tên thiết bị</th>
                                                <th>Loại thiết bị</th>
                                                <th>IMEI</th>
                                                <th>OS</th>
                                                <th>Số Điện Thoại</th>
                                                <th>Địa Chỉ Hiện Tại</th>
                                                <th>Nhân viên quản lý</th>
                                                <th class="edit-actions">Cài đặt</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listDevices}" var="device" varStatus="varStatus">
                                                <tr>
                                                    <td>${device.name}</td>
                                                    <td>${device.type}</td>
                                                    <td>${device.imei}</td>
                                                    <td>${device.os}</td>
                                                    <td>${device.msisdn}</td>
                                                    <td>${device.currentAdd}</td>
                                                    <td><a data-toggle="modal" href="javascript:void(0)" onclick="getViaAjaxEmployee(${device.id},'${device.name}');">Xem chi tiết</a></td>

                                                    <td class="edit-actions">
                                                        <button type="button" class="btn btn-xs btn-success edit-Template" data-toggle="modal" 
                                                                data-placement="top" title="View" onclick="getViaAjax(${device.id});">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                        </button>
                                                        <button type="button" class="btn btn-xs btn-danger edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Xóa" onclick="deleteViaAjax(${device.id});" id="delete-device">
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
        <script src="${urlProject}/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>

        <!-- boostrap dualistbox -->
        <script src="${urlProject}/plugins/bootstrap-duallistbox/jquery.bootstrap-duallistbox.min.js" type="text/javascript"></script>


        <script>
                                                                    document.getElementById("manager-company").className = "active";
                                                                    document.getElementById("info-device").className = "active";
                                                                    $(function () {
                                                                        $("#example1").DataTable({
                                                                            "paging": true,
                                                                            "lengthChange": true,
                                                                            "ordering": true,
                                                                            "info": true,
                                                                            "autoWidth": true,
                                                                            "searching": true,
                                                                            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
                                                                        });
                                                                    });
        </script>

        <!-- ADD VIEW FORM -->
        <%@include file="device_edit.jsp"%>
        <%@include file="device_add.jsp"%>
        <%@include file="device_employee_view.jsp"%>

    </body>
</html>
