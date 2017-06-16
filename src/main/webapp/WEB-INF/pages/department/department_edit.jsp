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
        width: 50%;
    }
</style>



<!-- Modal -->
<body>
    <div class="modal fade" id="ojectView" tabindex="-1" role="dialog" aria-labelledby="Insert Category"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Cập nhật phòng ban</h4>
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
                            <label for="name-input" class="col-sm-2 control-label">Tên phòng ban</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="viewForm-name" placeholder="name" name="name" required>
                            </div>
                        </div>   


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

        var deviceId;

        

        function saveChangeClick() {
            event.preventDefault();

            editViaAjax();
        }
      
        function getViaAjax(objId) {
            deviceId = objId;
            var json = {
                "departmentId": objId
            };

            //  getEmployeeByDeviceId(objId);

            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "department/getdetail",
                data: json,
                dataType: 'json',
                timeout: 100000,
                cache: false,
                async: false,
                success: function (data) {
                    console.log("SUCCESS: ", data === null);
                    if (data.length !== 0) {
                        console.log("SUCCESS1: ", data === null);
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
                        alert(data === null);
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
            
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "department/update",
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
        function showForm(data) {
            alert("showForm");

            
//            demo.on('change', function () {
//                var size = demo.find(":selected").size();
//                if (size > 3) {
//                    demo.find(":selected").each(function (ind) {
//                        if (ind > 2) {
//                            $(this).filter('option:selected:last').prop("selected", false);
//                           // alert("Mỗi thiết bị chọn tối đa 3 vùng địa lý");
//                        }
//                    });
//                    demo.bootstrapDualListbox('refresh', true);
//                }
//            });


            //alert("appendChild");





            $("#viewForm-id").val(data.id);
            $("#viewForm-name").val(data.name);
            //  $('#tbodyId').load(location.href + ' #tbodyId');
            //console.log("arrGeoFences: " + data.arrGeoFences);
            $('#ojectView').modal('show');

        }

        function deleteViaAjax(objId) {

            alert("deleteViaAjax");

            if (objId === null || objId === "") {
                objId = parseInt($("#viewForm-id").val());
            }

            if (objId !== null) {
                var confirm_check = confirm("${deleteConfirmMessage}");
                if (confirm_check === true) {
                    $.ajax({
                        type: "POST",
                        url: "department/delete",
                        dataType: 'text',
                        data: {
                            "departmentId": objId
                        },
                        timeout: 100000,
                        success: function (data) {
                            var type = $.trim(data.toString()).split('|')[1];
                            if (type === undefined) {
                                type = 'error';
                            }
                            alert($.trim(data.toString()).split('|')[0]);
                            window.location.href = "${urlProject}/departmentList";
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
