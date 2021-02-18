
function tabShow(ele, table_pane_id, active_tab_id) {
    event.preventDefault();
//    document.getElementById("tab-active-link").className = "";

    var link = document.getElementsByClassName("tab-active");
    for (var i = 0; i < link.length; i++) {
        link[i].className = link[i].className.replace(" tab-active", "");
    }
    var tab = document.getElementsByClassName("table-content");
    for (var i = 0; i < tab.length; i++) {
        tab[i].className = tab[i].className.replace(" show", "");
    }

//    for show and hide tab
    ele.className += " tab-active";
    document.getElementById(table_pane_id).className += " show";



    //    for image
    if (table_pane_id === "inroduction") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/intro.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "stock") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/stock.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "pricing") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/pricing.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "meta") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/meta.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "fullTable") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/fulltable.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "stock_end") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/stock_end.jsp", true);
        xhttp.send();
    } else if (table_pane_id === "create") {
        //console.log("Create");
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/create.jsp", true);
        xhttp.send();
    } else {

    }


    // designer
    if (table_pane_id === "designer_inroduction") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/intro.jsp", true);
        xhttp.send();
    }
    if (table_pane_id === "designer_social") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/designer_social.jsp", true);
        xhttp.send();
    }
    if (table_pane_id === "designer_fullTable") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/designer_fullTable.jsp", true);
        xhttp.send();
    }
    if (table_pane_id === "designer_create") {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById(table_pane_id).innerHTML = this.responseText;
                //console.log(this.responseText);
                if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
                    document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();

                }
            }
        };
        xhttp.open("GET", "table/designer_create.jsp", true);
        xhttp.send();
    }





    //for select box work
    if (document.getElementById(table_pane_id).getElementsByClassName("select_box")[0]) {
        document.getElementById(table_pane_id).getElementsByClassName("select_box")[0].onchange();
    }

    sessionStorage.setItem("active_tab_id", active_tab_id);
}


//by default first link clicked
if (sessionStorage.getItem("active_tab_id")) {
    var active_tab_id = sessionStorage.getItem("active_tab_id");
    if (document.getElementById(active_tab_id)) {
        document.getElementById(active_tab_id).click();
    } else {
        if (document.getElementsByClassName("all_time_tab_active")[0]) {
            document.getElementsByClassName("all_time_tab_active")[0].click();
        }
    }
} else {
    if (document.getElementsByClassName("all_time_tab_active")[0]) {
        document.getElementsByClassName("all_time_tab_active")[0].click();
    }
}






function tableSearchBox(search_box_Id, table_Id) {
    var input, filter, table, tr, td, i, txtValue;

    input = document.getElementById(search_box_Id);
    filter = input.value.toUpperCase();

    tr = document.querySelectorAll("#" + table_Id + " tbody tr");
    for (i = 0; i < tr.length; i++) {
        txtValue = tr[i].textContent;
//        txtValue = tr[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }
    }

}


