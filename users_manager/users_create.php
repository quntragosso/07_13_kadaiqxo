<?php

include("functions.php");

// 入力項目チェック
if (
    !isset($_POST['username']) || $_POST['username'] == '' ||
    !isset($_POST['passphrase']) || $_POST['passphrase'] == ''
) {
    echo json_encode(["error_msg" => "no input"]);
    exit();
};

$username = $_POST["username"];
$passphrase = $_POST["passphrase"];
$isadmin = 0;
$isdeleted = 0;

// var_dump($_POST);
// exit();

$sql = "INSERT INTO users_table(id, username, passphrase, is_admin, is_deleted, created_at, updated_at) VALUES(NULL, :username, :passphrase, :isadmin, :isdeleted, sysdate(), sysdate())";

$pdo = connect_to_db();
$stmt = $pdo->prepare($sql);
$stmt->bindValue(":username", $username, PDO::PARAM_STR);
$stmt->bindValue(":passphrase", $passphrase, PDO::PARAM_STR);
$stmt->bindValue(":isadmin", $isadmin, PDO::PARAM_INT);
$stmt->bindValue(":isdeleted", $isdeleted, PDO::PARAM_INT);
$status = $stmt->execute();

// データ登録処理後
if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // 正常にSQLが実行された場合は入力ページファイルに移動し，入力ページの処理を実行する
    header("Location:users_input.php");
    exit();
};
