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
                <form action="${pageContext.request.contextPath}/employee" method="POST" class="form-horizontal" id="gameTemplate-form" >
                    <div class="modal-body">

                        <div class="form-group hidden"> 
                            <label for="id-input" class="col-sm-2 control-label">ID</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="viewForm-id" placeholder="id" name="id" >
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="name-input" class="col-sm-2 control-label">Tên nhân viên</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="viewForm-name" placeholder="name" name="name" required>
                            </div>
                        </div>   

                        <spring:bind path="phone">
                            <div class="form-group">
                                <label for="phone-input" class="col-sm-2 control-label">Điện thoại</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="viewForm-phone" placeholder="phone" name="phone" required>
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
                                    <input type="text" class="form-control" id="viewForm-email" placeholder="email" name="email" required>
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
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script type="text/javascript" lang="javascript">
        function getViaAjax(objId) {

            var json = {
                "employeeId": objId
            };
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "employee",
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
                        window.location.href = "/SpringMVC_EFinder/login";
                    }
                },
                error: function (e) {
                    alert("Có lỗi xảy ra. Vui lòng đăng nhập lại!");
                    window.location.href = "/SpringMVC_EFinder/login";
                }
            });
        }

        function showForm(data) {
            $("#viewForm-id").val(data.id);
            $("#viewForm-name").val(data.name);
            $("#viewForm-phone").val(data.phone);
            $("#viewForm-email").val(data.email);
            $("#viewForm-address").val(data.address);
            $("#viewForm-description").val(data.description);
            $('#ojectView').modal('show');
        }
    </script>

</body>