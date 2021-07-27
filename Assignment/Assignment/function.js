function myFunction() {
    var x = document.getElementById("txtPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
    var x = document.getElementById("txtCPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}