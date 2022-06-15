package model;

import java.io.Serializable;

public class Result implements Serializable {
	private String message; //メッセージ

	/**
	 * @return message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message セットする message
	 */
	public void setMessage(String message) {
		this.message = message;
	}


}
