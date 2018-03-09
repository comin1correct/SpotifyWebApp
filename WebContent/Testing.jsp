<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "edu.pitt.IS18.SpotifyClone.jsp.*,java.sql.SQLException, java.sql.ResultSet, java.util.*,com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spotify</title>
</head>
<body>
<%
Vector<Vector<String>> songTable = new Vector<>();

try {
    String sql = "SELECT * FROM song;";
    DbUtilities db = new DbUtilities();
    ResultSet rs = db.getResultSet(sql);
    while(rs.next())
    {
        Song s = new Song(rs.getString("song_id"),
        rs.getString("title"),
        rs.getDouble("length"),
        rs.getString("file_path"),
        rs.getString("release_date"),
        rs.getString("record_date"));

        songTable.add(s.getSongRecord());
    }
    rs.close();
    db.closeDbConnection();
    db = null;
}catch (SQLException e){
    e.printStackTrace();
}%>
TESTING
<table border = "1"><%
		for(int i = 0; i < songTable.size(); i++)
        {
			%>	<tr><%
            for(int j = 0; j <songTable.get(i).size();j++)
            {
            %>
            
            		<td><%=songTable.get(i).get(j)%></td>
          
       	  <%}%>
			<tr>
		<%}%>
	</table>

</body>
</html>