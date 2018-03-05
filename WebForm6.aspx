﻿<!DOCTYPE html>
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
    var clientX, clientY, timeout;
    var density = 40;

    function getRandomFloat(min, max) {
        return Math.random() * (max - min) + min;
    }

    el.onmousedown = function (e) {
        ctx.lineJoin = ctx.lineCap = 'round';
        clientX = e.clientX;
        clientY = e.clientY;

        timeout = setTimeout(function draw() {
            for (var i = density; i--;) {
                var angle = getRandomFloat(0, Math.PI * 2);
                var radius = getRandomFloat(0, 30);
                ctx.globalAlpha = Math.random();
                ctx.fillRect(
                    clientX + radius * Math.cos(angle),
                    clientY + radius * Math.sin(angle),
                    getRandomFloat(1, 2), getRandomFloat(1, 2));
            }
            if (!timeout) return;
            timeout = setTimeout(draw, 50);
        }, 50);
    };
    el.onmousemove = function (e) {
        clientX = e.clientX;
        clientY = e.clientY;
    };
    el.onmouseup = function () {
        clearTimeout(timeout);
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the dot brush 6.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>

</body>
</html>
