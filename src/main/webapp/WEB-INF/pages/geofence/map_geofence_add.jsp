<%-- 
    Document   : google_map
    Created on : May 24, 2017, 1:43:39 PM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title>Thêm mới vùng địa lý</title>
        <link href="${urlProject}/pages/css/styles.css" title="compact" rel="stylesheet" type="text/css">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${urlProject}/bootstrap/css/bootstrap.min.css">
        <!-- PNotify. -->
        <link href="${urlProject}/pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >
        <script src="https://maps.googleapis.com/maps/api/js?v=3.27&key=AIzaSyBjuAChAvGlJKZYOrB1r3ToLKd-PkjfOps&region=VI&libraries=drawing" type="text/javascript"></script>
        <script src="${urlProject}/pages/js/geofence.map.js" type="text/javascript"></script>
        <!-- jQuery 2.2.3 -->
        <script src="${urlProject}/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="${urlProject}/bootstrap/js/bootstrap.min.js"></script>
        <!-- PNotify -->
        <script src="${urlProject}/pages/js/pnotify.custom.min.js"></script>



    </head>

    <body>
        <div id="panel">
            <div id="panel-content">
                <div id="panel-title">Thêm mới vùng địa lý</div>
                <hr/>

                <form action="" method="POST" class="form-horizontal" id="addForm">
                    <div class="modal-body">
                        <spring:bind path="id">
                            <div class="form-group hidden"> 
                                <label for="id-input" class="col-sm-3 control-label">ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-id" placeholder="id" name="id" 
                                           value="${editGeofence.id}">
                                </div>
                            </div>
                        </spring:bind>

                        <spring:bind path="name">
                            <div class="form-group">
                                <label for="name-input" class="col-sm-3 control-label">Tên</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-name" placeholder="name" name="name" required
                                           value="${editGeofence.name}" >
                                </div>
                            </div>   
                        </spring:bind>
                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="description-input" class="col-sm-3 control-label">Mô tả</label>
                                <div class="col-sm-9">

                                    <input type="text" class="form-control" id="addForm-description" placeholder="description" name="description" required
                                           value="${editGeofence.description}">
                                </div>
                            </div>   
                        </spring:bind>
                        <textarea class="hidden" id="geojson-input"
                                  placeholder="Drag and drop GeoJSON onto the map or paste it here to begin adding.">
                            value="${editGeofence.location}"
                        </textarea>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" onclick="top.location.href = '${urlProject}/geoFenceList'">Trở về</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="delete-button">Xóa</button>
                        <button type="submit" class="btn btn-primary">Thêm mới</button>
                    </div>
                </form>

            </div>
        </div>

        <div id="map-container">
            <div id="map-holder"></div>

            <div id="drop-container">
                <div id="drop-silhouette"></div>
            </div>
        </div>

        <script>
            $(document).on('submit', '#addForm', function (e) {
                event.preventDefault();

                var confirm_check = confirm("${addGeofenceTitle}");
                if (confirm_check === true) {
                    addViaAjax();
                }
            });

            function addViaAjax() {
                var add = {};

                add["id"] = $("#addForm-id").val().trim();
                add["name"] = $("#addForm-name").val().trim();
                add["description"] = $("#addForm-description").val().trim();
                add["location"] = $("#geojson-input").val().trim();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "${urlInfo}/insert",
                    data: JSON.stringify(add),
                    dataType: 'text',
                    timeout: 100000,
                    success: function (data) {
                        console.log(data);
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
                                closer_hover: false
                            }
                        });

                        if (type !== 'error') {
                            window.top.location.href = "${urlProject}/geoFenceList";

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
                                    closer_hover: false
                                }
                            });
                        }
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                        new PNotify({
                            title: "Thông báo",
                            text: "Có lỗi xảy ra",
                            type: "error",
                            delay: 3000,
                            styling: "jqueryui",
                            addclass: 'custom-notif',
                            mouse_reset: false,
                            buttons: {
                                sticker: false,
                                closer_hover: false
                            }
                        });
                    },
                    done: function (e) {
                        console.log("DONE");
                    }
                });
            }
        </script>
    </body>
</html>



