
$(document).ready(function () {
    var table_var;
    var table_info;
    var current_page_index = 1;         //目前點選到第幾page
    var one_page_row = 10;              //table一頁要顯示多少筆資料
    var SQL_DATA;   //WebService return SQL DATA 
    call_ajax_task();
    function call_ajax_task()
    {
        $("#loader").attr("class", "ui massive active inverted dimmer");    //設置一讀取資料庫就active Loader
        call_ajax(1);
        call_ajax(2);
        call_ajax(3);
        call_ajax(4);
        $("#loader").attr("class", "ui disabled inverted dimmer");
    }
    
    function proccess(SQL_DATA,proccess_select)
    {


        for (var i = 0; i < SQL_DATA.d.length; i++) {

            if (proccess_select == 1)
            {
                var rows1=
                "<tr>" + "<td>" + SQL_DATA.d[i]._bg + "</td>" + "<td>" + SQL_DATA.d[i]._bg_qty + '支' + "</td>" + "</tr>"
                $("#tbody1").append(rows1);       
            }
            else if (proccess_select == 2)
            {
                var rows2 =
               "<tr>" + "<td>" + SQL_DATA.d[i]._factory_locate + "</td>" + "<td>" + SQL_DATA.d[i]._factory_locate_qty + '支' + "</td>" + "</tr>"
                $("#tbody2").append(rows2);
            }
            else if (proccess_select == 3) {
                var rows3 =
               "<tr>" + "<td>" + SQL_DATA.d[i]._product + "</td>" + "<td>" + SQL_DATA.d[i]._product_qty + '支' + "</td>" + "</tr>"
                $("#tbody3").append(rows3);
            }
            else if (proccess_select == 4) {
                var rows4 =
               "<tr>" + "<td>" + SQL_DATA.d[i]._factory_locate_floor + "</td>" + "<td>" + SQL_DATA.d[i]._factory_locate_floor_qty + '支' + "</td>" + "</tr>"
                $("#tbody4").append(rows4);
            }

        }


       


    }


    function call_ajax(table_select) {
        $.ajax({
            type: 'POST',
            async: true,
            url: 'WebService1.asmx/online_data',
            data: "{'select':'" + table_select + "','page':'" + current_page_index + "','pageLength':'" + one_page_row + "'}",
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {

                SQL_DATA = data;

                console.log(data.d);

                proccess(SQL_DATA, table_select);
                drawChart(SQL_DATA,table_select);                   //Proccess&Draw Chart


            },
            Error: function () { alert("error"); },
            failure: function (msg) { alert(msg); console.log(msg); }

        });

    


               


        function drawChart(SQL_DATA,table_select) {

            google.charts.load('current', {'packages':['corechart']});
            // Set a callback to run when the Google Visualization API is loaded.
            if (table_select == 1)
            { google.charts.setOnLoadCallback(drawChart1); }
            else if (table_select == 2)
            { google.charts.setOnLoadCallback(drawChart2); }
            else if (table_select == 3)
            { google.charts.setOnLoadCallback(drawChart3); }
            else if (table_select == 4)
            { google.charts.setOnLoadCallback(drawChart4); }

            function drawChart1()
            {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', '_bg');
                data.addColumn('number', '_bg_qty');
                var total_qty = 0;
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    total_qty = total_qty + parseInt(SQL_DATA.d[i]._bg_qty);
                }
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    data.addRow([SQL_DATA.d[i]._bg, (SQL_DATA.d[i]._bg_qty / total_qty)]);
                }
                   
                var options = {
                   // 'title': '各事業群-手臂比例分析',
                    'width':450,
                    'height': 330,
                    is3D: true
                };


                var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
                chart.draw(data, options);
            }



            function drawChart2() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', '_factory_locate');
                data.addColumn('number', '_factory_locate_qty');
                var total_qty = 0;
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    total_qty = total_qty + parseInt(SQL_DATA.d[i]._factory_locate_qty);
                }
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    data.addRow([SQL_DATA.d[i]._factory_locate, (SQL_DATA.d[i]._factory_locate_qty / total_qty)]);
                }

                var options = {
                  //  'title': '各廠區-手臂比例分析',
                    'width': 450,
                    'height': 330,
                    is3D: true
                };


                var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
                chart.draw(data, options);
            }


            function drawChart3() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', '_product');
                data.addColumn('number', '_product_qty');
                var total_qty = 0;
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    total_qty = total_qty + parseInt(SQL_DATA.d[i]._product_qty);
                }
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    data.addRow([SQL_DATA.d[i]._product, (SQL_DATA.d[i]._product_qty / total_qty)]);
                }

                var options = {
                 //   'title': '客戶類-手臂比例分析',
                    'width': 450,
                    'height': 330,
                    is3D: true
                };


                var chart = new google.visualization.PieChart(document.getElementById('piechart3'));
                chart.draw(data, options);
            }

            function drawChart4() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', '_factory_locate_floor');
                data.addColumn('number', '_factory_locate_floor_qty');
                var total_qty = 0;
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    total_qty = total_qty + parseInt(SQL_DATA.d[i]._factory_locate_floor_qty);
                }
                for (var i = 0; i < SQL_DATA.d.length; i++) {
                    data.addRow([SQL_DATA.d[i]._factory_locate_floor, (SQL_DATA.d[i]._factory_locate_floor_qty / total_qty)]);
                }

                var options = {
                 //   'title': '各廠區/樓層-手臂比例分析',
                    'width': 450,
                    'height': 330,
                    is3D: true
                };


                var chart = new google.visualization.PieChart(document.getElementById('piechart4'));
                chart.draw(data, options);
            }






       


            
        };

        };

    });









    window.onload = function () {  };













