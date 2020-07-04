$(function () {
    let status = "circle";
    let selected;
    let dropped;
    let selectedClassArray;
    let droppedClassArray;
    let selectedRow;
    let selectedCol;
    let droppedRow;
    let droppedCol;


    // 手番交代用関数
    function turnSwitch() {
        if (status == "circle") {
            status = "cross"
        } else if (status == "cross") {
            status = "circle"
        };
    };

    // 右に誰の手番か表示する。
    function text() {
        $("#right_column").text(status + "の手番です。");
    };

    // クラス操作
    function classResetALL() {
        $(".grids").each(function () {
            $(this).removeClass("untouchable");
            $(this).removeClass("draggable");
            $(this).removeClass("ui-droppable");
        });
    };

    // マス目の背景決定。
    function backgrounsManager() {
        $(".grids").each(function () {
            const thisClass = $(this).attr("class");
            let class_array = thisClass.split(" ");
            $(this).find("div").css("background", "url('img/" + class_array[3] + ".png')");
        });
    }

    // 触っていいコマを判定する。だけだったのですが、draggable()周りが機能する条件的にとても長くなっていました。
    function touchableManager() {
        // 全マスに対する一般化。
        $(".grids").each(function () {
            const thisClass = $(this).attr("class");
            const localClassArray = thisClass.split(" ");
            if (localClassArray[3] == status || localClassArray[3] == "none") {
                $(this).removeClass("untouchable");
                $(this).addClass("draggable");
            } else {
                $(this).removeClass("draggable");
                $(this).addClass("untouchable");
            };
        });
        // ドラッグ可能処理
        $(".draggable > div").draggable({
            revert: true
        });

        // ajax通信
        function toPhp() {
            $.ajax({
                type: "POST",
                url: "quixo_update.php",
                data: {
                    "game_id": game_id,
                    "selected_row": selectedRow,
                    "selected_col": selectedCol,
                    "status": status,
                    "dropped_row": droppedRow,
                    "dropped_col": droppedCol,
                }
            }).done(function (result) {
                jsonArray = JSON.parse(result);
                console.log(jsonArray);

                for (let i = 0; i < jsonArray.length; i++) {
                    $(`#${jsonArray[i][0]}`).removeClass("none");
                    $(`#${jsonArray[i][0]}`).removeClass("circle");
                    $(`#${jsonArray[i][0]}`).removeClass("cross");
                    $(`#${jsonArray[i][0]}`).addClass(jsonArray[i][1]);
                };

                turnSwitch();
                text();
                backgrounsManager();
                touchableManager();
            }).fail(function () {
                // 通信失敗時の処理を記述
                console.log("error")
            });

        }

        // ドラッグ時の処理
        $(".draggable").on("mousedown", function () {
            selected = $(this).attr("class");
            selectedClassArray = selected.split(" ");
            $(".r1" + `.${selectedClassArray[2]}`).addClass("droppable");
            $(".r1" + `.${selectedClassArray[2]}`).droppable({
                accept: ".draggable > div",
                drop: function () {
                    dropped = $(this).attr("class");
                    droppedClassArray = dropped.split(" ");
                    selectedRow = selectedClassArray[1];
                    selectedCol = selectedClassArray[2];
                    droppedRow = droppedClassArray[1];
                    droppedCol = droppedClassArray[2];
                    classResetALL();
                    toPhp();
                }
            });

            $(".r5" + `.${selectedClassArray[2]}`).addClass("droppable");
            $(".r5" + `.${selectedClassArray[2]}`).droppable({
                accept: ".draggable > div",
                drop: function () {
                    dropped = $(this).attr("class");
                    droppedClassArray = dropped.split(" ");
                    selectedRow = selectedClassArray[1];
                    selectedCol = selectedClassArray[2];
                    droppedRow = droppedClassArray[1];
                    droppedCol = droppedClassArray[2];
                    classResetALL();
                    toPhp();
                }
            });

            $(".c1" + `.${selectedClassArray[1]}`).addClass("droppable");
            $(".c1" + `.${selectedClassArray[1]}`).droppable({
                accept: ".draggable > div",
                drop: function () {
                    dropped = $(this).attr("class");
                    droppedClassArray = dropped.split(" ");
                    selectedRow = selectedClassArray[1];
                    selectedCol = selectedClassArray[2];
                    droppedRow = droppedClassArray[1];
                    droppedCol = droppedClassArray[2];
                    classResetALL();
                    toPhp();
                }
            });

            $(".c5" + `.${selectedClassArray[1]}`).addClass("droppable");
            $(".c5" + `.${selectedClassArray[1]}`).droppable({
                accept: ".draggable > div",
                drop: function () {
                    dropped = $(this).attr("class");
                    droppedClassArray = dropped.split(" ");
                    selectedRow = selectedClassArray[1];
                    selectedCol = selectedClassArray[2];
                    droppedRow = droppedClassArray[1];
                    droppedCol = droppedClassArray[2];
                    classResetALL();
                    toPhp();
                }
            });
        });


        $(".draggable").on("mouseup", function () {
            const class_array = selected.split(" ");
            $(".r1" + `.${class_array[2]}`).removeClass("droppable");
            $(".r5" + `.${class_array[2]}`).removeClass("droppable");
            $(".c1" + `.${class_array[1]}`).removeClass("droppable");
            $(".c5" + `.${class_array[1]}`).removeClass("droppable");
        });

    };


    // 初期起動
    text();
    touchableManager();
    backgrounsManager();


});
