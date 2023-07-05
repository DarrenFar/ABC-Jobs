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
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Change password</h2>
                        <p>You can reset your password here.</p>
                        <div>
                          <form action="reset-pass" id="formValidation" class="text-center" method="post">
                            <div>
                                <input placeholder="Password" type="password" class="form-control mb-2" required id="password" name="password" >
                                <input placeholder="Confirm Password" type="password" class="form-control" required id="confirmpassword" name="confirmpassword">
                            </div>
                            <div>
                              <button class="btn btn-success btn-block my-4" type="submit">Change Password</button>
                            </div>
                            <a href="login" class="text-decoration-none">Back to Sign in</a>
                          </form>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
       <%@ include file="footer.jsp" %>