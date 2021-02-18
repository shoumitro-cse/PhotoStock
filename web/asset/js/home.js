//for categories
function openLayout(e, className) {
    e.preventDefault();
    pageLoader();
    var tablink = document.getElementsByClassName("tablink");
    for (var i = 0; i < tablink.length; i++) {
        tablink[i].className = tablink[i].className.replace(" selected", "");
    }
    var tabcontent = document.getElementsByClassName("tab-content");
    for (var i = 0; i < tabcontent.length; i++) {
        tabcontent[i].className = tabcontent[i].className.replace(" selected", "");
    }
    var current = document.getElementsByClassName(className);
//    console.log(current);
    if (current.length) {
        if (current.length < 2) {
            current[0].className += " selected";
        } else {
            current[0].className += " selected";
            current[1].className += " selected";
        }
    }
}
if (document.getElementById("active_tab_link_id")) {
    document.getElementById("active_tab_link_id").click();
}


// page loader
pageLoader();
function pageLoader() {
    HidePage();
    setTimeout(showPage, 2000);
}
function showPage() {

    let a_tag = document.querySelectorAll("#categories .layout  ul li a");
    for (let i = 0; i < a_tag.length; i++) {
        a_tag[i].style.opacity = "1";
    }

    let loader = document.getElementsByClassName("loader");
//    console.log(loader);
    for (let i = 0; i < loader.length; i++) {
        loader[i].style.display = "none";
    }
}
function HidePage() {

    let a_tag = document.querySelectorAll("#categories .layout  ul li a");
    for (let i = 0; i < a_tag.length; i++) {
        a_tag[i].style.opacity = ".05";
    }

    let loader = document.getElementsByClassName("loader");
//    console.log(loader);
    for (let i = 0; i < loader.length; i++) {
        loader[i].style.display = "block";
    }
}


document.addEventListener('DOMContentLoaded', function (event) {
    var dataText = ["Search for Photographs", "Banner, Ecommers Photographs for Business.", "Search Corona virus update Image.", "Icon, Image, Text Photographs for Banners"];

    function typeWriter(text, i, fnCallback) {
        if (i < (text.length)) {
            document.getElementById("top-search-box").attributes["placeholder"].value = text.substring(0, i + 1) + '|';
            setTimeout(function () {
                typeWriter(text, i + 1, fnCallback);
            }, 100);
        } else if (typeof fnCallback === 'function') {
            setTimeout(fnCallback, 1000);
        }
    }

    function StartTextAnimation(i) {
        if (typeof dataText[i] === 'undefined') {
            setTimeout(function () {
                StartTextAnimation(0);
            }, 1000);
        }
        if (dataText[i]) {
            if (i < dataText[i].length) {
                typeWriter(dataText[i], 0, function () {
                    StartTextAnimation(i + 1);
                });
            }
        }
    }
    StartTextAnimation(0);
});

