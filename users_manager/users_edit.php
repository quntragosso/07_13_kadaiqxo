<?php
// 送信データのチェック
// var_dump($_GET);
// exit();

// 関数ファイルの読み込み
include("functions.php");

// idの受け取り
$id = $_GET["id"];

// DB接続
$pdo = connect_to_db();

// データ取得SQL作成
$sql = "SELECT * FROM users_table where id = :id";

// SQL準備&実行

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();

// データ登録処理後
if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // 正常にSQLが実行された場合は指定の11レコードを取得
    // fetch()関数でSQLで取得したレコードを取得できる
    $record = $stmt->fetch(PDO::FETCH_ASSOC);
    // var_dump($record);
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ユーザー管理ページ</title>
</head>

<body>
    <form action="users_update.php" method="POST">
        <fieldset>
            <legend>ユーザー管理画面(編集)</legend>
            <a href="users_read.php">一覧画面</a>
            <div>
                なまえ: <input type="text" name="username" value="<?= $record["username"] ?>">
            </div>
            <div>
                ぱすわ: <input pattern="^[0-9A-Za-z]+${8,12}" maxlength="12" name="passphrase" value="<?= $record["passphrase"] ?>">
            </div>
            <div>
                いずあどみん化する:<br>
                はい<input type="radio" name="isadmin" value="1">
                いいえ<input type="radio" name="isadmin" value="0" checked>
            </div>
            <div>
                いずでりーてっど化する:<br>
                はい<input type="radio" name="isdeleted" value="1">
                いいえ<input type="radio" name="isdeleted" value="0" checked>
            </div>
            <input type="hidden" name="id" value="<?= $record["id"] ?>">
            <div>
                <button>submit</button>
            </div>
        </fieldset>
    </form>

</body>

</html>