package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bo.MoodBO;
import entity.Mood;

@WebServlet("/moodList")
public class MoodListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // セッション取得
        HttpSession session = request.getSession(false);
        String userName = (String) session.getAttribute("loginUser");

        // ログインしていなければログイン画面へ
        if (userName == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // ログインユーザーの記録だけ取得
        MoodBO moodBO = new MoodBO();
        List<Mood> moodList = moodBO.getMoodsByUser(userName);

        // JSPへ渡す

        request.setAttribute("moodList", moodList);

        // 一覧画面へ
        request.getRequestDispatcher("/moodList.jsp")
               .forward(request, response);
    }
}
