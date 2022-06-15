package model;
import java.io.Serializable;

public class Reactions implements Serializable {
	private int id; //リアクションid
	private String users_id; //ユーザーid
	private int declarations_id;//宣言id

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public int getDeclarations_id() {
		return declarations_id;
	}
	public void setDeclarations_id(int declarations_id) {
		this.declarations_id = declarations_id;
	}


}
