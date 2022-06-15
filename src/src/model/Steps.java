package model;
import java.io.Serializable;

public class Steps implements Serializable {

	private int id; //ステップID
	private String step; //ステップ
	private boolean achieve_flag; //達成
	private int declaration_id; //宣言テーブルの外部キー

	//ゲッターセッター
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public boolean isAchieve_flag() {
		return achieve_flag;
	}
	public void setAchieve_flag(boolean achieve_flag) {
		this.achieve_flag = achieve_flag;
	}
	public int getDeclaration_id() {
		return declaration_id;
	}
	public void setDeclaration_id(int declaration_id) {
		this.declaration_id = declaration_id;
	}



}


