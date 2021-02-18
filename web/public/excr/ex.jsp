<%-- 
    Document   : chat
    Created on : Jun 28, 2020, 11:02:01 PM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search box</title>
        <style>
            body {
                background-color: #f1f1f2;
            }
            .gallery-pagination {
                text-align:center;
            }
            .gallery-pagination > input {
                border: 1px solid #fff;
                padding: .5rem 1rem;
                background-color: #ffffff;
                color: #00b3f0;
                cursor: pointer;
                font-weight: bold;
                border-radius: 3px;
            }
            .gallery-pagination > #page_input {
                width: 20px;
                cursor: initial;
                color: #777;
                /*font-weight: normal;*/
            }
            .pg-small-text {
                color: #777;
                font-size: 14px;
            }
           #total_page {
                font-style: normal;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="gallery-pagination">
            <input type="button" id="first" onclick="firstPage()" value="first" />
            <input type="button" id="previous" onclick="previousPage()" value="<" />
            <input type="text" id="page_input" oninput="pageShow(this)"  />
            <span class="pg-small-text">of <em id="total_page"></em> pages</span>
            <input type="button" id="next" onclick="nextPage()" value=">" />
            <input type="button" id="last" onclick="lastPage()" value="last" />
            <div id="list"></div>
        </div>
        <script type="text/javascript">

            var list = new Array();
            var pageList = new Array();
            var currentPage = 1;
            var numberPerPage = 10;
            var numberOfPages = 0;

            function makeList() {
                for (x = 0; x < 200; x++)
                    list.push(x);

                numberOfPages = getNumberOfPages();
            }

            function getNumberOfPages() {
                return Math.ceil(list.length / numberPerPage);
            }

            function nextPage() {
                currentPage += 1;
                loadList();
            }

            function previousPage() {
                currentPage -= 1;
                loadList();
            }

            function firstPage() {
                currentPage = 1;
                loadList();
            }

            function lastPage() {
                currentPage = numberOfPages;
                loadList();
            }
            function pageShow(ele) {
                currentPage = ele.value*1;
                loadList();
            }

            function loadList() {
                var begin = ((currentPage - 1) * numberPerPage);
                var end = begin + numberPerPage;

                pageList = list.slice(begin, end);
                drawList();
                check();
                document.getElementById("total_page").innerHTML = numberOfPages;
            }

            function drawList() {
                document.getElementById("list").innerHTML = "";
                for (r = 0; r < pageList.length; r++) {
                    document.getElementById("list").innerHTML += pageList[r] + "<br/>";
                }
            }

            function check() {
                document.getElementById("next").disabled = currentPage == numberOfPages ? true : false;
                document.getElementById("previous").disabled = currentPage == 1 ? true : false;
                document.getElementById("first").disabled = currentPage == 1 ? true : false;
                document.getElementById("last").disabled = currentPage == numberOfPages ? true : false;
            }

            function load() {
                makeList();
                loadList();
            }

            window.onload = load;
        </script>
    </body>
</html>
