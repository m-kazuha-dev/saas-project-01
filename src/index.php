<?php
$host = 'db'; // docker-compose.ymlで付けたサービス名
$db   = 'test_db';
$user = 'root';
$pass = 'root';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    echo "Connected!";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}