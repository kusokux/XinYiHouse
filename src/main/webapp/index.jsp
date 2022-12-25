<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>心怡民宿，享受内心</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/search.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script><!--引入vue-->

</head>
<body>
<!-- 头部模块-->
<header>
    <!-- 快捷菜单模块-->
    <div class="xtx-shortcut">
        <div class="container">
            <ul class="fr">
                <%
                    if(request.getSession().getAttribute("uname") == null){
                %>
                <li><a href="login.jsp">请先登录</a>|</li>
                <li><a href="register.jsp">抢先注册</a>|</li>
                <%
                    }else{
                %>
                <%if(request.getSession().getAttribute("uid").equals("123")){%>
                <li><a href="ad_nav.jsp">后台管理</a></li>
                <%}%>
                <li><a href="Login?status=cancellation">注销</a></li>

                <li><i class="	fa fa-user-circle-o"></i></li>
                <li><a><%=request.getSession().getAttribute("uname")%></a></li>
                <%
                    }
                %>

                <li><a href="img.html" target="_blank">赞助合作</a></li>
            </ul>
        </div>
    </div>

    <!-- #主导航模块-->
    <div class="xtx-main-nav container">
        <!-- #logo -->
        <h1 class="logo fl">
            <a href="#">心怡民宿</a>
        </h1>
        <nav class="fl" id="app">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="reservation.jsp">预定房间</a></li>
                <li><a href="reservation_search.jsp">查看预定</a></li>
                <li><a href="RoomRsource">查看房源</a></li>
            </ul>
        </nav>
        <!-- #search -->
        <div class="search bar2">
            <form action="RoomSearch" method="post">
                <input type="text" name="room" placeholder="请输入您要搜索的内容...">
                <button type="submit"></button>
            </form>
        </div>
    </div>
</header>
<!-- #网站入口模块-->
<div class="xtx-entry">
    <div class="container">
        <div class="swiper" id="swiper"><!--轮播图-->
            <img  @mouseover="changeInterval(true)"
                              @mouseleave="changeInterval(false)"
                              v-for="item in imgArr"
                              :key="item.id"
                              :src="item.url"
                              alt="暂无图片"
                              v-show="item.id===currentIndex"
            >
            <!--控制圆点-->
            <div class="banner-circle">
                <ul>
                    <li @click="changeImg(item.id)"
                        v-for="(item) in imgArr"
                        :key="item.id"
                        :class="item.id=== currentIndex ? 'active': '' "
                    ></li>
                </ul>
            </div>
            <!-- #左右按钮 -->
            <a class="prev bt" @click="clickIcon('up')"></a>
            <a class="next bt" @click="clickIcon('down')"></a>
        </div>
        <!-- #侧边栏 -->
        <aside class="category">
            <ul>
                <li><a>北京 <span>二环 故宫附近</span></a></li>
                <li><a>深圳 <span>小梅沙 南澳 海边</span></a></li>
                <li><a>厦门 <span>岛内 岛外 鼓浪屿</span></a></li>
                <li><a>上海 <span>迪士尼 上海滩</span></a></li>
                <li><a>广州 <span>黄埔 大学城</span></a></li>
                <li><a>纽约 <span>麦迪逊广场</span></a></li>
                <li><a>旧金山 <span>大通中心 金门大桥</span></a></li>
                <li><a>东京 <span>二次元 主题</span></a></li>
                <li><a>台湾 <span>台北 高雄 机车</span></a></li>
                <li><a>重庆 <span>魔都</span></a></li>
            </ul>
        </aside>
    </div>
</div>
<!-- #新鲜好物模块 -->
<div class="xtx-new-goods container">
    <!-- #好物模块头部 -->
    <div class="goods-hd">
        <!-- #左边h2 -->
        <h2 class="fl">
            值得拥有 <span>顶级房源 品质靠谱</span>
        </h2>
        <!-- #右边的a -->
        <a href="RoomRsource" class="fr">查看全部</a>

    </div>
    <!-- #好物模块列表 -->
    <div class="goods-list">
        <ul>
            <li>
                <img src="img/2.jpg" alt="">
                <h3>免费年会/草坪/策划/私房菜</h3>
                <p><span>￥</span> 899</p>
            </li>
            <li>
                <img src="img/3.jpg" alt="">
                <h3>尔湾Irvine-晴天-侘寂风氧吧民宿</h3>
                <p><span>￥</span> 1299</p>
            </li>
            <li>
                <img src="img/4.jpg" alt="">
                <h3>Wabi-sabi日式侘寂风|山景豪华</h3>
                <p><span>￥</span> 129</p>
            </li>
            <li>
                <img src="img/5.jpg" alt="">
                <h3>“春风十里”小岛的人间烟火</h3>
                <p><span>￥</span> 3399</p>
            </li>
        </ul>
    </div>
</div>
<!-- #底部模块 -->
<footer>
    <!-- #宣传服务 -->
    <div class="xtx-service">
        <div class="container">
            <a href="#">放心入住</a>
            <a href="#">贴心服务</a>
            <a href="#">信用认证</a>
        </div>
    </div>
    <!-- #版权信息 -->
    <div class="xtx-copyright">
        <div class="container">
            <p>
                <a href="#">关于我们</a> |
                <a href="#">帮助中心</a> |
                <a href="#">售后服务</a> |
                <a href="#">加盟合作</a> |
                <a href="#">用户协议</a> |
                <a href="#">搜索推荐</a> |
                <a href="#">友情链接</a>
            </p>
        </div>
    </div>
</footer>
<script src="js/sweeper.js"></script>
</body>
</html>
