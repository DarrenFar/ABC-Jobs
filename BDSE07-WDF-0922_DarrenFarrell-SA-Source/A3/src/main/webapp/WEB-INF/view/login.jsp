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
                  <form:form modelAttribute="message" action="process-login" id="formValidation" method="post">
                    <h4 class="fw-bold">Sign in</h4>
                    <p>Please input all of the form below to sign in to ABC Jobs</p>
                    <hr class="my-4">
    				<div class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? " d-none" : "d-block" }" role="alert">
      ${ message }
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    
    <div class="alert alert-success alert-dismissible fade show my-3 ${ scMessage == null ? " d-none" : "d-block" }" role="alert">
      ${ scMessage }
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    
                    <div class="form-outline mb-4">
                      <input type="email" class="form-control" placeholder="Email address" id="email" name="email" required/>
                    </div>
    
                    <div class="form-outline mb-4">
                      <input type="password" class="form-control" placeholder="Password" id="password" name="password" required/>
                    </div>
    
                    <div class="text-center text-lg-start">
                      <p class="small fw-bold">Don't have an account? <a href="register"
                          class="link-success">Register</a></p>
                          <a href="forget_password" class="text-decoration-none">Forget Password</a>
                    </div>
                    <button type="submit" id="submit-button" class="btn btn-success btn-block mb-4 mt-4">Sign in</button>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <%@ include file="footer.jsp" %>