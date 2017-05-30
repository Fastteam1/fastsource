<%-- 
    Document   : geofence_device_view
    Created on : May 26, 2017, 4:30:11 PM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<style>
    .modal-dialog {
        position: absolute;
        top: 120px;
        right: 50px;
        bottom: 0;
        left: 50px;
        z-index: 10040;
        overflow: auto;
        overflow-y: auto;
        width: 60%
    }
</style>




<!-- Modal -->
<body>
    <div class="modal fade" id="ojectView" tabindex="-1" role="dialog" aria-labelledby="Insert Category"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Danh sách thiết bị vùng: <span id="name-geofence"></span></h4>
                </div>

                <div class="modal-body">
                    <!-- Main content -->
                    <section class="content">
                        <table id="example2" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Tên thiết bị</th>
                                    <th>Loại thiết bị</th>
                                    <th>IMEI</th>
                                    <th>OS</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Địa Chỉ Hiện Tại</th>
                                </tr>
                            </thead>

                        </table>
                    </section>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>


            </div>
        </div>
    </div>


    <script>

        function getViaAjax(objId, name) {

            $('#example2').DataTable({
                destroy: true,
                searching: false,
                ajax: "${urlInfo}/deviceList?id=" + objId,
                columns: [
                    {"data": "name"},
                    {"data": "type"},
                    {"data": "imei"},
                    {"data": "os"},
                    {"data": "msisdn"},
                    {"data": "currentAddress"}
                ]
            });
            console.log(name);
            $('#name-geofence').html(name);
            $('#ojectView').modal('show');
        }

    </script>
