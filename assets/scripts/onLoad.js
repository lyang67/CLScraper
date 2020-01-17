function paintIt( id) {
    document.getElementById(id).style.color = "red";

    document.getElementById(id).style.backgroundColor = "red";
    document.getElementById(id).textContent = "I'm red";
}

function loadDoc() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "http://google.com", true);
    xhttp.send();
}