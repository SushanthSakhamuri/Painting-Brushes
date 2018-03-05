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
    function drawStar(options) {
        var length = 15;
        ctx.save();
        ctx.translate(options.x, options.y);
        ctx.beginPath();
        ctx.globalAlpha = options.opacity;
        ctx.rotate(Math.PI / 180 * options.angle);
        ctx.scale(options.scale, options.scale);
        ctx.strokeStyle = options.color;
        ctx.lineWidth = options.width;
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

    var isDrawing, points = [], radius = 15;

    function addRandomPoint(e) {
        points.push({
            x: e.clientX,
            y: e.clientY,
            angle: getRandomInt(0, 180),
            width: getRandomInt(1, 10),
            opacity: Math.random(),
            scale: getRandomInt(1, 20) / 10,
            color: ('rgb(' + getRandomInt(0, 255) + ',' + getRandomInt(0, 255) + ',' + getRandomInt(0, 255) + ')')
        });
    }

    el.onmousedown = function (e) {
        isDrawing = true;
        addRandomPoint(e);
    };
    el.onmousemove = function (e) {
        if (!isDrawing) return;

        addRandomPoint(e);

        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        for (var i = 0; i < points.length; i++) {
            drawStar(points[i]);
        }
    };
    el.onmouseup = function () {
        isDrawing = false;
        points.length = 0;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Multi Coloured Star Brush 15.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

