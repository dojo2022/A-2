package model;

import java.io.Serializable;

public class Bookmarks implements Serializable{
	private int id;//ブックマークID
	private String user_id;//ユーザーID
	private int declaration_id;//宣言ID

	//ゲッター、セッター
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getDeclaration_id() {
		return declaration_id;
	}
	public void setDeclaration_id(int declaration_id) {
		this.declaration_id = declaration_id;
	}


}
