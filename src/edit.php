<?php
$dsn = "mysql:host=db;dbname=saas_db;charset=utf8mb4";
$pdo = new PDO($dsn, 'root', 'root');

// URLのIDを受け取る
$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM employees WHERE id = ?");
$stmt->execute([$id]);
$employee = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<h1>編集画面</h1>
<form action="update.php" method="POST">
    <input type="hidden" name="id" value="<?= $employee['id'] ?>">
    名前: <input type="text" name="name" value="<?= htmlspecialchars($employee['name']) ?>">
    <button type="submit">更新する</button>
</form>