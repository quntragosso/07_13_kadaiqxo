<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ユーザー管理ページ</title>
</head>

<body>
  <form action="users_create.php" method="POST">
    <fieldset>
      <legend>ユーザー管理画面</legend>
      <a href="users_read.php">一覧画面</a>
      <div>
        なまえ: <input type="text" name="username">
      </div>
      <div>
        ぱすわ: <input pattern="^[0-9A-Za-z]+${8,12}" maxlength="12" name="passphrase">
      </div>
      <div>
        <button>submit</button>
      </div>
    </fieldset>
  </form>

</body>

</html>