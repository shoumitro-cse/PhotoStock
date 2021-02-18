let today = "";
let series = "";
let xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function () {
    if(this.readyState === 4 && this.status === 200 ) {
       let obj = JSON.parse(this.responseText);
       series = obj;
//       console.log(obj.dataSeries.FullDate);
       today = obj.dataSeries.FullDate;
    }
};

xhttp.open("get", "get_chart_data.jsp", false);
xhttp.send();







//var series = {
//    "dataSeries": {
//        "dates": [
//            "02 Jul 2020",
//            "05 Jul 2020",
//            "09 Jul 2020",
//            "12 Jul 2020",
//            "29 Jul 2020"
//        ],
//        "users": [
//            2,
//            19,
//            89,
//            60,
//            40
//        ]
//    }
//    
//};

