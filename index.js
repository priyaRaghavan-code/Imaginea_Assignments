const fname = document.getElementById("fname");
const lname = document.getElementById("lname");
const dept = document.getElementById("dept");
const uname = document.getElementById("uname");
const pwd = document.getElementById("pwd");
const confirmpwd = document.getElementById("confirmpwd");
const email = document.getElementById("email");
const num = document.getElementById("num");

document.getElementById("submitButton").addEventListener("click", () => {
    let fnameRes = fname.value
    let lnameRes = lname.value
    let deptRes = dept.value
    console.log(fnameRes)
    if (fnameRes === null || fnameRes.length <= 1 || fnameRes.length > 15 || !isNumberCheck(fnameRes) || !isSpecialChar(fnameRes)) {
        console.log("Invalid First Name")
        document.getElementById("fnameError").style.display = "block"
    } else {
        document.getElementById("fnameError").style.display = "none"
        console.log("Valid First Name");
    }

    if (lnameRes === null || lnameRes.length <= 1 || lnameRes.length > 15 || !isNumberCheck(lnameRes) || !isSpecialChar(lnameRes)) {
        console.log("Invalid First Name")
        document.getElementById("lnameError").style.display = "block"
    } else {
        document.getElementById("lnameError").style.display = "none"
        console.log("Valid First Name");
    }

    if (dept === null || dept.length <= 1 || lnameRes.length > 15 || !isNumberCheck(lnameRes) || !isSpecialChar(lnameRes)) {
        console.log("Invalid First Name")
        document.getElementById("lnameError").style.display = "block"
    } else {
        document.getElementById("lnameError").style.display = "none"
        console.log("Valid First Name");
    }

})

function isNumberCheck(result) {
    for (let i=0;i<result.length;i++) {
        if (!isNaN(result[i])) {
            console.log("Failed at Number")
            return false
        }
    }
    return true
}

function isSpecialChar(result) {
    const specialChars = ['-', '!', '~', '#', '$']
    for (let i = 0;i<result.length;i++) {
        if (specialChars.includes(result[i])) {
            console.log("Failed at special")
            return false
        }
    }
    return true
}