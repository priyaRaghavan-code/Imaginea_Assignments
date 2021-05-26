const fname = document.getElementById("fname");
const lname = document.getElementById("lname");
const dept = document.getElementById("dept");
const uname = document.getElementById("uname");
const pwd = document.getElementById("pwd");
const confirmpwd = document.getElementById("confirmpwd");
const email = document.getElementById("email");
const num = document.getElementById("num");

document.getElementById("submitButton").addEventListener("click", () => {
  var decimal =
    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
  var emailRegEx =
    /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
  var phoneNumRegEx = /^\d{10}$/;
  let fnameRes = fname.value;
  let lnameRes = lname.value;
  let deptRes = dept.value;
  let unameRes = uname.value;
  let pwdRes = pwd.value;
  let confirmpwdRes = confirmpwd.value;
  let emailRes = email.value;
  let numRes = num.value;
  let bool = true;

  if (
    fnameRes === null ||
    fnameRes.length <= 1 ||
    fnameRes.length > 15 ||
    !isNumberCheck(fnameRes) ||
    !isSpecialChar(fnameRes) ||
    !isCapital(fnameRes)
  ) {
    document.getElementById("fnameError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("fnameError").style.display = "none";
  }

  if (
    lnameRes === null ||
    lnameRes.length <= 1 ||
    lnameRes.length > 15 ||
    !isNumberCheck(lnameRes) ||
    !isSpecialChar(lnameRes) ||
    !isCapital(lnameRes)
  ) {
    document.getElementById("lnameError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("lnameError").style.display = "none";
  }

  if (deptRes === "") {
    document.getElementById("deptError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("deptError").style.display = "none";
  }

  if (unameRes === null || unameRes.length <= 1 || unameRes.length > 15) {
    document.getElementById("unameError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("unameError").style.display = "none";
  }

  if (!pwdRes.match(decimal)) {
    document.getElementById("pwdError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("pwdError").style.display = "none";
  }

  if (pwdRes !== confirmpwdRes) {
    document.getElementById("confirmpwdError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("confirmpwdError").style.display = "none";
  }

  if (!emailRes.match(emailRegEx) || !/@gmail\.com$/.test(emailRes)) {
    document.getElementById("emailError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("emailError").style.display = "none";
  }

  if (!numRes.match(phoneNumRegEx)) {
    document.getElementById("numError").style.display = "block";
    bool = false;
  } else {
    document.getElementById("numError").style.display = "none";
  }
  
  if (bool) {
    alert(
      "FirstName:" +
        fnameRes +
        "\n" +
        "LastName:" +
        lnameRes +
        "\n" +
        "Department:" +
        deptRes +
        "\n" +
        "UserName:" +
        unameRes +
        "\n" +
        "Password:" +
        pwdRes +
        "\n" +
        "Email:" +
        emailRes +
        "\n" +
        "ContactNo:" +
        numRes
    );
  }
});

function isNumberCheck(result) {
  for (let i = 0; i < result.length; i++) {
    if (!isNaN(result[i])) {
      console.log("Failed at Number");
      return false;
    }
  }
  return true;
}

function isSpecialChar(result) {
  const specialChars = ["-", "!", "~", "#", "$"];
  for (let i = 0; i < result.length; i++) {
    if (specialChars.includes(result[i])) {
      console.log("Failed at special");
      return false;
    }
  }
  return true;
}

function isCapital(result) {
  if (result.charAt(0) !== result.charAt(0).toUpperCase()) {
    return false;
  }
  return true;
}
