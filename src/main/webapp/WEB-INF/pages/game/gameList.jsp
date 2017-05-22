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
        <title>SMSGame | Game</title>
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
                        Game
                        <small>Danh sách Game</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Thông tin game</a></li>
                        <li class="active">Game</li>
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
                                                            <input type="text" class="form-control" placeholder="Tên Game...">

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
                                                <th>Tên Game</th>
                                                <th>Mẫu Game</th>
                                                <th>Mã Game</th>
                                                <th>Đầu số</th>
                                                <th>Mô tả</th>
                                                <th>Ngày tạo</th>
                                                <th class="edit-actions">Sửa</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listGames}" var="gameInfo" varStatus="varStatus">
                                                <tr>
                                                    <td>${gameInfo.gameId}</td>
                                                    <td>${gameInfo.gameName}</td>
                                                    <td>${gameInfo.gameTempName}</td>
                                                    <td>${gameInfo.gameCode}</td>
                                                    <td>${gameInfo.serviceNumber}</td>
                                                    <td>${gameInfo.description}</td>
                                                    <td>
                                                        <fmt:formatDate value="${gameInfo.createTime}" pattern="dd-MM-yyyy HH:mm"/>
                                                    </td>

                                                    <td class="edit-actions"><button type="button" class="btn btn-xs btn-success edit-game" data-toggle="modal" data-target="#insert-modal">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            <div class="hidden gameId">${gameInfo.gameId}</div>
                                                            <div class="hidden gameName">${gameInfo.gameName}</div>
                                                            <div class="hidden gameTempId">${gameInfo.gameTempId}</div>
                                                            <div class="hidden gameTempName">${gameInfo.gameTempName}</div>
                                                            <div class="hidden description">${gameInfo.description}</div>
                                                            <div class="hidden status">${gameInfo.status}</div>
                                                            <div class="hidden gameCode">${gameInfo.gameCode}</div>
                                                            <div class="hidden serviceNumber">${gameInfo.gameTempId}</div>
                                                            <div class="hidden serviceNumberId">${gameInfo.serviceNumberId}</div>
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                            <!-- Danh sach mau Game -->
                                        <div class="listTemplate hidden">${listTemplates}</div>
                                        </tbody>
                                    </table>
                         
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>

                    <%@include file="../game/game.jsp" %>
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
            document.getElementById("GameInfomation").className = "active";
            document.getElementById("Game").className = "active";
        </script>
        <script>
            $(function () {
                $("#example2").DataTable();
                $('#example1').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "searching": false,
                    "columnDefs": [
                        {"width": "4%", "aTargets": [0]},
                        {"width": "12%", "aTargets": [1]},
                        {"width": "15%", "aTargets": [2]},
                        {"width": "7%", "aTargets": [3]},
                        {"width": "7%", "aTargets": [4]},
                        {"width": "25%", "aTargets": [5]},
                        {"width": "10%", "aTargets": [6]},
                        {"width": "4%", "aTargets": [7]}
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




        <script type="text/javascript">

            // Danh sach the loai cua Game
            $(function () {
                var data = eval('(' + '${listTemplates}' + ')');
                //console.log("data listTemplates: " + data[1].gameTempName);
                var templateList = document.getElementById("gameTemplates-input");
                //console.log("templateList listTemplates: " + templateList);
                var templateOption = new Option('-- Chọn thể loại game --', "");
                templateList.options.add(templateOption);
                for (var i = 0; i < data.length; i++) {
                    // Option (text, value)
                    var templateOption = new Option(data[i].gameTempName, data[i].gameTempId);
                    templateList.options.add(templateOption);
                }
            });


        </script>


        <script>
            // Danh sach dau so cua game
            $(function () {
                var data = eval('(' + '${listServiceNumbers}' + ')');

                var serviceNumberList = document.getElementById("serviceNumbers-input");
                //console.log("templateList listServiceNumbers " + serviceNumberList);
                var serviceNumberOption = new Option('-- Chọn đầu số --', "");
                serviceNumberList.options.add(serviceNumberOption);
                for (var i = 0; i < data.length; i++) {
                    // Option (text, value)
                    var serviceNumberOption = new Option(data[i].serviceNumber, data[i].serviceNumberId);
                    serviceNumberList.options.add(serviceNumberOption);
                }
            });

        </script>
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
                $("#add-form").click(function () {
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

                    gameId = $(this).find(".gameId").html();
                    gameName = $(this).find(".gameName").html();
                    gameCode = $(this).find(".gameCode").html();
                    gameTempId = $(this).find(".gameTempId").html();
                    serviceNumberId = $(this).find(".serviceNumberId").html();
                    description = $(this).find(".description").html();
                    status = $(this).find(".status").html();

                    console.log("serviceNumberId " + serviceNumberId);
                    //console.log("gameName " + gameName);

                    $("#insert-modal input[name=gameId]").val(gameId);
                    $("#insert-modal input[name=gameName]").val(gameName);
                    $("#insert-modal input[name=gameCode]").val(gameCode);
                    $("#insert-modal textarea[name=description]").val(description);

                    var templateList = document.getElementById("gameTemplates-input");
                    for (var i = 0; i < templateList.options.length; ++i) {
                        templateList.options[i].selected = false;
                        if (templateList.options[i].value === gameTempId)
                            templateList.options[i].selected = true;
                    }


                    var serviceNumberList = document.getElementById("serviceNumbers-input");
                    for (var i = 0; i < serviceNumberList.options.length; ++i) {
                        serviceNumberList.options[i].selected = false;
                        if (serviceNumberList.options[i].value === serviceNumberId)
                            serviceNumberList.options[i].selected = true;
                    }

                    var statusList = document.getElementById("status-input");
                    for (var i = 0; i < statusList.options.length; ++i) {
                        statusList.options[i].selected = false;
                        if (statusList.options[i].value === status)
                            statusList.options[i].selected = true;
                    }

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