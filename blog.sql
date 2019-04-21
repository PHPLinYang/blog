-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-04-21 02:57:30
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE `blog_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `list_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `cate_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属分类',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '作者',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT '标签',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `is_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐0不推荐1推荐',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态0删除1上架2下架',
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击量',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`id`, `list_order`, `cate_id`, `title`, `author`, `thumb`, `tags`, `description`, `content`, `is_recommend`, `status`, `clicks`, `create_time`, `update_time`) VALUES
(1, 0, 1, 'UEditor插件的使用', ' 一页知秋否', '20190418\\0db479ce0be51db69b7f41614f4a6a1c.jpg', 'ueditor ', '关于UEditor插件的使用以及UEditor数据回显问题，数据库存储标签代码前台页面如何解析问题小结', '<p>1.项目当中导入插件（个人愚见：选择那个基于原生js开发的插件，避免和自己项目的jquery起冲突，当然实在不想找，可以加入下面的学习群，里面有一些插件文件）</p><p><br/></p><p><br/></p><p><br/></p><p>2.页面当中uediter的渲染主要是靠带有id属性的div</p><p><br/></p><p>&lt;divid=&quot;editor&quot;type=&quot;text/plain&quot;&gt;&lt;/div&gt;</p><p><br/></p><p>3.页面js代码如下：</p><p>$(document).ready(function() {</p><p>UE.delEditor(&#39;editor&#39;);//初始化之前删除这个id下的富文本</p><p>varue =UE.getEditor(&#39;editor&#39;,{</p><p>toolbars: [[//自定义富文本编辑器的工具栏（在核心配置js里面ueditor.config.js）</p><p>//&#39;fontfamily&#39;, //字体</p><p>//&#39;fontsize&#39;, //字号</p><p>&#39;bold&#39;,//加粗</p><p>&#39;italic&#39;,//斜体</p><p>&#39;underline&#39;,//下划线</p><p>&#39;forecolor&#39;//字体颜色</p><p>]],</p><p>//focus时自动清空初始化时的内容</p><p>autoClearinitialContent:true,</p><p>//关闭字数统计</p><p>wordCount:false,</p><p>//关闭elementPath</p><p>elementPathEnabled:false,</p><p>//默认的编辑区域高度</p><p>initialFrameHeight:300</p><p><br/></p><p>//更多其他参数，请参考ueditor.config.js中的配置项</p><p>});</p><p><br/></p><p>4.直接打开页面就渲染出一个‘漂亮的’富文本编辑器，如何获取输入内容呢，ueditor自带很多种方法</p><p><br/></p><p><br/></p><p><br/></p><p>5.我选择的是“获取内容”这个按钮，因为这样存储的数据带有字体颜色，加粗等样式我是通过表单提交把获取的输入内容作为隐藏域的值传递到后台（回显数据的话就把数据返回到页面的隐藏域当中，先初始化富文本编辑器然后通过ue.setContent(值)把数据填充到编辑器里面）</p><p><br/></p><p><br/></p><p>&lt;input type=&quot;hidden&quot; id=&quot;answer&quot; name=&quot;answer&quot;/&gt;</p><p>var va = UE.getEditor(&#39;editor&#39;).getContent();</p><p>$(&quot;#answer&quot;).val(va);</p><p>6.如果你从数据库把这些数据查询出来再页面展示的时候会发现没有一点样式，而且带有标签都没有解析，破解方法是你依然吧值先传到一个隐藏域当中，然后在页面想要展示的地方写一个div ，通过这个div的id 在js中为这个div的.html()方法填充隐藏域里面的值即可。或者用标签拼接隐藏域的值在放到页面当中即可。</p><p><br/></p><p>return &#39;&lt;div style=&quot;width:100%;height:100%;&quot;&gt;&#39;+row.answer+&#39;&lt;/div&gt;&#39;;</p><p>---------------------&nbsp;</p><p>作者：一页知秋否&nbsp;</p><p>来源：CSDN&nbsp;</p><p>原文：https://blog.csdn.net/qq_39470733/article/details/79013971&nbsp;</p><p>版权声明：本文为博主原创文章，转载请附上博文链接！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p>', 1, 1, 0, 1555554144, 1555554144),
(2, 0, 1, 'THINKPHP5使用PHPEXCEL导入', '画江山', '20190418\\f74122295943544993d27037841c0881.jpg', 'tp5 thinkphp5 phpexcel', 'THINKPHP5 使用PHPEXCEL将EXCEL导入数据库 实例', '<p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">不怕路远，哪怕一天只看一个点，也要看到真贫。只有看到中国贫困的真实状况，我们才能作出正确的决策。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: right;\">——习近平</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"margin-bottom: 20px; line-height: 20px;\"><img src=\"http://t.live.cntv.cn/cntvwebplay/cntvplayer/images/plug-in_bg.gif\" width=\"540\" height=\"400\"/></span></p><p><a href=\"http://www.adobe.com/go/getflashplayer_cn\" style=\"color: rgb(204, 204, 204);\"><img src=\"http://player.cntv.cn/flashplayer/logo/get_adobe_flash_player.png\"/></a></p><p style=\"margin-top: 8px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体;\"><a href=\"http://www.adobe.com/go/getflashplayer_cn\" style=\"color: rgb(204, 204, 204);\">请点此安装最新Flash</a></p><p></p><p><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△[新闻联播]习近平在重庆考察并主持召开解决“两不愁三保障”突出问题座谈会时强调 统一思想一鼓作气顽强作战越战越勇 着力解决“两不愁三保障”突出问题</span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">4月15日，习近平的身影出现在山城重庆。在他的行程中，一个细节引起了《时政新闻眼》的注意。<br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555469554271_152_711x517.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△通往华溪村贫困户谭登周家的石阶狭窄陡峭。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">习近平到访时，村里刚刚下过一场淅淅沥沥的小雨，空气中弥漫着清新的泥土味道。贫困户老谭夫妇的老房子在半山腰。《时政新闻眼》数了一下，从公路边到正房前，共有111级台阶。这些台阶随地势而建，从“之<span style=\"font-size: 18px;\">”</span>字型蜿蜒变化为一路陡坡。总书记拾级而上，来到房前。两位老人因体弱多病，在檐下相迎。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555484776412_0_995x555.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△最远处的房子便是总书记探访的老谭家。</span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">这一幕，似曾相识。党的十八大以来，习近平步履匆匆，千里迢迢，访贫问苦的足迹遍布全国。无论严寒、酷暑、雨雪、风沙，无论险峻、泥泞、颠簸、崎岖，多远多难的路也挡不住他“看真贫、扶真贫、真扶贫”的决心。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>河北 骆驼湾村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555501489044_194_706x530.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2012年岁末，习近平冒着零下十余度的严寒，顶风踏雪前往河北省阜平县，专门了解当地的真实贫困状态。位于太行山深处的骆驼湾村平均海拔1512米，村里608口人中，428人为贫困人口。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555501716228_599_1161x707.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△位于太行山深处的骆驼湾村，当时年人均收入仅有950元，远低于2300元的贫困线标准。<br/></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">总书记走进村民唐宗秀家，“种了几亩地、粮食够吃不够吃、养猪了没有”，他关切地询问，和老人家亲切地拉起家常。唐家门外的小路用石头铺砌而成，走在上面深一脚浅一脚。她特意搀扶着送总书记走出门外，“我叫他慢着点，他也叫我慢着点，说路不好走。”</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555501548900_186_675x519.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△骆驼湾村的小路多用石头铺砌而成，坑坑洼洼，凹凸不平。</span><span style=\"font-size: 14px;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>甘肃 布楞沟村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555469619088_19_718x538.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">甘肃中部地区自然条件恶劣，清光绪四年，陕甘总督左宗棠率军途经甘肃，不禁感叹“陇中瘠苦甲于天下”。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555469678243_987_1634x549.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△</span><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">“在这样一个极度贫瘠的地方，不具备人类生存的基本条件”，1982年联合国粮食计划署官员考察甘肃后这样评价。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"margin-bottom: 20px; line-height: 20px;\"><img src=\"http://t.live.cntv.cn/cntvwebplay/cntvplayer/images/plug-in_bg.gif\" width=\"540\" height=\"400\"/></span></p><p><a href=\"http://www.adobe.com/go/getflashplayer_cn\" style=\"color: rgb(204, 204, 204);\"><img src=\"http://player.cntv.cn/flashplayer/logo/get_adobe_flash_player.png\"/></a></p><p style=\"margin-top: 8px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体;\"><a href=\"http://www.adobe.com/go/getflashplayer_cn\" style=\"color: rgb(204, 204, 204);\">请点此安装最新Flash</a></p><p></p><p><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△</span><span style=\"font-size: 14px;\">前往布楞沟村的路曲折险峻，非常颠簸。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">山大沟深，道路陡峭，黄沙漫天。2013年2月，习近平绕过九曲十八弯，来到海拔近2000米的临夏回族自治州东乡族自治县布楞沟村，入户看望老党员和困难群众。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555469724797_677_898x598.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△布楞沟村的土路</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>湖南 十八洞村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555469921420_506_816x613.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2013年深秋，湘西花垣县十八洞村。沿着长满青苔的崎岖小路，总书记走进苗族贫困村民施齐文的家。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470209036_316_903x552.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△群山环绕的十八洞村</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470349652_380_690x535.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△潮湿的气候给村里的石阶披上了一层湿滑的青苔。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">简陋的苗寨狭窄拥挤，木质地面凹凸不平，谷仓、床铺、灶房、猪圈，习近平一一察看。施齐文的老伴石爬专大娘怕总书记绊倒，拽着他的手，紧紧跟随。正是在与十八洞村村民的一场座谈中，总书记首次提出“精准扶贫”理念。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>内蒙古 阿尔山</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470391440_169_816x614.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2014年农历春节前夕，内蒙古大草原千里冰封。习近平顶风踏雪，冒着零下30多度的严寒，来到地处边陲的内蒙古兴安盟阿尔山市。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470427311_582_1031x515.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△隆冬时节的阿尔山</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">阿尔山市地处林区，当时正处于禁伐后艰难的产业转型时期。习近平沿着棚户区雪后湿滑的道路，前往74岁的困难林业职工郭永财家，看望慰问。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470461929_974_823x628.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△化雪成冰，郭永财家门外的道路湿滑泥泞。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>安徽 大湾村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470495006_455_815x613.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2016年初夏，安徽金寨县大湾村。这天下午，习近平沿着山路颠簸一小时，来到这个皖西村落考察脱贫工作。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470537079_454_959x541.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△山坳里的大湾村</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470573625_343_860x580.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△村口的土路陡坡</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">总书记沿着陡坡前行，沿途察看扶贫项目，茶园、鱼塘、小型光伏电站……他边看边问成本效益，边走边算脱贫时间账。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>青海 班彦村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470621345_795_815x612.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2016年8月23日上午，脚蹬雨靴的习近平，深一脚浅一脚，行走在泥泞的工地道路上。这里是正在实施易地扶贫搬迁的青海省互助县班彦村，新村建设正如火如荼。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555470657053_246_1062x590.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△班彦村新村工地道路</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">习近平走进村民新居，问面积、看结构、探质量。在土族贫困户吕有金家，他与一家人围坐桌边，细细询问，亲切交流。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>山西 赵家洼村</strong></span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555477011518_945_816x613.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2017年6月21日下午，习近平驱车1个多小时，来到山西忻州市岢岚县赵家洼村考察。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555482400733_336_1070x619.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△赵家洼村地貌</span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">赵家洼村是吕梁山集中连片特困地区的深度贫困村。当天下午，总书记登上台阶，翻过土坡，接连走访了刘福有、曹六仁、王三女这三户特困户。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555482285907_836_1301x971.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△</span><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">习近平一行走在赵家洼村。</span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(192, 0, 0);\"><strong>四川 三河村</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555477067663_975_814x607.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">2018年2月11日上午，雪后的大凉山艳阳高照，沿途雾凇银光闪闪。习近平乘车沿着坡急沟深的盘山公路，往返4个多小时，来到大凉山腹地的昭觉县三岔河乡三河村。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555477102041_146_812x609.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△这是去往三河村的土路，拍摄于总书记考察当天。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">三河村平均海拔2500多米，是一个彝族贫困村。习近平沿着石板小路步行进村，先后看望了村民吉好也求、节列俄阿木两户贫困家庭。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555477140537_211_1240x460.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; color: rgb(127, 127, 127);\">△这位彝族同胞身后就是总书记当年走过的石板小路。</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555477176409_166_808x607.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△习近平总书记弯腰经过这扇低矮的院门，看望了吉好也求一家。这是总书记到来前的场景。<br/></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\"><img src=\"http://p1.img.cctvpic.com/cportal/img/2019/4/17/1555487662315_777_833x623.jpg\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(127, 127, 127); font-size: 14px;\">△凉山州昭觉县三岔河乡三河村</span></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">习近平说，不怕路远，哪怕一天只看一个点，也要看到真贫。只有看到中国贫困的真实状况，我们才能作出正确的决策。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">这次赴重庆考察调研，习近平换乘飞机、火车、汽车，历经7小时，专程来看一个贫困村，“解剖麻雀”。在华溪村，总书记说，脱贫攻坚是我心里最牵挂的一件大事。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">唯此，才能理解他哪管山高路远，只顾风雨兼程。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p>', 1, 1, 7, 1555554344, 1555554923);
INSERT INTO `blog_article` (`id`, `list_order`, `cate_id`, `title`, `author`, `thumb`, `tags`, `description`, `content`, `is_recommend`, `status`, `clicks`, `create_time`, `update_time`) VALUES
(3, 0, 2, '安装最新LAMP环境', 'captain89', '20190418\\1cb8a620089e8ee3d0febc4f2bf21102.jpg', 'linux lamp centos7 php7 mysql5.7', '安装最新LAMP环境(CentOS7+PHP7.1.5+Mysql5.7)', '<h1 class=\"title\" style=\"box-sizing: border-box; font-size: 34px; margin: 20px 0px 0px; font-family: -apple-system, &quot;SF UI Display&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 1.3; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); word-break: break-word !important;\">安装最新LAMP环境(CentOS7+PHP7.1.5+Mysql5.7)</h1><p><a class=\"avatar\" href=\"https://www.jianshu.com/u/d74dcc7a6e0d\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(51, 51, 51); text-decoration-line: none; cursor: pointer; width: 48px; height: 48px; display: inline-block; vertical-align: middle;\"><img src=\"https://upload.jianshu.io/users/upload_avatars/624929/d920cc4b7fec.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96\" alt=\"96\"/></a>&nbsp;</p><p><span class=\"name\" style=\"box-sizing: border-box; margin-right: 3px; font-size: 16px; vertical-align: middle;\"><a href=\"https://www.jianshu.com/u/d74dcc7a6e0d\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(51, 51, 51); text-decoration-line: none; cursor: pointer;\">captain89</a></span>&nbsp;<a class=\"btn btn-success follow\" style=\"box-sizing: border-box; background-color: rgb(66, 192, 46); color: rgb(255, 255, 255); cursor: pointer; display: inline-block; margin-bottom: 0px; text-align: center; vertical-align: middle; touch-action: manipulation; background-image: none; border: 1px solid rgb(66, 192, 46); white-space: nowrap; padding: 0px 7px 0px 5px; font-size: 12px; line-height: normal; border-radius: 40px; user-select: none;\"><span class=\"iconfont ic-follow\" style=\"box-sizing: border-box; font-size: inherit; -webkit-font-smoothing: antialiased; font-family: iconfont !important;\"></span><span style=\"box-sizing: border-box; margin-left: 2px;\">关注</span></a></p><p><span class=\"jsd-meta\" style=\"box-sizing: border-box; color: rgb(234, 111, 90) !important; padding-right: 5px;\"><span class=\"iconfont ic-paid1\" style=\"box-sizing: border-box; font-size: inherit; -webkit-font-smoothing: antialiased; font-family: iconfont !important;\"></span>&nbsp;0.1&nbsp;</span><span class=\"publish-time\" style=\"box-sizing: border-box; padding-right: 5px;\">2018.03.25 23:06</span>&nbsp;<span class=\"wordage\" style=\"box-sizing: border-box; padding-right: 5px;\">字数 344</span>&nbsp;<span class=\"views-count\" style=\"box-sizing: border-box; padding-right: 5px;\">阅读 2912</span><span class=\"comments-count\" style=\"box-sizing: border-box; padding-right: 5px;\">评论 0</span><span class=\"likes-count\" style=\"box-sizing: border-box; padding-right: 5px;\">喜欢 2</span><span class=\"rewards-count \" style=\"box-sizing: border-box; padding-right: 5px;\">赞赏 1</span></p><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-fe0dd4d2081ad521.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp\"/></p><p>programmer.jpg</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.7; word-break: break-word !important;\"><span style=\"box-sizing: border-box; font-weight: 700;\">“工欲善其事必先利其器”，身为一个开发人员，快熟的搭建一个能使用的环境是必备的技能之一。我们来记录一个简单的LA(N)MP环境的搭建的过程，也方便后面的查阅</span></p></blockquote><h4 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.7; margin: 0px 0px 15px; font-size: 20px; text-rendering: optimizelegibility;\">安装Apache&amp;Nginx</h4><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-954fd5641a454aae.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/427/format/webp\"/></p><p>nginx_Apache.jpg</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">①.升级一下yum源（不是必须的），升级会花点时间，需要选择的地方都选择都输入“y”即可</p><pre class=\"hljs undefined\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">yum&nbsp;update</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">②. 安装Apache</p><pre class=\"hljs cpp\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">yum&nbsp;list&nbsp;|grep&nbsp;httpd&nbsp;&nbsp;&nbsp;&nbsp;//查看有哪些Apache可以安装yum&nbsp;install&nbsp;-y&nbsp;httpd&nbsp;&nbsp;&nbsp;&nbsp;//安装Apache指令http&nbsp;-v&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//安装完成后查看Apache版本指令显示内容如下\r\nServer&nbsp;version:&nbsp;Apache/2.4.6&nbsp;(CentOS)\r\nServer&nbsp;built:&nbsp;&nbsp;&nbsp;Apr&nbsp;12&nbsp;2017&nbsp;21:03:28</pre><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"></blockquote><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">③.通过浏览器访问<br/>在本机的浏览器的地址栏中输入虚拟主机的ip地址,但是浏览器中没有显示有效的内容</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-6fbe8dccb6b1af99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/641/format/webp\"/></p><p>2017-06-11_124942.png</p><br/><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.7; word-break: break-word !important;\">这种情况基本是Centos自带的防火墙开启造成的</p></blockquote><pre class=\"hljs cpp\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">1.关闭防火墙\r\n[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;systemctl&nbsp;stop&nbsp;firewalld&nbsp;&nbsp;&nbsp;//关闭防火墙[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;systemctl&nbsp;status&nbsp;firewalld&nbsp;//查看防火墙状态[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;systemctl&nbsp;restart&nbsp;httpd&nbsp;&nbsp;&nbsp;&nbsp;//重启Apache</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">再次刷新浏览器</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-1f7c76eeff6f7d43.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/672/format/webp\"/></p><p>2017-06-11.png</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.7; word-break: break-word !important;\"><span style=\"box-sizing: border-box; font-weight: 700;\">如果不想关闭防火墙,那我们可以在防火墙上允许访问80端口(这是Apache默认的端口)</span></p></blockquote><pre class=\"hljs cpp\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">2.防火墙上开启80端口\r\n[root@localhost&nbsp;/]#&nbsp;firewall-cmd&nbsp;--permanent&nbsp;--zone=public&nbsp;--add-port=80/tcp&nbsp;//开启80端口并且永久生效success\r\n[root@localhost&nbsp;/]#&nbsp;firewall-cmd&nbsp;--reload&nbsp;&nbsp;//重新载入防火墙配置success\r\n[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;status&nbsp;firewalld●&nbsp;firewalld.service&nbsp;-&nbsp;firewalld&nbsp;-&nbsp;dynamic&nbsp;firewall&nbsp;daemon\r\n&nbsp;&nbsp;&nbsp;Loaded:&nbsp;loaded&nbsp;(/usr/lib/systemd/system/firewalld.service;&nbsp;enabled;&nbsp;vendor&nbsp;preset:&nbsp;enabled)\r\n&nbsp;Active:&nbsp;active&nbsp;(running)&nbsp;since&nbsp;Sun&nbsp;2017-06-11&nbsp;13:08:10&nbsp;CST;&nbsp;8s&nbsp;ago&nbsp;&nbsp;//防火墙的状体是开启的</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">刷新浏览器依旧能访问到Apache的默认页面<br/>④.安装Ngixn</p><pre class=\"hljs cpp\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">[root@localhost&nbsp;/]#&nbsp;yum&nbsp;search&nbsp;nginx&nbsp;&nbsp;//搜索没有nginx这个安装包&nbsp;很遗憾的是没有[root@localhost&nbsp;/]#&nbsp;yum&nbsp;install&nbsp;nginx&nbsp;&nbsp;//尝试安装Loaded&nbsp;plugins:&nbsp;fastestmirror\r\nLoading&nbsp;mirror&nbsp;speeds&nbsp;from&nbsp;cached&nbsp;hostfile\r\n&nbsp;*&nbsp;base:&nbsp;mirrors.tuna.tsinghua.edu.cn\r\n&nbsp;*&nbsp;extras:&nbsp;mirrors.tuna.tsinghua.edu.cn\r\n&nbsp;*&nbsp;updates:&nbsp;mirrors.tuna.tsinghua.edu.cn\r\nNo&nbsp;package&nbsp;nginx&nbsp;available.&nbsp;&nbsp;&nbsp;//还是没有nginx的安装包//将nginx放到yum&nbsp;repro库中[root@localhost&nbsp;/]#&nbsp;rpm&nbsp;-ivh&nbsp;http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm[root@localhost&nbsp;/]#&nbsp;yum&nbsp;search&nbsp;nginx&nbsp;&nbsp;//再次搜索nginx安装包========================================================&nbsp;N/S&nbsp;matched:&nbsp;nginx&nbsp;=========================================================\r\nnginx-debug.x86_64&nbsp;:&nbsp;debug&nbsp;version&nbsp;of&nbsp;nginx\r\nnginx-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx\r\nnginx-module-geoip.x86_64&nbsp;:&nbsp;nginx&nbsp;GeoIP&nbsp;dynamic&nbsp;modules\r\nnginx-module-geoip-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx-module-geoip\r\nnginx-module-image-filter.x86_64&nbsp;:&nbsp;nginx&nbsp;image&nbsp;filter&nbsp;dynamic&nbsp;modulenginx-module-image-filter-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx-module-image-filter\r\nnginx-module-njs.x86_64&nbsp;:&nbsp;nginx&nbsp;nginScript&nbsp;dynamic&nbsp;modules\r\nnginx-module-njs-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx-module-njs\r\nnginx-module-perl.x86_64&nbsp;:&nbsp;nginx&nbsp;Perl&nbsp;dynamic&nbsp;modulenginx-module-perl-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx-module-perl\r\nnginx-module-xslt.x86_64&nbsp;:&nbsp;nginx&nbsp;xslt&nbsp;dynamic&nbsp;modulenginx-module-xslt-debuginfo.x86_64&nbsp;:&nbsp;Debug&nbsp;information&nbsp;for&nbsp;package&nbsp;nginx-module-xslt\r\nnginx-nr-agent.noarch&nbsp;:&nbsp;New&nbsp;Relic&nbsp;agent&nbsp;for&nbsp;NGINX&nbsp;and&nbsp;NGINX&nbsp;Plus\r\nnginx-release-centos.noarch&nbsp;:&nbsp;nginx&nbsp;repo&nbsp;configuration&nbsp;and&nbsp;pgp&nbsp;public&nbsp;keys\r\npcp-pmda-nginx.x86_64&nbsp;:&nbsp;Performance&nbsp;Co-Pilot&nbsp;(PCP)&nbsp;metrics&nbsp;for&nbsp;the&nbsp;Nginx&nbsp;Webserver\r\nnginx.x86_64&nbsp;:&nbsp;High&nbsp;performance&nbsp;web&nbsp;server&nbsp;&nbsp;&nbsp;//是存在nginx安装包的[root@localhost&nbsp;/]#&nbsp;yum&nbsp;install&nbsp;nginx&nbsp;&nbsp;&nbsp;//安装nginx[root@localhost&nbsp;/]#&nbsp;nginx&nbsp;-v&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//查看nginx版本nginx&nbsp;version:&nbsp;nginx/1.12.0[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;restart&nbsp;nginx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;重启nginx</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\"><span style=\"box-sizing: border-box; font-weight: 700;\">我希望通过80端口访问的是Apach服务器，通过8080端口访问的是nginx服务器，这么做？</span></p><pre class=\"hljs cpp\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">[root@localhost&nbsp;/]#&nbsp;firewall-cmd&nbsp;--permanent&nbsp;--zone=public&nbsp;--add-port=8080/tcp&nbsp;&nbsp;&nbsp;success\r\n[root@localhost&nbsp;/]#&nbsp;firewall-cmd&nbsp;--reloadsuccess\r\n[root@localhost&nbsp;/]#&nbsp;firewall-cmd&nbsp;--zone=public&nbsp;--list-ports&nbsp;&nbsp;//查看所有打开的端口80/tcp&nbsp;8080/tcp&nbsp;&nbsp;&nbsp;&nbsp;//80,8080已经打开[root@localhost&nbsp;/]#&nbsp;cd&nbsp;/etc/nginx/conf.d[root@localhost&nbsp;conf.d]#&nbsp;vim&nbsp;default.conf&nbsp;&nbsp;//将其中的listen&nbsp;80;修改为&nbsp;listen&nbsp;8080;[root@localhost&nbsp;conf.d]#&nbsp;systemctl&nbsp;restart&nbsp;nginx&nbsp;&nbsp;//重启nginx</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; word-break: break-word !important;\">通过浏览器访问</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-b0b53d284733532f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/692/format/webp\"/></p><p>2017-06-11.png</p></blockquote><h3 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.7; margin: 0px 0px 15px; font-size: 22px; text-rendering: optimizelegibility;\">安装MySql</h3><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-5f115b7048c7a4d5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/548/format/webp\"/></p><p>2017-06-11.png</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.7; word-break: break-word !important;\">CetOS7已使用了MariaDB替代了默认的MySQL ,所以我们想使用MySQL还得多做点事情</p></blockquote><pre class=\"hljs bash\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">[root@localhost&nbsp;/]#&nbsp;yum&nbsp;install&nbsp;wget&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//安装wget[root@localhost&nbsp;/]#&nbsp;wget&nbsp;http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm&nbsp;&nbsp;&nbsp;&nbsp;//下载mysql5.7的rpm文件[root@localhost&nbsp;/]#&nbsp;yum&nbsp;localinstall&nbsp;mysql57-community-release-el7-8.noarch.rpm&nbsp;&nbsp;&nbsp;&nbsp;//安装rmp文件[root@localhost&nbsp;/]#yum&nbsp;install&nbsp;mysql-community-server&nbsp;&nbsp;//安装MySQL数据库&nbsp;约190M左右[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;start&nbsp;mysqld&nbsp;&nbsp;&nbsp;//启动数据库[root@localhost&nbsp;/]#&nbsp;grep&nbsp;&#39;temporary&nbsp;password&#39;&nbsp;/var/log/mysqld.log&nbsp;&nbsp;//查看MySQL数据的原始密码文件&nbsp;2017-06-11T06:18:16.057811Z&nbsp;1&nbsp;[Note]&nbsp;A&nbsp;temporary&nbsp;password&nbsp;is&nbsp;generated&nbsp;for&nbsp;root@localhost:&nbsp;uvrpXRuul6/h&nbsp;&nbsp;&nbsp;&nbsp;\r\n[root@localhost&nbsp;/]#&nbsp;mysql&nbsp;-u&nbsp;root&nbsp;-p&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//进入数据库系统mysql&gt;&nbsp;set&nbsp;password&nbsp;for&nbsp;&#39;root&#39;@&#39;localhost&#39;=password(&#39;Aa@123456&#39;);&nbsp;//重新为数据库设置密码\r\nQuery&nbsp;OK,&nbsp;0&nbsp;rows&nbsp;affected,&nbsp;1&nbsp;warning&nbsp;(0.01&nbsp;sec)\r\n//将MySQL设置为开机启动项\r\n[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;enable&nbsp;mysqld[root@localhost&nbsp;/]#&nbsp;systemctl&nbsp;daemon-reload//设置数据的默认字符集(非必须的)\r\n[root@localhost&nbsp;~]#&nbsp;vim&nbsp;/etc/my.cnf//将下面两行配置代码加入到my.cnf最后面\r\ncharacter_set_server=utf8\r\ninit_connect=&#39;SET&nbsp;NAMES&nbsp;utf8&#39;[root@localhost&nbsp;~]#&nbsp;systemctl&nbsp;restart&nbsp;mysqld&nbsp;&nbsp;//重启MySQL//进入MySQL数据库\r\nmysql&gt;&nbsp;select&nbsp;version();&nbsp;&nbsp;&nbsp;&nbsp;\r\n+-----------+\r\n|&nbsp;version()&nbsp;|\r\n+-----------+\r\n|&nbsp;5.7.18&nbsp;&nbsp;&nbsp;&nbsp;|\r\n+-----------+\r\n1&nbsp;row&nbsp;in&nbsp;set&nbsp;(0.00&nbsp;sec)\r\nmysql&gt;&nbsp;show&nbsp;variables&nbsp;like&nbsp;&#39;%character%&#39;;\r\n+--------------------------+----------------------------+\r\n|&nbsp;Variable_name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;Value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n+--------------------------+----------------------------+\r\n|&nbsp;character_set_client&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_connection&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_database&nbsp;&nbsp;&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_filesystem&nbsp;|&nbsp;binary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_results&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_server&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_set_system&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;utf8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|\r\n|&nbsp;character_sets_dir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;/usr/share/mysql/charsets/&nbsp;|\r\n+--------------------------+----------------------------+\r\n8&nbsp;rows&nbsp;in&nbsp;set&nbsp;(0.01&nbsp;sec)</pre><h3 style=\"box-sizing: border-box; font-family: inherit; line-height: 1.7; margin: 0px 0px 15px; font-size: 22px; text-rendering: optimizelegibility;\">安装PHP7</h3><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-e7f44b6450b72eb3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/530/format/webp\"/></p><p>php7.jpg</p><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"></blockquote><pre class=\"hljs php\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 15px; margin-top: 0px; margin-bottom: 20px; line-height: 1.42857; overflow-wrap: normal; color: rgb(171, 178, 191); background-color: rgb(40, 44, 52); border: 1px solid rgb(204, 204, 204); border-radius: 4px; word-break: break-word !important;\">//安装依赖文件yum&nbsp;install&nbsp;gcc-c++&nbsp;libxml2&nbsp;libxml2-devel&nbsp;openssl&nbsp;openssl-devel&nbsp;bzip2&nbsp;bzip2-devel&nbsp;libcurl&nbsp;libcurl-devel&nbsp;libjpeg&nbsp;libjpeg-devel&nbsp;libpng&nbsp;libpng-devel&nbsp;freetype&nbsp;freetype-devel&nbsp;gmp&nbsp;gmp-devel&nbsp;libmcrypt&nbsp;libmcrypt-devel&nbsp;readline&nbsp;readline-devel&nbsp;libxslt&nbsp;libxslt-devel//安装php组新版本rpm[root@localhost&nbsp;~]#&nbsp;rpm&nbsp;-Uvh&nbsp;https://mirror.webtatic.com/yum/el7/epel-release.rpmRetrieving&nbsp;https://mirror.webtatic.com/yum/el7/epel-release.rpmwarning:&nbsp;/var/tmp/rpm-tmp.F1aZTS:&nbsp;Header&nbsp;V4&nbsp;RSA/SHA1&nbsp;Signature,&nbsp;key&nbsp;ID&nbsp;62e74ca5:&nbsp;NOKEY\r\nPreparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#################################&nbsp;[100%]Updating&nbsp;/&nbsp;installing...&nbsp;&nbsp;&nbsp;1:epel-release-7-5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#################################&nbsp;[100%][root@localhost&nbsp;~]#&nbsp;rpm&nbsp;-Uvh&nbsp;https://mirror.webtatic.com/yum/el7/webtatic-release.rpmRetrieving&nbsp;https://mirror.webtatic.com/yum/el7/webtatic-release.rpmwarning:&nbsp;/var/tmp/rpm-tmp.rnxYY3:&nbsp;Header&nbsp;V4&nbsp;RSA/SHA1&nbsp;Signature,&nbsp;key&nbsp;ID&nbsp;62e74ca5:&nbsp;NOKEY\r\nPreparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#################################&nbsp;[100%]Updating&nbsp;/&nbsp;installing...&nbsp;&nbsp;&nbsp;1:webtatic-release-7-3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#################################&nbsp;[100%][root@localhost&nbsp;~]#&nbsp;yum&nbsp;search&nbsp;php71&nbsp;&nbsp;&nbsp;//查看有哪些php最新版的安装包文件[root@localhost&nbsp;~]#&nbsp;yum&nbsp;install&nbsp;mod_php71w&nbsp;php71w-mysqlnd&nbsp;php71w-cli&nbsp;php71w-fpm&nbsp;&nbsp;&nbsp;//安装php7最新版[root@localhost&nbsp;~]#&nbsp;php&nbsp;-v&nbsp;&nbsp;&nbsp;&nbsp;//查看php版本PHP&nbsp;7.1.5&nbsp;(cli)&nbsp;(built:&nbsp;May&nbsp;12&nbsp;2017&nbsp;21:54:58)&nbsp;(&nbsp;NTS&nbsp;)\r\nCopyright&nbsp;(c)&nbsp;1997-2017&nbsp;The&nbsp;PHP&nbsp;Group\r\nZend&nbsp;Engine&nbsp;v3.1.0,&nbsp;Copyright&nbsp;(c)&nbsp;1998-2017&nbsp;Zend&nbsp;Technologies\r\n[root@localhost&nbsp;~]#&nbsp;systemctl&nbsp;restart&nbsp;httpd&nbsp;&nbsp;&nbsp;&nbsp;//重启Apache[root@localhost&nbsp;~]#&nbsp;vim&nbsp;/var/www/html/index.php&lt;?phpphpinfo();?&gt;</pre><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.7; word-break: break-word !important;\">刷新浏览器</p></blockquote><blockquote style=\"box-sizing: border-box; padding: 20px; margin: 0px 0px 25px; border-left: 6px solid rgb(180, 180, 180); background-color: rgb(247, 247, 247); line-height: 30px; word-break: break-word !important;\"><p><img class=\"\" src=\"https://upload-images.jianshu.io/upload_images/624929-0228788c786c4a9b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/758/format/webp\"/></p><p>2017-06-11.png</p></blockquote><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p>', 1, 1, 0, 1555555062, 1555555062),
(4, 0, 2, 'centos 7忘记mysql的密码的解决办法', ' 翁志来个人博文', '20190418\\69c4858548186b7d3ae2ce2167fdf181.jpg', 'centos7 密码 mysql', 'centos 7忘记mysql的密码的解决办法', '<p>方法一、找回安装是的初始密码：</p><p><br/></p><p>&nbsp;1、grep &#39;temporary password&#39; /var/log/mysqld.log</p><p><br/></p><p>方法二、使用操作系统账号和密码，进行修改密码</p><p><br/></p><p>1、mysql -uroot -p</p><p><br/></p><p>2、输入你的centos的密码</p><p><br/></p><p>3、UPDATE mysql.user SET authentication_string = PASSWORD(&#39;MyNewPassword&#39;) WHERE User = &#39;root&#39; AND Host = &#39;localhost&#39;;</p><p><br/></p><p>注：如果显示 ERROR 1819 (HY000): Your password does not satisfy the current policy requirements，说明你的密码不符合安全要求，</p><p><br/></p><p>4、FLUSH PRIVILEGES;</p><p><br/></p><p>5、quit;</p><p><br/></p><p>方法三、强制进行修改密码</p><p><br/></p><p><br/></p><p><br/></p><p>1、systemctl stop mysqld</p><p><br/></p><p>2、systemctl set-environment MYSQLD_OPTS=&quot;--skip-grant-tables&quot;</p><p><br/></p><p>3、systemctl start mysqld</p><p><br/></p><p>4、mysql -u root</p><p><br/></p><p>5、UPDATE mysql.user SET authentication_string = PASSWORD(&#39;MyNewPassword&#39;) WHERE User = &#39;root&#39; AND Host = &#39;localhost&#39;;</p><p><br/></p><p>注：如果显示 ERROR 1819 (HY000): Your password does not satisfy the current policy requirements，说明你的密码不符合安全要求，</p><p><br/></p><p>6、FLUSH PRIVILEGES;</p><p><br/></p><p>7、quit;</p><p>---------------------&nbsp;</p><p>作者：翁志来个人博文&nbsp;</p><p>来源：CSDN&nbsp;</p><p>原文：https://blog.csdn.net/wengzilai/article/details/78871414&nbsp;</p><p>版权声明：本文为博主原创文章，转载请附上博文链接！</p><p>&nbsp; &nbsp; &nbsp; &nbsp;<br/></p>', 0, 1, 2, 1555555156, 1555558958);

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_group`
--

CREATE TABLE `blog_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_group`
--

INSERT INTO `blog_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24'),
(2, '普通管理员', 1, '1,2,3,7,11,15,19,23');

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_group_access`
--

CREATE TABLE `blog_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_group_access`
--

INSERT INTO `blog_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_rule`
--

CREATE TABLE `blog_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_rule`
--

INSERT INTO `blog_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`) VALUES
(1, 'admin/index/index', '后台首页', 1, 1, ''),
(2, 'index/login/login', '后台登录', 1, 1, ''),
(3, 'admin/manage/lst', '管理员列表', 1, 1, ''),
(4, 'admin/manage/add', '管理员新增', 1, 1, ''),
(5, 'admin/manage/edit', '管理员修改', 1, 1, ''),
(6, 'admin/manage/del', '管理员删除', 1, 1, ''),
(7, 'admin/manage/auth_rule_lst', '权限节点列表', 1, 1, ''),
(8, 'admin/manage/auth_rule_add', '权限节点添加', 1, 1, ''),
(9, 'admin/manage/auth_rule_edit', '权限节点编辑', 1, 1, ''),
(10, 'admin/manage/auth_rule_del', '权限节点删除', 1, 1, ''),
(11, 'admin/manage/auth_group_lst', '用户组列表', 1, 1, ''),
(12, 'admin/manage/auth_group_add', '用户组添加', 1, 1, ''),
(13, 'admin/manage/auth_group_edit', '用户组编辑', 1, 1, ''),
(14, 'admin/manage/auth_group_del', '用户组删除', 1, 1, ''),
(15, 'admin/category/lst', '分类列表', 1, 1, ''),
(16, 'admin/category/add', '分类添加', 1, 1, ''),
(17, 'admin/category/edit', '分类编辑', 1, 1, ''),
(18, 'admin/category/del', '分类删除', 1, 1, ''),
(19, 'admin/article/lst', '文章列表', 1, 1, ''),
(20, 'admin/article/add', '文章添加', 1, 1, ''),
(21, 'admin/article/edit', '文章编辑', 1, 1, ''),
(22, 'admin/article/del', '文章删除', 1, 1, ''),
(23, 'admin/index/logout', '后台退出', 1, 1, ''),
(24, 'admin/manage/outxls', '管理员导出', 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_category`
--

