
function noticeDelete(notice_id) {
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
           window.location = "";
        }
    };
    xhttp.open("GET", "order_section/notice_info.jsp?notice_id="+notice_id, true);
    xhttp.send();

}