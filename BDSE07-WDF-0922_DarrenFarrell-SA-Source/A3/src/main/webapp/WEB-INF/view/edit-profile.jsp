<%@ include file="header.jsp" %>
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" width="150px" src="image/profile.jpg">
                    <span class="font-weight-bold">${Name}</span><span class="text-black-50">${Email}</span>
                </div>
            </div>
            <form action="update-profile" modelAttribute="user" method="post">
            <div class="border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>

                    <div class="row mt-3">
                    <input type="hidden" name="Users_ID" value="${id}">
                        <div><label class="labels">Full name</label><input type="text" class="form-control" required placeholder="Enter Full name" name="name" value="${Name}"></div>
                        <div><label class="labels">email</label><input type="email" class="form-control" required placeholder="Enter Full name" name="email" value="${Email}"></div>
                        <div><label class="labels">Country</label><input type="text" class="form-control" placeholder="Your Country" name="country" value="${Country}"></div>
                        <div><label class="labels">Education</label><input type="text" class="form-control" placeholder="Education" name="education" value="${Education}"></div>
                        <div><label class="labels">Certification</label><input type="text" class="form-control" placeholder="Certificate" name="certification" value="${Certification}"></div>
                        <div><label class="labels">Experience</label><input type="text" class="form-control" placeholder="Experience" name="experience" value="${Experience}"></div>
                    </div>
                    <div class="row mt-3">
                    </div>
                    <div class="mt-5 text-center"><button class="btn btn-success m-2" type="submit">Save Profile</button><a href="profile" class="btn btn-outline-success">Cancel</a></div>
                </div>
            </div>
        </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
        <style>
    body {
        background: #444444;
    }
    
    .form-control:focus {
        box-shadow: none;
        border-color: #008000
    }
    
    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none
    }
    
    .profile-button:hover {
        background: #682773
    }
    
    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }
    
    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .labels {
        font-size: 11px
    }
    
    </style>
