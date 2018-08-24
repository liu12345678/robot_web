<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RobotWeb.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    



    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="Content/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/semantic.min.js" type="text/javascript"></script>
    <script src="Scripts_leo/login.js" type="text/javascript"></script>






    <script>
       




    </script>



    <style>
    #c_div
    {
        left:35%;
        display:table-cell; 
        text-align:center; 
        vertical-align:middle;
    }

    </style>







    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:#cecece">
 
        






                      
      



                    <div class="row"><div class="col" style="height:80px"></div></div>



                    <!-------------------------login-------------------------->
                    

                    <div class="row ui block header bg-white" style="width:350px;margin: 0px auto">
                        <div class="col"></div>
                        <div class="col" style="text-align:center">
                            <img src="pic/foxlink icon.jpg" /><br />
                            製造發展處 - 手臂雲端管理系統
                            <h1 style="font-size:120px"><i class="user icon"></i></h1><br />
                            <div class="ui left icon input"><input type="text" id="in_id" placeholder="請輸入帳號" style="width:300px"/><i class="users icon"></i></div><br /><br />
                            <div class="ui left icon input"><input type="password" id="in_pwd" placeholder="請輸入密碼" style="width:300px"/><i class="edit outline icon"></i></div><br /><br />
                            <button type="button" id="b1" class="ui button" style="width:300px;background-color:#09c2b7">登 入</button>
                            <div id="e_div" style="background-color:#ffd04f;height:20px;width:300px;color:white;text-align:center;">
                                技術發展處　　　|　　　資訊工程處
                            </div>
                        </div>
                            
                        <div class="col"></div>
                    </div>
            
                    <div class="row"><div class="col"></div></div>


 


 












<div id="div_msg" class="ui basic modal" style="position:absolute;height:100%;width:100%">
  <div class="ui icon header" style="position:relative;top:25%">
    <i class="user times icon"></i>
    登入提示
  </div>
  <div class="content" style="position:relative;top:25%;left:20%">
    <p id="p1" style="font-size:30px;position:relative;left:15%">帳號或密碼錯誤 請重新輸入</p><br /><br />
  </div>
  <div class="actions" style="position:relative;top:25%;left:-45%">
    <div id="ok_but" class="ui green ok inverted button">
      <i class="checkmark icon" ></i>
      確認
    </div>
  </div>
</div>










    


    





</body>
</html>
