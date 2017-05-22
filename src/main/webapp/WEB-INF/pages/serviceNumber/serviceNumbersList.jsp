<%-- 
    Document   : gameCategoryList
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
        <title>SMSGame | Đầu số</title>
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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Đầu số
                        <small>Danh sách đầu số</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tiến trình game</a></li>
                        <li class="active">Đầu số</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table class="table table-hover" style="width: 35%">
                                        <thead>
                                            <tr>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-search"></i>
                                                            </div>
                                                            <input type="text" class="form-control" placeholder="Đầu số...">

                                                        </div>
                                                    </div>

                                                </td>

                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <button type="button" class="btn btn-info">
                                                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> Tìm kiếm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <a data-toggle="modal" href="#insert-modal" id ="add-form">
                                                                <button type="button" class="btn btn-info">
                                                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Thêm mới
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                            <tr>
                                        </thead>
                                    </table>


                                    <table id="example1" class="table table-bordered">
                                        <thead>

                                            <tr>
                                                <th>ID</th>
                                                <th>Đầu số</th>
                                                <th>Địa chỉ IP</th>
                                                <th>Ngày tạo</th>
                                                <th>Cổng</th>
                                                <th>Mô tả</th>
                                                <th class="edit-actions">Sửa</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listServiceNumbers}" var="serviceNumberInfo" varStatus="varStatus">
                                                <tr>
                                                    <td>${serviceNumberInfo.serviceNumberId}</td>
                                                    <td>${serviceNumberInfo.serviceNumber}</td>
                                                    <td>${serviceNumberInfo.ipAddress}</td>
                                                    <td>
                                                        <fmt:formatDate value="${serviceNumberInfo.createTime}" pattern="dd-MM-yyyy HH:mm"/>
                                                    </td>
                                                    <td>${serviceNumberInfo.port}</td>
                                                    <td>${serviceNumberInfo.description}</td>

                                                    <td class="edit-actions"><button type="button" class="btn btn-xs btn-success edit-ServiceNumber" data-toggle="modal" data-target="#insert-modal">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            <div class="hidden serviceNumberId">${serviceNumberInfo.serviceNumberId}</div>
                                                            <div class="hidden serviceNumber">${serviceNumberInfo.serviceNumber}</div>
                                                            <div class="hidden ipAddress">${serviceNumberInfo.ipAddress}</div>
                                                            <div class="hidden createTime">${serviceNumberInfo.createTime}</div>
                                                            <div class="hidden port">${serviceNumberInfo.port}</div>
                                                            <div class="hidden description">${serviceNumberInfo.description}</div>
                                                        </button></td>
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

                    <%@include file="../serviceNumber/serviceNumbers.jsp" %>

                    <!-- Modal form-->


                    <!-- end of modal ------------------------------>
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
        <script>
            var rh = rh || {};
            rh.mq = rh.mq || {};
            rh.mq.editing = false;
            rh.mq.attachEventHanlers = function () {
                $("#insert-modal").on('shown.bs.modal', function () {
                    $("input[name=serviceNumber]").focus();
                });
            };
            rh.mq.enableButtons = function () {

                $("#add-form").click(function () {

                    $('#serviceNumber-input').removeAttr('disabled');

                    $("#insert-modal .modal-title").html("Thêm mới đầu số");
                    $("#insert-modal button[type=submit]").html("Thêm mới");

                    $("#insert-modal input[name=serviceNumberId]").val(0)
                    $("#insert-modal input[name=serviceNumber]").val("");
                    $("#insert-modal input[name=ipAddress]").val("");
                    $("#insert-modal input[name=port]").val("");
                    $("#insert-modal textarea[name=description]").val("");
                });

                $("#example1").on("click", ".edit-ServiceNumber", function () {
                    $("#insert-modal .modal-title").html("Cập nhật đầu số");
                    $("#insert-modal button[type=submit]").html("Cập nhật");
                    serviceNumberId = $(this).find(".serviceNumberId").html();
                    serviceNumber = $(this).find(".serviceNumber").html();
                    ipAddress = $(this).find(".ipAddress").html();
                    port = $(this).find(".port").html();
                    description = $(this).find(".description").html();

                    $("#insert-modal input[name=serviceNumber]").val(serviceNumber);
                    $("#insert-modal textarea[name=description]").val(description);
                    $("#insert-modal input[name=ipAddress]").val(ipAddress);
                    $("#insert-modal input[name=port]").val(port);
                    $("#insert-modal input[name=serviceNumberId]").val(serviceNumberId);

                    $('#serviceNumber-input').attr('disabled', 'disabled');
                });
            };

            $(document).ready(function () {
                rh.mq.attachEventHanlers();
                rh.mq.enableButtons();

            });

        </script>
        <script>
            document.getElementById("GameProcess").className = "active";
            document.getElementById("ServiceNumber").className = "active";
        </script>
        <script>

            $(function () {
                $("#example1").DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "searching": false,
                    "columnDefs": [
                        {"width": "6%", "aTargets": [0]},
                        {"width": "10%", "aTargets": [1]},
                        {"width": "15%", "aTargets": [2]},
                        {"width": "15%", "aTargets": [3]},
                        {"width": "10%", "aTargets": [4]},
                        {"width": "25%", "aTargets": [5]},
                        {"width": "6%", "aTargets": [6]}
                    ],
                });
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                });
                //Money Euro
                $("[data-mask]").inputmask();
                //Datetime picker
                $(function () {
                    $('#datetimepicker1').datetimepicker({
                        defaultDate: new Date(),
                        format: 'DD/MM/YYYY hh:mm A',
                        toolbarPlacement: 'bottom',
                        showClose: true,
                        keepInvalid: false,
                        tooltips: {
                            today: 'Go to today',
                            clear: 'Clear selection',
                            close: 'Close the picker',
                            selectMonth: 'Select Month',
                            prevMonth: 'Previous Month',
                            nextMonth: 'Next Month',
                            selectYear: 'Select Year',
                            prevYear: 'Previous Year',
                            nextYear: 'Next Year',
                            selectDecade: 'Select Decade',
                            prevDecade: 'Previous Decade',
                            nextDecade: 'Next Decade',
                            prevCentury: 'Previous Century',
                            nextCentury: 'Next Century'
                        }
                    });
                });
            });
        </script>

        <script>
            $(document).on('submit', '#data-form', function (e) {

                e.preventDefault();

                var serviceNumberId = $('#id-input').val();
                var serviceNumber = $('#serviceNumber-input').val();
                var ipAddress = $('#ipAddress-input').val();
                var port = $('#port-input').val();
                var description = $('#description-input').val();
                var json = {
                    "serviceNumberId": serviceNumberId,
                    "serviceNumber": serviceNumber,
                    "description": description,
                    "ipAddress": ipAddress,
                    "port": port
                };

                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'text',
                    url: 'serviceNumbers',
                    data: JSON.stringify(json),
                    success: function (data) {
                        $('#insert-modal').modal("hide");
                        var type = $.trim(data.toString()).split('|')[1];
                        if (type === undefined) {
                            type = 'error';
                        }
                        console.log(type)

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



    </body>
</html>