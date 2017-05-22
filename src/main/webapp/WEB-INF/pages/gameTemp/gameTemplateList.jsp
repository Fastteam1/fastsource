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
        <title>SMSGame | Mẫu Game</title>
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
                                        <thead>
                                            <tr>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-search"></i>
                                                            </div>
                                                            <input type="text" class="form-control" placeholder="Tên mẫu Game...">

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
                                                <th>GameTempId</th>
                                                <th>Mẫu Game</th>
                                                <th>Thể loại Game</th>
                                                <th>Mô tả</th>
                                                <th>Ngày tạo</th>
                                                <th class="edit-actions">Sửa</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listGameTemplates}" var="gametempInfo" varStatus="varStatus">
                                                <tr>
                                                    <td>${gametempInfo.gameTempId}</td>
                                                    <td>${gametempInfo.gameTempName}</td>
                                                    <td>${gametempInfo.gameCateName}</td>
                                                    <td>${gametempInfo.description}</td>
                                                    <td>
                                                        <fmt:formatDate value="${gametempInfo.createTime}" pattern="dd-MM-yyyy HH:mm"/>
                                                    </td>

                                                    <td class="edit-actions"><button type="button" class="btn btn-xs btn-success edit-Template" data-toggle="modal" data-target="#insert-modal">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            <div class="hidden gameTempId">${gametempInfo.gameTempId}</div>
                                                            <div class="hidden gameCateName">${gametempInfo.gameCateName}</div>
                                                            <div class="hidden gameCateId">${gametempInfo.gameCateId}</div>
                                                            <div class="hidden gameTempName">${gametempInfo.gameTempName}</div>
                                                            <div class="hidden description">${gametempInfo.description}</div>
                                                            <div class="hidden status">${gametempInfo.status}</div>
                                                            <div class="hidden isQuestion">${gametempInfo.isQuestion}</div>
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                            <!-- Danh sach the loai Game -->
                                        <div class="listCate hidden">${listName}</div>

                                        </tbody>

                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <%@include file="../gameTemp/gameTemplate.jsp" %>
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
            document.getElementById("GameProcess").className = "active";
            document.getElementById("GameTemp").className = "active";
        </script>
        <script>
            $(function () {
                $("#example1").DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "searching": false
                });
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true
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

        <script src="pages/js/gameTemplateJS.js">
        </script>



        <script>
            $(document).on('submit', '#gameTemplate-form', function (e) {
                e.preventDefault();
                var gameTempId = $('#gameTempId-input').val();
                var gameTempName = $('#gameTempName-input').val();
                var gameCateId = $('#category').val();
                var status = $('#status-input').val();
                var isQuestion = $('#isQuestion-input').val();
                var description = $('#description-input').val();
                var json = {
                    "gameTempId": gameTempId,
                    "gameCateId": gameCateId,
                    "gameTempName": gameTempName,
                    "description": description,
                    "status": status,
                    "isQuestion": isQuestion
                };
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'text',
                    url: 'gameTemplate',
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




        <script type="text/javascript">
            $(function () {
                var data = eval('(' + '${listName}' + ')');
                var cateList = document.getElementById("category");
                var categoryOption = new Option('-- Chọn thể loại --', "");
                cateList.options.add(categoryOption);
                for (var i = 0; i < data.length; i++) {
                    // Option (text, value)
                    var categoryOption = new Option(data[i].gameCateName, data[i].gameCateId);
                    cateList.options.add(categoryOption);
                }
            });
            //Date range picker
            $('#reservation').daterangepicker();
        </script>

    </body>
</html>