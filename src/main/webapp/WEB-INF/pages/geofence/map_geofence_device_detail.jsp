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

        <title>Cập nhật vùng địa lý</title>
        <link href="${urlProject}/pages/css/styles.css" title="compact" rel="stylesheet" type="text/css">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${urlProject}/bootstrap/css/bootstrap.min.css">
        <!-- PNotify. -->
        <link href="${urlProject}/pages/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" >
        <script src="https://maps.googleapis.com/maps/api/js?v=3.27&key=AIzaSyBjuAChAvGlJKZYOrB1r3ToLKd-PkjfOps&region=VI&libraries=drawing" type="text/javascript"></script>
        <script src="${urlProject}/pages/js/geofence.map.tracking.js" type="text/javascript"></script>
        <!-- jQuery 2.2.3 -->
        <script src="${urlProject}/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="${urlProject}/bootstrap/js/bootstrap.min.js"></script>
        <!-- PNotify -->
        <script src="${urlProject}/pages/js/pnotify.custom.min.js"></script>



    </head>

    <body>
        <div id="panel" class="hidden">
            <div id="panel-content">
                <textarea class="hidden" id="geojson-input"
                          placeholder="Drag and drop GeoJSON onto the map or paste it here to begin editing.">
                    ${geoFenceInfo.location}
                </textarea>
            </div>
        </div>

        <div id="map-container" style="width: 100%">
            <div id="map-holder"></div>

            <div id="drop-container">
                <div id="drop-silhouette"></div>
            </div>
        </div>

        <script>
            $(document).on('submit', '#viewForm', function (e) {
                event.preventDefault();

                var confirm_check = confirm("${editGeofenceTitle}");
                if (confirm_check === true) {
                    editViaAjax();
                }
            });

            function editViaAjax() {
                var edit = {};

                edit["id"] = $("#viewForm-id").val().trim();
                edit["name"] = $("#viewForm-name").val().trim();
                edit["description"] = $("#viewForm-description").val().trim();
                edit["location"] = $("#geojson-input").val().trim();

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${urlInfo}/update",
                    data: JSON.stringify(edit),
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



