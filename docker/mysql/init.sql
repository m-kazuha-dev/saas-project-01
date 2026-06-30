-- データベースの作成と選択（スペースを入れました！）
SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS saas_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE saas_db;
-- (以下、テーブル作成やINSERT文はそのまま)

-- 1. 従業員テーブル
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dependents_count INT DEFAULT 0 COMMENT '扶養人数（税額計算に使用）',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. 給与テーブル
CREATE TABLE IF NOT EXISTS salaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    base_salary INT NOT NULL COMMENT '基本給',
    target_month VARCHAR(7) NOT NULL COMMENT '対象月 (例: 2026-06)',
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- テストデータの投入
INSERT INTO employees (name, dependents_count) VALUES 
('山田 太郎', 2),
('佐藤 花子', 0);

INSERT INTO salaries (employee_id, base_salary, target_month) VALUES 
(1, 350000, '2026-06'),
(2, 280000, '2026-06');