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
    <div class="modal fade" id="objectAdd1" tabindex="-1" role="dialog" aria-labelledby="Thêm mới nhân viên"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Thêm mới phòng ban</h4>
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
                                <label for="name-input" class="col-sm-2 control-label">Tên phòng ban2</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-name" placeholder="name" name="name" required
                                           pattern=".*\S+.*" title="Nhập đầy đủ thông tin">
                                </div>
                            </div>   
                        </spring:bind>
                        
                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="name-input" class="col-sm-2 control-label">Mô tả</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-description" placeholder="Mô tả" name="name" required
                                           pattern=".*\S+.*" title="Nhập đầy đủ thông tin">
                                </div>
                            </div>   
                        </spring:bind>

                        

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
            alert("nguyen thien van");
            addViaAjax();
        });
        
        function addViaAjax() {
            
            var add = {};

            add["name"] = $("#addForm-name").val().trim();
            add["description"] = $("#addForm-description").val().trim();
            
            alert($("#addForm-name").val().trim());

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "department/insert",
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
                    window.location.href = "${urlProject}/departmentList";

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