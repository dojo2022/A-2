package model;
import java.io.Serializable;

public class Reactions implements Serializable {
	private int id; //リアクションid
	private String userId; //ユーザーid
	private int declarationId;//宣言id

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
