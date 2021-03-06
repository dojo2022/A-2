package model;

import java.io.Serializable;

public class CommonTable implements Serializable {
	private String usersId; 			//usersテーブルのID
	private String usersPw; 			//usersテーブルのパスワード
	private String usersName; 			//usersテーブルの名前
	private String usersComment; 		//usersテーブルのコメント
	private int usersIcon;			    //usersテーブルのアイコン
	private int usersThemecolor; 		//usersテーブルのテーマカラー
	private int decsId; 				//decsテーブルのID
	private String decsDeclaration;  	//decsテーブルの宣言
	private int decsTag; 				//decsテーブルのタグ
	private boolean decsAchieveFlag;   //decsテーブルの達成
	private boolean decsPrivateFlag;   //decsテーブルの非公開
	private boolean decsDeleteFlag;    //decsテーブルの削除
	private String decsUserId; 			//decsテーブルのユーザーID
	private int stepsId; 				//stepsテーブルのID
	private String stepsStep; 			//stepsテーブルのステップ
	private boolean stepsAchieveFlag;  //stepsテーブルの達成
	private int stepsDecId; 			//stepsテーブルの宣言ID
	private int reactionsId;		    //reactionsテーブルのID
	private String reactionsUserId;    //reactionsテーブルのユーザーID
	private int reactionsDecId; 		//reactionsテーブルの宣言ID
	private int bookmarksId;		    //bookmarksテーブルのID
	private String bookmarksUserId;    //bookmarksテーブルのユーザーID
	private int bookmarksDecId; 		//bookmarksテーブルの宣言ID
	private String resultMessage;		//結果のメッセージ
	private int countReaction;

	public int getCountReaction() {
		return countReaction;
	}
	public void setCountReaction(int countReaction) {
		this.countReaction = countReaction;
	}
	//ゲッターとセッター
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getUsersPw() {
		return usersPw;
	}
	public void setUsersPw(String usersPw) {
		this.usersPw = usersPw;
	}
	public String getUsersName() {
		return usersName;
	}
	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}
	public String getUsersComment() {
		return usersComment;
	}
	public void setUsersComment(String usersComment) {
		this.usersComment = usersComment;
	}
	public int getUsersIcon() {
		return usersIcon;
	}
	public void setUsersIcon(int usersIcon) {
		this.usersIcon = usersIcon;
	}
	public int getUsersThemecolr() {
		return usersThemecolor;
	}
	public void setUsersThemecolr(int usersThemecolr) {
		this.usersThemecolor = usersThemecolr;
	}
	public int getDecsId() {
		return decsId;
	}
	public void setDecsId(int decsId) {
		this.decsId = decsId;
	}
	public String getDecsDeclaration() {
		return decsDeclaration;
	}
	public void setDecsDeclaration(String decsDeclaration) {
		this.decsDeclaration = decsDeclaration;
	}
	public int getDecsTag() {
		return decsTag;
	}
	public void setDecsTag(int decsTag) {
		this.decsTag = decsTag;
	}
	public boolean isDecsAchieveFlag() {
		return decsAchieveFlag;
	}
	public void setDecsAchieveFlag(boolean decsAchieveFlag) {
		this.decsAchieveFlag = decsAchieveFlag;
	}
	public boolean isDecsPrivateFlag() {
		return decsPrivateFlag;
	}
	public void setDecsPrivateFlag(boolean decsPrivateFlag) {
		this.decsPrivateFlag = decsPrivateFlag;
	}
	public boolean isDecsDeleteFlag() {
		return decsDeleteFlag;
	}
	public void setDecsDeleteFlag(boolean decsDeleteFlag) {
		this.decsDeleteFlag = decsDeleteFlag;
	}
	public String getDecsUserId() {
		return decsUserId;
	}
	public void setDecsUserId(String decsUserId) {
		this.decsUserId = decsUserId;
	}
	public int getStepsId() {
		return stepsId;
	}
	public void setStepsId(int stepsId) {
		this.stepsId = stepsId;
	}
	public String getStepsStep() {
		return stepsStep;
	}
	public void setStepsStep(String stepsStep) {
		this.stepsStep = stepsStep;
	}
	public boolean isStepsAchieveFlag() {
		return stepsAchieveFlag;
	}
	public void setStepsAchieveFlag(boolean stepsAchieveFlag) {
		this.stepsAchieveFlag = stepsAchieveFlag;
	}
	public int getStepsDecId() {
		return stepsDecId;
	}
	public void setStepsDecId(int stepsDecId) {
		this.stepsDecId = stepsDecId;
	}
	public int getReactionsId() {
		return reactionsId;
	}
	public void setReactionsId(int reactionsId) {
		this.reactionsId = reactionsId;
	}
	public String getReactionsUserId() {
		return reactionsUserId;
	}
	public void setReactionsUserId(String reactionsUserId) {
		this.reactionsUserId = reactionsUserId;
	}
	public int getReactionsDecId() {
		return reactionsDecId;
	}
	public void setReactionsDecId(int reactionsDecId) {
		this.reactionsDecId = reactionsDecId;
	}
	public int getBookmarksId() {
		return bookmarksId;
	}
	public void setBookmarksId(int bookmarksId) {
		this.bookmarksId = bookmarksId;
	}
	public String getBookmarksUserId() {
		return bookmarksUserId;
	}
	public void setBookmarksUserId(String bookmarksUserId) {
		this.bookmarksUserId = bookmarksUserId;
	}
	public int getBookmarksDecId() {
		return bookmarksDecId;
	}
	public void setBookmarksDecId(int bookmarksDecId) {
		this.bookmarksDecId = bookmarksDecId;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}





}
