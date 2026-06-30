<?php
$dsn = "mysql:host=db;dbname=saas_db;charset=utf8mb4";
$pdo = new PDO($dsn, 'root', 'root');

//フォームから送られてきた値を使って、データベースを書き換え
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE employees SET name = ? WHERE id = ?");
    $stmt->execute([$_POST['name'], $_POST['id']]);
    
    // 完了したら一覧へ戻る
    header('Location: index.php');
}
?>