<?php
include("functions.php");

$isadmin = isset($_POST['isadmin']) ? $_POST['isadmin'] : "";
$isdeleted = isset($_POST['isdeleted']) ? $_POST['isdeleted'] : "";
$yesOrNo = ["なし", "あり"];

$pdo = connect_to_db();

// データ取得SQL作成
$sql = 'SELECT * FROM users_table';
if ($isadmin == "" && $isdeleted == "") {
    $stmt = $pdo->prepare($sql);
} else if ($isadmin != "" && $isdeleted == "") {
    $sql .= " where is_admin=:isadmin";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(":isadmin", $isadmin, PDO::PARAM_INT);
} else if ($isadmin == "" && $isdeleted != "") {
    $sql .= " where is_deleted=:isdeleted";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(":isdeleted", $isdeleted, PDO::PARAM_INT);
} else if ($isadmin != "" && $isdeleted != "") {
    $sql .= " where is_admin=:isadmin AND is_deleted=:isdeleted";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(":isadmin", $isadmin, PDO::PARAM_INT);
    $stmt->bindValue(":isdeleted", $isdeleted, PDO::PARAM_INT);
};

// var_dump($_POST);
// exit();
$status = $stmt->execute();

// データ登録処理後
if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // 正常にSQLが実行された場合は入力ページファイルに移動し，入力ページの処理を実行する
    // fetchAll()関数でSQLで取得したレコードを配列で取得できる
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);  // データの出力用変数（初期値は空文字）を設定
    $output = "";
    // <tr><td>deadline</td><td>todo</td><tr>の形になるようにforeachで順番に$outputへデータを追加
    // `.=`は後ろに文字列を追加する，の意味
    foreach ($result as $record) {
        $output .= "<tr>";
        $output .= "<td>{$record["username"]}</td>";
        $output .= "<td>{$record["passphrase"]}</td>";
        $output .= "<td>{$yesOrNo[$record["is_admin"]]}</td>";
        $output .= "<td>{$yesOrNo[$record["is_deleted"]]}</td>";
        $output .= "<td>{$record["created_at"]}</td>";
        $output .= "<td><a href='users_edit.php?id={$record["id"]}'>編集する</a></td>";
        $output .= "<td><a href='users_delete.php?id={$record["id"]}'>完全に消去する</a></td>";
        $output .= "</tr>";
    }
    // $valueの参照を解除する．解除しないと，再度foreachした場合に最初からループしない
    // 今回は以降foreachしないので影響なし
    unset($record);
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
    <fieldset>
        <legend>ユーザー管理画面</legend>
        <a href="users_input.php">入力画面</a>
        <form action="users_read.php" method="post">
            検索条件<br>
            アドミンふらぐ:
            あり:<input type="radio" name="isadmin" value="1">
            なし:<input type="radio" name="isadmin" value="0"><br>
            デリーとふらぐ:
            あり:<input type="radio" name="isdeleted" value="1">
            なし:<input type="radio" name="isdeleted" value="0">
            <button>検索する</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>username</th>
                    <th>passphrase</th>
                    <th>admin flag</th>
                    <th>deleted flag</th>
                    <th>登録日時</th>
                </tr>
            </thead>
            <tbody>
                <?= $output ?>
            </tbody>
        </table>
    </fieldset>
</body>

</html>