<%-- 
    Document   : area
    Created on : Jul 29, 2020, 2:20:50 PM
    Author     : shoumitro
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Users Area Chart</title>
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

                        series: [{
                                name: "Users Visit",
                                data: series.dataSeries.users
                            }],
                        options: {
                            chart: {
                                type: 'area',
                                height: 440,
                                zoom: {
//                                    enabled: false
                                    enabled: true
                                }
                            },
                            dataLabels: {
//                                enabled: false
                                enabled: true
                            },
                            stroke: {
                                curve: 'smooth'
                            },

                            title: {
                                text: 'Fundamental Analysis of Users ('+today+")",
                                align: 'left'
                            },
                            subtitle: {
                                text: 'Last 10 day of current month visited users and  date',
                                align: 'left'
                            },
                            labels: series.dataSeries.dates,
                            xaxis: {
//                                type: 'datetime',
                                type: 'date'
                            },
                            yaxis: {
                                opposite: true
//                                opposite: false
                            },
                            legend: {
                                horizontalAlign: 'left'
                            }
                        }

                    };
                }

                render() {
                    return (
                            <div>
                                <div id="chart">
                            <ReactApexChart options={this.state.options} series={this.state.series} type="area" height={400} />
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
