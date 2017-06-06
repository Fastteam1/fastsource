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
                <textarea class="h" id="geojson-input"
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

        
    </body>
</html>



