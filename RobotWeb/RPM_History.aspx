<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RPM_History.aspx.cs" Inherits="RobotWeb.RPM_History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="Content/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/semantic.min.js" type="text/javascript"></script>
    <script src="Scripts_leo/rpm_history.js" type="text/javascript"></script>




    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>

    <script src="AddScripts/Chart.bundle.js" type="text/javascript"></script>
    <script src="AddScripts/utils.js" type="text/javascript"></script>


    <script src="AddScripts/1.5.2 dataTables.buttons.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="AddCss/1.5.2 buttons.dataTables.min.css" />

    <script src="AddScripts/1.5.2 buttons.colVis.min.js" type="text/javascript"></script>
    <script src="AddScripts/1.5.2 buttons.html5.min.js" type="text/javascript"></script>
    <script src="AddScripts/1.5.2 buttons.flash.min.js" type="text/javascript"></script>

    <script src="AddScripts/1.5.2 buttons.bootstrap4.min.js" type="text/javascript"></script>
    <script src="AddScripts/1.5.2 buttons.print.min.js" type="text/javascript"></script>


    <!--google charts  -->
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
<body>
   















<div class="row">
    
<a href="home.aspx">返回上一頁<i class="reply icon"></i></a>
    
</div>

    


<div class="row">  <h1 class="ui header offset-1" style="margin:0px auto">資料表</h1><br /></div>
<div class="row" style="background-color:#78ade0;width:80%;height:6px;margin:0px auto"></div>
<div class="row"><div class="col" style="height:10px"></div></div>

<div class="row ui block header bg-white" style="width:80%;margin: 0px auto;">





<table id="rpm_history_table" class="display nowrap cell-border stripe" style="width:100%">
  <thead>
    <tr>
        <th>手臂SN</th>
        <th>資料時間</th>
        <th>J1_轉速</th>
        <th>J2_轉速</th>
        <th>J3_轉速</th>
        <th>J4_轉速</th>
        <th>J5_轉速</th>
        <th>J6_轉速</th>
        <th>RN</th>
    </tr>

  </thead>
  <tbody>
  </tbody>
  

    




</table><br />

  
</div>


<!-----------------------------Loader------------------------------------>
<div id="loader" class="ui huge active inverted dimmer">
    <div class="ui text loader">資料讀取中 請稍後</div>
</div>





<div class="row">
<br /><br />
</div>
 
<div class="row"> <h1 class="ui header offset-1" style="margin:0px auto">平均轉速統計</h1></div>
   
<div class="row" style="background-color:#78ade0;width:80%;height:6px;margin:0px auto"></div>
     <div class="col" style="height:10px"></div>


<div class="row ui block header bg-white" style="width:80%;margin: 0px auto;">
   

    <div class="row ui" style="margin: 0px auto" >
    

    
    


   





<div class="ui row " style="margin: 0px auto">
    <div class="col">
        <div style="width: 500px; height: 400px">
        <div id="chart_div"></div>
        </div>
    </div>

    <div class="col" style="left:50px;top:60px">
        <div class="row"><div class="col" style="text-align:center"><h1 style="font-size:120px"><i class="chart line icon"></i></h1></div></div>
        <div class="row">
    
        <div class="col" style="width:160px;text-align:center">

 
            <div class="content">
              <div class="header"><h1 id="header1"> null </h1></div>
              <div class="meta " id="meta1">折線圖</div>
              <div class="description">
              
              </div>
            </div>

        </div>
        <div class="col" style="width:160px;text-align:center">
            <div class="content">
              <div class="header"><h1 id="header2"> null </h1></div>
              <div class="meta" id="meta2">折線圖</div>
              <div class="description">
       
              </div>
            </div>
        </div>

    </div>
        <div class="row">
    
        <div class="col" style="width:160px;text-align:center">

 
            <div class="content">
              <div class="header"><h1 id="header3"> null </h1></div>
              <div class="meta " id="meta3">折線圖</div>
              <div class="description">
     
              </div>
            </div>

        </div>
        <div class="col" style="width:160px;text-align:center">
            <div class="content">
              <div class="header"><h1 id="header4"> null </h1></div>
              <div class="meta" id="meta4">折線圖</div>
              <div class="description">
           
              </div>
            </div>
        </div>

    </div>
        <div class="row">
    
        <div class="col" style="width:160px;text-align:center">

 
            <div class="content">
              <div class="header"><h1 id="header5"> null </h1></div>
              <div class="meta " id="meta5">折線圖</div>
              <div class="description">
            
              </div>
            </div>

        </div>
        <div class="col" style="width:160px;text-align:center">
            <div class="content">
              <div class="header"><h1 id="header6"> null </h1></div>
              <div class="meta" id="meta6">折線圖</div>
              <div class="description">
         
              </div>
            </div>
        </div>

    </div>
    </div>




       








  
	</div>
		












</div>
    


</div>





<div class="row"><div class="col" style="height:30px"></div></div>

















 
</body>
</html>
