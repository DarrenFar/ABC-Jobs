<%@ include file="header.jsp" %>
<div class="container min-vh-100">
	<table class="table table-hover my-3">
	    <thead>
	      <tr>
	        <th scope="col">#</th>
	        <th scope="col">Full Name</th>
	        <th scope="col">Email</th>
	        <th scope="col">Country</th>
	        <th scope="col">Action</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<% int i = 1; %>
		   	<c:forEach var="user" items="${users}">
	   		  <tr>
		        <th scope="row"><%= i++ %></th>
		        <td>${user.getName()}</td>
		        <td>${user.getEmail()}</td>
		        <td>${user.getCountry() == null ? "-" : user.getCountry()}</td>
		        <td>
		          <form action="VjSSBQ2ZVb" method="post" class="ms-auto">
	           		<input type="hidden" name="uId" value="${user.getUsers_ID()}">
		           	<button type="submit" class="btn btn-outline-success ms-auto">Edit</button>
			   </form>
		        <form action="result" method="post" class="ms-auto">
	           		<input type="hidden" name="uId" value="${user.getUsers_ID()}">
		           	<button type="submit" class="btn btn-outline-success ms-auto">Detail</button>
			   </form>
			    <form action="PadsNsIda1" method="post" class="ms-auto">
	           		<input type="hidden" name="uId" value="${user.getUsers_ID()}">
		           	<button type="submit" class="btn btn-outline-danger ms-auto">Delete</button>
			   </form>
		        </td>
		      </tr>
		   	</c:forEach>
	    </tbody>
	  </table>
</div>
<%@ include file="footer.jsp" %>