// Script that handles button clicks for hw02.michaeltri.ch/task2.html.
(function() {
    "use strict";

    // Adds event listeners to the buttons.
    function init() {
        var value = document.getElementById('value');
        var inc = document.getElementById('inc');
        var append = document.getElementById('append');

        value.addEventListener('click', onValueClick, false);
        inc.addEventListener('click', onIncClick, false);
        append.addEventListener('click', onAppendClick, false);
    }
    
    // Creates an alert with the current number value.
    function onValueClick() {
        var number = document.getElementById('number').innerText;
        alert(number);
    }
    
    // Increments the number by one.
    function onIncClick() {
        var number = document.getElementById('number');
        number.innerText = Number(number.innerText) + 1;
    }

    // Appends a new paragraph to the body with the current number value.
    function onAppendClick() {
        var body = document.children[0].children[1];
        var p = document.createElement("p");
        var number = document.getElementById('number').innerText;
        p.innerText = number;
        body.appendChild(p);
    }

    window.addEventListener('load', init, false);
})(); 
