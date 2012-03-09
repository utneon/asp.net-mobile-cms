// JavaScript Document
var jQT = $.jQTouch({
    statusBar: 'default',
    useAnimations: true
});
/*
$(document).ready(function () {
$('#detalhesnoticia').bind('pageAnimationEnd', function (e, info) {
$('<ul />').load('x.aspx').appendTo(this);
});
}
);
*/
function loadx(page) {
    $('#newsDetails').bind('pageAnimationEnd', function (e, info) {
        $('<div />').load(page).appendTo(this);
    });
}
function loadXMLDocNews(id) {
    var myDiv = "newsDetails";
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'NewsDetails.aspx?id=' + id, true);
    xmlhttp.send();
}
function loadXMLDocProducts(id) {
    var myDiv = "productDetails";
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'ProductDetails.aspx?id=' + id, true);
    xmlhttp.send();
}
function loadXMLDocProductConfirmPurchase(id) {
    var myDiv = "purchase";
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'ConfirmPurchase.aspx?id=' + id, true);
    xmlhttp.send();
}
function loadXMLDocUserAuth(id) {
    var myDiv = "userauthenticate";
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'AuthenticateUserPurchase.aspx?id=' + id, true);
    xmlhttp.send();
}
function loadXMLDocAuthenticate(id, pricez) {
    var username = document.getElementById('userAuthLog');
    var password = document.getElementById('userPassLog');
    var myDiv = "purchaseCompleted";
    var xmlhttp;

    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'PurchaseComplete.aspx?id=' + id + "&username=" + username.value + "&password=" + password.value + "&total=" + pricez, true);
    xmlhttp.send();
}
function loadXMLDocAuthenticate2() {
    var username = document.getElementById('userAuthLog2');
    var password = document.getElementById('userPassLog2');
    var myDiv = "send-ticket";
    var xmlhttp;

    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(myDiv).innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", 'AuthenticateUserSupport.aspx?username=' + username.value + "&password=" + password.value, true);
    xmlhttp.send();
}