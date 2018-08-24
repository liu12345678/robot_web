
$(document).ready(function () {
        
    $("#b1").click(function () {
        login();
    });

    function login() {
        $("#b1").addClass("loading");
            $.ajax({
                type: 'POST',
                url: 'WebService1.asmx/login',
                data: "{'id':'" + $('#in_id').val() + "'"
                    + ",'pwd':'" + $('#in_pwd').val() + "'}",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    
                    $('#data').empty();
                    //alert(data.d.length);
                    if (check_login_data(data) == true) { $("#b1").removeClass("loading"); window.location.href = "home.aspx"; document.cookie = "myname=" + $('#in_id').val(); }
                    else {
                        //   alert("帳號密碼錯誤");
                        $("#b1").removeClass("loading");
                        $("#div_msg").modal('show');
                    }
                
                
                    //    $("#b1").click("javascript:location.href='home.aspx'");

                },

                Error: function () { alert("error");}
            });



        




        };
    



    function check_login_data(data)
    {
        var t = false;
        for (var i = 0; i < data.d.length; i++) {

            if (data.d[i].id == $('#in_id').val() && data.d[i].pwd == $('#in_pwd').val())
            { localStorage.setItem("user", data.d[i].name); t = true; break; }
            else { t = false; }

        }
        return t;
    }



    $(document).keydown(function (event) {
        if (event.keyCode == 13) {
      
            login();
        }
    });

    
   
});


window.onload = function () {
    


}