(function() {

    function init() {
        var lorem = document.getElementById("loremLink");
        var bottles = document.getElementById("bottlesLink");
        var last = document.getElementById("lastLink");

        lorem.addEventListener('click', onLoremClick, false);
        bottles.addEventListener('click', onBottlesClick, false);
        last.addEventListener('click', onLastClick, false);
    }

    function onLoremClick() {
        document.getElementById("loremText").hidden = false;
        document.getElementById("bottlesText").hidden = true;
        document.getElementById("lastText").hidden = true;
    }

    function onBottlesClick() {
        document.getElementById("loremText").hidden = true;
        document.getElementById("bottlesText").hidden = false;
        document.getElementById("lastText").hidden = true;
    }

    function onLastClick() {
        document.getElementById("loremText").hidden = true;
        document.getElementById("bottlesText").hidden = true;
        document.getElementById("lastText").hidden = false;
    }

    window.addEventListener('load', init, false);
})();
