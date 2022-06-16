package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDao {

//ログインの判断処理
	public boolean isLoginOK(String id, String pw) {
		Connection conn = null;
		boolean loginResult =false;

//以下の処理が成功した場合、loginResult =true（ログイン成功）
		try {
			// JDBCドライバを読み込む
		Class.forName("org.h2.Driver");

// データベースに接続する
		conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

// SELECT文を準備する
		String sql = "SELECT COUNT(*) FROM users WHERE id = ? and pw = ?";
		PreparedStatement pStmt = conn.prepareStatement(sql);

// ユーザーから受け取る値
		pStmt.setString(1, id);
		pStmt.setString(2, pw);

// SELECT文を実行し、結果表を取得する
		ResultSet rs = pStmt.executeQuery();

// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
		rs.next();
		if (rs.getInt("count(*)") == 1) {
			loginResult = true;

		}

	}
//	SQL文で起こったバグを拾ってくる
	catch (SQLException e) {
		e.printStackTrace();
		loginResult = false;
	}
//	DB接続に問題があった時
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		loginResult = false;
	}
	finally {
// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				loginResult = false;
			}
		}
	}

// 結果を返す
		return loginResult;
	}
}


