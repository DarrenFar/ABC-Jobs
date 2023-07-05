<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link href="css/style.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
    <header id="header" class="d-flex align-items-center">
        <div class="container d-flex align-items-center justify-content-between">
          <h1 class="logo"><a href="home">ABC Jobs</a></h1>
          <nav id="navbar" class="navbar">
            <ul>
            <form class="d-flex ms-auto" action="searching" method="get"  role="search">
              <input class="form-control me-2" type="search" name="search"  placeholder="Search" aria-label="Search">
              <button class="btn btn-dark" type="submit">Search</button>
          </form>
              <li><a class="nav-link" href="home">Home</a></li>
              <li><a class="nav-link" href="profile">Profile</a></li>
              <% if((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("userId").toString().equals("1")) { %>
        <li>
          <a class="nav-link" href="<%= request.getContextPath() %>/3Pf4D5qX4v">Admin</a>
        </li>
      <% } %>
            </ul>
          </nav>
        </div>
      </header>
