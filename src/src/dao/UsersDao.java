package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Users;

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
	}
//	DB接続に問題があった時
	catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	finally {
// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

// 結果を返す
		return loginResult;
	}



		// 【isRegistOkメソッド】以下の処理でDBから「1」が返ってくれば「true」になり登録完了
		// 引数はユーザーが入力した「id」「pw」「name」
		public boolean isRegistOk (String id, String pw, String name) {

			Connection conn = null;
			boolean registResult = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

				// SQL文のINSERTを用意
				String sql = "INSERT INTO users (id, pw, name, comment) VALUES (?, ?, ?, 'よろしくお願いします');";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// INSERTの「?」を埋める(SQL文を完成させる)
				pStmt.setString(1, id);
				pStmt.setString(2, pw);
				pStmt.setString(3, name);

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					registResult = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果(true か false)を返す
			return registResult;
		}


//Usersテーブルを更新するメソッド
		public boolean updateUser(String name, String comment, int icon, int themecolor) {
			Connection conn = null;
				boolean updateResult =false;

			//以下の処理が成功した場合、updateResult =true（更新成功）
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

				// SELECT文を準備する
				String sql = "UPDATE users SET name=?, comment=?, icon=?, themecolor=? WHERE id=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				pStmt.setString(1, name);
				pStmt.setString(2, comment);
				pStmt.setInt(3, icon);
				pStmt.setInt(4, themecolor);

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					updateResult = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			// 結果を返す
			return updateResult;
	}


//セッションスコープから取得したユーザーIDを引数にして、ユーザー情報を持ってくる
//	ユーザーの画面表示

	public Users selectUser(String id) {
		Connection conn = null;
		Users user = new Users();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT id, name, comment, icon, themecolor FROM users WHERE id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);


			// SQL文を完成させる
			pStmt.setString(1,id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			rs.next();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setComment(rs.getString("comment"));
				user.setIcon(rs.getInt("icon"));
				user.setThemecolor(rs.getInt("themecolor"));
		}
		catch (SQLException e) {
			e.printStackTrace();
			user = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			user = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					user = null;
				}
			}
		}

		// 結果を返す
		return user;
	}
}


