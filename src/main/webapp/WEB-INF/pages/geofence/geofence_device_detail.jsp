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
        <title>EFinder | Danh sách vùng địa lý</title>
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


                                    <iframe src="${urlInfo}/map_tracking_detail?id=${geoFenceId}" style="width: 100%; height: 400px"></iframe>                  

                                    <table id="example2" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Thời gian</th>
                                                <th>Trạng thái</th>
                                                <th>Số điện thoại</th>
                                                <th>Tên thiết bị</th>
                                                <th>Nhân viên quản lý</th>
                                                <th>Phòng ban</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listTrackingDevices}" var="geofence" varStatus="varStatus">
                                                <tr>
                                                    <td>${geofence.createTime}</td>
                                                    <c:choose>
                                                        <c:when test="${geofence.status == 0}">
                                                            <td>Ra</td>
                                                        </c:when>
                                                        <c:when test="${geofence.status == 1}">
                                                            <td>Vào</td>
                                                        </c:when>
                                                    </c:choose>
                                                    <td>${geofence.deviceName}</td>
                                                    <td>${geofence.description}</td>
                                                    <td>${geofence.employeeName}</td>
                                                    <td>${geofence.departmentName}</td>
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
        <script>


            $(function () {
                $("#example2").DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "searching": true,
                    "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
                    responsive: true
                });
            });


        </script>


    </body>
</html>