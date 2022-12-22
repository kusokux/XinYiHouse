<%--
  Created by IntelliJ IDEA.
  User: 10560
  Date: 2022/5/23
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="css/login.css">

</head>
<body>
<section>
    <!-- 背景颜色 -->
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="box">
        <!-- 背景圆 -->
        <div class="circle" style="--x:0"></div>
        <div class="circle" style="--x:1"></div>
        <div class="circle" style="--x:2"></div>
        <div class="circle" style="--x:3"></div>
        <div class="circle" style="--x:4"></div>
        <!-- 登录框 -->
        <div class="container">
            <div class="form">
                <%
                    // 判断是否有错误信息，如果有则打印
                    // 如果没有此段代码，则显示时会直接打印null
                    if(request.getAttribute("err")!=null)
                    {
                %>
                <div style="margin-bottom: 20px"><h4 style="color: #ff359b">
                    <%=request.getAttribute("err")%></h4></div>


                <%
                    }
                %>
                <h2>注册页面</h2>
                <form action="Login?status=register" method="post">
                    <div class="inputBox">
                        <input type="text" maxlength="10" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="用户ID（仅十位以内数字）" name="id" required>

                        <div class="inputBox">
                            <input type="text" placeholder="用户姓名" name="name" required>

                        </div>

                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="密码" name="password" required>

                    </div>
                    <div class="inputBox">
                        <input type="submit" value="注册">

                        <input type="reset" value="重置">
                    </div>
                    <div class="inputBox">
                        <a href="index.jsp" style="text-decoration: none">
                            <button type="button" class="rt">返回</button>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


</body>
</html>
