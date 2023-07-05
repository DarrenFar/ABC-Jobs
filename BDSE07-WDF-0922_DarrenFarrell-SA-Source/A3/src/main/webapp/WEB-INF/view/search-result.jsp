
<%@ include file="header.jsp" %>
<div class="container min-vh-100" style="">
        <h2 class="my-3">You Searched For :<%= request.getParameter("search") != null ? request.getParameter("search") : "" %></h2>
        <h1>${notFound == true ? "Not Found" : ""}</h1>
        <div class="container py-5" >
          <div class="row d-flex align-items-center ">
            <div class="col col-md-9 col-lg-10">
            <c:forEach var="s" items="${selected}">
              <div class="card mb-2" style="border-radius: 15px;">
                <div class="card-body p-4">
                  <div class="d-flex text-black">
                    <div class="flex-shrink-0">
                      <img src="image/profile.jpg"
                        alt="Generic placeholder image" class="img-fluid"
                        style="width: 180px; border-radius: 10px;">
                    </div>
                    <div class="flex-grow-1 ms-3">
                      <h5 class="mb-1">${s.getName()}</h5>
                      <p class="mb-2 pb-1" style="color: #2b2a2a;">${s.getEmail()}</p>
                      <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
                        style="background-color: #efefef;">
                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.</p>
                      </div>
                      <div class="d-flex pt-1">
                        	         <form action="result" method="post" class="ms-auto">
	           		<input type="hidden" name="uId" value="${s.getUsers_ID()}">
		           	<button type="submit" class="btn btn-outline-success ms-auto">View Profile</button>
			   </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
