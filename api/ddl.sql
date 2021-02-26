DROP DATABASE IF EXISTS TODO;
CREATE DATABASE IF NOT EXISTS TODO;

CONNECT TODO;

DROP TABLE IF EXISTS TASK;

CREATE TABLE TASK (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TASK VARCHAR(30) NOT NULL,
    DETAIL VARCHAR(100),
    DONE TINYINT(1) NOT NULL,
    CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARACTER SET=utf8;

INSERT INTO TASK (TASK, DETAIL, DONE) VALUES ('ログイン画面_詳設', 'ログイン画面の詳細設計書を作成する', 1);
INSERT INTO TASK (TASK, DETAIL, DONE) VALUES ('ログイン画面_実装', 'Vue.jsを使ってログイン画面を実装する', 0);
INSERT INTO TASK (TASK, DETAIL, DONE) VALUES ('ログイン画面_テスト', 'ログイン画面をテストする', 0);
INSERT INTO TASK (TASK, DETAIL, DONE) VALUES ('Vue.jsの本を買う', '', 0);