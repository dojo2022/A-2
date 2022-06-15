package model;
import java.io.Serializable;

public class Steps implements Serializable {

	private int id; //ステップID
	private String step; //ステップ
	private boolean achieveFlag; //達成
	private int declarationId; //宣言テーブルの外部キー

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
	public boolean isAchieveFlag() {
		return achieveFlag;
	}
	public void setAchieveFlag(boolean achieveFlag) {
		this.achieveFlag = achieveFlag;
	}
	public int getDeclarationId() {
		return declarationId;
	}
	public void setDeclarationId(int declarationId) {
		this.declarationId = declarationId;
	}

}


