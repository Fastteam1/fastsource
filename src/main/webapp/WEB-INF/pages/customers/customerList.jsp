<%-- 
    Document   : gameList
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
        <title>SMSGame | Customers</title>
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
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <!-- PNotify. -->
        <link href="pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Chăm sóc khách hàng
                        <small>Danh sách khách hàng</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Chăm sóc khách hàng</a></li>
                        <li class="active">Khách hàng</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Danh sách khách hàng</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Số điện thoại</th>
                                                <th>Ngày tham gia</th>
                                                <th>Mô tả</th>
                                                <th>Trạng thái</th>
                                                <th class="edit-actions">Lịch sử đăng ký hủy</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listCustomer}" var="customerInfo" varStatus="varStatus">
                                                <tr>
                                                    <td>${customerInfo.msisdn}</td>
                                                    <td>
                                                        <fmt:formatDate value="${customerInfo.createTime}" pattern="dd-MM-yyyy HH:mm"/>
                                                    </td>
                                                    <td>${customerInfo.description}</td>
                                                    <td>${customerInfo.status}</td>
                                                    <td class="edit-actions"><button id = "subscription" type="button" class="btn btn-xs btn-success edit-game" data-toggle="modal" data-target="#insert-modal">
                                                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                            <div class="hidden customerId">${customerInfo.customerId}</div>
                                                            <div class="listSubInfo hidden">${customerInfo.listSubscriptionsLogInfos}</div>
                                                            Chi tiết lịch sử</button>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                            <!-- Danh sach mau Game -->


                                        </tbody>

                                    </table>                 

                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <%@include file="../customers/customer.jsp" %> 
                    <!-- /.row -->
                </section>
            </div>

            <jsp:include page="../include/footer.jsp" />
            <jsp:include page="../include/setting.jsp" />
            <!-- ./wrapper -->
        </div>
        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQueryUI/jquery-ui.min.js"></script>
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

        <script>
            document.getElementById("CareKH").className = "active";
            document.getElementById("History").className = "active";
        </script>
        <script>
            $(function () {

                $('#example1').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autowidth": true,
                    "columnDefs": [
                        {"width": "10%", "aTargets": [0]},
                        {"width": "10%", "aTargets": [1]},
                        {"width": "10%", "aTargets": [2]},
                        {"width": "6%", "aTargets": [3]},
                        {"width": "6%", "aTargets": [4]}
                    ],
                });
            });
        </script>

        <script>
            $(document).on('submit', '#data-form', function (e) {
                e.preventDefault();
                var gameId = $('#gameId-input').val();
                var gameName = $('#gameName-input').val();
                var gameCode = $('#gameCode-input').val();
                var gameTempId = $('#gameTemplates-input').val();
                var serviceNumberId = $('#serviceNumbers-input').val();
                var status = $('#status-input').val();
                var description = $('#description-input').val();
                var json = {
                    "gameTempId": gameTempId,
                    "gameId": gameId,
                    "gameName": gameName,
                    "gameCode": gameCode,
                    "description": description,
                    "status": status,
                    "serviceNumberId": serviceNumberId
                };
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'text',
                    url: 'game',
                    data: JSON.stringify(json),
                    success: function (data) {
                        $('#insert-modal').modal("hide");
                        var type = $.trim(data.toString()).split('|')[1];
                        if (type === undefined) {
                            type = 'error';
                        }
                        new PNotify({
                            title: "Thông báo",
                            text: $.trim(data.toString()).split('|')[0],
                            type: type,
                            delay: 3000,
                            styling: "jqueryui",
                            addclass: 'custom-notif',
                            mouse_reset: false,
                            buttons: {
                                sticker: false,
                                closer_hover: false,
                            }
                        });
                        if (type !== 'error') {
                            $('#insert-modal').on('hidden.bs.modal', function () {
                                history.go(0);
                            });
                        }

                    }
                });
                return false;
            });
        </script>



        <!--        <script>
                    $(document).on("click", '#subscription', function (e) {
                        console.log("Vao roi nhe");
                    });
        
                </script>-->



        <script>

            var rh = rh || {};
            rh.mq = rh.mq || {};
            rh.mq.editing = false;
            rh.mq.attachEventHanlers = function () {
                $("#insert-modal").on('shown.bs.modal', function () {
                    $("input[name=gameName]").focus();
                });
            };
            rh.mq.enableButtons = function () {
                $("#add-game").click(function () {
                    $("#insert-modal .modal-title").html("Thêm mới Game");
                    $("#insert-modal button[type=submit]").html("Thêm mới");
                    $("#insert-modal input[name=gameName]").val("");
                    $("#insert-modal input[name=gameCode]").val("");
                    $("#insert-modal textarea[name=description]").val("");
                    $("#insert-modal input[name=gameId]").val(0);
                    var templateList = document.getElementById("gameTemplates-input");
                    for (var i = 0; i < templateList.options.length; ++i) {
                        templateList.options[i].selected = false;
                    }

                    var serviceNumberList = document.getElementById("serviceNumbers-input");
                    for (var i = 0; i < serviceNumberList.options.length; ++i) {
                        serviceNumberList.options[i].selected = false;
                    }

                    var statusList = document.getElementById("status-input");
                    for (var i = 0; i < statusList.options.length; ++i) {
                        statusList.options[i].selected = false;
                    }

                });
                $("#example1").on("click", ".edit-game", function () {
                    $("#insert-modal .modal-title").html("Cập nhật Game");
                    $("#insert-modal button[type=submit]").html("Cập nhật");
                    customerId = $(this).find(".customerId").html();
                    console.log("customerId " + customerId);
                    var json = {
                        "customerId": customerId
                    };
                    console.log(json);
                    var table = $('#example2').DataTable({
                        "processing": true,
                        "ajax": {
                            type: 'POST',
                            url: 'customer',
                            data: json,
                            dataSrc: function (data) {
                                return data.data;
                            }
                        },
                        "columns": [
                            {"data": "msisdn"},
                            {"data": "regTime"},
                            {"data": "regChannel"},
                            {"data": "startTime"},
                            {"data": "endTime"},
                            {"data": "delTime"}
                        ]

                    });


                    //var oTable = $('#example2').dataTable();
                    //oTable.fnClearTable();

//                    $.ajax({
//                        type: 'POST',
//                        url: 'customer',
//                        data: json,
//                        success: function (data) {
//                            console.log(data);
//                            //$('#example2').dataTable().clear;
//                            $('#example2').dataTable({
//                                "data": data,
//                                "columns": [
//                                    {"data": "msisdn"},
//                                    {"data": "regTime"},
//                                    {"data": "regChannel"},
//                                    {"data": "startTime"},
//                                    {"data": "endTime"},
//                                    {"data": "delTime"}
//                                ]
//
//                            });
//                        }
//                    });
                    return true;
                });
            };
            $(document).ready(function () {
                rh.mq.attachEventHanlers();
                rh.mq.enableButtons();
            });
        </script>

        <script>

            // Jquery draggable
            $('.modal-dialog').draggable({
                handle: ".modal-header"
            });

        </script>

    </body>
</html>