<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- Resources:
    1. https://www.youtube.com/watch?v=moBhzSC455o
    2. https://gridbyexample.com/
    3. https://www.bitovi.com/blog/using-css-grid-to-build-a-page-layout
    4. HTML5(audioPlayer) - https://www.youtube.com/watch?v=vtZCMTtP-0Y
    5. https://medium.com/flexbox-and-grids/how-to-efficiently-master-the-css-grid-in-a-jiffy-585d0c213577
-->
<!-- 
=====================================
~~~~~~~~~~~~~IMPORTANT~~~~~~~~~~~~~~~
===================================== 
https://stackoverflow.com/questions/
12316540/tomcat-is-not-deploying-my-web-project-from-eclipse


Select project > properties > 
deployment assembly > 

mysql-connector must be in Source
-->

<!--
=====================================
~~~~~~~~~~~~~~~HEADER~~~~~~~~~~~~~~~~
=====================================
 -->
<jsp:include page="main/header.jsp">
<jsp:param name="pageTitle" value="Spotify"/>
</jsp:include>

<body class = "bg-default">
<!--
=====================================
~~~~~~~~~~~~~~~SIDEBAR~~~~~~~~~~~~~~~
=====================================
 -->
<%@include file= "main/sidebar.jsp" %>


 <!--
=====================================
~~~~~~~~~~~~~~SHOWCASE~~~~~~~~~~~~~~~
=====================================
 --> 
 
    <div class="music-showcase">
        <script>
        		//on load 
        		$(function(){
        			$(".music-showcase").load("home.jsp");
        		});
        		
        		//home-spotify Icon:
        		document.getElementById("spotifyIcon").addEventListener("click", displayHome);
        		function displayHome() {
    				$("#album").removeClass("active");
    				$("#artist").removeClass("active");
    				$("#song").removeClass("active");
    				$('body').removeClass().addClass('bg-default');
    			
        			$(".music-showcase").load("home.jsp");
                }
        		
        		//search request
        		//https://www.youtube.com/watch?v=MG9itGX1hD0&t=311s
      		$("#search").keydown(function(event){
      			if(event.keyCode === 13){
	    				$("#album").removeClass("active");
	    				$("#artist").removeClass("active");
	    				$("#song").removeClass("active");
		            		
	      			$.get("search.jsp",{user_search:$("#search").val()},function(data){
    						$(".music-showcase").html(data);
    					});
    				}
      			})
        		
        		//click album
            document.getElementById("album").addEventListener("click", displayAlbums);
            function displayAlbums() {
				$("#album").addClass("active");
				$("#artist").removeClass("active");
				$("#song").removeClass("active");
				
            		
                $(".music-showcase").load("album.jsp");
            }
        		//click artist
        		document.getElementById("artist").addEventListener("click", displayArtists);
        		function displayArtists() {
    				$("#album").removeClass("active");
    				$("#artist").addClass("active");
    				$("#song").removeClass("active");
            		
        			$(".music-showcase").load("artist.jsp");
                }
        		//click album
        		document.getElementById("song").addEventListener("click", displaySongs);
        		function displaySongs() {
    				$("#album").removeClass("active");
    				$("#artist").removeClass("active");
    				$("#song").addClass("active");
            		
        			$(".music-showcase").load("song.jsp");
        			}
        </script>
    </div>
   
 <!--
=====================================
~~~~~~~~~~~~~~CONTROLS~~~~~~~~~~~~~~~
=====================================
 --> 
<%@include file= "main/controls.jsp" %>

<!--When passing in parameters  -->
<%-- <jsp:include page="header_footer/controls.jsp">
<jsp:param name="pageTitle" value="Spotify - Home"/>
</jsp:include> --%>

<!--
=====================================
~~~~~~~~~~~~~~~FOOTER~~~~~~~~~~~~~~~~
=====================================
 -->
<%@include file= "main/footer.jsp" %>