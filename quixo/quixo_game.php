<?php

include("functions.php");

// game_id受け取り。
$game_id = $_POST["game_id"];
$newID = "";

// gameであるフラグは1。
$is_game = 1;
$not_game = 0;

// newgameならidを作成し、ゲームデータも作成する。
if ($game_id == "newgame") {
    $a = rand(0, 9);
    $b = rand(0, 9);
    $c = rand(0, 9);
    $d = rand(0, 9);
    $e = rand(0, 9);
    $f = rand(0, 9);
    $newArray = [$a, $b, $c, $d, $e, $f];
    for ($i = 0; $i < count($newArray); $i++) {
        $newID .= (string) $newArray[$i];
    };
    $game_id = $newID;

    $sql_create = "INSERT INTO quixo_database(id, game_id, row, col, status, is_game) VALUES(NULL, :game_id, NULL, NULL, NULL, :is_game)";

    // game盤についてのレコードを一括生成する。
    for ($r = 1; $r <= 5; $r++) {
        for ($c = 1; $c <= 5; $c++) {
            $sql_create .= ",(NULL, :game_id, 'r{$r}', 'c{$c}', 'none', {$not_game})";
        };
    };

    $pdo_create = connect_to_db();
    $stmt_create = $pdo_create->prepare($sql_create);
    $stmt_create->bindValue(":game_id", $game_id, PDO::PARAM_STR);
    $stmt_create->bindValue(":is_game", $is_game, PDO::PARAM_INT);
    $status_create = $stmt_create->execute();

    // ゲームデータをして作成する。
    if ($status_create == false) {
        // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
        $error = $stmt_create->errorInfo();
        echo json_encode(["error_msg" => "{$error[2]}"]);
        exit();
    } else {
    };
}


$sql_load = "SELECT * from quixo_database where game_id = :game_id AND is_game = :not_game ORDER BY id asc";

$pdo_load = connect_to_db();
$stmt_load = $pdo_load->prepare($sql_load);
$stmt_load->bindValue(":game_id", $game_id, PDO::PARAM_STR);
$stmt_load->bindValue(":not_game", $not_game, PDO::PARAM_INT);
$status_load = $stmt_load->execute();

if ($status_load == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt_load->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    $result = $stmt_load->fetchAll(PDO::FETCH_ASSOC);  // データの出力用変数（初期値は空文字）を設定
    $status_array = [];
    foreach ($result as $record) {
        array_push($status_array, $record["status"]);
    }
};


// game_idをjsに変数として送る処理。
$json_game_id = json_encode($game_id, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT);


// phpでゲーム盤作成。htmlより記述が楽。ループするし変数使えるし。
$row = 5;
$col = 5;
$grid = '';
$count = 0;

for ($i = 1; $i <= $row; $i++) {
    $grid .= '<tr class="grids_box">';
    for ($j = 1; $j <= $col; $j++) {
        $grid .= "<td id='r{$i}c{$j}' class='grids r{$i} c{$j} {$status_array[$count]}'><div></div></td>";
        $count++;
    };
    $grid .= '</td>';
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
            <table>
                <?= $grid ?>
            </table>
        </div>
        <div id="right_column"></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <script>
        // 一回こっちで直接jsで変数と取得してから別ファイルで使うアプローチ。ダサい。
        const game_id = JSON.parse('<?php echo $json_game_id; ?>')
    </script>
    <script type="text/javascript" src="js/system.js">
    </script>
</body>

</html>