<%--
  Created by IntelliJ IDEA.
  User: 10560
  Date: 2022/5/23
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交预定中</title>
</head>
<body>
<%
    boolean flag = (boolean)request.getAttribute("flag");
    if(flag){
%>
    <script>
        alert("预定成功！");
    </script>
<%
        response.setHeader("refresh","0.001;URL=index.jsp");
    }else{
%>
    <script>
        alert("出错了！");
    </script>
<%
        response.setHeader("refresh","0.001;URL=index.jsp");
    }
%>
</body>
</html>
