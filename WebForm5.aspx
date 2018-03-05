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

    ctx.lineWidth = 1;
    ctx.lineJoin = ctx.lineCap = 'round';

    var isDrawing, points = [];

    el.onmousedown = function (e) {
        isDrawing = true;
        points.push({ x: e.clientX, y: e.clientY });
    };

    el.onmousemove = function (e) {
        if (!isDrawing) return;

        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        points.push({ x: e.clientX, y: e.clientY });

        ctx.beginPath();
        ctx.moveTo(points[0].x, points[0].y);
        for (var i = 1; i < points.length; i++) {
            ctx.lineTo(points[i].x, points[i].y);
            var nearPoint = points[i - 5];
            if (nearPoint) {
                ctx.moveTo(nearPoint.x, nearPoint.y);
                ctx.lineTo(points[i].x, points[i].y);
            }
        }
        ctx.stroke();
    };

    el.onmouseup = function () {
        isDrawing = false;
        points.length = 0;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the point based brush 5.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

