package model;
import java.io.Serializable;

public class Declarations implements Serializable {
	private int id; //宣言ID
	private String declaration; //宣言
	private int tag; //タグ
	private boolean achieveFlag; //達成
	private boolean privateFlag; //非公開
	private boolean deleteFlag; //削除
	private String userId; //外部キー


	//ゲッターとセッター
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeclaration() {
		return declaration;
	}
	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public boolean isAchieveFlag() {
		return achieveFlag;
	}
	public void setAchieveFlag(boolean achieveFlag) {
		this.achieveFlag = achieveFlag;
	}
	public boolean isPrivateFlag() {
		return privateFlag;
	}
	public void setPrivateFlag(boolean privateFlag) {
		this.privateFlag = privateFlag;
	}
	public boolean isDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}


}


