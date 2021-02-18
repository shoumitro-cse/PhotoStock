<%-- 
    Document   : line_chart
    Created on : Jul 30, 2020, 1:08:26 AM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Users Line Chart</title>
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

                        series: [
                            //               {
                            //                   name: 'Dataset 1',
                            //                   data: [20, 31, 14, 40, 12, 55, 13, 13, 9, 19, 20, 41, 36, 62, 60]
                            //               },
                            {
                                name: 'Users Visit',
                                data: series.dataSeries.users
                            }
                        ],
                        options: {
                            chart: {
                                height: 350,
                                type: 'line',
                            },
                            stroke: {
                                width: 5,
                                curve: 'smooth'
                            },
                            colors: ['#2e93fa'],
                            xaxis: {
                                categories: series.dataSeries.dates,
                                labels: {
                                    formatter: function (val) {
                                        return val
                                    }
                                }
                            },
                            title: {
                                text: 'LINE CHART 0F TODAY VISITED USERS ('+today+")",
                                align: 'left',
                                style: {
                                    fontSize: "14px",
                                }
                            },
                            subtitle: {
                                text: 'Last 10 day of current month visited users and  date',
                                align: 'left'
                            },
                            fill: {
                                type: 'image',
                                image: {
                                    src: [
                                        '../../asset/images/table_icon/abstract.jpg'
                                    ],
                                    width: 800,
                                    height: 800
                                },
                            },
                            markers: {
                                size: 0,
                                opacity: 0,
                                colors: ['#fff'],
                                strokeColor: "#2e93fa",
                                strokeWidth: 2,
                                hover: {
                                    size: 8,
                                }
                            },
                            yaxis: {
                                title: {
                                    text: '(Line)',
                                },
                            },
                            legend: {
                                position: 'top',
                                horizontalAlign: 'right',
                                floating: true,
                                offsetY: -25,
                                offsetX: -5
                            }
                        },

                    };
                }

                render() {
                    return (
                            <div>
                                          <div id="chart">
                                          <ReactApexChart options={this.state.options} series={this.state.series} type="line" height={400} />
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
