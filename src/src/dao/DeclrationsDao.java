package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeclrationsDao {
	public boolean insertDec(String dec,int tag,int private_flag,String use_id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO BC (name, postalcode,address,corporation,department,job,telephonenumber,emailaddress,url,businesshours,roma) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, );
			pStmt.setString(2, );
			pStmt.setString(3, );
			pStmt.setString(4, );
			pStmt.setString(5, );
			pStmt.setString(6, );
			pStmt.setString(7, );
			pStmt.setString(8, );
			pStmt.setString(9, );

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

		// 結果を返す
		return result;
	}

	public boolean editDec(int dec_id) {
		return true;
	}

	public boolean achiveDec(int dec_id) {
		return true;
	}

	public boolean deleteDec(int dec_id) {
		return true;
	}
}
