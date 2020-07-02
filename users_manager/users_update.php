<?php

// 送信データのチェック
// var_dump($_POST);
// exit();

// 関数ファイルの読み込み
include("functions.php");

// 送信データ受け取り
$id = $_POST["id"];
$username = $_POST["username"];
$passphrase = $_POST["passphrase"];
$isadmin = $_POST["isadmin"];
$isdeleted = $_POST["isdeleted"];

// DB接続
$pdo = connect_to_db();

// UPDATE文を作成&実行
$sql = "UPDATE users_table SET username=:username, passphrase=:passphrase, is_admin=:isadmin, is_deleted=:isdeleted, updated_at=sysdate() where id=:id";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$stmt->bindValue(':username', $username, PDO::PARAM_STR);
$stmt->bindValue(':passphrase', $passphrase, PDO::PARAM_STR);
$stmt->bindValue(':isadmin', $isadmin, PDO::PARAM_INT);
$stmt->bindValue(':isdeleted', $isdeleted, PDO::PARAM_INT);
$status = $stmt->execute();

// データ登録処理後
if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // 正常にSQLが実行された場合は一覧ページファイルに移動し，一覧ページの処理を実行する
    header("Location:users_read.php");
    exit();
}
