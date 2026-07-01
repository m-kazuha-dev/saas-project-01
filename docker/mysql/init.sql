SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS saas_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE saas_db;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dependents_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    /* [税務・課税ドメインの視点を反映]
       退職や削除があった場合も、過年度の税額修正や過去の計算根拠を
       遡って確認（エビデンス確認）できるよう、データを物理消去せず
       「無効（退職）フラグ」として残す論理削除を採用
    */
    deleted_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS salaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    base_salary INT NOT NULL,
    target_month VARCHAR(7) NOT NULL,
    /* [データの整合性保護]
       従業員情報の変更によって、過去の確定した給与支給履歴（＝課税・徴収の根拠データ）が
       連動して消えてしまうリスク（リレーションの寸断）を防ぐため、
       あえて ON DELETE CASCADE は設定しない設計とする
    */
    FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO employees (name, dependents_count) VALUES 
('山田 太郎', 2),
('佐藤 花子', 0);

INSERT INTO salaries (employee_id, base_salary, target_month) VALUES 
(1, 350000, '2026-06'),
(2, 280000, '2026-06');