-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2020-07-02 16:02:43
-- サーバのバージョン： 10.4.11-MariaDB
-- PHP のバージョン: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacfd06_13`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `battle_monsters`
--

CREATE TABLE `battle_monsters` (
  `id` int(12) NOT NULL,
  `monstername` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `hitpoint` int(4) NOT NULL,
  `attack` int(4) NOT NULL,
  `magic` int(4) NOT NULL,
  `barrier` int(4) NOT NULL,
  `powerlevel` int(4) NOT NULL,
  `reward` int(4) NOT NULL,
  `img` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `battle_monsters`
--

INSERT INTO `battle_monsters` (`id`, `monstername`, `hitpoint`, `attack`, `magic`, `barrier`, `powerlevel`, `reward`, `img`) VALUES
(1, 'スライム', 50, 10, 10, 10, 1, 10, 'm000.png'),
(2, 'スライム', 55, 12, 12, 12, 1, 15, 'm000.png');

-- --------------------------------------------------------

--
-- テーブルの構造 `monster_database`
--

CREATE TABLE `monster_database` (
  `id` int(11) NOT NULL,
  `monstername` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `attack` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `magic` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `barrier` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `life` int(8) NOT NULL,
  `evobonus` int(4) NOT NULL,
  `training` int(8) NOT NULL,
  `meal` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `toilet` int(8) NOT NULL,
  `sleep` int(8) NOT NULL,
  `evopattern` int(4) NOT NULL,
  `bonus` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `monster_database`
--

INSERT INTO `monster_database` (`id`, `monstername`, `attack`, `magic`, `barrier`, `life`, `evobonus`, `training`, `meal`, `toilet`, `sleep`, `evopattern`, `bonus`, `img`) VALUES
(1, 'スライム', 'a:2:{i:0;s:2:\"10\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"10\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"10\";i:1;s:1:\"1\";}', 14400, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 20, 30, 0, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm000.png'),
(2, 'いぬ', 'a:2:{i:0;s:2:\"16\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 5400, 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm001.png'),
(3, 'とり', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"16\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 5400, 2, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm002.png'),
(4, 'ふぐ', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"12\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"16\";i:1;s:1:\"2\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 5400, 3, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm003.png'),
(5, 'うま', 'a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 5400, 4, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm004.png'),
(6, 'オオカミ', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 10, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 5, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm005.png'),
(7, 'ハイエナ', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 5, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm006.png'),
(8, 'バク', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 8, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm007.png'),
(9, '軍鶏', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 6, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm008.png'),
(10, 'ハゲワシ', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 10, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 6, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm009.png'),
(11, '食べる青い鳥', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 43200, 0, 0, 'a:2:{i:0;s:1:\"5\";i:1;i:0;}', 900, 10800, 9, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm010.png'),
(12, 'イルカ', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 7, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm011.png'),
(13, 'ハナヒゲウツボ', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 43200, 10, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 7, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm012.png'),
(14, 'サザエ', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"2\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 43201, 10, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm013.png'),
(15, 'キリン', 'a:2:{i:0;s:2:\"18\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"18\";i:1;s:1:\"1\";}', 'a:2:{i:0;s:2:\"18\";i:1;s:1:\"1\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 11, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm014.png'),
(16, 'ユニコーン', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 12, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm015.png'),
(17, 'ゴロゴロしてる馬', 'a:2:{i:0;s:2:\"17\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"17\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"17\";i:1;s:1:\"3\";}', 43200, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 7200, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm016.png'),
(18, 'ケルベロス', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm017.png'),
(19, 'メガテリウム', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm018.png'),
(20, 'ヒポグリフ', 'a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm019.png'),
(21, '燃え上がる青い鳥', 'a:2:{i:0;s:2:\"30\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm020.png'),
(22, 'レヴィアタン', 'a:2:{i:0;s:2:\"22\";i:1;s:1:\"4\";}', 'a:2:{i:0;s:2:\"22\";i:1;s:1:\"4\";}', 'a:2:{i:0;s:2:\"16\";i:1;s:1:\"3\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm021.png'),
(23, 'アンモナイト', 'a:2:{i:0;s:2:\"10\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"18\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"32\";i:1;s:1:\"1\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 28801, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm022.png'),
(24, '麒麟', 'a:2:{i:0;s:2:\"22\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"22\";i:1;s:1:\"3\";}', 'a:2:{i:0;s:2:\"22\";i:1;s:1:\"3\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm023.png'),
(25, 'ユニコーン企業', 'a:2:{i:0;s:2:\"15\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}', 28800, 0, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 1800, 3600, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm024.png'),
(26, '魔王', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"0\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"0\";}', 'a:2:{i:0;s:2:\"25\";i:1;s:1:\"0\";}', 14400, 999, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 5, 14401, 13, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm025.png'),
(27, '宇宙人', 'a:2:{i:0;s:2:\"15\";i:1;s:2:\"10\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:2:\"10\";}', 'a:2:{i:0;s:2:\"15\";i:1;s:2:\"10\";}', 28800, 999, 0, 'a:2:{i:0;s:2:\"10\";i:1;i:0;}', 28801, 28801, 14, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:0;}', 'm026.png');

-- --------------------------------------------------------

--
-- テーブルの構造 `quixo_database`
--

CREATE TABLE `quixo_database` (
  `id` int(12) NOT NULL,
  `game_id` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `row` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_game` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `quixo_database`
