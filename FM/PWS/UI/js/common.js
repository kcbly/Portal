function showTime() {
    var today = new Date();
    var ye = today.getFullYear();//年year
    var mo = today.getMonth() + 1;//月month
    var da = today.getDate();//日 day
    var ho = today.getHours();//小时 hour
    var mi = today.getMinutes();//分钟 minute
    var se = today.getSeconds();//秒second
    mo = checkTime(mo);
    da = checkTime(da);
    mi = checkTime(mi);
    se = checkTime(se);
    var weekday;
    if (today.getDay() == 0) weekday = "星期日";
    if (today.getDay() == 1) weekday = "星期一";
    if (today.getDay() == 2) weekday = "星期二";
    if (today.getDay() == 3) weekday = "星期三";
    if (today.getDay() == 4) weekday = "星期四";
    if (today.getDay() == 5) weekday = "星期五";
    if (today.getDay() == 6) weekday = "星期六";

    document.getElementById("spTime").innerHTML = ye + "-" + mo + "-" + da + " " + ho + ":" + mi + ":" + se + " " + weekday;
    setTimeout("showTime()", 1000);//每一秒重新加载
    function checkTime(i) {
        if (i < 10)
            i = "0" + i;
        return i;
    }
}
function showNewTime(currDate) {
    var today = new Date(currDate);
    var weekday;
    if (today.getDay() == 0) weekday = "星期日";
    if (today.getDay() == 1) weekday = "星期一";
    if (today.getDay() == 2) weekday = "星期二";
    if (today.getDay() == 3) weekday = "星期三";
    if (today.getDay() == 4) weekday = "星期四";
    if (today.getDay() == 5) weekday = "星期五";
    if (today.getDay() == 6) weekday = "星期六";
    return weekday;
}