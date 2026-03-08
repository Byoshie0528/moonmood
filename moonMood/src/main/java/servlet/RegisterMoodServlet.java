package servlet;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bo.MoodBO;
import entity.Mood;

@WebServlet("/registerMood")
public class RegisterMoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * 気分データを登録する処理
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // セッションからログインユーザー取得
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("loginUser");

        // フォームから送られた値を取得

        String moodStr  = request.getParameter("mood");
        String message  = request.getParameter("message");

        // エンティティ作成
        LocalDate today = LocalDate.now();
        Mood mood = new Mood(userName, moodStr, message, today);

        // ビジネスロジック呼び出し
        MoodBO moodBO = new MoodBO();
        moodBO.registerMood(mood);

        // result.jspへフォワード
        request.setAttribute("userName", userName);
        request.setAttribute("mood", moodStr);
        request.setAttribute("message", message);
        request.setAttribute("date", today);

        request.getRequestDispatcher("/result.jsp")
               .forward(request, response);
    }
}





