
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import entity.Mood;

public class MoodDAO {

    // DB接続情報
    private final String URL =
        "jdbc:mysql://localhost:3306/moonmood?useSSL=false&serverTimezone=Asia/Tokyo&allowPublicKeyRetrieval=true";

    private final String USER = "root";
    private final String PASSWORD = "password";


    // 気分を登録
    public void insertMood(String userName, String mood, String message) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql =
                "INSERT INTO mood(user_name, mood, message, date) VALUES(?, ?, ?, CURDATE())";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, userName);
            ps.setString(2, mood);
            ps.setString(3, message);

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // ユーザーの記録一覧取得
    public List<Mood> findByUserName(String userName) {

        List<Mood> moodList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql =
                "SELECT id, user_name, mood, message, date " +
                "FROM mood WHERE user_name = ? ORDER BY date DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userName);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String name = rs.getString("user_name");
                String mood = rs.getString("mood");
                String message = rs.getString("message");
                LocalDate date = rs.getDate("date").toLocalDate();

                Mood moodData = new Mood(name, mood, message, date);
                moodData.setId(rs.getInt("id"));  
                moodList.add(moodData);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return moodList;
    }

    // 記録削除
    public int delete(int id) {

        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "DELETE FROM mood WHERE id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            result = ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}