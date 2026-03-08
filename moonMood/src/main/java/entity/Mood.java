package entity;

import java.time.LocalDate;

public class Mood {
        private int id;
        private String userName;
        private String mood;
        private String message;
        private LocalDate date;

        //空のコンストラクタ
        public Mood() {
        }

        //全フィールドのコンストラクタ
        public Mood(String userName,String mood,String message,LocalDate date) {
                this.userName=userName;
                this.mood=mood;
                this.message=message;
                this.date=date;
        }

        // getter
        public int getId() {
                return id;
        }

        public String getUserName() {
                return userName;
        }

        public String getMood() {
                return mood;
        }

        public String getMessage() {
                return message;
        }

        public LocalDate getDate() {
                return date;
        }

        // setter 
        public void setId(int id) {
                this.id = id;

        }

        public void setUserName(String userName) {
                this.userName=userName;
        }

        public void setMood(String mood) {
                this.mood=mood;
        }

        public void setMessage(String message) {
                this.message=message;
        }

        public void setDate(LocalDate date) {
                this.date=date;
        }
}
