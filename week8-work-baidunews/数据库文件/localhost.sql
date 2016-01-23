-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 12 月 17 日 01:22
-- 服务器版本: 5.6.21
-- PHP 版本: 5.4.34

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `baidunews`
--
CREATE DATABASE `baidunews` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `baidunews`;

-- --------------------------------------------------------

--
-- 表的结构 `newscontrol`
--

CREATE TABLE IF NOT EXISTS `newscontrol` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增加',
  `newsclass` varchar(100) NOT NULL,
  `newshref` text NOT NULL COMMENT 'news连接',
  `newstitle` varchar(200) NOT NULL COMMENT 'news标题',
  `newstext` text NOT NULL COMMENT 'news正文',
  `newsimg1` text NOT NULL COMMENT 'news图片链接1',
  `newsimg2` text NOT NULL COMMENT 'news图片链接2',
  `newsimg3` text NOT NULL COMMENT 'news图片链接3',
  `newstype` varchar(100) NOT NULL COMMENT 'news排版样式',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `newstag` varchar(100) NOT NULL COMMENT 'news来源',
  `tagcolor` varchar(100) NOT NULL COMMENT '来源颜色',
  PRIMARY KEY (`newsid`),
  KEY `newstitle` (`newstitle`,`newstag`),
  KEY `newsclass` (`newsclass`),
  KEY `newsclass_2` (`newsclass`),
  KEY `newsid` (`newsid`),
  KEY `newsclass_5` (`newsclass`),
  FULLTEXT KEY `newsclass_3` (`newsclass`),
  FULLTEXT KEY `newsclass_4` (`newsclass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- 转存表中的数据 `newscontrol`
--

INSERT INTO `newscontrol` (`newsid`, `newsclass`, `newshref`, `newstitle`, `newstext`, `newsimg1`, `newsimg2`, `newsimg3`, `newstype`, `addtime`, `newstag`, `tagcolor`) VALUES
(1, 'rec', 'http://tech.sina.cn/tech_zt/2015wic?wm=3200_0001', '习近平这样指点“第五疆域”', '中共中央总书记、国家主席习近平将出席第二届世界互联网大会。', './img/78310a55b319ebc4f8bbe5af8526cffc1f1716c0.jpg', '', '', 'img-text-show', '2015-12-13 11:00:00', '新浪要闻', 'red'),
(2, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen/http%3A%2F%2Ftech.163.com%2F15%2F1213%2F09%2FBAN57SA7000915BF.html/%E6%98%93%E5%8B%BA%E6%B1%87%3A12306%E9%AA%8C%E8%AF%81%E7%A0%81%E8%A2%AB%E6%8C%87%E5%A4%AA%E5%9D%91%20%E5%88%98%E5%BC%BA%E4%B8%9C%E5%86%8D%E8%AE%BD%E9%A9%AC%E4%BA%91%E5%94%AE%E5%81%87/%E7%BD%91%E6%98%93%E6%96%B0%E9%97%BB/1449971760000/4093576474447630806', '易勺汇:12306验证码被指太坑 刘强东再讽马云售假', '', './img/201512130936295419a.jpg', './img/20151213093641eeace.jpg', './img/2015121309370059ea6.jpg', 'img-show', '2015-12-13 11:30:00', '', ''),
(3, 'bendi', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen/http%3A%2F%2Froll.sohu.com%2F20151213%2Fn431101577.shtml/%E6%97%A5%E6%9C%AC%E9%92%A2%E9%93%81%E8%81%94%E7%9B%9F%E4%BC%9A%E9%95%BF%EF%BC%9A%E4%B8%AD%E5%9B%BD%E4%B8%8D%E4%BC%9A%E9%95%BF%E6%9C%9F%E5%87%BA%E5%8F%A3%E5%BB%89%E4%BB%B7%E9%92%A2%E9%93%81/%E6%90%9C%E7%8B%90%E6%96%B0%E9%97%BB/1449969060000/9740265518526404199', '日本钢铁联盟会长：中国不会长期出口廉价钢铁', '主要原因是中国生产过剩和出口激增。', '', '', '', 'text-show', '2015-12-13 11:38:00', '', ''),
(4, 'rec', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen%3A%E6%8E%A8%E8%8D%90/http%3A%2F%2Fnews.163.com%2F15%2F1213%2F17%2FBANUDNBQ0001124J.html/%E5%A4%A7%E5%94%90%E9%9B%86%E5%9B%A2%E9%A1%B9%E7%9B%AE%E7%8E%AF%E8%AF%84%E6%8A%A5%E5%91%8A%E8%A2%AB%E9%80%80%E5%9B%9E/%E7%AC%AC%E4%B8%80%E8%B4%A2%E7%BB%8F%E6%97%A5%E6%8A%A5/1449998988000/6550566027365651871', '大唐集团项目环评报告被退回', '安徽省环保厅强调，依据环评法规定，建设项目环境影响报告书未予批准的，建设单位不得开工建设。', './img/20151213172415d0b09.jpg', '', '', 'img-text-show', '2015-12-14 18:42:00', '网易要闻', 'red'),
(5, 'rec', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen%3A%E6%8E%A8%E8%8D%90/http%3A%2F%2Fsinanews.sina.cn%2Fsharenews.shtml%3Fid%3Dfxmpxnx5067693-comos-news-cms%26fromsinago%3D1%26page_start%3D1%26page_end%3D100/%E5%8D%B8%E4%BB%BB%E6%8C%82%E8%81%8C%E5%89%AF%E5%8E%BF%E9%95%BF%E6%89%B6%E8%B4%AB%E5%BF%83%E5%BE%97%EF%BC%9A%E5%9B%A0%E7%97%85%E8%BF%94%E8%B4%AB%E6%98%AF%E6%9C%80%E5%A4%A7%E6%95%8C%E4%BA%BA/%E6%96%B0%E5%8D%8E%E7%BD%91/1449998886000/12664200776495778686', '卸任挂职副县长扶贫心得：因病返贫是最大敌人', '', './img/auto.jpg', '', '', 'img-text-show', '2015-12-13 18:45:00', '新浪要闻', 'red'),
(6, 'rec', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen%3A%E6%8E%A8%E8%8D%90/http%3A%2F%2Ffinance.jrj.com.cn%2F2015%2F12%2F13095020229012.shtml/%E6%9C%80%E6%96%B0%E6%95%B0%E6%8D%AE%E6%98%BE%E7%A4%BA%EF%BC%9A%E4%B8%AD%E5%9B%BD%E7%BB%8F%E6%B5%8E%E5%B9%B4%E6%9C%AB%E5%9B%9E%E6%9A%96%20/%E9%87%91%E8%9E%8D%E7%95%8C/1449974160000/5973709483188673', '最新数据显示：中国经济年末回暖 ', '兴业银行首席经济学家鲁政委分析，工业增速回升表明前期刺激政策开始逐步显效。', '', '', '', 'text-show', '2015-12-13 18:56:00', '', ''),
(7, 'rec', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/chosen%3A%E6%8E%A8%E8%8D%90/http%3A%2F%2Fnews.xinhuanet.com%2Finfo%2F2015-12%2F13%2Fc_134910019.htm/%E7%99%BE%E5%BA%A6%E6%97%A0%E4%BA%BA%E9%A9%BE%E9%A9%B6%E6%B1%BD%E8%BD%A6%E9%95%BF%E4%BB%80%E4%B9%88%E6%A0%B7%3F%20%E7%9C%8B%E5%AE%9E%E6%8B%8D%EF%BC%81/%E6%96%B0%E5%8D%8E%E7%BD%91/1449939021000/1841254336704623050', '百度无人驾驶汽车长什么样? 看实拍！', '', './img/134910019_14499173259521n.jpg', './img/134910019_14499173259681n.jpg', './img/134910019_14499173259841n.jpg', 'img-show', '2015-12-14 20:13:00', '', ''),
(99, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/news%3A478%3A%E7%99%BE%E5%AE%B6/http%3A%2F%2Fwclg.baijia.baidu.com%2Farticle%2F266686/%E7%88%B1%E7%A9%BA%E9%97%B4%E8%8E%B71.35%E4%BA%BF%E8%9E%8D%E8%B5%84%EF%BC%8C%E5%90%91%E5%9F%BA%E6%9C%AC%E9%9D%A0%E9%AA%97%E7%9A%84%E5%AE%B6%E8%A3%85%E4%B8%9A%E5%AF%B9%E7%97%87%E4%B8%8B%E8%8D%AF%EF%BC%9F/%E7%8E%8B%E6%98%A5%E9%BE%99/1450282593000/15055745561704054061', '爱空间获1.35亿融资，向基本靠骗的家装业对症下药？', '', './img/b03533fa828ba61eb59270144634970a304e5988.jpg', './img/72f082025aafa40f167a76e6ac64034f78f01948.jpg', './img/738b4710b912c8fcf6a04ef6fb039245d68821bd.jpg', 'img-show', '2015-12-17 00:28:00', '', ''),
(100, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/news%3A478%3A%E7%99%BE%E5%AE%B6/http%3A%2F%2Fmusicbusiness.baijia.baidu.com%2Farticle%2F266630/%E6%B1%AA%E4%BA%AC%E4%BA%AC%EF%BC%9A%E9%9F%B3%E4%BF%83%E4%BC%9A%E5%B0%86%E5%BB%BA%E7%AB%8B%E4%B8%AD%E5%9B%BD%E9%9F%B3%E4%B9%90%E9%9F%B3%E8%A7%86%E9%A2%91%E6%8A%A5%E5%A4%87%E5%B9%B3%E5%8F%B0/%E9%9F%B3%E4%B9%90%E8%B4%A2%E7%BB%8F/1450275529000/15414754653450192380', '汪京京：音促会将建立中国音乐音视频报备平台', '', './img/ca1349540923dd5479cefe53d609b3de9c82484f.jpg', './img/ac345982b2b7d0a2f0e15ca6ccef76094b369ae5.jpg', './img/b90e7bec54e736d1221bd4339c504fc2d5626984.jpg', 'img-show', '2015-12-17 00:33:00', '', ''),
(101, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/news%3A478%3A%E7%99%BE%E5%AE%B6/http%3A%2F%2Flancet.baijia.baidu.com%2Farticle%2F266603/%E4%BB%8E%E2%80%9C%E8%8B%B1%E5%9B%BD%E7%BB%85%E5%A3%AB%E2%80%9D%E8%AF%B4%E5%88%B0%E2%80%9C%E5%8F%8C%E5%8D%81%E4%BA%8C%E2%80%9D/%E6%9F%B3%E5%8F%B6%E5%88%80/1450273865000/433715956157612729', '从“英国绅士”说到“双十二”', '劳动力与资源结缘是创造财富充分条件，但要想子孙满堂还要解决激励问题。', './img/9f510fb30f2442a75d65959ed643ad4bd11302a5.jpg', '', '', 'img-text-show', '2015-12-17 00:36:00', '', ''),
(102, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/news%3A478%3A%E7%99%BE%E5%AE%B6/http%3A%2F%2Ftieren.baijia.baidu.com%2Farticle%2F266596/%E3%80%8A%E6%9D%9C%E6%8B%89%E6%8B%89%E8%BF%BD%E5%A9%9A%E8%AE%B0%E3%80%8B%E5%86%85%E5%9C%B0%E8%A7%82%E4%BC%97%E6%AC%A0%E7%BC%BA%E7%9A%84%E4%B8%8D%E6%98%AF%E5%93%81%E5%91%B3%E6%98%AF%E4%B9%A0%E6%83%AF/%E9%93%81%E4%BB%BB/1450271313000/2164282035033193075', '《杜拉拉追婚记》内地观众欠缺的不是品味是习惯', '', './img/9e3df8dcd100baa1a05722804010b912c8fc2e95.jpg', '', '', 'img-text-show', '2015-12-17 00:39:00', '', ''),
(103, 'bendi', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/local%3A0%3A%E5%8C%97%E4%BA%AC/http%3A%2F%2Fsports.21cn.com%2Fintegrate%2Fother%2Fa%2F2015%2F1217%2F00%2F30385699.shtml/CBA-%E5%9B%9B%E5%B7%9D%E4%B8%8D%E6%95%8C%E5%8C%97%E4%BA%AC%E4%B8%BB%E5%9C%BA%E9%A6%96%E8%B4%9F/21CN/1450283430000/3155211840641345405', 'CBA-四川不敌北京主场首负', '此役开始后北京队反客为主，尤其是马布里手感滚烫带领北京队打出一波１０：０的冲击波，首节便以３８...', '', '', '', 'text-show', '2015-12-17 00:45:00', '', ''),
(104, 'bendi', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/local%3A0%3A%E5%8C%97%E4%BA%AC/http%3A%2F%2Fsinanews.sina.cn%2Fsharenews.shtml%3Fid%3Dfxmttck8103581-comos-news-cms%26fromsinago%3D1%26page_start%3D1%26page_end%3D100/%E6%B8%85%E5%8D%8E%E6%AF%95%E4%B8%9A%E7%94%9F%E9%BE%99%E6%B3%89%E5%AF%BA%E5%9D%A0%E4%BA%A1%20%E5%AF%BA%E9%99%A2%E7%A7%B0%E4%BA%8B%E5%8F%91%E5%9C%B0%E6%97%A0%E4%BA%94%E5%B1%82%E9%AB%98%E6%A5%BC/%E6%B3%95%E5%88%B6%E6%99%9A%E6%8A%A5/1450281614000/11481064996997749545', '清华毕业生龙泉寺坠亡 寺院称事发地无五层高楼', '', './img/400x533.jpg', '', '', 'img-text-show', '2015-12-17 00:47:00', '新浪要闻', 'blue'),
(105, 'bendi', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/local%3A0%3A%E5%8C%97%E4%BA%AC/http%3A%2F%2Fsports.china.com%2Fcba%2F11127706%2F20151216%2F20951809.html/%E5%A4%B1%E6%9D%8E%E6%A0%B9%E5%8C%97%E4%BA%AC%E6%BF%80%E6%B4%BB%E5%BC%A0%E4%B8%89%E7%96%AF%20%E6%9C%AB%E8%8A%82%E8%BF%9E%E9%80%81%E5%8A%A9%E6%94%BB%20%E4%B8%89%E5%88%86%E5%AE%9A%E8%83%9C%E5%B1%80/%E4%B8%AD%E5%8D%8E%E7%BD%91/1450275997000/12187640546719733145', '失李根北京激活张三疯 末节连送助攻 三分定胜局', '连续三场得分超过16分的张庆鹏，在得分上虽然没有前几场那么亮眼，但他在末节连送助攻，帮助北京结...', '', '', '', 'text-show', '2015-12-17 00:49:00', '', ''),
(106, 'bendi', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/local%3A0%3A%E5%8C%97%E4%BA%AC/http%3A%2F%2Fwww.nbd.com.cn%2Farticles%2F2015-12-16%2F970943.html/%E6%97%B6%E9%9A%94%E4%B8%80%E5%B9%B4%E5%88%86%E6%96%87%E6%9C%AA%E6%8A%95%20%E4%BF%A1%E5%A8%81%E9%9B%86%E5%9B%A2%E6%9C%80%E5%A4%A7%E5%AE%9A%E5%A2%9E%E9%A1%B9%E7%9B%AE%E5%8F%98%E8%BA%AB%E5%A4%A7%E5%81%A5%E5%BA%B7/%E6%AF%8F%E7%BB%8F%E7%BD%91/1450282090000/9880033744729576604', '时隔一年分文未投 信威集团最大定增项目变身大健康', '全球信威无线宽带接入网络服务中心建设项目投资总额约为19.54亿元，募集资金投入金额18.79...', '', '', '', 'text-show', '2015-12-17 00:51:00', '', ''),
(107, 'baijia', 'http://m.baidu.com/news?fr=mohome&ssid=1dd16b6b3030323134b92c&from=844b&uid=&pu=sz%401320_2001%2Cta%40iphone_1_8.0_3_600&bd_page_type=1#page/news%3A478%3A%E7%99%BE%E5%AE%B6/http%3A%2F%2Fkejishuoshuo.baijia.baidu.com%2Farticle%2F266694/%E2%80%9C%E4%BB%B7%E6%A0%BC%E5%B1%A0%E5%A4%AB%E2%80%9D%E9%A3%8E%E8%A1%8C%E7%94%B5%E8%A7%86%E6%83%8A%E8%89%B3%E7%9A%84%E9%99%A4%E4%BA%86%E4%BB%B7%E6%A0%BC%EF%BC%8C%E8%BF%98%E6%9C%89%E5%95%A5%EF%BC%9F/%E7%A7%91%E6%8A%80%E8%AF%B4%E8%AF%B4/1450283375000/16094972980486256755', '“价格屠夫”风行电视惊艳的除了价格，还有啥？', '', './img/21a4462309f790523ef3e2050bf3d7ca7bcbd519.jpg', './img/7af40ad162d9f2d3d95880d4aeec8a136327cc44.jpg', './img/80cb39dbb6fd52669494982fac18972bd4073649.jpg', 'img-show', '2015-12-17 00:53:00', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
