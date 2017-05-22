<%-- 
    Document   : gameCategoryList
    Created on : Oct 11, 2016, 02:45:47 PM
    Author     : vnpt2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${formTitle}</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">



        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
        <!-- iCheck for checkboxes and radio inputs -->
        <link rel="stylesheet" href="plugins/iCheck/all.css">
        <!-- Bootstrap Color Picker -->
        <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
        <!-- Bootstrap time Picker -->
        <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->



    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="../include/header.jsp" />
            <jsp:include page="../include/menu.jsp" />   
            <div class="content-wrapper">

                <section class="content-header">
                    <h1>
                        Mẫu Game
                        <small>Cập nhật thông tin</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tiến trình game</a></li>
                        <li class="active">Mẫu Game</li>
                    </ol>
                </section>

                <section class="content margin">
                    <!-- left column -->
                    <div class="col-md-6" >
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Game Template Form</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form modelAttribute="gameTemplateForm" method="POST" class="form-horizontal">

                                <div class="box-body">


                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label">Mẫu game</label>

                                        <div class="col-sm-9">

                                            <form:input class="form-control" placeholder="Enter ..." required="required" path="gameTempName" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label">Thể loại</label>
                                        <div class="col-sm-9">
                                            <form:select path="gameCateId" class="form-control"> 
                                                <form:options items="${listName}" itemValue="gameCateId" itemLabel="gameCateName"/>                          
                                            </form:select>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label">Mô tả</label>
                                        <div class="col-sm-9">
                                            <form:textarea class="form-control" rows="3" placeholder="Enter ..." required="required" path="description"/>
                                        </div>
                                    </div>

                                    <div class="form-group" >
                                        <label class="col-sm-2 control-label">Date</label>

                                        <div class="col-sm-9">
                                            <div class="input-group date" id="datepicker" >
                                                <div class="input-group-addon" >
                                                    <i class="fa fa-calendar" ></i>
                                                </div>
                                                <form:input path="createTime" class="form-control pull-right" required="required"/>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="${pageContext.request.contextPath}/gameTemplateList">
                                        <button type="button" class="btn btn-default">Cancel</button>
                                    </a>
                                    <button type="submit" class="btn btn-info pull-right">Thực hiện</button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                    </div>
                </section>



            </div>
            <jsp:include page="../include/footer.jsp" />
            <jsp:include page="../include/setting.jsp" />

            <!-- ./wrapper -->
        </div>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- date-range-picker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap datepicker -->
        <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- bootstrap color picker -->
        <script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
        <!-- bootstrap time picker -->
        <script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>

        <!--dateTimePicker-->
        <script src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
        </script>

        <!-- page script -->
        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true
                });


            });
        </script>

        <script type="text/javascript">
            $('#datepicker').datepicker({
                autoclose: true,
                todayHighlight: true
            });
        </script>





        <script>
            document.getElementById("GameProcess").className = "active";
            document.getElementById("GameTemp").className = "active";
        </script>

    </body>
</html>