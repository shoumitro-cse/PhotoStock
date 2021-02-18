<%-- 
    Document   : pie_chart
    Created on : Jul 30, 2020, 12:00:03 AM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Users Pie Chart</title>
        <link rel="icon" href="../../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../../asset/css/ionicons.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/common.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/chart.css"/>

        <!--for chart script-->
        <script src="../../asset/js/admin/chart/react.production.min.js"></script>
        <script src="../../asset/js/admin/chart/16.12_umd_react-dom.production.min.js"></script>
        <script src="../../asset/js/admin/chart/15.7.2_prop-types.min.js"></script>
        <script src="../../asset/js/admin/chart/5.8.34_browser.min.js"></script>
        <script src="../../asset/js/admin/chart/https _cdn.jsdelivr.net_npm_apexcharts.js"></script>
        <script src="../../asset/js/admin/chart/react-apexcharts.iife.min.js"></script>

        <script src="../../asset/js/admin/chart_data.js"></script>

    </head>

    <body>

        <%@include file="../dashboard/navbar.jsp" %>
        <%@include file="../dashboard/side_menu.jsp" %>

        <div id="app"></div>

        <script type="text/babel">
            class ApexChart extends React.Component {
                constructor(props) {
                    super(props);

                    this.state = {

//                        series: [44, 55, 13, 43, 22],
                        series: series.dataSeries.users,
                        options: {
                            chart: {
                                width: 580,
                                type: 'pie',
                                zoom: {
                                    enabled: true
                                }
                            },
                            title: {
                                text: 'Fundamental Analysis of Users Pie Chart (' + today + ")",
                                align: 'left'
                            },
                            subtitle: {
                                text: 'Last 10 day of current month visited users and  date',
                                align: 'left'
                            },
                            labels: series.dataSeries.dates,
                            responsive: [{
                                    breakpoint: 480,
                                    options: {
                                        chart: {
                                            width: 200
                                        },
                                        legend: {
                                            position: 'bottom'
                                        }
                                    }
                                }]
                        },

                    };
                }

                render() {
                    return (
                            <div>
                                <div id="chart">
                            <ReactApexChart options={this.state.options} series={this.state.series} type="pie" width={500} />
                                </div>
                                <div id="html-dist"></div>
                            </div>
                            );
                }
            }

            const domContainer = document.querySelector('#app');
            ReactDOM.render(React.createElement(ApexChart), domContainer);
        </script>

        <%@include file="../dashboard/footer.jsp" %>
    </body>
</html>
