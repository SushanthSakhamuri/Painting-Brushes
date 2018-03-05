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
    function drawPixels(x, y) {
        for (var i = -10; i < 10; i += 4) {
            for (var j = -10; j < 10; j += 4) {
                if (Math.random() > 0.5) {
                    ctx.fillStyle = ['red', 'orange', 'yellow', 'green',
                        'light-blue', 'blue', 'purple'][getRandomInt(0, 6)];
                    ctx.fillRect(x + i, y + j, 4, 4);
                }
            }
        }
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    var el = document.getElementById('c');
    var ctx = el.getContext('2d');

    ctx.lineJoin = ctx.lineCap = 'round';
    var isDrawing, lastPoint;

    el.onmousedown = function (e) {
        isDrawing = true;
        lastPoint = { x: e.clientX, y: e.clientY };
    };
    el.onmousemove = function (e) {
        if (!isDrawing) return;

        drawPixels(e.clientX, e.clientY);

        lastPoint = { x: e.clientX, y: e.clientY };
    };
    el.onmouseup = function () {
        isDrawing = false;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Coloured Pixel Brush 14.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

