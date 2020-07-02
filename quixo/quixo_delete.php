<?php
// ゲームデータを関連の配置済みのコマデータを全て消去する。

// 関数ファイルの読み込み
include("functions.php");

// 送信データ受け取り
$game_id = $_GET["game_id"];

// DB接続
$pdo = connect_to_db();

// DELETE文を作成&実行
$sql = "DELETE from quixo_database where game_id = :game_id";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':game_id', $game_id, PDO::PARAM_STR);
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
