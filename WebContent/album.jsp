<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "edu.pitt.IS18.SpotifyClone.jsp.*,java.sql.SQLException, java.sql.ResultSet, java.util.*,com.mysql.jdbc.Driver" %>

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
					Vector<Vector<String>> albumTable = new Vector<>();
					
					try {
					    String sql = "SELECT * FROM spotify_knockoff.album;";
					    DbUtilities db = new DbUtilities();
					    ResultSet rs = db.getResultSet(sql);
					    while(rs.next())
					    {
					        Album a = new Album(rs.getString("album_id"),
					        rs.getString("title"),
					        rs.getString("release_date"),
					        rs.getString("recording_company_name"),
					        rs.getInt("number_of_tracks"),
					        rs.getString("PMRC_rating"),
					        rs.getDouble("length"));
					        
					        albumTable.add(a.getAlbumRecord());
					    }
					    rs.close();
					    db.closeDbConnection();
					    db = null;
					}catch (SQLException e){
					    e.printStackTrace();
					}%>	
					
				<%for(int i = 0; i < albumTable.size(); i++){%>	
                <li>
                    <p id= "title"><%=albumTable.get(i).get(1)%></p>
                    <p class="sm--hide" id= "recordingCompany"><%=albumTable.get(i).get(3)%></p>
                    <p class= "sm--right" id= "length"><%=albumTable.get(i).get(6)%></p>
                    <p class="sm--hide"><span class="catty-cloud"> CLOUD SYNC</span></p>
                    
                </li>
                <%}%>

            </ul>


        </div> <!--END - album details-->

    </main>
