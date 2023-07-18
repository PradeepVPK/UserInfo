<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/bootstrap.css">
</head>
<body>
  <div class="container m-5">
    <form class="row g-3 m-5  needs-validation" novalidate  method="post">

      <input type="hidden" name="action" value="register">

      <div class="col-md-6   form-floating ">
        <input type="text" class="form-control"required name="username" id="floatingName" placeholder="Pradeep"><br>
        <label for="floatingName">Name</label>
      </div>
      <div class="col-md-6  form-floating ">
       
      <input type="password" class="form-control " required name="password" id="floatingPassword" placeholder="password"><br>
      <label for="floatingPassword">Password</label>
  </div>

  <fieldset class="row mb-3">
    <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
    <div class="col-md-8">
      <div class="form-check col-md-4 gap-2">
        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
        <label class="form-check-label" for="male">
        Male
        </label>
      </div>
      <div class="form-check col-md-4 gap-2" >
        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
        <label class="form-check-label" for="female">
       Female
        </label>
      </div>
    </div>
  </fieldset>



  <div class="col-md-6 form-floating ">
    <input type="date" class="form-control" name="dob" id="floatingDob" required  placeholder="15-06-2003"><br>
    <label for="floatingDob">Date Of Birth</label>
  </div>

  <div class="col-md-6 form-floating ">
    <input type="email" class="form-control" name="email" id="floatingEmail" required placeholder="ame@example.com"><br>
    <label for="floatingEmail">Email </label>̥

    <div class="col-auto">
    <button type="submit" class="btn btn-primary">Register</button><br> <br> Already a User?<a href="login.jsp">Login</a>
   </div> </form>
  </div>

  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
  </script>
</body>

</html>