
var myThreeYearCntChart = echarts.init(document.getElementById('page_views_three_qd'));
// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetNearThreeCntData"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myThreeYearCntChart.setOption({
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（个）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: jsonObj[0].ListYear
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: jsonObj[0].YearValue[0],
                    type: 'line',
                    data: jsonObj[0].OneValue,

                    itemStyle: {
                        color: '#4c97ce'
                    }
                },
                {
                    name: jsonObj[0].YearValue[1],
                    type: 'line',
                    data: jsonObj[0].TwoValue,
                    itemStyle: {
                        color: '#e01804'
                    }

                },
                {
                    name: jsonObj[0].YearValue[2],
                    type: 'line',
                    data: jsonObj[0].ThreeValue,
                    itemStyle: {
                        color: '#408a08'
                    }

                }
                ]
            });
        }
    },
    error: function (ex) { }
})


var myThreeYearAmountChart = echarts.init(document.getElementById('page_views_three_value'));
// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetNearThreeAmountData"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myThreeYearAmountChart.setOption({
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（万元）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: jsonObj[0].ListYear
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: jsonObj[0].YearValue[0],
                    type: 'bar',
                    data: jsonObj[0].OneValue,

                    itemStyle: {
                        color: '#4c97ce'
                    }
                },
                {
                    name: jsonObj[0].YearValue[1],
                    type: 'bar',
                    data: jsonObj[0].TwoValue,
                    itemStyle: {
                        color: '#e01804'
                    }

                },
                {
                    name: jsonObj[0].YearValue[2],
                    type: 'bar',
                    data: jsonObj[0].ThreeValue,
                    itemStyle: {
                        color: '#408a08'
                    }

                }
                ]
            });
        }
    },
    error: function (ex) { }
})




var myChart = echarts.init(document.getElementById('page_views_today_bar'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetChargeData"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myChart.setOption({
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（万元）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['计划到款', '实际到款']
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '计划到款',
                    type: 'bar',
                    data: jsonObj[0].planValue,
                    markLine: {
                        data: [{
                            type: 'average',
                            name: '平均值'
                        }]
                    },
                    itemStyle: {
                        color: '#4c97ce'
                    }

                },
                {
                    name: '实际到款',
                    type: 'bar',
                    data: jsonObj[0].factValue,
                    markLine: {
                        data: [{
                            type: 'average',
                            name: '平均值'
                        }]
                    },
                    itemStyle: {
                        color: '#a0c7e6'
                    }

                }
                ]
            });
        }
    },
    error: function (ex) { }
})

myChart.on('click', function (param) {
    var name = param.seriesName;
    var month = param.dataIndex;
    if (name == "实际到款") {
        var nowDate = new Date();
        startDate = new Date(nowDate.getFullYear(), month, 1);
        endDate = new Date(nowDate.getFullYear(), month + 1, 0);
        $startDate = timeStamp2String(startDate);
        $endDate = endDate.getFullYear() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getDate() + " 23:23:59";
        var url = $appCtx.appPath + "/MM/List/MCM/ContractReceiveCorpList.aspx";
        url += "?chargeStartDate=" + $startDate + "&chargeEndDate=" + $endDate;
        window.open(url, "_blank");
    }
});

//echarts.init(document.getElementById('bottom-echart')).setOption({
//    title: {
//        text: '2018年合同额总计',
//        subtext: '单位：万元',

//    },
//    tooltip: {
//        trigger: 'item',
//        formatter: "{a} <br/>{b} : {c} ({d}%)"
//    },
//    series: {
//        name: '合同额',
//        type: 'pie',
//        radius: '55%',
//        center: ['50%', '60%'],
//        label: {
//            normal: {
//                show: true,
//                formatter: "{b} : {c}"
//            },
//            emphasis: {
//                show: true,
//                textStyle: {
//                    fontSize: '12',
//                    fontWeight: 'bold'
//                }
//            }
//        },
//        labelLine: {
//            normal: {
//                show: true
//            }
//        },
//        data: [{
//            name: '勘测',
//            value: 8652.12,
//            itemStyle: {
//                color: '#abd4f6'
//            }
//        },
//        {
//            name: '科研',
//            value: 9020.08,
//            itemStyle: {
//                color: '#6ca0cb'
//            }
//        },
//        {
//            name: '其它',
//            value: 6458.7,
//            itemStyle: {
//                color: '#598fbd'
//            }
//        },
//        {
//            name: '总承包',
//            value: 189239.23,
//            itemStyle: {
//                color: '#7caed8'
//            }
//        },
//        {
//            name: '咨询',
//            value: 12431.67,
//            itemStyle: {
//                color: '#9cc7eb'
//            }
//        },
//        {
//            name: '设计',
//            value: 242617.16,
//            itemStyle: {
//                color: '#457ead'
//            }
//        },
//        {
//            name: '监理',
//            value: 9343.56,
//            itemStyle: {
//                color: '#8dbbe2'
//            }
//        }

