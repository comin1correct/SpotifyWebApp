<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "edu.pitt.IS18.SpotifyClone.jsp.*,java.sql.SQLException, java.sql.ResultSet, java.util.*,com.mysql.jdbc.Driver" %>
    
<!-- Resources:
    1. https://www.youtube.com/watch?v=moBhzSC455o
    2. https://gridbyexample.com/
    3. https://www.bitovi.com/blog/using-css-grid-to-build-a-page-layout
    4. HTML5(audioPlayer) - https://www.youtube.com/watch?v=vtZCMTtP-0Y
    5. https://medium.com/flexbox-and-grids/how-to-efficiently-master-the-css-grid-in-a-jiffy-585d0c213577
    6. https://medium.freecodecamp.org/understanding-flexbox-everything-you-need-to-know-b4013d4dc9af
-->

<!--
=====================================
~~~~~~~~~~~~~~~HEADER~~~~~~~~~~~~~~~~
=====================================
 -->
<link rel="stylesheet" href="stylesheets/albumStyle.css">
 <!--
=====================================
~~~~~~~~~~~~~~SHOWCASE~~~~~~~~~~~~~~~
=====================================
 --> 
    <main class="main">

        <!--music art and playbacks-->
        <div class="main__header">

            <div class="img"> <!-- Album art-->
                <img src="http://bit.ly/2sc2NJd"/>
            </div>

            <section class="details"> <!-- Album details-->
                <div>
                    <p>CattyBoard Top 100 Single Charts (11.06.36)</p>
                    <p class="sm--hide">Unknown Artist</p>
                    <p class="sm--hide">2016 . charts . 100 songs</p>
                </div>

                <div> <!-- Controls-->
                    <!--https://fontawesome.com/how-to-use/svg-with-js-->
                    <i class="fas fa-play fa-fw"></i>Play all
                    <i class="fas fa-plus fa-fw"></i> Add to
                    <i class="fas fa-ellipsis-h fa-fw"></i>More
                </div>

            </section>
        </div> <!--main_header END-->

        <!--album details-->
        <div>
            <ul class="music-list">

				<%
					Vector<Vector<String>> artistTable = new Vector<>();
					
					try {
					    String sql = "SELECT * FROM spotify_knockoff.artist;";
					    DbUtilities db = new DbUtilities();
					    ResultSet rs = db.getResultSet(sql);
					    while(rs.next())
					    {
					        Artist a = new Artist(rs.getString("artist_id"),
					        rs.getString("first_name"),
					        rs.getString("last_name"),
					        rs.getString("band_name"),
					        rs.getString("bio"));
	
					
					        artistTable.add(a.getArtistRecord());
					    }
					    rs.close();
					    db.closeDbConnection();
					    db = null;
					}catch (SQLException e){
					    e.printStackTrace();
					}%>	
					
				<%for(int i = 0; i < artistTable.size(); i++){%>	
                <li>
                    <p id = "firstName"><%=artistTable.get(i).get(1)%></p>
                    <p class="sm--hide" id= "bandName"><%=artistTable.get(i).get(3)%></p>
                    <p class= "sm--right" id= "bio"><%=artistTable.get(i).get(4)%></p>
                    <p class="sm--hide"><span class="catty-cloud"> CLOUD SYNC</span></p>
                    
                </li>
                <%}%>

            </ul>


        </div> <!--END - album details-->

    </main>
