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
<form:errors path="gameCategoryForm.*"/>

<!-- Modal -->
<div class="modal fade" id="insert-modal" tabindex="-1" role="dialog" aria-labelledby="Insert Category">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >Game Category Form</h4>
            </div>
            <form:form action="gameCategory" method="POST" class="form-horizontal" modelAttribute="gameCategoryForm" id="gamCategory-form">
                <div class="modal-body">

                    <div class="form-group hidden"> 
                        <label for="gameCateId-input" class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="gameCateId-input" placeholder="gameCateId" name="gameCateId">
                        </div>
                    </div>



                    <div class="form-group has-feedback">
                        <label for="gameCateName-input" class="col-sm-2 control-label ">Thể loại</label>
                        <div id="gameCateName1" class="col-sm-9">
                            <input type="text" class="form-control" id="gameCateName-input" placeholder="gameCateName" name="gameCateName" required>
                            <span id="gameCateName2" class="form-control-feedback"></span>
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
                    <button type="submit" class="btn btn-primary" >Save changes</button>
                </div>
            </form:form>

        </div>
    </div>
</div>