CREATE TABLE `blog_category` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `catename` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `list_order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态0删除1开启2停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_category`
--

INSERT INTO `blog_category` (`id`, `catename`, `list_order`, `status`, `create_time`, `update_time`) VALUES
(1, 'PHP', 0, 1, 1555553983, 0),
(2, 'Linux', 0, 1, 1555553996, 0),
(3, 'MySQL', 0, 1, 1555554005, 1555554016),
(4, 'Apache', 0, 1, 1555554028, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_excel`
--

CREATE TABLE `blog_excel` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `age` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sex` char(1) NOT NULL DEFAULT '男',
  `phone` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_excel`
--

INSERT INTO `blog_excel` (`id`, `username`, `age`, `sex`, `phone`, `email`) VALUES
(1, '张三', 18, '男', 123456789, '81818468@qq.com'),
(2, '李四', 20, '男', 2147483647, '844022818@qq.com'),
(3, '春花', 16, '女', 1301113497, '487245412@qq.com'),
(4, '张三', 18, '男', 123456789, '81818468@qq.com'),
(5, '李四', 20, '男', 2147483647, '844022818@qq.com'),
(6, '春花', 16, '女', 1301113497, '487245412@qq.com'),
(7, '张三', 18, '男', 123456789, '81818468@qq.com'),
(8, '李四', 20, '男', 2147483647, '844022818@qq.com'),
(9, '春花', 16, '女', 1301113497, '487245412@qq.com'),
(10, '张三', 18, '男', 123456789, '81818468@qq.com'),
(11, '李四', 20, '男', 2147483647, '844022818@qq.com'),
(12, '春花', 16, '女', 1301113497, '487245412@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `blog_grade`
--

CREATE TABLE `blog_grade` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `score` tinyint(3) DEFAULT '0',
  `class` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_grade`
--

INSERT INTO `blog_grade` (`id`, `username`, `score`, `class`) VALUES
(1, '杨霖', 90, 1),
(2, '都慧琳', 30, 2),
(3, '萌萌', 99, 3),
(4, '换换', 77, 2),
(5, '笑笑', 66, 1),
(6, '哈哈', 55, 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_manage`
--

CREATE TABLE `blog_manage` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `pic` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `phone` char(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '2' COMMENT '状态0删除1正常2待审',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_manage`
--

INSERT INTO `blog_manage` (`id`, `username`, `password`, `pic`, `phone`, `email`, `status`, `create_time`, `update_time`) VALUES
(1, 'admin', '0d1ab73c1e5e0268807784113cf613b5', '20190418\\063bd0382493cb7483f6ad46a4128ce8.jpg', '18213149026', '844022818@qq.com', 2, 1555560524, 1555560524);

--
-- 转储表的索引
--

--
-- 表的索引 `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blog_auth_group`
--
ALTER TABLE `blog_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blog_auth_group_access`
--
ALTER TABLE `blog_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- 表的索引 `blog_auth_rule`
--
ALTER TABLE `blog_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blog_excel`
--
ALTER TABLE `blog_excel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blog_grade`
--
ALTER TABLE `blog_grade`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blog_manage`
--
ALTER TABLE `blog_manage`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `blog_auth_group`
--
ALTER TABLE `blog_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `blog_auth_rule`
--
ALTER TABLE `blog_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `blog_excel`
--
ALTER TABLE `blog_excel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `blog_grade`
--
ALTER TABLE `blog_grade`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `blog_manage`
--
ALTER TABLE `blog_manage`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
