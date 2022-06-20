package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReactionsDao {

	//insertReactionでリアクションが押された時にデータを一つ追加する
	public boolean insertReaction(String userId, int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			//SQL文を準備する
			String sql = "INSERT INTO reactions  (user_id,declaration_id) VALUES (?,?);";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			//SQL文を完成させる
			pStmt.setString(1, userId);
			pStmt.setInt(2, decId);

			//SQL文を実行する（DBに送る）

			if (pStmt.executeUpdate() == 1) {
				result = true;
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

	//結果を返す
	return result;

	}


	//deleteReactionメソッドでリアクションを取り消す
	public boolean deleteReaction(String userId, int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			//SQL文を準備する
			String sql = "DELETE from reactions WHRE user_id = ? and declaration_id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			//SQL文を完成させる
			pStmt.setString(1, userId);
			pStmt.setInt(2, decId);

			//SQL文を実行する（DBに送る）

			if (pStmt.executeUpdate() == 1) {
				result = true;
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

	//結果を返すConnection conn = null;
	return result;

	}



	//countReactionでどの宣言に何回リアクションをしているか数える
	public int countReaction(int decId) {
		Connection conn = null;
		int num = 0;//戻り値として何回リアクションされたかをnumに入れて返す。

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			//SQL文を準備する
			String sql = "SELECT COUNT(*) as count FROM reactions WHERE declaration_id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			//SQL文を完成させる
			pStmt.setInt(1, decId);

			//SQL文を実行する（DBに送る）
			//SQL文を実行して、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
			rs.next();
			num = rs.getInt("count");


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

	//結果を返すConnection conn = null;
	return num;

	}
}
