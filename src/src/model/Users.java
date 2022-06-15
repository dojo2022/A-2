package model;
import java.io.Serializable;

public class Users implements Serializable {
	private String id; //ユーザーID
	private String pw; //パスワード
	private String name; //名前
	private String comment; //ひとこと
	private int icon; //アイコン
	private int themecolor; //テーマカラー

	//ゲッターとセッター
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getIcon() {
		return icon;
	}

	public void setIcon(int icon) {
		this.icon = icon;
	}

	public int getThemecolor() {
		return themecolor;
	}

	public void setThemecolor(int themecolor) {
		this.themecolor = themecolor;
	}

}
