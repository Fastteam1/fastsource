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
                    <h4 class="modal-title" >Game Template Form</h4>
                </div>
                <form action="" method="POST" class="form-horizontal" id="viewForm" >
                    <div class="modal-body">

                        <div class="form-group hidden"> 
                            <label for="id-input" class="col-sm-2 control-label">ID</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="viewForm-id" placeholder="id" name="id" >
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="name-input" class="col-sm-2 control-label">Tên Thiet Bi</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="viewForm-name" placeholder="name" name="name" required>
                            </div>
                        </div>   

                        <spring:bind path="phone">
                            <div class="form-group">
                                <label for="phone-input" class="col-sm-2 control-label">Loại thiết bị</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-type" placeholder="phone" name="phone" required>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="address">
                            <div class="form-group">
                                <label for="address-input" class="col-sm-2 control-label">Số IMEI</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-imei" placeholder="address" name="address" required>
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="email">
                            <div class="form-group">
                                <label for="email-input" class="col-sm-2 control-label">Hệ điều hành</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-os" placeholder="email" name="email" required>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="description-input" class="col-sm-2 control-label">Số điện thoại</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-phone" placeholder="description" name="description" required>
                                </div>
                            </div>   
                        </spring:bind>



                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="button" onclick="saveChangeClick();"class="btn btn-primary">Save changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script type="text/javascript" lang="javascript">
             
        function saveChangeClick() {
            alert("cai lozl");
            event.preventDefault();
            editViaAjax();
        }
        function getViaAjax(objId) {
            
            alert("getViaAjax");

            var json = {
                "deviceId": objId
            };
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "device/getdetail",
                data: json,
                dataType: 'json',
                timeout: 100000,
                cache: false,
                async: false,
                success: function (data) {
                    alert('1');
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
                        window.location.href = "/SpringMVC_EFinder/login";
                    }
                },
                error: function (e) {
                    alert("Có lỗi xảy ra. Vui lòng đăng nhập lại!");
                    window.location.href = "/SpringMVC_EFinder/login";
                }
            });
        }

        function editViaAjax() {
            var edit = {};

            edit["id"] = $("#viewForm-id").val().trim();
            edit["name"] = $("#viewForm-name").val().trim();
            edit["type"] = $("#viewForm-type").val().trim();
            edit["imei"] = $("#viewForm-imei").val().trim();
            edit["os"] = $("#viewForm-os").val().trim();
            edit["phone"] = $("#viewForm-phone").val().trim();

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "device/update",
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
                            closer_hover: false,
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
        function showForm(data) {
            $("#viewForm-id").val(data.id);
            $("#viewForm-name").val(data.name);
            $("#viewForm-type").val(data.type);
            $("#viewForm-imei").val(data.imei);
            $("#viewForm-os").val(data.os);
            $("#viewForm-phone").val(data.msisdn);
            $('#ojectView').modal('show');
        }
        
        function deleteViaAjax(objId) {

            if (objId === null || objId === "") {
                objId = parseInt($("#viewForm-id").val());
            }

            if (objId !== null) {
                var confirm_check = confirm("${deleteConfirmMessage}");
                if (confirm_check === true) {
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "${pageInfo.url}/delete/" + objId,
                        data: JSON.stringify(""),
                        dataType: 'json',
                        timeout: 100000,
                        success: function (data) {
                            console.log("SUCCESS: ", data);
                            alert(data.msg);
                            $('#ojectView').modal('hide');
                            goToPage("${pageInfo.url}/list/", ${pageInfo.destPage});
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                            alert(e.msg);
                        },
                        done: function (e) {
                            console.log("DONE");
                            enableButton("btn-edit", true);
                            enableButton("btn-delete", true);
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