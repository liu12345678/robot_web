<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page1.aspx.cs" Inherits="RobotWeb.page1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="Content/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/semantic.min.js" type="text/javascript"></script>
    <script src="Scripts_leo/page1.js" type="text/javascript"></script>




    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>

    <script src="AddScripts/Chart.bundle.js" type="text/javascript"></script>
    <script src="AddScripts/utils.js" type="text/javascript"></script>
    <script src="AddScripts/loader.js" type="text/javascript"></script>

   <script type="text/javascript">



         $(document).ready(function () {




          


        });


    </script>





    <style>


        div.dataTables_wrapper {
        width: 90%;
        margin: 0 auto;
    }

    </style>
















<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:#f2f2f2">


<div class="row">
    <a href="home.aspx">返回上一頁</a>

</div>



<div class="row">
    <div class="col">
        <div class="card" style="width:90%;margin: 0px auto">
            <div class="card-header" style="background-color:#aaaaaa;color:#f2f2f2;text-align:center">
                <h3 style="font-size:24px">機械手臂 - 統計資料</h3>
            </div>
            <div class="card-body">
                
                <div class="row">

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h4 class="ui horizontal divider header" style="font-size:20px">
                                     依事業群
                                </h4>
                            </div>
                        </div>
                        <div class="row" style='height:20px'></div>
                        <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="chart pie icon"></i> 各事業群-手臂持有比例</h4></div></div>
                        <div class="row">
                           <div class="col" id="piechart1" style="left:80px; width: 300px; height: 300px"></div>
                        </div>
                        <div class="row">
                             <div class="col">
                                <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="table icon"></i> 各事業群-手臂持有統計</h4></div></div>
                                <div class="row"><div class="col" style="height:20px"></div></div>
                                <div class="row">
                                    <div class="col" style="left:30%">
                                        <table id="table1" class="ui celled table" style="width:200px;text-align:center">
                                          <thead>
                                            <tr>
                                                <th style="background-color:#e5dfdf">事業群</th>         <!--<th colspan="2">Header</th> 合併欄位-->
                                                <th style="background-color:#e5dfdf">數量</th>
                                            </tr>
                                          </thead>
                                          <tbody id="tbody1"> 
                                          </tbody>
                                        </table>


                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h4 class="ui horizontal divider header" style="font-size:20px">
                                     依廠區
                                </h4>
                            </div>
                        </div>
                        <div class="row" style='height:20px'></div>
                        <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="chart pie icon"></i> 各廠區-手臂持有比例</h4></div></div>
                        <div class="row">
                           <div class="col" id="piechart2" style="left:80px; width: 300px; height: 300px"></div>
                        </div>
                        <div class="row">
                             <div class="col">
                                <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="table icon"></i> 各廠區-手臂持有統計</h4></div></div>
                                <div class="row"><div class="col" style="height:20px"></div></div>
                                <div class="row">
                                    <div class="col" style="left:30%">
                                        <table id="table2" class="ui celled table" style="width:200px;text-align:center">
                                          <thead>
                                            <tr>
                                                <th style="background-color:#e5dfdf">廠區</th>         <!--<th colspan="2">Header</th> 合併欄位-->
                                                <th style="background-color:#e5dfdf">數量</th>
                                            </tr>
                                          </thead>
                                          <tbody id="tbody2"> 
                                          </tbody>
                                        </table>


                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>

                </div>

                <div class="row" style="height:30px"></div>
                    <div class="row">

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h4 class="ui horizontal divider header" style="font-size:20px">
                                     依產品
                                </h4>
                            </div>
                        </div>
                        <div class="row" style='height:20px'></div>
                        <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="chart pie icon"></i> 各產品-手臂持有比例</h4></div></div>
                        <div class="row">
                           <div class="col" id="piechart3" style="left:80px; width: 300px; height: 300px"></div>
                        </div>
                        <div class="row">
                             <div class="col">
                                <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="table icon"></i> 各產品-手臂持有統計</h4></div></div>
                                <div class="row"><div class="col" style="height:20px"></div></div>
                                <div class="row">
                                    <div class="col" style="left:30%">
                                        <table id="table3" class="ui celled table" style="width:200px;text-align:center">
                                          <thead>
                                            <tr>
                                                <th style="background-color:#e5dfdf">產品</th>         <!--<th colspan="2">Header</th> 合併欄位-->
                                                <th style="background-color:#e5dfdf">數量</th>
                                            </tr>
                                          </thead>
                                          <tbody id="tbody3"> 
                                          </tbody>
                                        </table>


                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <h4 class="ui horizontal divider header" style="font-size:20px">
                                     依各廠區/樓層
                                </h4>
                            </div>
                        </div>
                        <div class="row" style='height:20px'></div>
                        <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="chart pie icon"></i> 各廠區/樓層-手臂持有比例</h4></div></div>
                        <div class="row">
                           <div class="col" id="piechart4" style="left:80px; width: 300px; height: 300px"></div>
                        </div>
                        <div class="row">
                             <div class="col">
                                <div class="row"><div class="col" style="text-align:center"><h4 style="font-size:14px;color:#808080"><i class="table icon"></i> 各廠區/樓層-手臂持有統計</h4></div></div>
                                <div class="row"><div class="col" style="height:20px"></div></div>
                                <div class="row">
                                    <div class="col" style="left:30%">
                                        <table id="table4" class="ui celled table" style="width:200px;text-align:center">
                                          <thead>
                                            <tr>
                                                <th style="background-color:#e5dfdf">各廠區/樓層</th>         <!--<th colspan="2">Header</th> 合併欄位-->
                                                <th style="background-color:#e5dfdf">數量</th>
                                            </tr>
                                          </thead>
                                          <tbody id="tbody4"> 
                                          </tbody>
                                        </table>


                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>

                </div>

                    
            </div>
    </div>
</div>
</div>








<!-----------------------------Loader------------------------------------>
<div id="loader" class="ui huge active inverted dimmer">
    <div class="ui text loader">資料讀取中 請稍後</div>
</div>



    











</body>
</html>
