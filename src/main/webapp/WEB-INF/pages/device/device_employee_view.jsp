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
    <div class="modal fade" id="ojectViewEmployee" tabindex="-1" role="dialog" aria-labelledby="Insert Category"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Danh sách nhân viên của thiết bị: <span id="name-device"></span></h4>
                </div>

                <div class="modal-body">
                    <!-- Main content -->
                    <section class="content">
                        <table id="example3" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Tên nhân viên</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Email</th>
                                    <th>Mô tả</th>
                                    <th>Bộ phận</th>
                                    <th>Start Time (h)</th>
                                    <th>End Time (h)</th>
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

        function getViaAjaxEmployee(objId, name) {

            $('#example3').DataTable({
                destroy: true,
                searching: false,
                ajax: "${urlInfo}/employeeList?id=" + objId,
                columns: [
                    {"data": "name"},
                    {"data": "phone"},
                    {"data": "address"},
                    {"data": "email"},
                    {"data": "description"},
                    {"data": "departmentName"},
                    {"data": "startTime"},
                    {"data": "endTime"}
                ]
            });
            console.log(name);
            $('#name-device').html(name);
            $('#ojectViewEmployee').modal('show');
        }

    </script>
