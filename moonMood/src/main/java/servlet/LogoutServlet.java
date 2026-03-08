package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // セッション取得
        HttpSession session = request.getSession(false);

        // セッションが存在する場合は削除
        if (session != null) {
            session.invalidate();
        }

        // ログイン画面へ戻る
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
