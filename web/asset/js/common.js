"use strict";

if (sessionStorage.getItem("body_select_box")) {

    var body_select_box = sessionStorage.getItem("body_select_box");

    if (document.getElementById('body-select-box')) {
        document.getElementById('body-select-box').value = body_select_box;
    }

    if (document.getElementById('select-box')) {
        document.getElementById('select-box').value = body_select_box;
    }
}





(function menuActive() {
    var current_active = document.getElementsByClassName("active");
    for (var i = 0; i < current_active.length; i++) {
        current_active[i].className = current_active[i].className.replace(" active", "");
    }
    try {
        if (activeId) {
            var ele = document.getElementById(activeId);
            ele.parentNode.className += " active";
        }
    } catch (e) {

    }

})();



function autocomplete(inp, arr, recent_search) {
    var currentFocus;

    inp.addEventListener("focus", function (e) {
        var div_tag, p_tag, ul_tag, li_atg, a_tag, btn, ul_list, ul_list_len;
        var r_arr = recent_search;
        div_tag = document.createElement("div");
        div_tag.setAttribute("class", "recent-search");

        p_tag = document.createElement("p");
        p_tag.setAttribute("class", "recent-search-title");
        p_tag.innerHTML = "Recent searches";
        div_tag.appendChild(p_tag);

        ul_tag = document.createElement("ul");

        for (var i = 0; i < r_arr.length; i++) {
            if (r_arr[i] !== '') {
                li_atg = document.createElement("li");

                a_tag = document.createElement("a");
                a_tag.setAttribute("href", "gallery.jsp?top_search_box=" + r_arr[i]);
                a_tag.innerHTML = r_arr[i];

                a_tag.addEventListener("click", function (e) {
                    e.preventDefault();
                    inp.value = this.innerHTML;
                    inp.parentNode.parentNode.submit();
                    // same code => inp.parentNode.parentNode.submit(); given
                    //document.getElementById("search_form").submit();
                });
                li_atg.appendChild(a_tag);

                ul_tag.appendChild(li_atg);
            }
        }
        div_tag.appendChild(ul_tag);

        // .search-container class  => position: sticky;
        // problem solve
        // show only 9 data
        ul_list = ul_tag.getElementsByTagName("li");
        ul_list_len = ul_list.length;
        if (ul_list_len >= 9) {
            for (var j = ul_list_len - 1; j >= 9; j--) {
                ul_list[j].parentNode.removeChild(ul_list[j]);
            }
        }

        btn = document.createElement("span");
        btn.setAttribute("class", "list-clear");
        btn.setAttribute("id", "clear_button");
        btn.innerHTML = "Clear all";
        btn.addEventListener("click", function (e) {
            e.preventDefault();
            localStorage.setItem("recnt_search_arr", "");
            this.parentNode.removeChild(this.parentNode.getElementsByTagName("ul")[0]);
        });
        div_tag.appendChild(btn);
        this.parentNode.appendChild(div_tag);



        document.getElementsByClassName("recent-search ")[0].style.display = "block";
    });
    function closeRecentSearch(ele) {
        var a = document.getElementsByClassName("recent-search")[0];
        var b = document.getElementById("clear_button");
        if (ele !== b && ele !== a && ele !== inp) {
            if (document.getElementsByClassName("recent-search ")[0] !== undefined) {
                document.getElementsByClassName("recent-search ")[0].style.display = "none";
            }
        }
    }

    inp.addEventListener("input", function (e) {
        var a, b, i, j, val = this.value, div_list, div_len, show_max_list_data;

        if (document.getElementsByClassName("recent-search ")[0]) {
            document.getElementsByClassName("recent-search ")[0].style.display = "none";
        }

        closeAllLists();
        if (!val) {
            return false;
        }
        currentFocus = -1;

        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");

        this.parentNode.appendChild(a);
        for (i = 0; i < arr.length; i++) {

            if (arr[i].substr(0, val.length).toUpperCase() === val.toUpperCase()) {
                b = document.createElement("DIV");

                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                b.innerHTML += arr[i].substr(val.length);

                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

                b.addEventListener("click", function (e) {
                    inp.value = this.getElementsByTagName("input")[0].value;
                    closeAllLists();
                });
                a.appendChild(b);
            }
        }
        show_max_list_data = 10;
        div_list = a.getElementsByTagName("div");
        div_len = div_list.length;
        if (div_len => show_max_list_data) {
            for (j = div_len - 1; j >= show_max_list_data; j--) {
                div_list[j].parentNode.removeChild(div_list[j]);
                div_len = div_list.length;
            }
        }

    });

    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x)
            x = x.getElementsByTagName("div");
        if (e.keyCode === 40) { // down arrow
            currentFocus++;
            addActive(x);
        } else if (e.keyCode === 38) { //up arrow
            currentFocus--;
            addActive(x);
        } else if (e.keyCode === 13) { // enter
            //e.preventDefault();
            var rs = new Array(localStorage.getItem("recnt_search_arr"));
            rs.push(inp.value);
            localStorage.setItem("recnt_search_arr", rs);
            if (currentFocus > -1) {
                if (x)
                    x[currentFocus].click();
            }
        }
    });

    function addActive(x) {
        if (!x)
            return false;
        removeActive(x);
        if (currentFocus >= x.length)
            currentFocus = 0;
        if (currentFocus < 0)
            currentFocus = (x.length - 1);
        x[currentFocus].classList.add("autocomplete-active");
        inp.value = x[currentFocus].getElementsByTagName("input")[0].value;
    }
    function removeActive(x) {
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt !== x[i] && elmnt !== inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
//         console.log(e.target);
        closeRecentSearch(e.target);
    });
}