--

INSERT INTO `quixo_database` (`id`, `game_id`, `row`, `col`, `status`, `is_game`) VALUES
(135, '348143', NULL, NULL, NULL, 1),
(136, '348143', 'r1', 'c1', 'none', 0),
(137, '348143', 'r1', 'c2', 'circle', 0),
(138, '348143', 'r1', 'c3', 'circle', 0),
(139, '348143', 'r1', 'c4', 'none', 0),
(140, '348143', 'r1', 'c5', 'none', 0),
(141, '348143', 'r2', 'c1', 'none', 0),
(142, '348143', 'r2', 'c2', 'none', 0),
(143, '348143', 'r2', 'c3', 'none', 0),
(144, '348143', 'r2', 'c4', 'circle', 0),
(145, '348143', 'r2', 'c5', 'none', 0),
(146, '348143', 'r3', 'c1', 'circle', 0),
(147, '348143', 'r3', 'c2', 'none', 0),
(148, '348143', 'r3', 'c3', 'none', 0),
(149, '348143', 'r3', 'c4', 'none', 0),
(150, '348143', 'r3', 'c5', 'circle', 0),
(151, '348143', 'r4', 'c1', 'none', 0),
(152, '348143', 'r4', 'c2', 'none', 0),
(153, '348143', 'r4', 'c3', 'none', 0),
(154, '348143', 'r4', 'c4', 'none', 0),
(155, '348143', 'r4', 'c5', 'none', 0),
(156, '348143', 'r5', 'c1', 'none', 0),
(157, '348143', 'r5', 'c2', 'circle', 0),
(158, '348143', 'r5', 'c3', 'none', 0),
(159, '348143', 'r5', 'c4', 'none', 0),
(160, '348143', 'r5', 'c5', 'none', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `todo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`) VALUES
(1, '二回目のSQL', '2020-06-27', '2020-06-20 15:29:24', '2020-06-27 16:07:03'),
(3, 'これはテストですか？', '2020-06-27', '2020-06-20 15:29:59', '2020-06-20 15:29:59'),
(5, 'これはテストですか？', '2020-06-27', '2020-06-20 15:30:27', '2020-06-20 15:30:27'),
(7, '残念、これはテストでした！', '2020-06-24', '2020-06-20 15:31:49', '2020-06-20 15:31:49'),
(8, 'いいえ、これはテストではありません', '2020-06-25', '2020-06-20 15:31:49', '2020-06-20 15:31:49'),
(9, 'はい、これはテストです。', '2020-06-24', '2020-06-20 15:32:38', '2020-06-20 15:32:38'),
(10, 'todoなんだが？', '2020-06-21', '2020-06-20 16:13:27', '2020-06-20 16:13:27'),
(14, 'todoなんだってさ', '2020-06-27', '2020-06-27 14:50:37', '2020-06-27 14:50:37');

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(12) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `passphrase` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `passphrase`, `is_admin`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'QunQuuun', 'qwertyasdfgh', 0, 1, '2020-06-29 15:41:48', '2020-06-29 15:41:48'),
(2, 'QunQuuun2', 'asdfgzxcvbn', 1, 1, '2020-06-29 15:43:31', '2020-06-29 17:21:20'),
(4, 'QunQuuun2', 'asdfgzxcvbn', 0, 0, '2020-06-29 15:44:27', '2020-06-29 15:44:27'),
(5, 'QunQuuun3', 'kojihugyft', 0, 0, '2020-06-29 15:45:01', '2020-06-29 15:45:01');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_database`
--

CREATE TABLE `user_database` (
  `id` int(11) NOT NULL,
  `username` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `userID` text COLLATE utf8_unicode_ci NOT NULL,
  `passphrase` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `userdata` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `user_database`
--

INSERT INTO `user_database` (`id`, `username`, `userID`, `passphrase`, `userdata`) VALUES
(37, 'QunQuuun', '628816694675', 'qunqunqun', 'a:10:{s:4:\"name\";s:8:\"QunQuuun\";s:10:\"passphrase\";s:9:\"qunqunqun\";s:4:\"gold\";s:3:\"500\";s:10:\"background\";s:29:\"url(\'img/bg_img/default.jpg\')\";s:6:\"userID\";s:12:\"628816694675\";s:9:\"foodStock\";a:5:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";}s:10:\"nowMonster\";a:13:{s:11:\"monstername\";s:15:\"ヒポグリフ\";s:3:\"img\";s:8:\"m019.png\";s:6:\"attack\";a:2:{i:0;s:2:\"20\";i:1;s:1:\"3\";}s:5:\"magic\";a:2:{i:0;s:2:\"25\";i:1;s:1:\"5\";}s:7:\"barrier\";a:2:{i:0;s:2:\"15\";i:1;s:1:\"3\";}s:4:\"life\";s:5:\"28800\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:3:\"NaN\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:2:\"10\";i:1;s:1:\"0\";}s:6:\"toilet\";s:4:\"1800\";s:5:\"sleep\";s:4:\"3600\";s:10:\"evoPattern\";s:3:\"NaN\";}s:12:\"monsterStock\";a:3:{i:0;a:13:{s:11:\"monstername\";s:0:\"\";s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}i:1;a:12:{s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}i:2;a:12:{s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}}s:8:\"playTime\";s:1:\"0\";s:11:\"cheeredTime\";a:3:{i:0;s:3:\"240\";i:1;s:3:\"240\";i:2;s:3:\"240\";}}'),
(38, 'QunQuuun', '806827798586', 'qwe', 'a:10:{s:4:\"name\";s:8:\"QunQuuun\";s:10:\"passphrase\";s:3:\"qwe\";s:4:\"gold\";s:3:\"500\";s:10:\"background\";s:29:\"url(\'img/bg_img/default.jpg\')\";s:6:\"userID\";s:12:\"806827798586\";s:9:\"foodStock\";a:5:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";}s:10:\"nowMonster\";a:13:{s:11:\"monstername\";s:6:\"うま\";s:3:\"img\";s:8:\"m004.png\";s:6:\"attack\";a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}s:5:\"magic\";a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}s:7:\"barrier\";a:2:{i:0;s:2:\"14\";i:1;s:1:\"2\";}s:4:\"life\";s:5:\"28800\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:3:\"NaN\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:2:\"10\";i:1;s:1:\"0\";}s:6:\"toilet\";s:4:\"1800\";s:5:\"sleep\";s:4:\"5400\";s:10:\"evoPattern\";s:3:\"NaN\";}s:12:\"monsterStock\";a:3:{i:0;a:13:{s:11:\"monstername\";s:0:\"\";s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}i:1;a:13:{s:11:\"monstername\";s:0:\"\";s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}i:2;a:13:{s:11:\"monstername\";s:0:\"\";s:3:\"img\";s:0:\"\";s:6:\"attack\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:5:\"magic\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:7:\"barrier\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:4:\"life\";s:1:\"0\";s:5:\"bonus\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"evoBonus\";s:1:\"0\";s:8:\"training\";s:1:\"0\";s:4:\"meal\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"0\";}s:6:\"toilet\";s:1:\"0\";s:5:\"sleep\";s:1:\"0\";s:10:\"evoPattern\";s:1:\"0\";}}s:8:\"playTime\";s:1:\"0\";s:11:\"cheeredTime\";a:3:{i:0;s:3:\"240\";i:1;s:3:\"240\";i:2;s:3:\"240\";}}');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `battle_monsters`
--
ALTER TABLE `battle_monsters`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `monster_database`
--
ALTER TABLE `monster_database`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `quixo_database`
--
ALTER TABLE `quixo_database`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_database`
--
ALTER TABLE `user_database`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `battle_monsters`
--
ALTER TABLE `battle_monsters`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルのAUTO_INCREMENT `monster_database`
--
ALTER TABLE `monster_database`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- テーブルのAUTO_INCREMENT `quixo_database`
--
ALTER TABLE `quixo_database`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- テーブルのAUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルのAUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルのAUTO_INCREMENT `user_database`
--
ALTER TABLE `user_database`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
