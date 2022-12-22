package jmu.xinyihouse.servlet;

import jmu.xinyihouse.factory.DAOFactory;
import jmu.xinyihouse.vo.Person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String path = "login.jsp";
        request.setCharacterEncoding("utf-8");
        String status = request.getParameter("status");


        System.out.println("TEST!!!");

        if("login".equals(status)){
            try {
                // 1、接收传递的参数
                String id = request.getParameter("id");
                String password = request.getParameter("password");
                // 2、将请求的内容赋值给VO类
                Person person = new Person();
                person.setId(id);
                person.setPassword(password);

                // 进行数据库验证
                if (DAOFactory.getPersonDAOInstance().login(person)) {
                    // 如果为真，则表示用户ID和密码合法
                    // 设置用户姓名到session范围之中
                    request.getSession().setAttribute("uname", person.getName());
                    request.getSession().setAttribute("uid",person.getId());
                    System.out.println("登录成功！");
                    // 修改跳转路径
                    path = "index.jsp";
                } else {
                    // 登陆失败
                    // 设置错误信息
                    request.setAttribute("err", "您输入的用户ID或密码错误，请重新输入");
                }
            } catch (Exception e) {
            }
        }

        if("cancellation".equals(status)){
            request.getSession().setAttribute("uname", null);
            path = "index.jsp";
        }

        if("register".equals(status)){
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            Person person = new Person();
            person.setId(id);
            person.setName(name);
            person.setPassword(password);
            try {
                if(DAOFactory.getPersonDAOInstance().register(person)){
                    System.out.println("register successfully!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            path = "login.jsp";
        }

        // 进行跳转
        request.getRequestDispatcher(path).forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        this.doPost(request, response);
    }
}
