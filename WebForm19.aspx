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
    function distanceBetween(point1, point2) {
        return Math.sqrt(Math.pow(point2.x - point1.x, 2) + Math.pow(point2.y - point1.y, 2));
    }
    function angleBetween(point1, point2) {
        return Math.atan2(point2.x - point1.x, point2.y - point1.y);
    }

    var el = document.getElementById('c');
    var ctx = el.getContext('2d');
    ctx.fillStyle = 'red';
    ctx.strokeStyle = '#333';

    var isDrawing, lastPoint;

    el.onmousedown = function (e) {
        isDrawing = true;
        lastPoint = { x: e.clientX, y: e.clientY };
    };

    el.onmousemove = function (e) {
        if (!isDrawing) return;

        var currentPoint = { x: e.clientX, y: e.clientY };
        var dist = distanceBetween(lastPoint, currentPoint);
        var angle = angleBetween(lastPoint, currentPoint);

        for (var i = 0; i < dist; i += 5) {
            x = lastPoint.x + (Math.sin(angle) * i) - 25;
            y = lastPoint.y + (Math.cos(angle) * i) - 25;
            ctx.beginPath();
            ctx.arc(x + 10, y + 10, 20, false, Math.PI * 2, false);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();
        }

        lastPoint = currentPoint;
    };

    el.onmouseup = function () {
        isDrawing = false;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Trail Effect Brush 19.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

