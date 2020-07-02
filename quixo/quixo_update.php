<?php

include("functions.php");
$row_or_col;

// $game_id = $_POST["game_id"];
// $selected_row = $_POST["selected_row"];
// $selected_col = $_POST["selected_col"];
// $status = $_POST["status"];
// $dropped_row = $_POST["dropped_row"];
// $dropped_col = $_POST["dropped_col"];


// $sql_first = "UPDATE quixo_database SET status = :status where game_id = :game_id AND row = :row AND col = :col";

// $pdo_first = connect_to_db();
// $stmt_first = $pdo_first->prepare($sql_first);
// $stmt_first->bindValue(":game_id", $game_id, PDO::PARAM_STR);
// $stmt_first->bindValue(":row", $dropped_row, PDO::PARAM_STR);
// $stmt_first->bindValue(":col", $dropped_col, PDO::PARAM_STR);
// $stmt_first->bindValue(":status", $status, PDO::PARAM_STR);
// $status_first = $stmt_first->execute();

// // データ登録処理後
// if ($status_first == false) {
//     // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
//     $error = $stmt_first->errorInfo();
//     echo json_encode(["error_msg" => "{$error[2]}"]);
//     exit();
// } else {
// };

$game_id = "348143";
$selected_row = "r3";
$selected_col = "c4";
$dropped_row = "r5";
$dropped_col = "c4";

$selected_row_str = str_replace("r", "", $selected_row);
$selected_row_int = (int) $selected_row_str;
$selected_col_str = str_replace("c", "", $selected_col);
$selected_col_int = (int) $selected_col_str;
$dropped_row_str = str_replace("r", "", $dropped_row);
$dropped_row_int = (int) $dropped_row_str;
$dropped_col_str = str_replace("c", "", $dropped_col);
$dropped_col_int = (int) $dropped_col_str;



$cells_array = [];
$sql_second = "SELECT * from quixo_database where game_id = :game_id";


if ($selected_row_int == $dropped_row_int) {
    $row_or_col = "row";
    $sql_second .= " AND row = '{$selected_row}' AND (";
    if ($selected_col_int > $dropped_col_int) {
        for ($i = $selected_col_int; $i >= $dropped_col_int; $i--) {
            array_push($cells_array, "c{$i}");
        }
        for ($j = 0; $j < count($cells_array); $j++) {
            if ($j != count($cells_array) - 1) {
                $sql_second .= "col = '{$cells_array[$j]}' OR ";
            } else if ($j == count($cells_array) - 1) {
                $sql_second .= "col = '{$cells_array[$j]}')";
            }
        }
    } else if ($selected_col_int < $dropped_col_int) {
        for ($i = $selected_col_int; $i <= $dropped_col_int; $i++) {
            array_push($cells_array, "c{$i}");
        }
        for ($j = 0; $j < count($cells_array); $j++) {
            if ($j != count($cells_array) - 1) {
                $sql_second .= "col = '{$cells_array[$j]}' OR ";
            } else if ($j == count($cells_array) - 1) {
                $sql_second .= "col = '{$cells_array[$j]}')";
            }
        }
    }
} else if ($selected_col_int == $dropped_col_int) {
    $row_or_col = "col";
    $sql_second .= " AND col = '{$selected_col}' AND (";
    if ($selected_row_int > $dropped_row_int) {
        for ($i = $selected_row_int; $i >= $dropped_row_int; $i--) {
            array_push($cells_array, "r{$i}");
        }
        for ($j = 0; $j < count($cells_array); $j++) {
            if ($j != count($cells_array) - 1) {
                $sql_second .= "row = '{$cells_array[$j]}' OR ";
            } else if ($j == count($cells_array) - 1) {
                $sql_second .= "row = '{$cells_array[$j]}')";
            }
        }
    } else if ($selected_row_int < $dropped_row_int) {
        for ($i = $selected_row_int; $i <= $dropped_row_int; $i++) {
            array_push($cells_array, "r{$i}");
        }
        for ($j = 0; $j < count($cells_array); $j++) {
            if ($j != count($cells_array) - 1) {
                $sql_second .= "row = '{$cells_array[$j]}' OR ";
            } else if ($j == count($cells_array) - 1) {
                $sql_second .= "row = '{$cells_array[$j]}')";
            }
        }
    }
};

// 試験の名残。
// $sql_second = "SELECT * from quixo_database where game_id = :game_id AND col = 'c4' AND (row = 'r3' OR row = 'r4' OR row = 'r5')";

$pdo_second = connect_to_db();
$stmt_second = $pdo_second->prepare($sql_second);
$stmt_second->bindValue(":game_id", $game_id, PDO::PARAM_STR);
$status_second = $stmt_second->execute();

// データ登録処理後
if ($status_second == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt_second->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    $result = $stmt_second->fetchAll(PDO::FETCH_ASSOC);
    var_dump($result[1]);
};

if ($row_or_col == "row") {
} else if ($row_or_col == "col") {
};
