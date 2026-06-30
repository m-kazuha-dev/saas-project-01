<?php
$dsn = "mysql:host=db;dbname=saas_db;charset=utf8mb4";
$pdo = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

// 1. 削除処理
if (isset($_GET['delete_id'])) {
    $stmt = $pdo->prepare("DELETE FROM employees WHERE id = ?");
    $stmt->execute([$_GET['delete_id']]);
    header('Location: ' . $_SERVER['PHP_SELF']);
    exit;
}

// 2. 登録処理
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO employees (name) VALUES (:name)");
    $stmt->execute(['name' => $_POST['name']]);
    header('Location: ' . $_SERVER['PHP_SELF']);
    exit;
}

// 3. 一覧取得（重要：id も SELECT するように変更！）
$employees = $pdo->query('SELECT id, name FROM employees')->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="ja">
<head><meta charset="UTF-8"><title>従業員管理</title></head>
<body>
    <h1>従業員追加</h1>
    <form method="POST">
        <input type="text" name="name" required placeholder="名前を入力">
        <button type="submit">追加する</button>
    </form>

    <h2>従業員一覧</h2>
    <ul>
        <?php foreach ($employees as $row): ?>
            <li>
                <?= htmlspecialchars($row['name']) ?>
                <a href="?delete_id=<?= $row['id'] ?>" onclick="return confirm('本当に削除しますか？')">削除</a>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>