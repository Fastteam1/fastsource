<%-- 
    Document   : gameTemplate
    Created on : Oct 17, 2016, 8:34:38 AM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    }
</style>




<!-- Modal -->
<body>
    <div class="modal fade" id="objectAdd" tabindex="-1" role="dialog" aria-labelledby="Thêm mới nhân viên"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Thêm mới thiết bịn</h4>
                </div>
                <form action="" method="POST" class="form-horizontal" id="addForm">
                    <div class="modal-body">
                        <spring:bind path="id">
                            <div class="form-group hidden"> 
                                <label for="id-input" class="col-sm-2 control-label">ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-id" placeholder="id" name="id" >
                                </div>
                            </div>
                        </spring:bind>

                        <spring:bind path="name">
                            <div class="form-group">
                                <label for="name-input" class="col-sm-2 control-label">Tên thiết bị</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-name" placeholder="name" name="name" required
                                           pattern=".*\S+.*" title="Nhập đầy đủ thông tin">
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="type">
                            <div class="form-group">
                                <label for="type-input" class="col-sm-2 control-label">Loại thiết bị</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-type" placeholder="type" name="type" >
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="os">
                            <div class="form-group">
                                <label for="os-input" class="col-sm-2 control-label">Hệ điều hành</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-os" placeholder="os" name="os" >
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="imei">
                            <div class="form-group">
                                <label for="imei-input" class="col-sm-2 control-label">IMEI</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-imei" placeholder="imei" name="email">
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="phone">
                            <div class="form-group">
                                <label for="phone-input" class="col-sm-2 control-label">Số điện thoại</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-phone" placeholder="phone" name="department" required>
                                </div>
                            </div>   
                        </spring:bind>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm mới</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script>
        $(document).on('submit', '#addForm', function (e) {
            event.preventDefault();
            addViaAjax();
        });
        
        function addViaAjax() {
            
            var add = {};

            add["name"] = $("#addForm-name").val().trim();
            add["type"] = $("#addForm-type").val().trim();
            add["os"] = $("#addForm-os").val().trim();
            add["imei"] = $("#addForm-imei").val().trim();
            add["msisdn"] = $("#addForm-phone").val().trim();
            alert($("#addForm-phone").val().trim());

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "device/insert",
                data: JSON.stringify(add),
                dataType: 'text',
                timeout: 100000,
                success: function (data) {
                    $('#objectAdd').modal("hide");
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
                        $('#objectAdd').on('hidden.bs.modal', function () {
                            history.go(0);
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
            
            return false;
        }

        
    </script>

</body>