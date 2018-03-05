

<!DOCTYPE html>
<html>
<head>
    <style>
    
    .zoomin img { height: 200px; width: 200px;
    -webkit-transition: all 2s ease;
    -moz-transition: all 2s ease;
    -ms-transition: all 2s ease;
    transition: all 2s ease; }
    .zoomin img:hover,
    img.zoomer{ width: 300px; height: 300px; }
        </style>
    
<title>sushanth</title>
</head>
    
<body>
    


    
<!--<input type="button" value ="-" onclick="zoom(2.10)"/> 
<input type="button" value ="+" onclick="zoom(8.15)"/> 
<div id="imagediv">
<img id="pic" src="http://localhost:65443/WebForm17.aspx"/>
</div>-->
<!-- <button onClick="resize(1)">plus</button>
<button onClick="resize(-1)">minus</button>-->
<canvas id="c" width="500" height="400">
canvas { border: 1px solid #ccc }
</canvas>

    <script>

        function zoomin() {
            var myImg = document.getElementById("c");
            var currWidth = myImg.clientWidth;
            if (currWidth == 700) {
                alert("Maximum zoom-in level reached.");
            } else {
                myImg.style.width = (currWidth + 50) + "px";
            }
        }
        function zoomout() {
            var myImg = document.getElementById("c");
            var currWidth = myImg.clientWidth;
            if (currWidth == 50) {
                alert("Maximum zoom-out level reached.");
            } else {
                myImg.style.width = (currWidth - 50) + "px";
            }
        }
    function drawStar(x, y) {
        var length = 15;
        ctx.save();
        ctx.translate(x, y);
        ctx.beginPath();
        ctx.rotate((Math.PI * 1 / 10));
        for (var i = 5; i--;) {
            ctx.lineTo(0, length);
            ctx.translate(0, length);
            ctx.rotate((Math.PI * 2 / 10));
            ctx.lineTo(0, -length);
            ctx.translate(0, -length);
            ctx.rotate(-(Math.PI * 6 / 10));
        }
        ctx.lineTo(0, length);
        ctx.closePath();
        ctx.stroke();
        ctx.restore();
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    var el = document.getElementById('c');
    var ctx = el.getContext('2d');

    ctx.lineJoin = ctx.lineCap = 'round';
    ctx.fillStyle = 'red';

    var isDrawing, points = [], radius = 15;

    el.onmousedown = function (e) {
        isDrawing = true;
        points.push({ x: e.clientX, y: e.clientY });
    };
    el.onmousemove = function (e) {
        if (!isDrawing) return;

        points.push({ x: e.clientX, y: e.clientY });

        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        for (var i = 0; i < points.length; i++) {
            drawStar(points[i].x, points[i].y);
        }
    };
    el.onmouseup = function () {
        isDrawing = false;
        points.length = 0;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Five Pointed Star Brush 17.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>


