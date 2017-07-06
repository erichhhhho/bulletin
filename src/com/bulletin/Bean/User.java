package com.bulletin.Bean;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：1:20 2017/7/6
 * @Description：
 */
public class User {

    private int id;
    private String nickname;
    private  String password;

    public User(int id, String nickname, String password) {
        this.id = id;
        this.nickname = nickname;
        this.password = password;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
