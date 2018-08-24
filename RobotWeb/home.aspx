<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="RobotWeb.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="Content/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/semantic.min.js" type="text/javascript"></script>
    <script src="Scripts_leo/home.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="AddCss/icon.min.css"/>

    <script type="text/javascript">
        
        $(document).ready(function () {

            alert(document.cookie.toString());
          



        });


    </script>


  


<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    





    <!--------------------側邊工具欄---------------------->
<div id="div1" class="ui sidebar inverted vertical menu">
    <br />
    <h1 style="font-size:22px;color:white">聯絡我們 </h1>
    <h1 style="font-size:16px;color:white">正崴精密全球據點</h1>
    <label style="color:white">頂埔科技園區</label><br />
    <a class="item" href="login.aspx">
       新北市土城區中央路四段49號<br />
       資訊處 - 劉耀祥 |  #21253  |  Leo_7472@foxlink.com 
    </a>
    <label style="color:white">富港電子 富東廠</label><br />
    <a class="item" href="login.aspx">
       中國廣東省東莞市東坑鎮工業大道<br />
       資訊處 - 劉耀祥 |  #31000  |  Leo_7472@foxlink.com
    </a>
 
  
  <div class="pusher">
    <!-- Site content !-->
  </div>

</div>
















 <!----------------------------menu------------------------------>
<div class="row ui equal width center aligned padded grid" style="height:60px;z-index:1">
<div class="col ui menu" style="position:fixed;top:0px;left:0px;width:100%;z-index:1">
         <img src="pic/foxlink icon.jpg" style="height:60px;width:220px" /><div style="font-size:18px;position:absolute;top:50%;left:20%">智慧製造發展處 - 雲端手臂監控系統</div>
  <div class="right menu">

        <a class="item" href="home.aspx">監控</a>
        
      
          <div id="div_c" class="ui dropdown item">查詢<i class="caret down icon"></i>
               <div class="menu">
                 <a class="item" href="page1.aspx">
                   即時資料
                 </a>
                 <div class="ui dropdown item">歷史資料<i class="caret right icon"></i>
                     <div class="menu" >
                         <a class="item"  href="page1.aspx">手臂狀態</a>
                         <a class="item"  href="page1.aspx">手臂異常事件</a>
                         <a class="item"  href="RPM_History.aspx">轉速</a>
                         <a class="item"  href="page1.aspx">扭矩</a>
                         <a class="item"  href="page1.aspx">溫度</a>
                     </div>
                 </div>
               </div>
          </div>
        
        
        
        <a class="item">管理</a>
        <a class="item" id="help">幫助</a>
    </div>
</div>
</div>
     
     
     
     <div class="row"><div class="col" style="height:30px"></div></div>
     
<div class="row">

<div class="col-2">

    <div class="row">
        <!----------------------Account Message----------------------------->
        <div class="offset-sm-2" >
            <div class="row ui block header" style="width:190px;height:120px;background-color:#fafafa;margin: 0px auto;">
              <div class="col">
              <div class="row"><h1 style="font-size:40px;float:right"><i class="user icon"></i></h1></div>
              <div class="row">Account<div id="div_hello" style="font-size:14px;float:left;text-align:center"></div></div>
              </div>
              
              <div class="col" style="align-content:center;text-align:center;margin:auto 0px">
              <div class="row"><a href="test.aspx">登出</a></div>
              <div class="row"><a href="test.aspx">變更密碼</a></div>
              <div class="row"><a href="test.aspx">帳號管理</a></div>
              </div>
              </div>
        </div>
    </div>

    <div class="row"><div class="col" style="height:30px"></div></div>


    <div class="row">
        <!----------------------------Search--------------------------------->
        <div class="col">
               
                    <div class="row" style="float:right">手臂序號<input id="in1" type="text" value="" placeholder="手臂序號" /></div>
                    <div class="row" style="float:right">BG<input id="in2" type="text" placeholder="BG" /></div>
                    <div class="row" style="float:right">廠區<input id="in3" type="text" placeholder="廠區" /></div>
                    <div class="row" style="float:right">樓層<input id="in4" type="text" placeholder="樓層" /></div>
                    <div class="row" style="float:right">車間<input id="in5" type="text" placeholder="車間" /></div>
                    <div class="row" style="float:right">產品<input id="in6" type="text" placeholder="產品" /></div>
                    <div class="row" style="float:right">線別<input id="in7" type="text" placeholder="線別" /></div>
                    <div class="row" style="float:right"><div class="col offset-sm-0"><div class="col offset-2"><button id="srch_but" type="button" style="width:155px">搜尋</button></div></div></div>
                    <div class="row" style="float:right"><div class="col offset-sm-0"><div class="col offset-2" id="update_time" style="color:#c3c3c3;font-size:8px"></div></div></div>
                </div>
    </div>

</div>




<div class="col">
        <!------------------------------Robot Block------------------------------------>
        <div class="col align-self-start offset-1">
             <div id="add" class="ui four column row grid"></div>
        </div>
</div>



</div>






<!--
<div class="row" style="background-color:#e9e9e9;top:60px;height:100px">
    <div class="col-2">

        <div class="row ui block header" style="margin: 0px auto;">
        <div class="col">
                <div class="row">Account</div>
                <div class="row"><h1 style="font-size:40px;float:right"><i class="user icon"></i></h1></div>
                
        </div>
        <div class="col"><div class="row" id="div_hello123" style="font-size:14px;float:left;text-align:center"></div></div>

        </div> 
    </div>
    
    <div class="col">123123123123</div>
    <div class="col">123123123123</div>
    <div class="col">123123123123</div>
    <div class="col">123123123123</div>
    <div class="col">123123123123</div>
</div>
<br />
  -->  



  
                
      
             
    
    

    
    
    
    
    
    
    

         

    





                


  

 












    




    
   
    <div class="row" style="height:1000px"></div>







    




   




       

</body>
</html>
