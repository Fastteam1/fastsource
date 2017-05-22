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
    <div class="modal fade" id="insert-modal" tabindex="-1" role="dialog" aria-labelledby="Insert Category"  >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >Game Template Form</h4>
                </div>
                <form action="${pageContext.request.contextPath}/gameTemplate" method="POST" class="form-horizontal" id="gameTemplate-form" >
                    <div class="modal-body">

                        <div class="form-group hidden"> 
                            <label for="gameTempId-input" class="col-sm-2 control-label">ID</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="gameTempId-input" placeholder="gameTempId" name="gameTempId" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gameTempName-input" class="col-sm-2 control-label">Mẫu game</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="gameTempName-input" placeholder="gameTempName" name="gameTempName" required>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="gameCateId-input" class="col-sm-2 control-label">Thể loại</label>
                            <div class="col-sm-9">
                                <select id="category" class="form-control" name="gameCateId" required>
                                </select>
                            </div>
                        </div>

                        <div class="form-group" >
                            <label class="col-sm-2 control-label">Trạng thái</label>
                            <div class="col-sm-9">
                                <select id="status-input" class="form-control" name="status" required>
                                    <option value="" label=" -- Chọn trạng thái -- "> -- Chọn trạng thái -- </option>
                                    <option value="true" label="True" >True</option>
                                    <option value="false" label="False">False</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group" >
                            <label class="col-sm-2 control-label">Câu hỏi</label>
                            <div class="col-sm-9">
                                <select id="isQuestion-input" class="form-control" name="isQuestion" required>
                                    <option value="" label=" -- Chọn trạng thái -- "> -- Chọn trạng thái -- </option>
                                    <option value="true" label="True" >True</option>
                                    <option value="false" label="False">False</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description-input" class="col-sm-2 control-label">Mô tả</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="3" id="description-input" placeholder="description" name="description" required></textarea>
                            </div>
                        </div>

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