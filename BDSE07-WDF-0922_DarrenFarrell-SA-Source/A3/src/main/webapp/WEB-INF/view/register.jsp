<%@ include file="header.jsp" %>
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    <div class="container">
      <div class="row gx-lg-5 align-items-center">
        <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            The best place <br />
            <span class="text-success">To find jobs</span>
          </h1>
          <p style="color: hsl(217, 10%, 50.8%)">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
            Eveniet, itaque accusantium odio, soluta, corrupti aliquam
            quibusdam tempora at cupiditate quis eum maiores libero
            veritatis? Dicta facilis sint aliquid ipsum atque?
          </p>
        </div>

        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form:form action="process-register" id="formValidation" method="post" modelAttribute="registration">
                <h4 class="fw-bold">Register now</h4>
                <p>Please input all of the form below to register to ABC Jobs</p>
                <hr class="my-4">
                <div class="alert alert-danger ${errMsg != null ? " d-block" : "d-none" }" role="alert">
      			${errMsg}
    			</div>

                <div class="form-outline mb-4">
                  <input type="text" class="form-control" placeholder="Full name" required id="fullname" name="fullname"/>
                </div>

                <div class="form-outline mb-4">
                  <input type="email" class="form-control" placeholder="Email address" id="email" name="email" required/>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" class="form-control" placeholder="Password" id="password" name="password" required/>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" class="form-control" placeholder="Confirm Password" id="confirmpassword" required name="confirmpassword"  />
                </div>

                <div class="text-center text-lg-start mt-4 pt-2">
                  <p class="small fw-bold">Already have an account? <a href="login"
                      class="link-success">Sign in</a></p>
                      <button type="submit" id="submit-button" class="btn btn-success btn-block mb-4">
                        Sign up
                      </button>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="footer.jsp" %>