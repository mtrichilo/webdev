import "phoenix_html";
import $ from "jquery";

function update_buttons() {
    $('.time-button').each((_, button) => {
        let task_id = $(button).data('task');
        let time_id = $(button).data('time');
        if (time_id == "") {
            $(button).text("Start work");
        } else {
            $(button).text("Stop work");
        }
    });
}

function set_button(task_id, value) {
    $('.time-button').each((_, button) => {
        if (task_id == $(button).data('task')) {
            $(button).data('time', value);
        }
    });
    update_buttons();
}

function start_time(task_id) {
    let date = Date();
    let time_block = JSON.stringify({
        time: {
            start: date,
            end: date,
            task_id: task_id
        }
    });

    $.ajax(time_path, {
        method: "post",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: time_block,
        success: (resp) => { set_button(task_id, resp.data.id); },
    });
}

function end_time(task_id, time_id) {
    let date = Date();
    let time_block = JSON.stringify({
        time: {
            end: date
        }
    });

    $.ajax(time_path + "/" + time_id, {
        method: "post",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: time_block,
        success: (resp) => { set_button(task_id, ""); },
    });
}

function time_click(ev) {
    let button = $(ev.target);
    let time_id = button.data('time');
    let task_id = button.data('task');

    if (time_id == "") {
        start_time(task_id);
    } else {
        end_time(task_id, time_id);
    }
}

function init_time() {
    if (!$('.time-button')) {
        return;
    }

    $('.time-button').click(time_click);

    update_buttons();
}

$(init_time)
