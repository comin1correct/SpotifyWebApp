<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Resources:
    1. https://www.youtube.com/watch?v=moBhzSC455o
    2. https://gridbyexample.com/
    3. https://www.bitovi.com/blog/using-css-grid-to-build-a-page-layout
    4. HTML5(audioPlayer) - https://www.youtube.com/watch?v=vtZCMTtP-0Y
    5. https://medium.com/flexbox-and-grids/how-to-efficiently-master-the-css-grid-in-a-jiffy-585d0c213577
    6. https://medium.freecodecamp.org/understanding-flexbox-everything-you-need-to-know-b4013d4dc9af
    7. https://objectpartners.com/2011/04/14/jsp-to-include-or-jspinclude && https://beginnersbook.com/2013/12/jsp-include-with-parameter-example/
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= request.getParameter("pageTitle")%></title>
    <link rel="icon"  href= "images/spotify-icon.png" />
    <link rel="stylesheet" href="stylesheets/stylesheet.css">
    <link rel="stylesheet" href="stylesheets/albumStyle.css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <script src="script.js"></script>
</head>