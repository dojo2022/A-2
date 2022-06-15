package model;
import java.io.Serializable;

public class Declarations implements Serializable {
	private int id; //宣言ID
	private String declaration; //宣言
	private int tag; //タグ
	private boolean achieve_flag; //達成
	private boolean private_flag; //非公開
	private boolean delete_flag; //削除
	private String user_id; //外部キー

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

	public boolean isAchieve_flag() {
		return achieve_flag;
	}

	public void setAchieve_flag(boolean achieve_flag) {
		this.achieve_flag = achieve_flag;
	}

	public boolean isPrivate_flag() {
		return private_flag;
	}

	public void setPrivate_flag(boolean private_flag) {
		this.private_flag = private_flag;
	}

	public boolean isDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(boolean delete_flag) {
		this.delete_flag = delete_flag;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}


