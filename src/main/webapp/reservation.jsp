<%--
  Created by IntelliJ IDEA.
  User: 10560
  Date: 2022/5/23
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>房源预定</title>
    <link rel="stylesheet" href="css/reservation.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">

</head>
<body>

<%
    if(request.getSession().getAttribute("uname") == null){
%>
<script>
    alert("请先登录！");
</script>
<%
        response.setHeader("refresh","0.001;URL=login.jsp");
    }
%>

<form action="Reservation" method="post">
    <div class="panel-container">
        <div class="left">
            <h2>心怡民宿-做出心怡的选择</h2></br></br>


            <p>房源选择</p>
            <select name="information" >
                <option>【以下房源空闲】</option>
                <option>宝龙一城复式挑高大三房·近国际会展中心·高崎机场·环岛路曾厝垵·楼下宝龙商城·可做饭</option>
                <option>复式家庭房-新店尊享特惠|会展中心|城市职业学院、瑞景商业广场|可住3人【北欧ins】考场周边</option>
                <option>馨心相居会展店 【标准双人间2】双床 近会展中心、环岛路、香山国际游艇会码头 交通便利</option>
                <option>思明观音山海景合住男生公寓，两人合住</option>
                <option>【夏·朵拉】高端公寓 宝龙一城商圈地铁口 会展中心 软件园二期 观音山梦幻海边沙滩</option>
                <option>舒适大床房 | 近会展中心环岛路曾厝垵鼓浪屿可步行至海边</option>
                <option>【厦·贰丛】厦门十居室~单居价/KTV/独立棋牌室/客厅小影院/桌游棋牌/承接公司团建轰趴/</option>
                <option>『乐·栖』环岛路旁整层四房四卫一厅、顶楼花园露台、可聚会、近会展-曾厝垵-厦大-中山路步行街</option>
                <option>环岛路旁、两室两厅海景超大套房、步行五分钟到黄厝沙滩、可洗衣做饭可住8人、近曾厝垵</option>
                <option>(一禾)小资一居轻奢城市景观房可月租年租/近呼家楼地铁站　/复星国际中心/朝外soho/世贸天阶</option>
                <option>亚运村/外经贸/安贞/惠新/中日友好/国家会议中心/TV特惠大床</option>
                <option>望京SOHO店/方恒国际/地铁14号线直达北京南/舒适大床房</option>
                <option>宜家风｜月租长租优惠/双人大床房 清华/北大/矿大/地大/北航/中科院/五道口地铁站/购物中心商圈房源</option>

            </select>

            <p>如何称呼</p>
            <div class="mcontainer">
                <input type="text" name="name" id="name1"required/>
                <button type="button"   class="mclear"   onclick="cleared()" >X</button>
            </div>
            <p>联系电话</p>

            <div class="mcontainer">
                <input type="text" name="phonenum" id="p-num" required/>
                <button type="button"   class="mclear2"   onclick="cleared()" >X</button>
            </div>

            <p>选择时间</p>
            <input type="date" name="date"/>

            <button>提交预定</button>
            </br></br>
            <a href="index.jsp">返回主页</a>
        </div>
        <div class="right"></div>
    </div>

</form>


<div class="social-panel-container">
    <div class="social-panel">
        <p>Created with<i class="fa fa-heart"></i>by
            雀氏润</p>
        <button class="close-btn"><i class="fa fa-times"></i></button>
        <h4>Get in touch on</h4>
        <ul>
            <li>
                <a href="https://im.qq.com/index" target="_blank">
                    <i class="fa fa-qq"></i>
                </a>
            </li>
            <li>
                <a href="https://weixin.qq.com/" target="_blank">
                    <i class="fa fa-wechat"></i>
                </a>
            </li>
            <li>
                <a href="https://weibo.com/newlogin?tabtype=weibo&gid=102803&openLoginLayer=0&url=https%3A%2F%2Fweibo.com%2F" target="_blank">
                    <i class="fa fa-weibo"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<button class="floating-btn">
    联系我们！
    <script src="js/reservation.js" type="text/javascript"></script>
    <script src="js/cleared.js" type="text/javascript"></script>
</button>
</body>


</html>
