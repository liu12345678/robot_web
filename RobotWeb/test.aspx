<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="RobotWeb.test" %>

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


    <script src="AddScripts/Chart.bundle.js" type="text/javascript"></script>
    <script src="AddScripts/utils.js" type="text/javascript"></script>


    <script type="text/javascript">
         
         
         
        $(document).ready(function () {

            $("#bbb").click(function () { abc() });

            function abc() { alert("bbb!!!") };

            
            var table = $('#example').DataTable({
                scrollY: "300px",
                scrollX: true,
                scrollCollapse: true,
                paging: false,
                fixedColumns: {
                    leftColumns: 1,
                    rightColumns: 1
                }
            });
            



        });

 </script>













<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	.chart-container {
		width: 500px;
		margin-left: 40px;
		margin-right: 40px;
		margin-bottom: 40px;
	}
	.container {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: center;
	}
	</style>
	




















<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   


    <h4 class="ui horizontal divider header">
  <i class="tag icon"></i>
  Description
</h4>


    <button type="button" id="bbb">test click</button>






















    <div class="container">
	</div>
	<script>
		function createConfig(position) {
			return {
				type: 'line',
				data: {
					labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					datasets: [{
						label: 'My First dataset',
						borderColor: window.chartColors.red,
						backgroundColor: window.chartColors.red,
						data: [10, 30, 46, 2, 8, 50, 0],
						fill: false,
					}, {
						label: 'My Second dataset',
						borderColor: window.chartColors.blue,
						backgroundColor: window.chartColors.blue,
						data: [7, 49, 46, 13, 25, 30, 22],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					title: {
						display: true,
						text: 'Tooltip Position: ' + position
					},
					tooltips: {
						position: position,
						mode: 'index',
						intersect: false,
					},
				}
			};
		}

		window.onload = function() {
			var container = document.querySelector('.container');

			['average', 'nearest'].forEach(function(position) {
				var div = document.createElement('div');
				div.classList.add('chart-container');

				var canvas = document.createElement('canvas');
				div.appendChild(canvas);
				container.appendChild(div);

				var ctx = canvas.getContext('2d');
				var config = createConfig(position);
				new Chart(ctx, config);
			});
		};
	</script>




    <script>
        $(document).ready(function () {
            $("#div_c").dropdown();
        });
    </script>



<div class="center">
  <div id="div_c" class="ui dropdown">查詢<i class="dropdown icon"></i>
       <div class="menu">
         <div class="item">
           即時資料
         </div>
         <div class="item">
           歷史資料
         </div>
       </div>
  </div>
</div>


    <button type="button" id="b1" class="ui loading button" style="width:300px">login</button>


    <div>
<div class="left" style="float:left">aaaaaaaaaaaa</div>
<div class="right" style="float:right">bbbbbbbb</div>
</div>


</body>
</html>
