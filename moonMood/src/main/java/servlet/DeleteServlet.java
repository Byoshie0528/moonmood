package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MoodDAO;

@WebServlet("/deleteMood")
public class DeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response
    ) throws ServletException, IOException {


        int id = Integer.parseInt(request.getParameter("id"));

        MoodDAO dao = new MoodDAO();
        dao.delete(id);

        response.sendRedirect("moodList");
    }
}
