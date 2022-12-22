<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>登录页面</title>
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
                <h2>登录页面</h2>
                <form action="Login?status=login" method="post">
                    <div class="inputBox">
                        <input type="text" maxlength="10" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="用户ID" name="id" required>

                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="密码" name="password" required>

                    </div>
                    <div class="inputBox">
                        <input type="submit" value="登录">
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

<script>
</script>
</body>
</html>
