
$(document).ready(function () {
    $("#div_hello").text(localStorage.getItem("user"));
    console.log(localStorage.getItem("user"));
    var _robot_sn;

    get_online_robotData();

    /////////////////////////更新倒數顯示////////////////////////
    var tr = setInterval(update_show, 1000);        //1000毫秒更新、顯示一次
    var now_datetime = 10;                          //now_datetime倒數秒數
    var time_show=1;
    function update_show()
    {
        
        if (now_datetime == 1) { now_datetime = 10; }
        else { now_datetime--;}
        
        $("#update_time").text("下次更新時間: " + now_datetime.toString());
    }

    /////////////////////////set timer loop////////////////////////
    var tid = setInterval(click_get_online_robotData, 10000);
    function get_online_robotData() {
      
        $.ajax({
            type: 'POST',
            async: true,
            url: 'WebService1.asmx/get_online_robotData',
            data:"",
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {

                console.log(data.d);

                


                $("#add").empty();

                for (var i = 0; i < data.d.length; i++) {
                   
                    $("#add").append(
                           '<div class="column">' +
                           '<div id="div'+i+'">'+
                           '<img src="pic/Robot_view/'+robot_pic_selector(data.d[i].robot_sn)+'_good.png" style="height:110px;width:110px"/>' + '<br />' +
                           '<br /> 手臂序號：' + data.d[i].robot_sn + '<br />' + 'BG：' + data.d[i].mac_address +
                           '<br />' + '廠區：' + data.d[i].factory_locate + '<br />' + '樓層：' + data.d[i].floor + '<br />' + '車間：' + data.d[i].workshop + '<br />' + '產品：' + data.d[i].product + '<br />' + '線別：' + data.d[i].line_no +
                           '</div>' + '</div>'
                           );




                    
                };


         
                







            },

            Error: function () { alert("error"); }
        });








    };
    function abortTimer() { // to be called when you want to stop the timer
        clearInterval(tid);
    };

    function robot_pic_selector(r_no) {     //讀取對應的Robot PIC
       return r_no.substring(0,8);
    };


    $("#help").click(function () {          //聯絡我們
        $("#div1").sidebar('toggle');
    });




    $(".a_click0").click(function () {

        $("#test_0").modal('show');

    });
    
    $(".a_click1").click(function () {

        $("#test_1").modal('show');

    });
    $(".a_click2").click(function () {

        $("#test_2").modal('show');

    });










    $("#srch_but").click(click_get_online_robotData);




    function click_get_online_robotData() {
        var t=false;
        $.ajax({
            type: 'POST',
            url: 'WebService1.asmx/get_online_robotData',
            data: "",
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {

                console.log("get_data!!");




                $("#add").empty();

                for (var i = 0; i < data.d.length; i++) {
                    t = false;      //=true 不要顯示

                    if ($("#in1").val() != '' && $("#in1").val() != data.d[i].robot_sn)
                    { var t = true; }
                    else if($("#in2").val() != '' && $("#in2").val() != data.d[i].mac_address)
                    { var t = true; }
                    else if ($("#in3").val() != '' && $("#in3").val() != data.d[i].factory_locate)
                    { var t = true; }
                    else if ($("#in4").val() != '' && $("#in4").val() != data.d[i].floor)
                    { var t = true; }
                    else if ($("#in5").val() != '' && $("#in5").val() != data.d[i].workshop)
                    { var t = true; }
                    else if ($("#in6").val() != '' && $("#in6").val() != data.d[i].product)
                    { var t = true; }
                    else if ($("#in7").val() != '' && $("#in7").val() != data.d[i].line_no)
                    { var t = true; }




                    if (t == false)
                    {
                        $("#add").append(
                           '<div class="column">' +
                           '<div id="div' + i + '">' +
                           '<img src="pic/Robot_view/' + robot_pic_selector(data.d[i].robot_sn) + '_good.png" style="height:110px;width:110px"/>' + '<br />' +
                           '<br /> 手臂序號：' + data.d[i].robot_sn + '<br />' + 'BG：' + data.d[i].mac_address +
                           '<br />' + '廠區：' + data.d[i].factory_locate + '<br />' + '樓層：' + data.d[i].floor + '<br />' + '車間：' + data.d[i].workshop + '<br />' + '產品：' + data.d[i].product + '<br />' + '線別：' + data.d[i].line_no +
                           '</div>' + '</div>'
                           );
                    }
                    

                };











            },

            Error: function () { alert("error"); }
        });








    };







    $("#div_c").dropdown();


    $(document).keydown(function (event) {
        if (event.keyCode == 13) {
            $("#srch_but").click();
        }
    });


});