package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CommonTable;

public class DeclarationsDao {
	//宣言リストの新規作成
	public boolean insertDec(String dec,int tag,boolean privateFlag,String userId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "INSERT INTO declarations (declaration, tag, private_flag,user_id) VALUES ( ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を作成する
			pStmt.setString(1,dec);
			pStmt.setInt(2,tag);
			pStmt.setBoolean(3,privateFlag);
			pStmt.setString(4,userId);

			// SQL文の成功/失敗を変数に入れる
			int ans = pStmt.executeUpdate();

			// SQL文を実行する
			if (ans == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

	//宣言リストの編集
	public boolean editDec(String dec,int tag,boolean privateFlag,int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE declarations SET declaration = ?, tag = ?, private_flag = ? WHERE id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を作成する
			pStmt.setString(1,dec);
			pStmt.setInt(2,tag);
			pStmt.setBoolean(3,privateFlag);
			pStmt.setInt(4,decId);

			// SQL文の成功/失敗を変数に入れる
			int ans = pStmt.executeUpdate();

			// SQL文を実行する
			if (ans == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

	//宣言リストの達成
	public boolean achiveDec(int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE declarations  SET achieve_flag = 1 WHERE id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を作成する
			pStmt.setInt(1,decId);

			// SQL文の成功/失敗を変数に入れる
			int ans = pStmt.executeUpdate();

			// SQL文を実行する
			if (ans == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

	public boolean noAchiveDec(int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE declarations  SET achieve_flag = 0 WHERE id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を作成する
			pStmt.setInt(1,decId);

			// SQL文の成功/失敗を変数に入れる
			int ans = pStmt.executeUpdate();

			// SQL文を実行する
			if (ans == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

	//宣言リストの削除
	public boolean deleteDec(int decId) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "UPDATE declarations SET delete_flag = 1 WHERE id =?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を作成する
			pStmt.setInt(1,decId);

			// SQL文の成功/失敗を変数に入れる
			int ans = pStmt.executeUpdate();

			// SQL文を実行する
			if (ans == 1) {//executeUpdate()　← 更新した値が変える「1」なら成功
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

	//マイリストに表示するための表取得
	public ArrayList<CommonTable> myListDec(String userId){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * "
					+ "FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id "
					+ "WHERE declarations.achieve_flag = 0  and declarations.delete_flag = 0  and declarations.user_id = ? ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1の?が自分のID
				pStmt.setString(1,userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsPrivateFlag(rs.getBoolean("declarations.private_flag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setStepsDecId(rs.getInt("steps.declaration_id"));
				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//マイページに表示するための表取得
	public ArrayList<CommonTable> myPageDec(String userId){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT *"
					+ "FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id "
					+ "WHERE declarations.delete_flag = 0 and users.id = ? ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1の?が自分のID
				pStmt.setString(1, userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();



			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsAchieveFlag(rs.getBoolean("declarations.achieve_flag"));
				ct.setDecsPrivateFlag(rs.getBoolean("declarations.private_flag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));

				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//リアクション数
	public int countReaction(int decsId){
			Connection conn = null;
			int count = 0;
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");
				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

				// SQL文を準備する
				String sql = "SELECT count(*) FROM REACTIONS where declaration_id = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1,decsId);

				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				rs.next();
					count = rs.getInt("count(*)");
			}
			catch (SQLException e) {
				e.printStackTrace();
				count = 0;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				count = 0;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						count = 0;
					}
				}
				return count;
			}
		}

	//他ユーザーページに表示するための表取得
	public ArrayList<CommonTable> otherPageDec(String userId,String otherId){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * "
					+ "FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.private_flag = 0 and  declarations.delete_flag = 0 and users.id = ? ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2の?が自分のID、3の?が他の人のID
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);
				pStmt.setString(3,otherId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsAchieveFlag(rs.getBoolean("declarations.achieve_flag"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));
				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//タイムラインに表示するための表取得
	public ArrayList<CommonTable> timelineDec(String userId){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM declarations "
					+ "LEFT JOIN users ON declarations.user_id = users.id "
					+ "LEFT JOIN steps ON declarations.id = steps.declaration_id "
					+ "LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? "
					+ "LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.achieve_flag = 0  and declarations.private_flag = 0 and declarations.delete_flag = 0 ORDER BY declarations.id , steps.achieve_flag";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2の?が自分のID
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();

				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));
				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//ブックマークに表示するための表取得
	public ArrayList<CommonTable> bookmarkDec(String userId){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT *"
					+ "FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.achieve_flag = 0  and declarations.private_flag = 0 and declarations.delete_flag = 0  and bookmarks.user_id = ? ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2,3の?が自分のID、
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);
				pStmt.setString(3,userId);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));

				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//検索結果に表示するための表取得
	public ArrayList<CommonTable> searchResultDec(String userId,String str){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT *"
					+ " FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.achieve_flag = 0  and declarations.private_flag = 0 and declarations.delete_flag = 0  and (declarations.declaration LIKE ?  or steps.step LIKE ?)ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2の?が自分のID、3,4の?が入力フォームに入力された値
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);
				pStmt.setString(3,"%" + str + "%");
				pStmt.setString(4,"%" + str + "%");

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsAchieveFlag(rs.getBoolean("declarations.achieve_flag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));

				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	public ArrayList<CommonTable> searchAResultDec(String userId,String[] str){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sqlA = "SELECT *"
					+ " FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.achieve_flag = 0  and declarations.private_flag = 0 and declarations.delete_flag = 0  ";
			String sqlB = " and (declarations.declaration LIKE ?  or steps.step LIKE ?) ";
			String sqlC = "ORDER BY declarations.id , steps.achieve_flag";
			String sql;
			sql = "";
			for(int i= 0; i < str.length; i++) {
				sqlA = sqlA + sqlB;
			}
			sql = sqlA + sqlC;


			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2の?が自分のID、3,4の?が入力フォームに入力された値
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);
				int num = 3;
				for(int i =0;i <str.length; i++) {
				pStmt.setString(num,"%" + str[i] + "%");
				pStmt.setString(num+1,"%" + str[i] + "%");
					num = num + 2;
				}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsAchieveFlag(rs.getBoolean("declarations.achieve_flag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));

				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//タグ検索結果に表示するための表取得
	public ArrayList<CommonTable> tagSearchDec(String userId,int tagNumber){
		Connection conn = null;
		ArrayList<CommonTable> pageList = new ArrayList<CommonTable>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * "
					+ "FROM declarations LEFT JOIN users ON declarations.user_id = users.id LEFT JOIN steps ON declarations.id = steps.declaration_id LEFT JOIN reactions ON reactions.declaration_id = declarations.id and reactions.user_id = ? LEFT JOIN bookmarks ON bookmarks.declaration_id = declarations.id and bookmarks.user_id = ? "
					+ "WHERE declarations.achieve_flag = 0 and  declarations.private_flag = 0 and  declarations.delete_flag = 0 and declarations.tag = ? ORDER BY declarations.id , steps.achieve_flag";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる 1,2の?が自分のID、3の?が検索されたtagNumber
				pStmt.setString(1,userId);
				pStmt.setString(2,userId);
				pStmt.setInt(3,tagNumber);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {//.next() ← rsインスタンスの内容を全て取り出す
				CommonTable ct = new CommonTable();
				ct.setDecsId(rs.getInt("declarations.id"));
				ct.setDecsDeclaration(rs.getString("declarations.declaration"));
				ct.setDecsTag(rs.getInt("declarations.tag"));
				ct.setDecsAchieveFlag(rs.getBoolean("declarations.achieve_flag"));
				ct.setUsersId(rs.getString("users.id"));
				ct.setUsersIcon(rs.getInt("users.icon"));
				ct.setStepsId(rs.getInt("steps.id"));
				ct.setStepsStep(rs.getString("steps.step"));
				ct.setStepsAchieveFlag(rs.getBoolean("steps.achieve_flag"));
				ct.setReactionsId(rs.getInt("reactions.id"));
				ct.setBookmarksId(rs.getInt("bookmarks.id"));
				pageList.add(ct);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pageList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pageList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pageList = null;
				}
			}
		}

		// 結果を返す
		return pageList;
	}

	//ステップ達成個数を検索
	public int countAchieve(String id) {
		Connection conn = null;
		int count = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT count(*) FROM declarations\r\n"
					+ "LEFT JOIN users ON declarations.user_id = users.id\r\n"
					+ "LEFT JOIN steps ON declarations.id = steps.declaration_id\r\n"
					+ "WHERE user_id =? and steps.achieve_flag = true";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1,id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			rs.next();
				count = rs.getInt("count(*)");
		}
		catch (SQLException e) {
			e.printStackTrace();
			count = 0;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			count = 0;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					count = 0;
				}
			}
			return count;
		}
	}
}
