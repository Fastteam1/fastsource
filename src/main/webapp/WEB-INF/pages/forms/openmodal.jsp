<%-- 
    Document   : openmodal
    Created on : Oct 13, 2016, 9:47:40 AM
    Author     : vnpt2
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dynamic modal dialog form bootstrap</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

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



        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
    </head>
    <body class="skin-black">

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="right-side">
                <section class="content-header">
                    <h1>
                        How to create Dynamic modal dialog form bootstrap
                    </h1>
                </section>
                <section class="content" >
                    <div class="box box-primary">
                        <div class="row">
                            <div class="col-md-2">
                                <select class="form-control" id="mysize">
                                    <option value="small">Small</option>
                                    <option value="standart">Standart</option>
                                    <option value="large">Large</option>
                                </select>
                            </div>
                        </div><br/>

                        <div class="row">
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary btn-lg" onClick="open_container();" > Launch demo modal</button>
                            </div>
                        </div>
                        <!-- Modal form-->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog ">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title" id="myModalLabel"></h4>
                                    </div>
                                    <div class="modal-body" id="modal-bodyku">
                                    </div>
                                    <div class="modal-footer" id="modal-footerq">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end of modal ------------------------------>
                    </div> 

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

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

        <script language="javascript">
                                    function open_container()
                                    {
                                        var size = document.getElementById('mysize').value;
                                        var content = '<form role="form"><div class="form-group"><label for="exampleInputEmail1">Email address</label><input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"></div><div class="form-group"><label for="exampleInputPassword1">Password</label><input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"></div><div class="form-group"><label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile"><p class="help-block">Example block-level help text here.</p></div><div class="checkbox"><label><input type="checkbox"> Check me out</label></div><button type="submit" class="btn btn-default">Submit</button></form>';
                                        var title = 'My dynamic modal dialog form with bootstrap';
                                        var footer = '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button><button type="button" class="btn btn-primary">Save changes</button>';
                                        setModalBox(title, content, footer, size);
                                        $('#myModal').modal('show');
                                    }
                                    function setModalBox(title, content, footer, $size)
                                    {
                                        document.getElementById('modal-bodyku').innerHTML = content;
                                        document.getElementById('myModalLabel').innerHTML = title;
                                        document.getElementById('modal-footerq').innerHTML = footer;
                                        if ($size == 'large')
                                        {
                                            $('#myModal').attr('class', 'modal fade bs-example-modal-lg')
                                                    .attr('aria-labelledby', 'myLargeModalLabel');
                                            $('.modal-dialog').attr('class', 'modal-dialog modal-lg');
                                        }
                                        if ($size == 'standart')
                                        {
                                            $('#myModal').attr('class', 'modal fade')
                                                    .attr('aria-labelledby', 'myModalLabel');
                                            $('.modal-dialog').attr('class', 'modal-dialog');
                                        }
                                        if ($size == 'small')
                                        {
                                            $('#myModal').attr('class', 'modal fade bs-example-modal-sm')
                                                    .attr('aria-labelledby', 'mySmallModalLabel');
                                            $('.modal-dialog').attr('class', 'modal-dialog modal-sm');
                                        }
                                    }

                                    var openMyModal = function (source, width, height) {
                                        modalWindow.windowId = "myModal";
                                        if (width == undefined) {
                                            width = 800;
                                        }
                                        if (height == undefined) {
                                            height = 600;
                                        }
                                        modalWindow.width = width;
                                        modalWindow.height = height;
                                        modalWindow.content = "<iframe width='" + width + "' height='" + height + "' frameborder='0' scrolling='yes' allowtransparency='true' src='" + source + "'></iframe>";
                                        modalWindow.open();
                                    };
        </script>


        <form action="gameCategory" method="POST" enctype="multipart/form-data" class="form-horizontal">
            <div class="box-body">
                <div class="form-group">
                    <label for="inputEmail3">ID</label>
                    <input class="form-control " placeholder="Enter ..." required="required" name="gameCateId"  id="gameCateId"/>
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="inputEmail3">Tên th? lo?i</label>
                    <input class="form-control" placeholder="Enter ..." required="required" name="gameCateName" id="gameCateName" />
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="inputPassword3" >Mô t?</label>
                    <textarea class="form-control" rows="3" placeholder="Enter ..." required="required" name="description" id="description"  />
                    </textarea>
                </div></div>
            <!-- /.box-body -->
            <div class="box-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">Th?c hi?n</button>
            </div>
            <!-- /.box-footer -->
        </form>


    </body>




</html>