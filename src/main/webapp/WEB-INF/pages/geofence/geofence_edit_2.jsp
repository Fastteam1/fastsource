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
    <div class="modal fade" id="ojectView" tabindex="-1" role="dialog" aria-labelledby="Insert Category"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Cập nhật vùng địa lý</h4>
                </div>
                <form action="" method="POST" class="form-horizontal" id="viewForm">
                    <div class="modal-body">
                        <spring:bind path="id">
                            <div class="form-group hidden"> 
                                <label for="id-input" class="col-sm-2 control-label">ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-id" placeholder="id" name="id" >
                                </div>
                            </div>
                        </spring:bind>

                        <spring:bind path="name">
                            <div class="form-group">
                                <label for="name-input" class="col-sm-2 control-label">Tên nhân viên</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-name" placeholder="name" name="name" required
                                           pattern=".*\S+.*" title="Nhập đầy đủ thông tin">
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="phone">
                            <div class="form-group">
                                <label for="phone-input" class="col-sm-2 control-label">Điện thoại</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-phone" placeholder="phone" name="phone" required
                                           data-inputmask='"mask": ["01999999999", "0999999999"]' data-mask>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="address">
                            <div class="form-group">
                                <label for="address-input" class="col-sm-2 control-label">Địa chỉ</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-address" placeholder="address" name="address" required>
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="email">
                            <div class="form-group">
                                <label for="email-input" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="viewForm-email" placeholder="email" name="email" required>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="department">
                            <div class="form-group">
                                <label for="department-input" class="col-sm-2 control-label">Bộ phận</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-department" placeholder="department" name="department" required>
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="description-input" class="col-sm-2 control-label">Mô tả</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-description" placeholder="description" name="description" required>
                                </div>
                            </div>   
                        </spring:bind>



                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script>
        $(document).on('submit', '#viewForm', function (e) {
            event.preventDefault();
            editViaAjax();
        });

        $("[data-mask]").inputmask();

        function getViaAjax(objId) {

            var json = {
                "employeeId": objId
            };
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "${urlInfo}/getdetail",
                data: json,
                dataType: 'json',
                timeout: 100000,
                success: function (data) {
                    console.log("SUCCESS: ", data === null);
                    if (data.length !== 0) {
                        showForm(data[0]);
                    } else if (data.length !== 0) {
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
                    } else {
                        window.location.href = "${urlProject}/login";
                    }
                },
                error: function (e) {
                    alert("Có lỗi xảy ra. Vui lòng đăng nhập lại!");
                    window.location.href = "${urlProject}/login";
                }
            });
        }

        function showForm(data) {
            $("#viewForm-id").val(data.id);
            $("#viewForm-name").val(data.name);
            $("#viewForm-phone").val(data.phone);
            $("#viewForm-email").val(data.email);
            $("#viewForm-address").val(data.address);
            $("#viewForm-department").val(data.department);
            $("#viewForm-description").val(data.description);
            $('#ojectView').modal('show');
        }


        function editViaAjax() {
            var edit = {};

            edit["id"] = $("#viewForm-id").val().trim();
            edit["name"] = $("#viewForm-name").val().trim();
            edit["phone"] = $("#viewForm-phone").val().trim();
            edit["description"] = $("#viewForm-description").val().trim();
            edit["address"] = $("#viewForm-address").val().trim();
            edit["department"] = $("#viewForm-department").val().trim();
            edit["email"] = $("#viewForm-email").val().trim();

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "${urlInfo}/update",
                data: JSON.stringify(edit),
                dataType: 'text',
                timeout: 100000,
                success: function (data) {
                    $('#ojectView').modal("hide");
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
                        $('#ojectView').on('hidden.bs.modal', function () {
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
        }

        function deleteViaAjax(objId) {

            if (objId === null || objId === "") {
                objId = parseInt($("#viewForm-id").val());
            }

            if (objId !== null) {
                var confirm_check = confirm("${deleteConfirmMessage}");
                if (confirm_check === true) {
                    $.ajax({
                        type: "POST",
                        url: "${urlInfo}/deactive",
                        dataType: 'text',
                        data: {
                            "employeeId": objId
                        },
                        timeout: 100000,
                        success: function (data) {
                            var type = $.trim(data.toString()).split('|')[1];
                            if (type === undefined) {
                                type = 'error';
                            }
                            alert($.trim(data.toString()).split('|')[0]);
                            window.location.href = "${urlProject}/employeeList";
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

                } else {
                    return;
                }
            } else {
                return;
            }
        }
    </script>

</body>