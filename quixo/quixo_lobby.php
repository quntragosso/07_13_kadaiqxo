<?php

include("functions.php");

// gameであるデータだけ引っ張ってロビーに表示する。
$is_game = 1;

$pdo = connect_to_db();
$sql = 'SELECT * FROM quixo_database where is_game=:is_game';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(":is_game", $is_game, PDO::PARAM_INT);
$status = $stmt->execute();

if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);  // データの出力用変数（初期値は空文字）を設定
    $games = "";
    foreach ($result as $record) {
        $games .= "<input type='radio' name='game_id' value='{$record["game_id"]}'>{$record["game_id"]}";
        $games .= "<a href='quixo_delete.php?id={$record["game_id"]}'>ゲームデータを消去する</a>";
        $games .= "<br>";
    }
};

?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>quixo</title>
</head>

<body>
    <header>
        <h1>quixo</h1>
    </header>
    <div class="wrapper">
        <div id="left_column"></div>
        <div id="center_column">
            <form action="quixo_game.php" method="post">
                <input type="radio" name="game_id" value="newgame" checked>新規作成<br>
                <?= $games ?>
                <button>選択したゲームをロード</button>
            </form>
        </div>
        <div id="right_column"></div>
    </div>
</body>

</html>