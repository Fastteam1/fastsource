var rh = rh || {};
rh.mq = rh.mq || {};
rh.mq.editing = false;
rh.mq.attachEventHanlers = function () {
    $("#insert-modal").on('shown.bs.modal', function () {
        $("input[name=gameTempName]").focus();
    });
};
rh.mq.enableButtons = function () {

    $("#add-form").click(function () {
        $("#insert-modal .modal-title").html("Thêm mới mẫu Game");
        $("#insert-modal button[type=submit]").html("Thêm mới");

        $("#insert-modal input[name=gameTempName]").val("");
        $("#insert-modal textarea[name=description]").val("");
        $("#insert-modal input[name=gameTempId]").val(0);

        var cateList = document.getElementById("category");
        for (var i = 0; i < cateList.options.length; ++i) {
            cateList.options[i].selected = false;
        }
        
        var statusList = document.getElementById("status-input");
        for (var i = 0; i < statusList.options.length; ++i) {
            statusList.options[i].selected = false;
        }
        
        var isQuestionList = document.getElementById("isQuestion-input");
        for (var i = 0; i < isQuestionList.options.length; ++i) {
            isQuestionList.options[i].selected = false;
        }
    });



    $("#example1").on("click", ".edit-Template", function () {
        $("#insert-modal .modal-title").html("Cập nhật mẫu Game");
        $("#insert-modal button[type=submit]").html("Cập nhật");

        gameTempId = $(this).find(".gameTempId").html();
        gameTempName = $(this).find(".gameTempName").html();
        gameCateId = $(this).find(".gameCateId").html();
        description = $(this).find(".description").html();
        status = $(this).find(".status").html();
        isQuestion = $(this).find(".isQuestion").html();

//        console.log("gameTempId" + gameTempId);
//        console.log("gameTempName" + gameTempName);
        console.log("status: " + status);
        console.log("isQuestion: " + isQuestion);

        $("#insert-modal input[name=gameTempId]").val(gameTempId);
        $("#insert-modal input[name=gameTempName]").val(gameTempName);
        $("#insert-modal textarea[name=description]").val(description);

        var cateList = document.getElementById("category");
        for (var i = 0; i < cateList.options.length; ++i) {
            cateList.options[i].selected = false;
            if (cateList.options[i].value === gameCateId)
                cateList.options[i].selected = true;
        }

        var statusList = document.getElementById("status-input");
        for (var i = 0; i < statusList.options.length; ++i) {
            statusList.options[i].selected = false;
            //console.log("statusList.options[i].value " + statusList.options[i].value);
            if (statusList.options[i].value === status)
                statusList.options[i].selected = true;
        }


        var isQuestionList = document.getElementById("isQuestion-input");
        for (var i = 0; i < isQuestionList.options.length; ++i) {
            isQuestionList.options[i].selected = false;

            if (isQuestionList.options[i].value === isQuestion)
                isQuestionList.options[i].selected = true;
        }
    });

};

$(document).ready(function () {
    rh.mq.attachEventHanlers();
    rh.mq.enableButtons();

});
