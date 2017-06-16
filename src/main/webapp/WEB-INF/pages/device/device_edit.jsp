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
                    <h4 class="modal-title" >Cập nhật thiết bị</h4>
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
                            <label for="name-input" class="col-sm-2 control-label">Tên thiết bị</label>
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


                        <spring:bind path="arrGeoFences">
                            <div class="form-group">
                                <label for="arrGeoFences-input" class="col-sm-2 control-label">${arrGeoFences}</label>
                                <div class="col-sm-9">
                                    <form:select id="viewForm-arrGeoFences" path="arrGeoFences" class="form-control" multiple="true" name="duallistbox-geofence-view[]">
                                        <c:if test="${not empty listGeoFences}"> 
                                            <c:forEach var="geofence" items="${listGeoFences}">
                                                <form:option value="${geofence.getId()}" label="${geofence.getName()}" />
                                            </c:forEach>
                                        </c:if>
                                    </form:select>
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
                        <div class="panel panel-default">
                            <div class="panel-body"> 
                                <div class="modal-body">
                                    <!-- Main content -->
                                    <section class="content">
                                        <!--                                        <table id="example3" class="table table-bordered">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Tên nhân viên</th>
                                                                                            <th>Start Time</th>
                                                                                            <th>End Time</th>
                                                                                            <th>Cài đặt</th>
                                        
                                                                                        </tr>
                                                                                    </thead>
                                        
                                                                                </table>-->
                                        <table id="example1" class="table table-bordered">
                                            <thead>
                                                <tr >
                                                    <th class="text-center">Tên nhân viên2</th>
                                                    <th class="text-center">Start time</th>
                                                    <th class="text-center">End time</th>
                                                    <th class="edit-actions text-center">Cài đặt</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyId">



                                            </tbody>

                                        </table>
                                    </section>

                                </div>

                                <!--                                <div class="form-group">
                                                                    <div class="col-sm-4">
                                                                        <label>Nhân viên</label>
                                                                        <select class="form-control" id="selectEmployee">
                                                                            <c:forEach items="${listEmployees}" var="employee" varStatus="varStatus">
                                                                                <option value="${employee.id}">${employee.name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <label>Start Time</label>
                                                                        <div class="">
                                                                            <input type="number" id="viewForm-startTime" placeholder="Start Time" name="description" required="" class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <label>End Time</label>
                                                                        <div class="">
                                                                            <input type="number" id="viewForm-endTime" placeholder="End Time" name="description" required="" class="form-control">
                                                                        </div>
                                                                    </div>
                                
                                                                </div>-->
                                <div class="form-group"> 
                                    <div class="col-md-12">
                                        <div class="pull-right">
                                            <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary">Add</button>
                                        </div>
                                    </div>


                                </div>
                                <!-- Modal -->

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

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="form-group">
                    <div class="col-sm-4">
                        <label>Nhân viên</label>
                        <select class="form-control" id="selectEmployee">
                            <c:forEach items="${listEmployees}" var="employee" varStatus="varStatus">
                                <option value="${employee.id}">${employee.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <label>Start Time</label>
                        <div class="">
                            <input type="number" id="viewForm-startTime" placeholder="Start Time" name="description" required="" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label>End Time</label>
                        <div class="">
                            <input type="number" id="viewForm-endTime" placeholder="End Time" name="description" required="" class="form-control">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addEmployee()">Thêm</button>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript" lang="javascript">

        var deviceId;

        function addEmployee() {
            var employeeId = $('#selectEmployee').val();
            var startTime = $('#viewForm-startTime').val();
            var endTime = $('#viewForm-endTime').val();
            alert(deviceId);
            alert(employeeId);
            alert("addEmployee");
            var json = {
                "employeeId": employeeId,
                "deviceId": deviceId,
                "startTime": startTime,
                "endTime": endTime
            };
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "device/insertEmployee",
                data: json,
                dataType: 'text',
                timeout: 100000,
                success: function (data) {
                    alert('SUCCESS:');
                    $('#myModal').modal("hide");;
                    console.log("SUCCESS: ", data === null);
                    if (data.length !== 0) {
                        //  showForm(data[0]);
                        getEmployeeTimeList(deviceId);

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
                    alert("Có lỗi xảy ra. Vui lòng đăng nhập lại! error: function (e)");
                    // window.location.href = "/SpringMVC_EFinder/login";
                }
            });
        }

        function saveChangeClick() {
            event.preventDefault();

            var demo = $('select[name="duallistbox-geofence-view[]"]').bootstrapDualListbox();
            var size = demo.find(":selected").size();

            if (size > 3) {
                alert("Mỗi thiết bị chọn tối đa 3 vùng địa lý");
            }

            console.log($("#viewForm-arrGeoFences").val());
            editViaAjax();
        }
        function getViaAjax(objId) {
            deviceId = objId;
            var json = {
                "deviceId": objId
            };

            //  getEmployeeByDeviceId(objId);

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

        function getEmployeeTimeList(objId) {
            deviceId = objId;
            var json = {
                "deviceId": objId
            };

            //  getEmployeeByDeviceId(objId);

            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "device/employeeTimeList",
                data: json,
                dataType: 'json',
                timeout: 100000,
                cache: false,
                async: false,
                success: function (data) {
                    console.log("data = " + data);
                    $html = "";
                    for (i = 0; i < data.length; i++) {
                        alert(data[i].deviceEmployeeId)
                        $html += "<tr>";
                        $html += '<td class="text-center">' + data[i].name + '</td>';
                        $html += '<td class="text-center">' + data[i].startTime + '</td>';
                        $html += '<td class="text-center">' + data[i].endTime + '</td>';
                        $html += '<td class="edit-actions text-center">';
                        $html += '<button type="button" class="btn btn-xs btn-success edit-Template" data-toggle="modal" data-placement="top" title="View" onclick="getViaAjax(' + data[i].deviceEmployeeId + ');">';
                        $html += '      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>';
                        $html += '  </button>';
                        $html += ' <button type="button" class="btn btn-xs btn-danger edit-Template " data-toggle="modal" data-placement="top" title="Xóa" onclick="deleteDeviceEmployee(' + data[i].deviceEmployeeId + ');" id="delete-device">';
                        $html += '      <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>';
                        $html += '  </button>';
                        $html += '</td>';
                        $html += '</tr>';
                    }
                    console.log("$html = " + $html);
                    $('#tbodyId').html($html);
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
            edit["phone"] = $("#viewForm-phone").val();
            edit["arrGeoFences"] = $("#viewForm-arrGeoFences").val();
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

            var strArrGeoFences = data.arrGeoFences.toString();
            var arrGeoFences = strArrGeoFences.split(","),
                    i = 0, size = arrGeoFences.length,
                    $options = $('#viewForm-arrGeoFences option');

            $("#viewForm-arrGeoFences option:selected").prop("selected", false);
            for (i; i < size; i++) {
                $options.filter('[value="' + arrGeoFences[i] + '"]').prop('selected', true);
            }
            var demo = $('select[name="duallistbox-geofence-view[]"]').bootstrapDualListbox();
            demo.bootstrapDualListbox('refresh', true);

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

            getEmployeeTimeList(data.id);



            $("#viewForm-id").val(data.id);
            $("#viewForm-name").val(data.name);
            $("#viewForm-type").val(data.type);
            $("#viewForm-imei").val(data.imei);
            $("#viewForm-os").val(data.os);
            $("#viewForm-phone").val(data.msisdn);
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
                        url: "device/deactive",
                        dataType: 'text',
                        data: {
                            "deviceId": objId
                        },
                        timeout: 100000,
                        success: function (data) {
                            var type = $.trim(data.toString()).split('|')[1];
                            if (type === undefined) {
                                type = 'error';
                            }
                            alert($.trim(data.toString()).split('|')[0]);
                            window.location.href = "${urlProject}/deviceList";
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
        

        function deleteDeviceEmployee(objId) {


            alert(objId);


            if (objId === null || objId === "") {
                objId = parseInt($("#viewForm-id").val());
            }

            if (objId !== null) {
                var confirm_check = confirm("${deleteConfirmMessage}");
                if (confirm_check === true) {
                    $.ajax({
                        type: "POST",
                        url: "device/deactive/device_employee",
                        dataType: 'text',
                        data: {
                            "id": objId
                        },
                        timeout: 100000,
                        success: function (data) {
                            var type = $.trim(data.toString()).split('|')[1];
                            if (type === undefined) {
                                type = 'error';
                            }
                            alert($.trim(data.toString()).split('|')[0]);
                            getEmployeeTimeList(deviceId)

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
