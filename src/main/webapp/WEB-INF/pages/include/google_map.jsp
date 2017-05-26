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

        <title>Simple GeoJSON Editor</title>
        <link href="pages/css/styles.css" title="compact" rel="stylesheet" type="text/css">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="https://maps.googleapis.com/maps/api/js?v=3.27&key=AIzaSyBjuAChAvGlJKZYOrB1r3ToLKd-PkjfOps&region=VI&libraries=drawing" type="text/javascript"></script>
        <script src="pages/js/editor.js" type="text/javascript"></script>
        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>



    </head>

    <body>
        <div id="panel">
            <div id="panel-content">
                <div id="panel-title">Cập nhật vùng địa lý</div>
                <hr/>

                <form action="" method="POST" class="form-horizontal" id="viewForm">
                    <div class="modal-body">
                        <spring:bind path="id">
                            <div class="form-group hidden"> 
                                <label for="id-input" class="col-sm-3 control-label">ID</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="viewForm-id" placeholder="id" name="id" >
                                </div>
                            </div>
                        </spring:bind>

                        <spring:bind path="name">
                            <div class="form-group">
                                <label for="name-input" class="col-sm-3 control-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="viewForm-name" placeholder="name" name="name" required
                                           value="${editGeofence.name}">
                                </div>
                            </div>   
                        </spring:bind>
                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="description-input" class="col-sm-3 control-label">Mô tả</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="viewForm-description" placeholder="description" name="description" required>
                                        ${editGeofence.description} 
                                    </textarea>
                                </div>
                            </div>   
                        </spring:bind>
                        <textarea class="" id="geojson-input"
                                  placeholder="Drag and drop GeoJSON onto the map or paste it here to begin editing.">
                            ${editGeofence.location}
                        </textarea>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="delete-button">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
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
    </body>
</html>



