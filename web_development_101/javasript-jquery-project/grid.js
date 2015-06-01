var side = 16;
const containerWidth = 720;
const borderWidth = 1;
var numSquares = Math.pow(Math.floor(containerWidth/(side + borderWidth)), 2);

function grid (numSquares) {
    for (var i = 0; i < numSquares; i++) {
        $('#container').append('<div class="grid"></div>');
    }
    
    $('.grid').on('mouseenter', function () {
        $(this).addClass('visited');
    });
}

function changeGrid() {
    $('.grid').remove();
    var squarePerSide = prompt('Enter number of squares per side to print');
    side = containerWidth/(squarePerSide) - borderWidth;
    grid(squarePerSide*squarePerSide);
    $('.grid').css({"width": side, "height": side});
}

$(document).ready(function() { 
    $('body').append('<div id="container"></div>');
    $('#container').append('<div class="button"><button type="button">Clear grid!</button></div>');
 
    grid(numSquares);
    $('button').on('click', function() { changeGrid(); });
});
