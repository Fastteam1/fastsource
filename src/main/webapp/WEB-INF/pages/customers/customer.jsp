<%-- 
    Document   : game
    Created on : Oct 17, 2016, 8:34:38 AM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
    .modal-dialog {
        position: absolute;
        top: 120px;
        right: 60px;
        bottom: 0;
        left: 50px;
        z-index: 10040;
        overflow: auto;
        overflow-y: auto;
        width: 1000px;
    }
</style>




<!-- Modal -->
<body>
    <div class="modal fade" id="insert-modal" tabindex="-1" role="dialog" aria-labelledby="Insert Game"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header menu">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Game Form</h4>
                </div>
                <form action="${pageContext.request.contextPath}/gameTemplate" method="POST" class="form-horizontal" id="data-form" >
                    <div class="modal-body">

                        <table id="example2" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Số điện thoại</th>
                                    <th>Thời gian đăng ký</th>
                                    <th>Kênh đăng ký</th>
                                    <th>Thời gian bắt đầu</th>
                                    <th>Thời gian kết thúc</th>
                                    <th>Thời gian hủy</th>
                                </tr>
                            </thead>
                            

                        </table> 
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


</body>