//        ],
//        itemStyle: {
//            emphasis: {
//                shadowBlur: 10,
//                shadowOffsetX: 0,
//                shadowColor: 'rgba(0, 0, 0, 0.5)'
//            }
//        }
//    }
//});

var contractPieChart = echarts.init(document.getElementById('bottom-echart'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetContractPie"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            contractPieChart.setOption({
                title: {
                    //text: '2018年合同额总计',
                    subtext: '单位：万元',

                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                color: ['#abd4f6', '#6ca0cb', '#598fbd', '#8dbbe2', '#457ead', '#9cc7eb', '#7caed8'],
                series: {
                    name: '合同额',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    label: {
                        normal: {
                            show: true,
                            formatter: "{b} : {c}"
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '12',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true
                        }
                    },
                    data: jsonObj,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            });
        }
    },
    error: function (ex) { }
})

contractPieChart.on('click', function (param) {
    var name = param.name;
    var nowDate = new Date();
    $startDate = nowDate.getFullYear() + "-01-01 00:00:00";;
    $endDate = nowDate.getFullYear() + "-12-31 23:23:59";
    var url = $appCtx.appPath + "/MM/List/MCM/ContractListNew.aspx";
    url += "?paramBusinessPlate=" + name + "&signStartDate=" + $startDate + "&signEndDate=" + $endDate;
    window.open(url, "_blank");
});

var contractPieChartCG = echarts.init(document.getElementById('bottom-echart-cg'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetPurchaseContractPie"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            contractPieChartCG.setOption({
                title: {
                    //text: '2018年合同额总计',
                    subtext: '单位：万元',

                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                color: ['#abd4f6', '#6ca0cb', '#598fbd', '#8dbbe2', '#457ead', '#9cc7eb', '#7caed8'],
                series: {
                    name: '合同额',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    label: {
                        normal: {
                            show: true,
                            formatter: "{b} : {c}"
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '12',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true
                        }
                    },
                    data: jsonObj,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            });
        }
    },
    error: function (ex) { }
})

contractPieChartCG.on('click', function (param) {
    var name = param.name;
    var nowDate = new Date();
    $startDate = nowDate.getFullYear() + "-01-01 00:00:00";;
    $endDate = nowDate.getFullYear() + "-12-31 23:23:59";
    var url = $appCtx.appPath + "/MM/List/MBM/PurchaseContractListNew.aspx";
    url += "?contractType=" + name + "&signStartDate=" + $startDate + "&signEndDate=" + $endDate;
    window.open(url, "_blank");
});






var myCustomerAmount = echarts.init(document.getElementById('page_views_customer_amount'));
// 客户累计合同额统计
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetCustomerAmount"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myCustomerAmount.setOption({
                chart: {
                    inverted: true
                },
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（万元）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: 250
                },
                calculable: true,
                yAxis: [{
                    type: 'category',
                    data: jsonObj[0].name
                }],
                xAxis: [{
                    type: 'value'
                  
                }],
                series: [{
                    type: 'bar',
                    data: jsonObj[0].value,

                    itemStyle: {
                        color: '#4c97ce'
                    },
                    sorted: false
                }
                ]
            });
        }
    },
    error: function (ex) { }
})

var myImportCustomerAmount = echarts.init(document.getElementById('page_views_importcustomer_amount'));
// 客户累计合同额统计
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetImportanceCustomerAmount"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myImportCustomerAmount.setOption({
                chart: {
                    inverted: true
                },
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（万元）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: 250
                },
                calculable: true,
                yAxis: [{
                    type: 'category',
                    data: jsonObj[0].name
                }],
                xAxis: [{
                    type: 'value'

                }],
                series: [{
                    type: 'bar',
                    data: jsonObj[0].value,

                    itemStyle: {
                        color: '#4c97ce'
                    },
                    sorted: false
                }
                ]
            });
        }
    },
    error: function (ex) { }
})
