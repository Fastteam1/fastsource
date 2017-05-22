<%-- 
    Document   : searchForm
    Created on : Nov 15, 2016, 4:22:29 PM
    Author     : vnpt2
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table class="table table-hover" style="width: 50%">
    <thead>
        <tr>
            <td>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" class="form-control" data-inputmask='"mask": ["09999 999 999", "+849999 999 999"]' data-mask>

                    </div>
                </div>

            </td>
            <td>
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </td>
            <td>
                <div class="form-group">
                    <div class="input-group">
                        <button type="button" class="btn btn-info btn-sm">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span> Tìm kiếm
                        </button>
                    </div>
                </div>
            </td>

            <td>
                <div class="form-group">
                    <div class="input-group">
                        <a data-toggle="modal" href="#insert-modal" id ="add-form">
                            <button type="button" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Thêm mới
                            </button>
                        </a>
                    </div>
                </div>
            </td>
        <tr>
    </thead>
</table> 
