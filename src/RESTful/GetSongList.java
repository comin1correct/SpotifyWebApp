package RESTful;

// IMPORTING THE JSON jar files
import org.json.JSONObject;

import edu.pitt.IS18.SpotifyClone.jsp.DbUtilities;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetSongList
 */
@WebServlet("/GetSongList")
public class GetSongList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSongList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		EXplictly telling the server that the data coming back is in JSON format
		response.setContentType("application/json");
		
		
		try {
		DbUtilities db = new DbUtilities();
		String sql = "SELECT * FROM song ORDER BY title ASC;";
		ResultSet rs = db.getResultSet(sql);	
		JSONArray songList = new JSONArray();
			while(rs.next()) {
				JSONObject song = new JSONObject();
				song.put("id", rs.getString("song_id"));
				song.put("title", rs.getString("title"));
				
				
//				Adding to JSON array;
				songList.put(song);
				
				
				
			}
//			print to web browser
			response.getWriter().write(songList.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
