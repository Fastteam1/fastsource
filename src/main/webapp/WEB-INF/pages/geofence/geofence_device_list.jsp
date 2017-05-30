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
        <title>EFinder | Theo dõi thiết bị vào ra</title>
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
        <link rel="stylesheet" href="${urlProject}/dist/css/AdminLTE.min.css">
        <!-- bootstrap datetimepicker -->
        <link rel="stylesheet" href="${urlProject}/plugins/datetimepicker/bootstrap-datetimepicker.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${urlProject}/dist/css/skins/_all-skins.min.css">
        <!-- PNotify. -->
        <link href="${urlProject}/pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >

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
                                                            <button type="button" class="btn btn-info" onclick="location.href = '${urlInfo}/update'" >
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
                                                <th>Tên vùng</th>
                                                <th>Ngày tạo</th>
                                                <th>Ngày cập nhật</th>
                                                <th>Mô tả</th>
                                                <th>Danh sách thiết bị theo dõi</th>
                                                <th>Lịch sử vào ra</th>
                                                <th class="edit-actions">Cài đặt</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listGeofences}" var="geofence" varStatus="varStatus">
                                                <tr>
                                                    <td>${geofence.name}</td>
                                                    <td>${geofence.createTime}</td>
                                                    <td>${geofence.updateTime}</td>
                                                    <td>${geofence.description}</td>
                                                    <td><a data-toggle="modal" href="javascript:void(0)" onclick="getViaAjax(${geofence.id},'${geofence.name}');">Xem chi tiết</a></td>
                                                    <td><a href="${urlInfo}/tracking_detail?id=${geofence.id}">Xem chi tiết</a></td>

                                                    <td class="center">
                                                        <button type="button" class="btn btn-xs btn-success edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Sửa" onclick="location.href = '${urlInfo}/update?id=${geofence.id}'">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                        </button>

                                                        <button type="button" class="btn btn-xs btn-danger edit-Template " data-toggle="modal" 
                                                                data-placement="top" title="Xóa" onclick="deleteViaAjax(${geofence.id});" id="delete-geofence">
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
        <script src="${urlProject}/pages/js/pnotify.custom.min.js"></script>                                                });
       
        <!-- ADD VIEW FORM -->
        <%@include file="geofence_device_view.jsp"%>


    </body>
</html>