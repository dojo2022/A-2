package model;

import java.io.Serializable;

public class Bookmarks implements Serializable{
	private int id;//ブックマークID
	private String userId;//ユーザーID
	private int declarationId;//宣言ID

	//ゲッター、セッター
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getDeclarationId() {
		return declarationId;
	}
	public void setDeclarationId(int declarationId) {
		this.declarationId = declarationId;
	}





}
