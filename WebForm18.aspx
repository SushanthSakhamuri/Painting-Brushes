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
        points.push({
            x: e.clientX,
            y: e.clientY,
            radius: getRandomInt(10, 30),
            opacity: Math.random()
        });
    };
    el.onmousemove = function (e) {
        if (!isDrawing) return;

        points.push({
            x: e.clientX,
            y: e.clientY,
            radius: getRandomInt(5, 20),
            opacity: Math.random()
        });

        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        for (var i = 0; i < points.length; i++) {
            ctx.beginPath();
            ctx.globalAlpha = points[i].opacity;
            ctx.arc(
                points[i].x, points[i].y, points[i].radius,
                false, Math.PI * 2, false);
            ctx.fill();
        }
    };
    el.onmouseup = function () {
        isDrawing = false;
        points.length = 0;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Random Radius Brush 18.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

