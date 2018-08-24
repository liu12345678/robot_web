//////////////////////////////////////////////////Jquery//////////////////////////////////////////////////
$(document).ready(function () {
    var table_var;
    var table_info;
    var current_page_index = 1;         //目前點選到第幾page
    var one_page_row = 10;              //table一頁要顯示多少筆資料
    var DATA;   //WebService return SQL DATA
    //  $("#b_sch").click(function () { getdata_search_history();});
    $("#loader").attr("class", "ui massive active inverted dimmer");    //設置一讀取資料庫就active Loader
    call_ajax();

    function call_ajax() {
    $("#loader").attr("class", "ui massive active inverted dimmer");
    $.ajax({
        type: 'POST',
        async: true,
        url: 'WebService1.asmx/search_history',
        data: "{'select':'2','page':'" + current_page_index + "','pageLength':'" + one_page_row + "'}",
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (rpm_data) {

            if (rpm_data.d.length > 0) {

            var table = $('#rpm_history_table').DataTable();
            table.destroy();


            console.log(rpm_data.d);

            DATA = rpm_data;

            

                for (var i = 0; i < rpm_data.d.length; i++) {

                    var rows = "<tr>" +
                           "<td>" + rpm_data.d[i].robot_sn + "</td>" +
                           "<td>" + rpm_data.d[i].create_time + "</td>" +
                           "<td>" + rpm_data.d[i].j1_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].j2_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].j3_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].j4_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].j5_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].j6_rpm + "</td>" +
                           "<td>" + rpm_data.d[i].RN + "</td>" +
                           "</tr>";
                    $("#rpm_history_table").append(rows);

                }




                table_var = $("#rpm_history_table").DataTable({                   //使用DataTable前初始化
                 //   bStateSave: true,       //記憶上次page_Index
                    pageLength: one_page_row,
                    scrollX: true,
                    scrollY: '50vh',
                    scrollCollapse: true,
                    paging: true,
                    info: true,
                    pagingType: "full_numbers",
                    dom: 'Bfrtip',
                    buttons: [
                    {
                        extend: 'csvHtml5',
                        text: '匯出.CSV檔案',
                        filename: 'rpm_data',
                        exportOptions: { modifier: { search: 'none' } }
                    },
                    {
                        extend: 'print',
                        text: '列印',
                        autoPrint: true
                    }
                    ],



                    columns: [
                        { title: "手臂編號" },
                        { title: "資料更新時間" },
                        { title: "j1_rpm" },
                        { title: "j2_rpm" },
                        { title: "j3_rpm" },
                        { title: "j4_rpm" },
                        { title: "j5_rpm" },
                        { title: "j6_rpm" },
                        { title: "RN" }

                    ]

                });




                sum();


                $("#header1").html(j1_avg);
                $("#meta1").html("J1平均轉速");
                $("#header2").html(j2_avg);
                $("#meta2").html("J2平均轉速");
                $("#header3").html(j3_avg);
                $("#meta3").html("J3平均轉速");
                $("#header4").html(j4_avg);
                $("#meta4").html("J4平均轉速");
                $("#header5").html(j5_avg);
                $("#meta5").html("J5平均轉速");
                $("#header6").html(j6_avg);
                $("#meta6").html("J6平均轉速");


                bar_chart(j1_avg, j2_avg, j3_avg, j4_avg, j5_avg, j6_avg);

                table_info = table_var.page.info();             //獲取初始page info
                current_page_index = table_info.page + 1;       //獲取初始page index

            }

            $("#loader").attr("class","ui disabled inverted dimmer");
            },              //success

            Error: function () { alert("error"); },
            failure: function (msg) { alert(msg); console.log(msg); }




        
    });




    


       }

        

    



     
        

    var j1_sum = 0, j2_sum = 0, j3_sum = 0, j4_sum = 0, j5_sum = 0, j6_sum = 0;
    var j1_avg = 0, j2_avg = 0, j3_avg = 0, j4_avg = 0, j5_avg = 0, j6_avg = 0;
    
    var temp_createTime;
    function sum() {
            
        for (var i = 0; i < DATA.d.length; i++) {
            j1_sum = j1_sum + Number(DATA.d[i].j1_rpm);
            j2_sum = j2_sum + Number(DATA.d[i].j2_rpm);
            j3_sum = j3_sum + Number(DATA.d[i].j3_rpm);
            j4_sum = j4_sum + Number(DATA.d[i].j4_rpm);
            j5_sum = j5_sum + Number(DATA.d[i].j5_rpm);
            j6_sum = j6_sum + Number(DATA.d[i].j6_rpm);
            temp_createTime = DATA.d[i].create_time;
        };
        j1_avg = parseFloat((j1_sum / DATA.d.length).toFixed(2));
        j2_avg = parseFloat((j2_sum / DATA.d.length).toFixed(2));
        j3_avg = parseFloat((j3_sum / DATA.d.length).toFixed(2));
        j4_avg = parseFloat((j4_sum / DATA.d.length).toFixed(2));
        j5_avg = parseFloat((j5_sum / DATA.d.length).toFixed(2));
        j6_avg = parseFloat((j6_sum / DATA.d.length).toFixed(2));


    };
        





    function CreateChart(j1,j2,j3,j4,j5,j6) {

        var labels = ['J1_轉速', 'J2_轉速', 'J3_轉速', 'J4_轉速', 'J5_轉速', 'J6_轉速'];

        var ctx = document.getElementById('canvasPie').getContext("2d");
        var pieChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    //預設資料
                    data: [j1, j2, j3, j4, j5, j6],
                    backgroundColor: [
                    //資料顏色
                                "#FFDAB9",
                                "#FF4500",
                                "#DDA0DD",
                                "#BDB76B",
                                "#7FFF00",
                                "#191970"
                    ],
                }],
            }
        });




    };


       






    function bar_chart(j1_avg, j2_avg, j3_avg, j4_avg, j5_avg, j6_avg) {

        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['平均轉速統計', 'axis：j1', 'axis：j2', 'axis：j3', 'axis：j4', 'axis：j5', 'axis：j6'],
              ['單位：rpm',j1_avg, j2_avg, j3_avg, j4_avg, j5_avg, j6_avg]
            ]);

            var options = {
                chart: {
                    title: 'Robot Average RPM Chart',
                    subtitle: '智慧製造處 機械手臂轉速統計表',
                },
                bars: 'vertical',
                vAxis: { format: 'decimal' },
                height: 400,
                colors: ['#ffd9ec', '#96fed1', '#ca8eff', '#00caca', '	#97cbff', '	#b15bff']
            };

            var chart = new google.charts.Bar(document.getElementById('chart_div'));

            chart.draw(data, google.charts.Bar.convertOptions(options));


        };


    };




        

        




    $('#pag_previous').click( function(){
        table_var.page('previous').draw('page');
    });

    $('#pag_next').click(function () {
        table_var.page('next').draw('page');
    });


    $("#rpm_history_table").on('page.dt', function () {     //table頁數切換事件發生
        table_info = table_var.page.info();             //獲取初始page info
        current_page_index = table_info.page + 1;       //獲取初始page index
        console.log("index now : " + current_page_index);
        console.log("total pages : " + table_info.pages);                  //獲取當前畫面的總頁數
        if (table_info.pages == current_page_index) { call_ajax(table_info.pages) };       //當前點選的頁面為當前畫面的總頁數的最後一頁
        //需補當前畫面的總頁數!=總頁數 判斷式
        
    });


































});






























//////////////////////////////////////////////////javascript//////////////////////////////////////////////////
window.onload = function (j1_avg, j2_avg, j3_avg, j4_avg, j5_avg, j6_avg) {
  



  




















    google.charts.load('current', {
        'packages': ['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
    });
    google.charts.setOnLoadCallback(drawRegionsMap);

    function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
          ['Country', 'Popularity'],
          ['Germany', 200],
          ['United States', 300],
          ['Brazil', 400],
          ['Taiwan', 500],
       
        ]);

        var options = {};

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
    }




























   


    function changeData() {
        //隨機資料
        var randomNum = Math.floor(Math.random() * 100) + 1;
        //將隨機資料載入至圖表中
        pieChart.data.datasets[0].data = [randomNum, 100 - randomNum];
        //更新
        pieChart.update();
    }

  //  setInterval(changeData, 2000);




}