function sortTable(ele, n, tableId) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById(tableId);
    switching = true;
    dir = "asc";

    // change up and down icon
    thUpDownIcon(ele, tableId);

    while (switching) {

        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;

            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];

            if (dir === "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir === "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount++;
        } else {
            if (switchcount === 0 && dir === "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }

}

function thUpDownIcon(ele, tableId) {
    let table = document.getElementById(tableId);
    let th = table.getElementsByTagName("th");

    for (var i = 0; i < th.length; i++) {
        th[i].className = th[i].className.replace("th_down", " th_updown");
        ;
    }
    ele.className = " th_down";
}


//pagination() ;
//document.getElementById("table_select_box").onchange();
function pagination(ele, firstPage, table_select_box_Id, table_Id, table_pagination_Id) {
    var list = [];
    var pageList = [];
    var currentPage = 1;
    if (firstPage && firstPage > 0) {
        currentPage = firstPage;

    }
    var numberPerPage = ele.value * 1;

    var pages = 0;
    var item_list = document.querySelectorAll("#" + table_Id + " tbody tr");

    if (numberPerPage.toString() !== 'NaN') {

        removePreNextBtn(table_pagination_Id);
        insertPreNextBtn(table_pagination_Id);

        function displayNone() {
            for (var i = 0; i < item_list.length; i++) {
                item_list[i].style.display = "none";
            }
        }
        function makeList() {
            for (var x = 0; x < item_list.length; x++)
                list.push(x);

            pages = getNumberOfPages();
        }
        function getNumberOfPages() {
            return Math.ceil(list.length / numberPerPage);
        }

        //next button
        document.getElementById(table_pagination_Id).getElementsByClassName("pg")[0].getElementsByClassName("next")[0].onclick = function () {
            event.preventDefault();
            if (currentPage < pages) {
                currentPage += 1;
                currentActivePage(currentPage, table_select_box_Id, table_Id, table_pagination_Id);
            }
            loadList();
        };

        // previous button
        document.getElementById(table_pagination_Id).getElementsByClassName("pg")[0].getElementsByClassName("previous")[0].onclick = function () {
            event.preventDefault();
            if (currentPage > 1) {
                currentPage -= 1;
                currentActivePage(currentPage, table_select_box_Id, table_Id, table_pagination_Id);
            }

            loadList();
        };


        function loadList() {
            var begin = ((currentPage - 1) * numberPerPage);
            var end = begin + numberPerPage;

            pageList = list.slice(begin, end);
            drawList();
        }
        function drawList() {
            displayNone();
            for (var r = 0; r < pageList.length; r++) {
                var p_item = pageList[r];
                item_list[p_item].style.display = "table-row";
            }
        }
        function load() {
            makeList();
            loadList();
        }
        load();

        insertPageNumber(pages, currentPage, table_select_box_Id, table_Id, table_pagination_Id);
    } else {
        for (var i = 0; i < item_list.length; i++) {
            item_list[i].style.display = "table-row";
        }
        removePreNextBtn(table_pagination_Id);
    }
}



//pagination external method
function currentActivePage(currentPage, table_select_box_Id, table_Id, table_pagination_Id) {
    let pageNumber;
    let ac = document.getElementsByClassName("p-active");
    for (var j = 0; j < ac.length; j++) {
        ac[j].className = ac[j].className.replace("p-active", "");
    }

    var ul = document.getElementById(table_pagination_Id).getElementsByClassName("pg")[0];

    var li_list = ul.getElementsByTagName("li");
    for (var i = 1; i < li_list.length - 1; i++) {
        var a = li_list[i].getElementsByTagName("a")[0].innerHTML;
        if (currentPage === a * 1) {
            li_list[i].getElementsByTagName("a")[0].setAttribute("class", "p-active");
            pageNumber = a * 1;
        }

    }
//    console.log(currentPage);
    pagination(document.getElementById(table_select_box_Id), pageNumber, table_select_box_Id, table_Id, table_pagination_Id);
    return pageNumber;
}

function insertPageNumber(pages, currentPage, table_select_box_Id, table_Id, table_pagination_Id) {
    for (var i = 0; i < pages; i++) {

        var ul = document.getElementById(table_pagination_Id).getElementsByClassName("pg")[0];

        var li_tag = document.createElement("li");
        var a_tag = document.createElement("a");
        a_tag.setAttribute("href", "javascript:void(0)");
        a_tag.setAttribute("onclick", "currentActivePage(this.innerHTML*1, '" + table_select_box_Id + "', '" + table_Id + "', '" + table_pagination_Id + "');");
        a_tag.setAttribute("class", "pageCounter");
        if (i === (currentPage - 1)) {
            a_tag.setAttribute("class", "p-active");
        }
        a_tag.innerHTML = i + 1;
        li_tag.appendChild(a_tag);
        ul.insertBefore(li_tag, ul.lastElementChild);

    }
}

function removePreNextBtn(table_pagination_Id) {

    let ac = document.getElementsByClassName("p-active");
    for (var j = 0; j < ac.length; j++) {
        ac[j].className = ac[j].className.replace("p-active", "");
    }

    var ul = document.getElementById(table_pagination_Id).getElementsByClassName("pg")[0];
    if (ul) {
        ul.parentNode.removeChild(ul);
    }

}

function insertPreNextBtn(table_pagination_Id) {

    var div, ul_tag, li_tag, a_tag;


    var div = document.getElementById(table_pagination_Id);
//    console.log(document.getElementById(table_pagination_Id));

    ul_tag = document.createElement("ul");
    ul_tag.setAttribute("class", "pg");

    li_tag = document.createElement("li");
    a_tag = document.createElement("a");
    a_tag.setAttribute("href", "");
    a_tag.setAttribute("class", "previous");
    a_tag.innerHTML = "Previous";
    li_tag.appendChild(a_tag);
    ul_tag.appendChild(li_tag);

    li_tag = document.createElement("li");
    a_tag = document.createElement("a");
    a_tag.setAttribute("href", "");
    a_tag.setAttribute("class", "next");
    a_tag.innerHTML = "Next";
    li_tag.appendChild(a_tag);
    ul_tag.appendChild(li_tag);

    div.appendChild(ul_tag);
}



function searchButton(ele) {
    let  filter, li_list;

    filter = (ele.value).toString().trim().toUpperCase();
    li_list = document.querySelectorAll(".btn-content ul li");
    for (var i = 0; i < li_list.length; i++) {
        let txt_value = li_list[i].textContent.toString().trim();
        if (txt_value.toUpperCase().indexOf(filter) > -1) {
            li_list[i].style.display = "";
        } else {
            li_list[i].style.display = "none";
        }
    }

}


//for admin login
function adminLoginValidation() {

    event.preventDefault();

    let admin_login_form = document.getElementById("admin_login_form");
    let input = document.querySelectorAll("#admin_login_form input");

    for (var i = 0; i < input.length; i++) {
        input[i].oninput = function () {
            this.style.borderColor = "#d3d3d3";
        };
    }

    function inputValidation() {
        let valid = true;

        for (var i = 0; i < input.length; i++) {
            input[i].style.borderColor = "#d3d3d3";
            if (input[i].value === "") {
                valid = false;
                input[i].style.borderColor = "red";
            }
        }

        return valid;
    }

    if (inputValidation()) {
        admin_login_form.submit();
    }

}


function passwordShow() {
    let password_show = document.getElementById("password_show");
    let pw_clss_list = password_show.classList;

    for (var i = 0; i < pw_clss_list.length; i++) {
        if (pw_clss_list[i].toString().trim() === "fa-eye" || pw_clss_list[i].toString().trim() === "fa-eye-slash") {
            if (pw_clss_list[i].toString().trim() === "fa-eye") {
                password_show.className = password_show.className.replace("fa-eye", " fa-eye-slash");
                document.querySelector("#admin_login_form #password").setAttribute("type", "password");
            } else {
                password_show.className = password_show.className.replace("fa-eye-slash", " fa-eye");
                document.querySelector("#admin_login_form #password").setAttribute("type", "text");
            }
        }
    }

}


