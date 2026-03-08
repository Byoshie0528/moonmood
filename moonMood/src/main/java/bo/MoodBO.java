package bo;

import java.util.List;

import dao.MoodDAO;
import entity.Mood;

public class MoodBO {

    // 気分登録
    public void registerMood(Mood mood) {

        MoodDAO dao = new MoodDAO();
        dao.insertMood(
            mood.getUserName(),
            mood.getMood(),
            mood.getMessage()
        );
    }
    
    // ログインユーザーの記録だけ取得
    public List<Mood> getMoodsByUser(String userName) {

        MoodDAO dao = new MoodDAO();
        return dao.findByUserName(userName);
    }
}