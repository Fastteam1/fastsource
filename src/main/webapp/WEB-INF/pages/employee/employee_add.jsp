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
                    <h4 class="modal-title" >Thêm mới thiết bị</h4>
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
                                <label for="name-input" class="col-sm-2 control-label">Tên nhân viên</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-name" placeholder="name" name="name" required
                                           pattern=".*\S+.*" title="Nhập đầy đủ thông tin">
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="phone">
                            <div class="form-group">
                                <label for="phone-input" class="col-sm-2 control-label">Điện thoại</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-phone" placeholder="phone" name="phone" required
                                           data-inputmask='"mask": ["01999999999", "0999999999"]' data-mask>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="address">
                            <div class="form-group">
                                <label for="address-input" class="col-sm-2 control-label">Địa chỉ</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-address" placeholder="address" name="address" required>
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="email">
                            <div class="form-group">
                                <label for="email-input" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="addForm-email" placeholder="email" name="email" required>
                                </div>
                            </div>   
                        </spring:bind>


                        <spring:bind path="departmentId">
                            <div class="form-group">
                                <label for="department-input" class="col-sm-2 control-label">${departmentId}</label>
                                <div class="col-sm-9">
                                    <form:select id="addForm-department" path="departmentId" class="form-control">
                                        <form:option value="0" label="Chọn Bộ phận"/>
                                        <c:if test="${not empty listDepartments}"> 
                                            <c:forEach var="department" items="${listDepartments}">
                                                <form:option value="${department.getId()}" label="${department.getName()}" />
                                            </c:forEach>
                                        </c:if>
                                    </form:select>
                                </div>
                            </div>   
                        </spring:bind>

                        <spring:bind path="description">
                            <div class="form-group">
                                <label for="description-input" class="col-sm-2 control-label">Mô tả</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addForm-description" placeholder="description" name="description" required>
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


        $("[data-mask]").inputmask();
        function addViaAjax() {
            var add = {};

            add["name"] = $("#addForm-name").val().trim();
            add["phone"] = $("#addForm-phone").val().trim();
            add["description"] = $("#addForm-description").val().trim();
            add["address"] = $("#addForm-address").val().trim();
            add["departmentId"] = $("#addForm-department").val().trim();
            add["email"] = $("#addForm-email").val().trim();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "${urlInfo}/insert",
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
                            window.location.href = "${urlProject}/employeeList";
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