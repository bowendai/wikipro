-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-06-13 02:15:51
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydokuwiki`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_groups`
--

CREATE TABLE `tp_groups` (
  `gid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_groups`
--

INSERT INTO `tp_groups` (`gid`, `name`) VALUES
(1, 'user');

-- --------------------------------------------------------

--
-- 表的结构 `tp_navigation`
--

CREATE TABLE `tp_navigation` (
  `id` int(2) NOT NULL,
  `parentid` int(2) NOT NULL,
  `text` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT '""'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航菜单信息表';

--
-- 转存表中的数据 `tp_navigation`
--

INSERT INTO `tp_navigation` (`id`, `parentid`, `text`, `url`) VALUES
(1, 0, '业界动态', '""'),
(2, 0, '测试自动化', '""'),
(3, 0, '测试工具', '""'),
(4, 0, '测试技术', '""'),
(5, 0, '客户化测试', '""'),
(20, 2, '自动化框架', '""'),
(21, 2, '自动化设计', '""'),
(22, 3, '性能测试', '""'),
(23, 3, 'DFR工具', '""'),
(24, 3, '安全工具', '""'),
(25, 4, '性能测试', '""'),
(26, 4, '可靠性测试', '""'),
(27, 4, '安全测试', '""'),
(28, 4, '测试设计', '""'),
(29, 4, '评估', '""'),
(30, 5, 'DT场景', '""'),
(31, 5, 'HWS场景', '""'),
(32, 5, '流程IT场景', '""'),
(33, 5, '私有云场景', '""');

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic`
--

CREATE TABLE `tp_topic` (
  `id` int(11) NOT NULL,
  `navigation_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `cur_version_id` int(11) DEFAULT NULL,
  `create_version_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题表';

--
-- 转存表中的数据 `tp_topic`
--

INSERT INTO `tp_topic` (`id`, `navigation_id`, `title`, `create_time`, `creater`, `cur_version_id`, `create_version_id`) VALUES
(1, 21, '计算机设计自动化 ', '2016-06-08 10:50:09', NULL, 5, 1),
(2, 21, '测试一个', '2016-06-08 10:50:23', NULL, 11, 2),
(3, 21, '测试二个', '2016-06-08 10:50:42', NULL, 12, 3),
(4, 22, '测试3', '2016-06-08 10:54:26', NULL, 8, 8),
(5, 21, 'test', '2016-06-12 16:04:58', NULL, 13, 13);

-- --------------------------------------------------------

--
-- 表的结构 `tp_usergroup`
--

CREATE TABLE `tp_usergroup` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_usergroup`
--

INSERT INTO `tp_usergroup` (`uid`, `gid`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_users`
--

CREATE TABLE `tp_users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `pass` varchar(60) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_users`
--

INSERT INTO `tp_users` (`uid`, `login`, `pass`, `firstname`, `lastname`, `email`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'dai', '', 'dai@huawei.com');

-- --------------------------------------------------------

--
-- 表的结构 `tp_version`
--

CREATE TABLE `tp_version` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` varchar(255) NOT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题版本表';

--
-- 转存表中的数据 `tp_version`
--

INSERT INTO `tp_version` (`id`, `topic_id`, `modified_time`, `version`, `content`) VALUES
(1, 1, '2016-06-08 10:50:09', '1465354209', '计算机设计自动化的定义\r\n计算机设计自动化,就是使用计算机来帮助设计和研制计算机,使设计工作在计算机帮助下,达到自动化或半自动化,从而减轻人的劳动和提高设计质量。使用计算机来帮助设计,亦常被称为计算机辅助设计。按照问题的性质,有些设计工作是可以由人工预先安排好,编出程序由计算机去自动完成的,因而称为设计自动化\r\n\r\n功能设计自动化\r\n系统设计和逻辑设计通称功能设计。硬件描述语言是实现功能设计自动化的有效工具。辅助系统设计的内容主要是系统级模拟。逻辑设计自动化所涉及的内容较多，有自动逻辑综合、逻辑模拟、微程序设计自动化等'),
(2, 2, '2016-06-08 10:50:23', '1465354223', '8-)'),
(3, 3, '2016-06-08 10:50:42', '1465354242', 'LOL'),
(4, 1, '2016-06-08 10:51:24', '1465354284', '====== 计算机设计自动化的定义 ======\r\n\r\n计算机设计自动化,就是使用计算机来帮助设计和研制计算机,使设计工作在计算机帮助下,达到自动化或半自动化,从而减轻人的劳动和提高设计质量。使用计算机来帮助设计,亦常被称为计算机辅助设计。按照问题的性质,有些设计工作是可以由人工预先安排好,编出程序由计算机去自动完成的,因而称为设计自动化\r\n\r\n====== 功能设计自动化 ======\r\n\r\n系统设计和逻辑设计通称功能设计。硬件描述语言是实现功能设计自动化的有效工具。辅助系统设计的内容主要是系统级模拟。逻辑设计自动化所涉及的内容较多，有自动逻辑综合、逻辑模拟、微程序设计自动化等'),
(5, 1, '2016-06-08 10:51:57', '1465354317', '====== 计算机设计自动化的定义 ======\r\n\r\n计算机设计自动化,就是使用计算机来帮助设计和研制计算机,使设计工作在计算机帮助下,达到自动化或半自动化,从而减轻人的劳动和提高设计质量。使用计算机来帮助设计,亦常被称为计算机辅助设计。按照问题的性质,有些设计工作是可以由人工预先安排好,编出程序由计算机去自动完成的,因而称为设计自动化\r\n\r\n====== 功能设计自动化 ======\r\n\r\n系统设计和逻辑设计通称功能设计。硬件描述语言是实现功能设计自动化的有效工具。辅助系统设计的内容主要是系统级模拟。逻辑设计自动化所涉及的内容较多，有自动逻辑综合、逻辑模拟、微程序设计自动化等\r\n\r\nDELETEME'),
(6, 2, '2016-06-08 10:52:34', '1465354354', '====== 测试1 ======\r\n\r\n8-)'),
(7, 3, '2016-06-08 10:53:05', '1465354385', '====== 测试2 ======\r\n\r\nLOL'),
(8, 4, '2016-06-08 10:54:26', '1465354466', '====== 性能测试 ======\r\n'),
(9, 2, '2016-06-08 13:59:22', '1465365562', '====== 测试1 ======\r\n\r\n\r\n{{:autodesign:ceshi.png?nolink&100 |}}\r\n\r\n\r\n----\r\n\r\n8-)'),
(10, 2, '2016-06-08 14:00:27', '1465365627', '====== 测试1 ======\r\n\r\n\r\n{{:autodesign:ceshi.png?nolink&100 |}}\r\n\r\n\r\n----\r\n{{:autodesign:ceshi.png?linkonly|}}\r\n\r\n{{:autodesign:ceshi.png?direct&100|}}\r\n\r\n{{:autodesign:ceshi.png?100|}}\r\n\r\n8-)'),
(11, 2, '2016-06-12 09:30:25', '1465695025', '====== 测试1 ======\r\n\r\n\r\n{{:autodesign:ceshi.png?nolink&100 |}}\r\n\r\n\r\n----\r\n{{:autodesign:ceshi.png?linkonly|}}\r\n\r\n{{:autodesign:ceshi.png?direct&100|}}\r\n\r\n{{:autodesign:ceshi.png?100|}}\r\n\r\n8-)\r\n\r\n====== 标题 ======\r\n\r\n====== 标题 ======\r\n\r\n====== 标题 ======\r\n'),
(12, 3, '2016-06-12 16:04:19', '1465718659', 'LOL\r\n\r\n**粗体**'),
(13, 5, '2016-06-12 16:04:58', '1465718698', '====== 标题 ======\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tp_groups`
--
ALTER TABLE `tp_groups`
  ADD PRIMARY KEY (`gid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tp_navigation`
--
ALTER TABLE `tp_navigation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tp_topic`
--
ALTER TABLE `tp_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `title_2` (`title`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tp_usergroup`
--
ALTER TABLE `tp_usergroup`
  ADD PRIMARY KEY (`uid`,`gid`);

--
-- Indexes for table `tp_users`
--
ALTER TABLE `tp_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indexes for table `tp_version`
--
ALTER TABLE `tp_version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tp_groups`
--
ALTER TABLE `tp_groups`
  MODIFY `gid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tp_navigation`
--
ALTER TABLE `tp_navigation`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `tp_topic`
--
ALTER TABLE `tp_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tp_version`
--
ALTER TABLE `tp_version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
