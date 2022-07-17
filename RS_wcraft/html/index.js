$(function () {
    function display(bool) {
        if (bool) {
            $("#Canvas").show();
        } else {
            $("#Canvas").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://NXJ_wcraft/close', JSON.stringify({}));
            return
        }
    };
    
    $("#ButtonGusi").click(function(){
        $.post('http://NXJ_wcraft/crafting', JSON.stringify({}));
        return
    })
    $("#ButtonAdvanced").click(function(){
        $.post('http://NXJ_wcraft/crafting2', JSON.stringify({}));
        return
    })

    $("#ButtonBullpup").click(function(){
        $.post('http://NXJ_wcraft/crafting3', JSON.stringify({}));
        return
    })
})

window.onload = function(){
    document.getElementById('close').onclick = function(){
            $.post('http://NXJ_wcraft/close', JSON.stringify({}));
        return
    };
};
