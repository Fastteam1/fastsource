<%-- 
    Document   : menu
    Created on : Oct 10, 2016, 9:45:40 AM
    Author     : vnpt2
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${urlProject}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${pageContext.request.userPrincipal.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview" id="home">
                <a href="${pageContext.request.contextPath}/companyInfo">
                    <i class="fa fa-home"></i> <span>Trang chủ</span>
                    <span class="pull-right-container">

                    </span>
                </a>
            </li>
            <li class="treeview" id="manager-company">
                <a href="">
                    <i class="fa fa-gears"></i>
                    <span>Quản lý</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">4</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="info-company"><a href="${pageContext.request.contextPath}/companyInfo"><i class="fa fa-circle-o"></i> Thông tin doanh nghiệp</a></li>
                    <li id="info-device"><a href="${pageContext.request.contextPath}/deviceList"><i class="fa fa-circle-o"></i> Quản lý thiết bị</a></li>
                    <li id="info-employee"><a href="${pageContext.request.contextPath}/employeeList"><i class="fa fa-circle-o"></i> Quản lý nhân viên</a></li>
                    <li id="ServiceNumber"><a href="${pageContext.request.contextPath}/serviceNumbersList"><i class="fa fa-circle-o"></i> Quản lý phòng ban</a></li>
                </ul>
            </li>


            <li class="treeview" id="export-data">
                <a href="">
                    <i class="fa fa-bars"></i>
                    <span>Truy suất dữ liệu</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">3</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="ContentType"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Tra cứu vị trí</a></li>
                    <li id="ContentQuestion"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Theo dõi lộ trình</a></li>
                    <li id="ContentQuestion"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Tra cứu thông tin thiết bị</a></li>
                </ul>
            </li>

            <li class="treeview" id="geofencing">
                <a href="">
                    <i class="fa fa-users"></i>
                    <span>Khoanh vùng địa lý</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">2</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="geofencing-info"><a href="${pageContext.request.contextPath}/geoFenceList"><i class="fa fa-circle-o"></i> Thống kê số lượng thiết bị</a></li>
                    <li id="geofencing-tracking-device"><a href="${pageContext.request.contextPath}/geoFence/trackingDevice"><i class="fa fa-circle-o"></i> Theo dõi thiết bị ra vào</a></li>
                </ul>
            </li>

            <li class="treeview" id="Stats">
                <a href="">
                    <i class="fa fa-pie-chart"></i>
                    <span>Thống kê và báo cáo</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">2</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="KPI1"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Chi phí sử dụng dịch vụ</a></li>
                    <li id="KPI2"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i>Lịch sử sử dụng dịch vụ</a></li>
                    <li id="KPI2"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i>Báo cáo tin nhắn</a></li>
                </ul>
            </li>
         
            <li class="treeview" id="logout">
                <a href="${pageContext.request.contextPath}/logout">
                    <i class="glyphicon glyphicon-log-out"></i> <span>Đăng xuất</span>
                    <span class="pull-right-container">

                    </span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
