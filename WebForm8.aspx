<!DOCTYPE html>
<html>
<head>
<title>sushanth</title>
</head>
<body>
<canvas id="c" width="500" height="300">
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
    var el = document.getElementById('c');
    var ctx = el.getContext('2d');
    var isDrawing;
    var density = 50;

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    el.onmousedown = function (e) {
        isDrawing = true;
        ctx.lineWidth = 10;
        ctx.lineJoin = ctx.lineCap = 'round';
        ctx.moveTo(e.clientX, e.clientY);
    };
    el.onmousemove = function (e) {
        if (isDrawing) {
            for (var i = density; i--;) {
                var radius = 20;
                var offsetX = getRandomInt(-radius, radius);
                var offsetY = getRandomInt(-radius, radius);
                ctx.fillRect(e.clientX + offsetX, e.clientY + offsetY, 1, 1);
            }
        }
    };
    el.onmouseup = function () {
        isDrawing = false;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the normal spray brush 
    8.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