//for local storage keyword
var rs = [""];
try {
    if (localStorage.getItem("recnt_search_arr")) {
        rs = localStorage.getItem("recnt_search_arr").split(",").reverse();
    } else {
        localStorage.setItem("recnt_search_arr", rs);
        console.log(localStorage);
    }
} catch (e) {

}


//for image key word
function getImageKeyword() {

    let arr1 = [];
    let imageHeadingArray = [];

    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {

        if (this.readyState === 4 && this.status === 200) {

            var image_arr = JSON.parse(this.responseText);

            // for image header text
            imageHeadingArray = image_arr.imageHeadingList;

            // for image keyword text
            let len = image_arr.imageKeywordList.length;
            for (var i = 0; i < len; i++) {
                let arr2 = image_arr.imageKeywordList[i].toString().replace(".", " ").split(",");
                arr1.push(arr2);
            }


        }
    };

    xhttp.open("GET", "image_content/get_image_keyword.jsp", false);
    xhttp.send();

    var arr3 = [];
    for (let k = 0; k < arr1.length; k++) {
        for (let m = 0; m < arr1[k].length; m++) {
            arr3.push((arr1[k][m]).toString().trim());
        }
    }

    var uniq = arr3.reduce(function (a, b) {
        if (a.indexOf(b) < 0)
            a.push(b);
        return a;
    }, []);

    var arr4 = [];
    for (var h = 0; h < uniq.length; h++) {
        let a = uniq[h].split(" ");
        arr4.push(a);
    }

    const capitalize = (s) => {
        if (typeof s !== 'string')
            return '';
        return s.charAt(0).toUpperCase() + s.slice(1);
    };

    var final_arr = [];
    for (let k = 0; k < arr4.length; k++) {
        for (let m = 0; m < arr4[k].length; m++) {
            final_arr.push(capitalize((arr4[k][m]).toString().replace(".", " ").replace(",", " ").trim()));
        }
    }

    // for image keyword text
    var imageKeywordUniqueArray = final_arr.reduce(function (a, b) {
        if (a.indexOf(b) < 0)
            a.push(b);
        return a;
    }, []);

    // for image header text
    var imageHeadingUniqueArray = imageHeadingArray.reduce(function (a, b) {
        if (a.indexOf(b) < 0)
            a.push(b);
        return a;
    }, []);


    return imageKeywordUniqueArray.concat(imageHeadingUniqueArray);
}


var autoCompleteKeywordList = getImageKeyword();
//console.log(autoCompleteKeywordList);




function openPreView(name, designer, image_url) {
    document.getElementById("preview_img_title").innerHTML = name.toString().trim();
    document.getElementById("preview_desginer_name").innerHTML = designer;

    let preview_img = document.getElementById("preview_img");
//    console.log(preview_img);
    preview_img.setAttribute("src", "../asset/" + image_url);
    document.getElementById('previewModal').style.display = 'block';
}