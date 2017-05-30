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
                <a href="${pageContext.request.contextPath}/index">
                    <i class="fa fa-home"></i> <span>Trang chủ</span>
                    <span class="pull-right-container">

                    </span>
                </a>
            </li>
            <li class="treeview" id="GameProcess">
                <a href="">
                    <i class="fa fa-gears"></i>
                    <span>Tiến trình game</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">3</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="GameCate"><a href="${pageContext.request.contextPath}/gameCategoryList"><i class="fa fa-circle-o"></i> Thể loại game</a></li>
                    <li id="GameTemp"><a href="${pageContext.request.contextPath}/gameTemplateList"><i class="fa fa-circle-o"></i> Mẫu game</a></li>
                    <li id="ServiceNumber"><a href="${pageContext.request.contextPath}/serviceNumbersList"><i class="fa fa-circle-o"></i> Đầu số</a></li>
                </ul>
            </li>

            <li class="treeview" id="GameInfomation">
                <a href="">
                    <i class="fa fa-info-circle"></i>
                    <span>Thông tin game</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">3</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="Game"><a href="${pageContext.request.contextPath}/gameList"><i class="fa fa-circle-o"></i> Game</a></li>
                    <li id="CommandCode"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Command Code</a></li>
                    <li id="ContentFeedback"><a href="${urlProject}/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Nội dung trả về</a></li>

                </ul>
            </li>

            <li class="treeview" id="Service">
                <a href="">
                    <i class="fa fa-wrench"></i>
                    <span>Dịch vụ</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">5</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="GameCycle"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Vòng game</a></li>
                    <li id="PointType"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Loại điểm</a></li>
                    <li id="Package"><a href="${urlProject}/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Gói dịch vụ</a></li>
                    <li id="PricePackage"><a href="${urlProject}/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Gói cước</a></li>
                    <li id="PointFrame"><a href="${urlProject}/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Khung điểm</a></li>
                </ul>
            </li>

            <li class="treeview" id="Content">
                <a href="">
                    <i class="fa fa-bars"></i>
                    <span>Nội dung</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">2</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="ContentType"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Loại nội dung</a></li>
                    <li id="ContentQuestion"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Nội dung câu hỏi</a></li>
                </ul>
            </li>

            <li class="treeview" id="CareKH">
                <a href="">
                    <i class="fa fa-users"></i>
                    <span>Chăm sóc khách hàng</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">5</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="History"><a href="${pageContext.request.contextPath}/customerList"><i class="fa fa-circle-o"></i> Lịch sử đăng ký hủy</a></li>
                    <li id="Charging"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Lịch sử trừ cước</a></li>
                    <li id="MOMT"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Lịch sử MO/MT</a></li>
                    <li id="PointSearch"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Tra cứu điểm</a></li>
                    <li id="DKHuy"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Đăng ký hủy dịch vụ</a></li>
                </ul>
            </li>

            <li class="treeview" id="Stats">
                <a href="">
                    <i class="fa fa-pie-chart"></i>
                    <span>Báo cáo thống kê</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">2</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="KPI1"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> KPI mẫu 1</a></li>
                    <li id="KPI2"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> KPI mẫu 2</a></li>
                </ul>
            </li>

            <li class="treeview" id="System">
                <a href="">
                    <i class="fa fa-server"></i>
                    <span>Quản lý hệ thống</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">4</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="Users"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Người sử dụng</a></li>
                    <li id="Providers"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Nhà cung cấp</a></li>
                    <li id="Roles"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Quản lý quyền</a></li>
                    <li id="WhiteList"><a href="${urlProject}/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Danh sách test</a></li>
                </ul>
            </li>

            <li class="treeview" id="QuanLyCaNhan">
                <a href="">
                    <i class="fa fa-user"></i>
                    <span>Quản lý cá nhân</span>
                    <span class="pull-right-container">
                        <span class="label label-primary pull-right">1</span>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="ChangePass"><a href="${urlProject}/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Thay đổi mật khẩu</a></li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
