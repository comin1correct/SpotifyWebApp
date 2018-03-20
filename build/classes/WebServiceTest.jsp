<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "edu.pitt.IS18.SpotifyClone.jsp.*,java.sql.SQLException, java.sql.ResultSet, java.util.*,com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Service Test</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>



<script>

	var songList = null;
	
	$(document).ready(function(){
		
		$.get("GetArtistList", function(data){
			/*  comes back as string need to convert to object
			songList = JSON.parse(data);
			
			no need with the explicit call of "response.setContentType("application/json");" knows it a json object
			*/
			console.log(data);
		});
	});
</script>


</body>
</html>

<!-- 
<script>
	var song = {};
	/*  empty object == {}*/
	
	var song2 = {
			"song_id":1,
			"title" : "Stair way to Heaven",
			"length" : 10,
	};
	
	var song3 = "{'song_id':1,'title': 'Stair way to Heaven','length' : 10}";
	
	
	$(document).ready(function(){
		//console.log("jQuery is 3.3.1 is loaded");
		
		song.id = 1;
		song.title = "Stairway to Heaven";
		song.length = 10;
		
		console.log(song);
		console.log("Song title: "+ song.title);
		
		
		console.log(song2);
		
		//converts javascript obj to string
		var song3 = JSON.stringify(song2)
		console.log(song3);
		
		
		
		
	});

</script> -->