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
        <title>EFinder | Danh sách phòng ban</title>
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
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="${urlProject}/pages/js/dataTables.editor.js" type="text/javascript"></script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Phòng ban
                        <small>Danh sách phòng ban</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
                        <li><a href="#">Quản lý</a></li>
                        <li class="active">Phòng ban</li>
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
                                                                    data-placement="top" title="Xóa" data-target="#objectAdd1" >
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
                                                <th class="text-center">ID</th>
                                                <th class="text-center">Tên phòng ban</th>
                                                
                                                <th class="edit-actions text-center">Cài đặt</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listDepartment}" var="department" varStatus="varStatus">
                                                <tr>
                                                    <td class="text-center">${department.id}</td>
                                                    <td class="text-center">${department.name}</td>
                                                    <td class="edit-actions text-center">
                                                        <button type="button" class="btn btn-xs btn-success edit-Template" data-toggle="modal" 
                                                                data-placement="top" title="View" onclick="getViaAjax(${department.id});">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                        </button>
                                                        <button type="button" class="btn btn-xs btn-danger edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Xóa" id="delete-device" onclick="deleteViaAjax(${department.id});">
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
        <%@include file="department_edit.jsp"%>
        <%@include file="department_add.jsp"%>
        

    </body>
</html>