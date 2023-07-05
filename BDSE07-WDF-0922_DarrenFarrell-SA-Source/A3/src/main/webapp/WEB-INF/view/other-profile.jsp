
<%@ include file="header.jsp" %> 
        <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 border-right">
                <div class="d-flex flex-column align-items-center text-center">
                    <img class="rounded-circle mt-5" width="150px" src="image/profile.jpg">
                    <span class="font-weight-bold">${Name}</span>
                    <span class="text-black-50">${Email}</span>
                    </div>
            </div>
            <div class="col-md-7 border-right">
                <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Full Name</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            ${Name}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Email</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            ${Email}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Country</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            ${Country}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Education</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            ${Education}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Certification</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            ${Certification}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-12">
  							<button class="btn btn-success" id="follow-button" onclick="follow()">Follow</button>
						</div>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="card container col-md-13">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center experience"><span>Experience</span></div><br>
                    <div class="row">
                        <br>
                        <div class="col-sm-9 text-secondary">
                            ${Experience}
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    var isFollowed = false;
  function follow() {
	    var button = document.getElementById("follow-button");
	    if (isFollowed) {
	      button.innerHTML = "Follow";
	      isFollowed = false;
	    } else {
	      button.innerHTML = "Unfollow";
	      isFollowed = true;
	    }
  }
</script>
<%@ include file="footer.jsp" %>