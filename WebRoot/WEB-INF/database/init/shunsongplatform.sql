/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : shunsongplatform

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2020-10-14 17:36:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `baseinfo_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_attachment`;
CREATE TABLE `baseinfo_attachment` (
  `ATTACHMENT_ID` varchar(100) NOT NULL,
  `BILL_ID` varchar(100) DEFAULT NULL COMMENT '单据ID',
  `BILL_TYPE` varchar(100) DEFAULT NULL COMMENT '单据类型',
  `TRADEUNIT_ID` varchar(100) DEFAULT NULL COMMENT '客商ID',
  `FILE_ORIGINAL_NAME` varchar(100) DEFAULT NULL COMMENT '原始文件名称（含扩展名称）',
  `FILE_SYSTEM_NAME` varchar(100) DEFAULT NULL COMMENT '系统文件名称（含扩展名称）',
  `FILE_EXT_NAME` varchar(100) DEFAULT NULL COMMENT '文件扩展名称',
  `FILE_SIZE` int(11) DEFAULT NULL COMMENT '文件大小（bytes）',
  `FILE_TYPE` varchar(100) DEFAULT NULL COMMENT '文件类型（image：图片）',
  `FILE_PATH` varchar(500) DEFAULT NULL COMMENT '文件存放路径',
  `FILE_BROWER_PATH` varchar(500) DEFAULT NULL COMMENT '文件浏览路径',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ATTACHMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of baseinfo_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `baseinfo_barcodelist`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_barcodelist`;
CREATE TABLE `baseinfo_barcodelist` (
  `BARCODELIST_ID` varchar(100) NOT NULL,
  `BARCODE_CODE` varchar(100) DEFAULT NULL COMMENT '条码',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态（10：未打印；20：已打印）',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BARCODELIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='条码信息表';

-- ----------------------------
-- Records of baseinfo_barcodelist
-- ----------------------------
INSERT INTO baseinfo_barcodelist VALUES ('01169adeec504e1b896051cf1805a065', 'P18032700000049', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('01d479db3ba141d48a8f9dfd381e8ea4', 'P17112500000011', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-11-25 17:30:52', 'admin', '2017-11-25 17:30:56', null);
INSERT INTO baseinfo_barcodelist VALUES ('023d1e02596143beb0d5d49d15fb6b4c', 'P18030300000026', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('0a217619171c408ea624e64abb0eb40c', 'P18032700000054', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('10de0557ffaa4feda9e0961879fce88d', 'P18030300000029', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('164d6ceab02c4d8db5b34eab302c818b', 'P18030300000017', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('1b16c8114dfb44f7bf1b24baf0b09f2f', 'P18030300000032', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('258890e0c80e44a993226d4e3a8091f5', 'P18030300000020', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('3310bc2ae286462eac22f580f81de555', 'P18032700000051', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('33d2a81dd39541f5969e721f633c421f', 'P17052800000008', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:10:00', 'admin', '2017-05-28 23:02:45', null);
INSERT INTO baseinfo_barcodelist VALUES ('347e8defa02f48149014bc1697bfb95d', 'P18030300000022', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('38a9efcb39b34bd28da9e7602b15c9f8', 'P18030300000036', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('3ae57e44c7134f359b118a22b3b5856a', 'P18030300000016', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('3b9c248d41414d90b09e51433be58fe4', 'P181000000061', '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-23 16:28:55', null, null, null);
INSERT INTO baseinfo_barcodelist VALUES ('472c7f21631444b095c49b60139d2e15', 'P181000000060', '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-23 16:28:55', null, null, null);
INSERT INTO baseinfo_barcodelist VALUES ('4c23d5b5073a4f32a652c4537dd31281', 'P18032700000052', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('5071ceb6998f4e08bff02950fb46cef2', 'P18030300000025', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('52de9a10527747b48109e74970417e9b', 'P17112500000012', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-11-25 17:30:52', 'admin', '2017-11-25 17:30:56', null);
INSERT INTO baseinfo_barcodelist VALUES ('544013c9a43742a4aba23dd1e7cb23c5', 'P17052800000009', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:10:00', 'admin', '2017-05-28 23:02:45', null);
INSERT INTO baseinfo_barcodelist VALUES ('58f92059c2e34083a3693d309c7d205a', 'P18032700000041', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('5a6d36c0984e408a9f9c6bc676286f38', 'P18030300000027', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('729d9ecb20674702b71000ec767e88fb', 'P18030300000034', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('7421fc5e90814106b350486c8b8a4d63', 'P18032700000055', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('74c9270a02574919beb9cecdf85bb32d', 'P17052800000004', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('7d2d9cc888b441f2a90325e36643f42d', 'P18032700000044', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('86321d27a5c2471e8ba18387f1bcf34e', 'P18032700000048', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('86619bb5198d468f80ebaeab34b0035a', 'P18032700000059', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('872951e42243422da5a315e4fa401288', 'P18030300000030', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('8cc2c49d851e47fb91cca6d06c1f8a1a', 'P18030300000021', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('95b8f08575db41fb90a1eb791ce0b25e', 'P18030300000023', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('97b16372c8e848b2bbf6f375ba3221ea', 'P17052800000001', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('9c8ab9cf98fe4ff19516343763edc449', 'P18030300000018', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('a3159b65a670416cb796db11904c96eb', 'P18032700000050', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('a494e9380f684949a32b08ba569178a1', 'P18032700000053', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('a4fa9dbd1bb8489aa1adda8ffb1bc909', 'P18032700000047', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('abc02c3b7b154a08acbd9a28baca7db9', 'P18030300000028', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('b0fee6df3d244204a32f24241f792cfc', 'P18030300000014', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('b1484afb87f540fc9b68c058778544f6', 'P18032700000039', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:58', null);
INSERT INTO baseinfo_barcodelist VALUES ('b18a60dbd65a48e398ce6804da91e3b6', 'P17052800000002', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('b7be2ed442394d37849011b8cefcca5a', 'P18032700000056', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('bbcc32884bfb431186b288fca433e199', 'P18032700000045', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('bd683612fc2f4f80a06e55edb4bb77fa', 'P17052800000007', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:10:00', 'admin', '2017-05-28 23:02:45', null);
INSERT INTO baseinfo_barcodelist VALUES ('be628690c59d4c219660f456a791183c', 'P18030300000035', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('bfeedbf4f56e4d76954a6e767f4564f7', 'P18032700000038', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:58', null);
INSERT INTO baseinfo_barcodelist VALUES ('c51e9f3c137141e6b8f5c1288d3bc4f6', 'P18030300000033', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('c72939b3829d40f4b7fb12aa098ab624', 'P18032700000046', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('c9d9e9d1034249af9d0613d90105ba4b', 'P18032700000040', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:58', null);
INSERT INTO baseinfo_barcodelist VALUES ('cdcb25691d1148d8a9ce3c12fd94e631', 'P17112500000013', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-11-25 17:30:53', 'admin', '2017-11-25 17:30:56', null);
INSERT INTO baseinfo_barcodelist VALUES ('cefe5f5ad8984a1989ca4019730e5a8a', 'P18032700000058', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('d09ef8c47f46481a9f553bf77d51d6ad', 'P17052800000003', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('d2e33d3f1699413ea7534dbef6e00ac1', 'P17052800000006', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('d8e25d7e88a2411ea5580524949e7461', 'P17052800000010', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:10:00', 'admin', '2017-05-28 23:02:45', null);
INSERT INTO baseinfo_barcodelist VALUES ('d96aa476d6ed47f0950344c8c43335ec', 'P18032700000037', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:58', null);
INSERT INTO baseinfo_barcodelist VALUES ('e83db856885b477aa26c7784b1275a6e', 'P18030300000024', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('ecacabf7ecfe409fbb32dccfb28e1f93', 'P18032700000043', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('ed1978374d8c4ccaaaf024329f5bbad0', 'P18030300000019', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('f2dd75bbe8fc4fcf9b53583349b4e00f', 'P18032700000057', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);
INSERT INTO baseinfo_barcodelist VALUES ('fb2379ead82349429c9c1a5aab044579', 'P18030300000031', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:04', null);
INSERT INTO baseinfo_barcodelist VALUES ('fb34a50f04f343a58b02cd8b2f2b80c2', 'P18030300000015', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-03 21:04:00', 'admin', '2018-03-03 21:04:03', null);
INSERT INTO baseinfo_barcodelist VALUES ('ff7c2267d7294c099e615e05a1b8fa6b', 'P17052800000005', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-05-28 22:09:59', 'admin', '2017-05-28 23:02:44', null);
INSERT INTO baseinfo_barcodelist VALUES ('ffaa0c93550d47f592c9f68665e02797', 'P18032700000042', '20', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-03-27 16:01:47', 'admin', '2018-03-27 16:01:59', null);

-- ----------------------------
-- Table structure for `baseinfo_excellentstaff`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_excellentstaff`;
CREATE TABLE `baseinfo_excellentstaff` (
  `EXCELLENT_ID` varchar(100) NOT NULL,
  `YEAR` varchar(4) DEFAULT NULL COMMENT '���',
  `MONTH` varchar(2) DEFAULT NULL COMMENT '��',
  `USER_ID` varchar(100) DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `USER_CODE` varchar(100) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  `GROUP_ID` varchar(100) DEFAULT NULL,
  `COMPANY_ID` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(100) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `EXT1` varchar(100) DEFAULT NULL,
  `EXT2` varchar(100) DEFAULT NULL,
  `EXT3` varchar(100) DEFAULT NULL,
  `EXT4` varchar(100) DEFAULT NULL,
  `EXT5` varchar(100) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`EXCELLENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����Ա����¼��';

-- ----------------------------
-- Records of baseinfo_excellentstaff
-- ----------------------------

-- ----------------------------
-- Table structure for `baseinfo_matchcraft`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_matchcraft`;
CREATE TABLE `baseinfo_matchcraft` (
  `MATCH_ID` varchar(10) NOT NULL COMMENT 'ID',
  `USER_NAME` varchar(100) NOT NULL COMMENT '对应人员代码',
  `CRAFT_NO` varchar(100) NOT NULL COMMENT '对应工序代码',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态：10有效，00无效',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `EXT1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `EXT2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `EXT3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `EXT4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段4',
  `EXT5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段5',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '10班组长，20操作员',
  PRIMARY KEY (`MATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员对应工序表';

-- ----------------------------
-- Records of baseinfo_matchcraft
-- ----------------------------

-- ----------------------------
-- Table structure for `baseinfo_material`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_material`;
CREATE TABLE `baseinfo_material` (
  `MATERIAL_ID` varchar(100) NOT NULL,
  `MATERIAL_CLASS_ID` varchar(100) DEFAULT NULL,
  `MATERIAL_CODE` varchar(100) DEFAULT NULL COMMENT '物料编号',
  `MATERIAL_NAME` varchar(100) DEFAULT NULL COMMENT '物料名称',
  `MATERIAL_DESC` varchar(500) DEFAULT NULL COMMENT '物料描述',
  `MATERIAL_TYPE` varchar(30) DEFAULT NULL COMMENT '物料类型：10，原料；20，开料',
  `MATERIAL_SHAPE` varchar(30) DEFAULT NULL COMMENT '物料形状：10，板料；20，异形件；30，圆棒',
  `MATERIAL_SPEC` varchar(200) DEFAULT NULL COMMENT '物料规格尺寸',
  `MATERIAL_SPEC_REAL` varchar(200) DEFAULT NULL COMMENT '物料实际规格尺寸',
  `TYPE` varchar(20) DEFAULT NULL ,
  `DROPDOWN_FLAG` varchar(100) DEFAULT NULL ,
  `TYPE_NO` varchar(200) DEFAULT NULL COMMENT '物料牌号',
  `THICKNESS_NUM` varchar(200) DEFAULT NULL COMMENT '厚度',
  `WIDTH_NUM` varchar(200) DEFAULT NULL COMMENT '宽度',
  `LENGTH_NUM` varchar(200) DEFAULT NULL COMMENT '高度',
  `THICKNESS_NUM_REAL` varchar(200) DEFAULT NULL COMMENT '实际厚度',
  `WIDTH_NUM_REAL` varchar(200) DEFAULT NULL COMMENT '实际宽度',
  `LENGTH_NUM_REAL` varchar(200) DEFAULT NULL COMMENT '实际高度',
  `DENSITY_NUM` decimal(30,6) DEFAULT NULL COMMENT '密度',
  `WEIGHT_LOGIC` decimal(30,6) DEFAULT NULL COMMENT '理论重量',
  `WEIGHT_REAL` decimal(30,6) DEFAULT NULL COMMENT '实际重量',
  `FILE_NO` varchar(100) DEFAULT NULL COMMENT '文件编号',
  `FIGURE_NO` varchar(100) DEFAULT NULL COMMENT '物料图号',
  `PRIMARY_UNIT` varchar(100) DEFAULT NULL COMMENT '主单位',
  `SECOND_UNIT` varchar(100) DEFAULT NULL COMMENT '辅助单位',
  `CHANGE_RATE` decimal(30,6) DEFAULT NULL COMMENT '单位转换比例',
  `COLOR_INFO` varchar(100) DEFAULT NULL COMMENT '产品颜色',
  `SALE_PRICE` decimal(30,6) DEFAULT NULL COMMENT '销售单价',
  `PURCHASE_PRICE` decimal(30,6) DEFAULT NULL COMMENT '采购单价',
  `PIC_PATH` varchar(100) DEFAULT NULL COMMENT '产品图片路径',
  `STOCK_MFLG` varchar(20) DEFAULT NULL COMMENT '库存管理标志：10，按物料管；20，按批次管；30，按单件管',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态（1：在用；2：停用）',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`MATERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料信息表';

-- ----------------------------
-- Records of baseinfo_material
-- ----------------------------
INSERT INTO baseinfo_material VALUES ('0b84068c4483427499f2c1a6483ea05f', '5315178-J1', 'KR466', null, null, '10', '27.0*106*106', '27.0*106*106', 'KR466', '27.0', '106', '106', '27.0', '106', '106', '14.000000', '4.250000', '4.250000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-08 16:00:50', null, null, null);
INSERT INTO baseinfo_material VALUES ('1571564e3f7b49e5bde3573885667810', '6207232', 'KR466', null, null, '10', '62*70*200', '62.8*70.8*202', 'KR466', '62', '70', '200', '62.8', '70.8', '202', '14.000000', '12.150000', '12.570000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-05-31 17:46:36', null, null, null);
INSERT INTO baseinfo_material VALUES ('214f8b97b1af47628ee57c08a8d86449', '5704684-J1', 'KR855', null, null, '10', '1*5.5*63', '1*5.5*63', 'KR855', '1', '5.5', '63', '1', '5.5', '63', '14.000000', '0.000000', '0.000000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-30 00:19:08', null, null, null);
INSERT INTO baseinfo_material VALUES ('283b42aa312e43c58db77d42f3360f59', '6326045-J1', 'G45C', null, null, '10', '9*26*120', '9*26*120', 'G45C', '9', '26', '120', '9', '26', '120', '14.000000', '0.390000', '0.390000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-05 21:28:29', null, null, null);
INSERT INTO baseinfo_material VALUES ('4146ed07d4e346d0a684338cfdee13f5', '6308039', 'KMS', null, null, '30', null, 'φ2.2*330*106', 'KMS', null, null, null, '2.2*330', null, '106', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-06-17 09:25:19', null, null, null);
INSERT INTO baseinfo_material VALUES ('46968b68358f4346b7be3762f881cab8', '2342', 'CD650', null, null, '30', null, 'φ2*106', 'CD650', null, null, null, '2', null, '106', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-20 14:14:45', null, null, null);
INSERT INTO baseinfo_material VALUES ('4d309b8c-cfbb-11e8-b0a5-54e1ad19c940', '6175170', 'CD337', 'CD337', '10', '10', '28.0*105*105', '28.8*106*106', 'CD337', '28.0', '105', '105', '28.8', '106', '106', '14.000000', '4.320000', '4.530000', null, null, null, null, null, null, null, null, null, '20', null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('60847021ebfd45a3a1aeecf53e503d18', '6308232', 'KMS', null, null, '30', null, 'φ8.2*330', 'KMS', null, null, null, '8.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-06-17 09:06:58', null, null, null);
INSERT INTO baseinfo_material VALUES ('7878751d0e7f49c48ebdc22ae6916b56', '6306563', 'KR466', null, null, '10', '23*105*105', '23.8*106*106', 'KR466', '23', '105', '105', '23.8', '106', '106', '14.000000', '3.550000', '3.740000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-24 21:22:24', null, null, null);
INSERT INTO baseinfo_material VALUES ('7ee6db200b704a2684c1cc9377997240', '6124337', 'KR855', null, null, '10', '25*105*105', '25.8*106*106', 'KR855', '25', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-29 21:08:38', null, null, null);
INSERT INTO baseinfo_material VALUES ('907d2783e6374449b6b853a4577ba176', '6308055', 'THM-F', null, null, '30', null, 'φ5.2*330', 'THM-F', null, null, null, '5.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 16:42:52', null, null, null);
INSERT INTO baseinfo_material VALUES ('9117559c80324539b647d1ffc7edecce', '5315178-J2', 'KR466', null, null, '10', '34.0*106*106', '34.0*106*106', 'KR466', '34.0', '106', '106', '34.0', '106', '106', '14.000000', '5.350000', '5.350000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-08 16:01:20', null, null, null);
INSERT INTO baseinfo_material VALUES ('929cc6107a644e799cd9a7f6788e2574', '6655051', 'KR855', null, null, '10', '15*150*150', '15.8*150*150', 'KR855', '15', '150', '150', '15.8', '150', '150', '15.000000', '5.060000', '5.330000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-06-12 10:49:34', null, null, null);
INSERT INTO baseinfo_material VALUES ('97746d909eef4a228d60a0971fcbdf67', '3594355', '2210', null, null, '30', null, 'φ4.2*310', '2210', null, null, null, '4.2', null, '310', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 21:26:03', null, null, null);
INSERT INTO baseinfo_material VALUES ('a4991016079b48a9a62efae791931221', '6308002', '2210', null, null, '30', null, 'φ16.2*330', '2210', null, null, null, '16.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 21:25:34', null, null, null);
INSERT INTO baseinfo_material VALUES ('b36b15a718534668b0158aaaf623686a', 'test', 'test', null, null, '20', null, 'test1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-19 11:20:51', 'admin', '2019-07-19 11:21:00', null);
INSERT INTO baseinfo_material VALUES ('c8a78fc1a4864b84b76ea6c4c87b25f8', '6307988', '2210', null, null, '30', null, 'φ8.2*310', '2210', null, null, null, '8.2', null, '310', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 21:25:10', null, null, null);
INSERT INTO baseinfo_material VALUES ('cffaa875d5994ee8ad1d994299eaef64', '5416725-J1', 'KR887', null, null, '10', '6.8*106*106', '6.8*106*106', 'KR887', '6.8', '106', '106', '6.8', '106', '106', '14.000000', '1.070000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-13 21:06:01', null, null, null);
INSERT INTO baseinfo_material VALUES ('d535d7d05f494b39a441af2691f9c44e', '6306948', 'K3109', null, null, '30', null, 'φ19.5*73', 'K3109', null, null, null, '19.5', null, '73', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-08 00:25:37', null, null, null);
INSERT INTO baseinfo_material VALUES ('dc023faec36248e08b16dca900f4e911', '6611141', 'KR466', null, null, '30', null, 'φ45*82', 'KR466', null, null, null, '45', null, '82', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-08 23:44:51', null, null, null);
INSERT INTO baseinfo_material VALUES ('e1984deed9c6479a8473a3d944ed5110', '6307986', '2210', null, null, '30', null, 'φ6.2*330', '2210', null, null, null, '6.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-26 22:07:30', null, null, null);
INSERT INTO baseinfo_material VALUES ('e620125a340841d38ee596aacfa5639f', '6300972', '2210', null, null, '30', null, 'φ8.2*310', '2210', null, null, null, '8.2', null, '310', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 16:41:27', null, null, null);
INSERT INTO baseinfo_material VALUES ('e67e09c9a9fc4f858249072372920eea', '5990520-J1', 'CD750', null, null, '10', '1*6.5*63', '1*6.5*63', 'CD750', '1', '6.5', '63', '1', '6.5', '63', '14.000000', '0.010000', '0.010000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-30 00:11:40', null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3e18e-cb98-11e8-b3b4-54e1ad19c9345', '6307983', '2210', '2210', '10', '30', '3.2*330L', '3.2*330L', '2210', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3e18e-cb98-11e8-b3b4-54e1ad19c940', '3104399', '2210', '2210', '10', '30', '12.2*330', '12.2*330', '2210', '', null, '', '12.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, 'admin', '2018-10-09 21:18:50', null);
INSERT INTO baseinfo_material VALUES ('e6f3ec38-cb98-11e8-b3b4-54e1ad19c940', '3503980', '2210', '2210', '10', '30', '3.2*330L', '3.2*330L', '2210', null, null, null, '3.2', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3ed95-cb98-11e8-b3b4-54e1ad19c940', '3580559', '2210', '2210', '10', '30', '8.2*325', '8.2*325', '2210', null, null, null, '8.2', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3ee72-cb98-11e8-b3b4-54e1ad19c940', '3580563', '2210', '2210', '10', '30', '12.2*325', '12.2*325', '2210', null, null, null, '12.2', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3ef30-cb98-11e8-b3b4-54e1ad19c940', '3580609', '2210', '2210', '10', '30', '3.2*325L', 'φ3.2*325L', '2210', null, null, null, '3.2', null, '325L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, 'admin', '2018-10-09 21:32:29', null);
INSERT INTO baseinfo_material VALUES ('e6f3efd0-cb98-11e8-b3b4-54e1ad19c940', '6189831', '2210', '2210', '10', '30', '14.2*325', '14.2*325', '2210', null, null, null, '14.2', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f079-cb98-11e8-b3b4-54e1ad19c940', '6233867', '2210', '2210', '10', '30', '5.2*330L', '5.2*330L', '2210', null, null, null, '5.2', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f11e-cb98-11e8-b3b4-54e1ad19c940', '6307984', '2210', '2210', '10', '30', '4.2*330L', '4.2*330L', '2210', null, null, null, '4.2', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f1ec-cb98-11e8-b3b4-54e1ad19c940', '6307990', '2210', '2210', '10', '30', '10.2*330', '10.2*330', '2210', null, null, null, '10.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f2a5-cb98-11e8-b3b4-54e1ad19c940', '6308001', '2210', '2210', '10', '30', '11.2*330L', '11.2*330L', '2210', null, null, null, '11.2', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f391-cb98-11e8-b3b4-54e1ad19c940', '5408634', 'CD3109', 'CD3109', '10', '10', '63*65*65', '', 'CD3109', '63', '65', '65', '', '', '', '14.000000', '3.730000', '0.000000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f464-cb98-11e8-b3b4-54e1ad19c940', '5645396', 'CD3109', 'CD3109', '10', '20', '', null, 'CD3109', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f724-cb98-11e8-b3b4-54e1ad19c940', '5970895', 'CD3109', 'CD3109', '10', '20', '', null, 'CD3109', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f7ed-cb98-11e8-b3b4-54e1ad19c940', '5970896', 'CD3109', 'CD3109', '10', '20', '', null, 'CD3109', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f8a1-cb98-11e8-b3b4-54e1ad19c940', '5984255', 'CD337', 'CD337', '10', '10', '6.0*105*105', '6.8*106*106', 'CD337', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3f95a-cb98-11e8-b3b4-54e1ad19c940', '5984257', 'CD337', 'CD337', '10', '10', '10.0*105*105', '10.8*106*106', 'CD337', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fa08-cb98-11e8-b3b4-54e1ad19c940', '5984258', 'CD337', 'CD337', '10', '10', '15.0*105*105', '15.8*106*106', 'CD337', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fae0-cb98-11e8-b3b4-54e1ad19c940', '5984259', 'CD337', 'CD337', '10', '10', '20.0*105*105', '20.8*106*106', 'CD337', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fb8a-cb98-11e8-b3b4-54e1ad19c940', '5984260', 'CD337', 'CD337', '10', '10', '25.0*105*105', '25.8*106*106', 'CD337', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fc29-cb98-11e8-b3b4-54e1ad19c940', '6006768', 'CD337', 'CD337', '10', '10', '8.0*105*105', '8.8*106*106', 'CD337', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fcf7-cb98-11e8-b3b4-54e1ad19c940', '6027858', 'CD337', 'CD337', '10', '10', '12.0*105*105', '12.8*106*106', 'CD337', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fdbf-cb98-11e8-b3b4-54e1ad19c940', '6049861', 'CD337', 'CD337', '10', '10', '50.0*105*105', '50.8*106*106', 'CD337', '50.0', '105', '105', '50.8', '106', '106', '14.000000', '7.720000', '7.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3fe69-cb98-11e8-b3b4-54e1ad19c940', '6065964', 'CD337', 'CD337', '10', '10', '58.0*105*105', '58.8*106*106', 'CD337', '58.0', '105', '105', '58.8', '106', '106', '14.000000', '8.950000', '9.250000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3ff03-cb98-11e8-b3b4-54e1ad19c940', '6085332', 'CD337', 'CD337', '10', '10', '18.0*105*105', '18.8*106*106', 'CD337', '18.0', '105', '105', '18.8', '106', '106', '14.000000', '2.780000', '2.960000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f3ffb2-cb98-11e8-b3b4-54e1ad19c940', '6088375', 'CD337', 'CD337', '10', '10', '59.0*105*105', '59.8*106*106', 'CD337', '59.0', '105', '105', '59.8', '106', '106', '14.000000', '9.110000', '9.410000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f40061-cb98-11e8-b3b4-54e1ad19c940', '6176769', 'CD337', 'CD337', '10', '10', '62.0*105*105', '62.8*106*106', 'CD337', '62.0', '105', '105', '62.8', '106', '106', '14.000000', '9.570000', '9.880000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f40129-cb98-11e8-b3b4-54e1ad19c940', '6444777', 'CD630', 'CD630', '10', '10', '20*150*150', null, 'CD630', '20', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f401e2-cb98-11e8-b3b4-54e1ad19c940', '6595954', 'CD630', 'CD630', '10', '30', '40*52L', '40*52L', 'CD630', null, null, null, '40', null, '52L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f402a0-cb98-11e8-b3b4-54e1ad19c940', '4146359', 'CD636', 'CD636', '10', '30', '7.2*307', '7.2*307', 'CD636', null, null, null, '7.2', null, '307', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f40345-cb98-11e8-b3b4-54e1ad19c940', '4146386', 'CD636', 'CD636', '10', '30', '10.3*307', '10.3*307', 'CD636', null, null, null, '10.3', null, '307', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f403e9-cb98-11e8-b3b4-54e1ad19c940', '4146387', 'CD636', 'CD636', '10', '30', '11.6*308L', '11.6*308L', 'CD636', null, null, null, '11.6', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f40489-cb98-11e8-b3b4-54e1ad19c940', '4146388', 'CD636', 'CD636', '10', '30', '531*12.13', '531*12.13', 'CD636', null, null, null, '531', null, '12.13', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4058f-cb98-11e8-b3b4-54e1ad19c940', '5679096', 'CD636', 'CD636', '10', '10', '8.0*105*105', '8.8*106*106', 'CD636', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4066c-cb98-11e8-b3b4-54e1ad19c940', '5984301', 'CD636', 'CD636', '10', '10', '6.0*105*105', '6.8*106*106', 'CD636', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f40706-cb98-11e8-b3b4-54e1ad19c940', '5984303', 'CD636', 'CD636', '10', '10', '10.0*105*105', '10.8*106*106', 'CD636', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f407a6-cb98-11e8-b3b4-54e1ad19c940', '5984304', 'CD636', 'CD636', '10', '10', '15.0*105*105', '15.8*106*106', 'CD636', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f41f24-cb98-11e8-b3b4-54e1ad19c940', '5984305', 'CD636', 'CD636', '10', '10', '20.0*105*105', '20.8*106*106', 'CD636', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f420ca-cb98-11e8-b3b4-54e1ad19c940', '5984306', 'CD636', 'CD636', '10', '10', '25.0*105*105', '25.8*106*106', 'CD636', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f421e4-cb98-11e8-b3b4-54e1ad19c940', '6006765', 'CD636', 'CD636', '10', '10', '30.0*105*105', '30.8*106*106', 'CD636', '30.0', '105', '105', '30.8', '106', '106', '14.000000', '4.630000', '4.840000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42319-cb98-11e8-b3b4-54e1ad19c940', '6085334', 'CD636', 'CD636', '10', '10', '12.0*105*105', '12.8*106*106', 'CD636', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f423e1-cb98-11e8-b3b4-54e1ad19c940', '6085335', 'CD636', 'CD636', '10', '10', '18.0*105*105', '18.8*106*106', 'CD636', '18.0', '105', '105', '18.8', '106', '106', '14.000000', '2.780000', '2.960000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4249f-cb98-11e8-b3b4-54e1ad19c940', '6085336', 'CD636', 'CD636', '10', '10', '35.0*105*105', '35.8*106*106', 'CD636', '35.0', '105', '105', '35.8', '106', '106', '14.000000', '5.400000', '5.630000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4254e-cb98-11e8-b3b4-54e1ad19c940', '6128854', 'CD636', 'CD636', '10', '20', '预型件', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42617-cb98-11e8-b3b4-54e1ad19c940', '6128855', 'CD636', 'CD636', '10', '20', '预型件', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f426cb-cb98-11e8-b3b4-54e1ad19c940', '6128856', 'CD636', 'CD636', '10', '20', '预型件', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42793-cb98-11e8-b3b4-54e1ad19c940', '6130233', 'CD636', 'CD636', '10', '30', '16*305L', '16*305L', 'CD636', null, null, null, '16', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42866-cb98-11e8-b3b4-54e1ad19c940', '6133608', 'CD636', 'CD636', '10', '30', '23*305L', '23*305L', 'CD636', null, null, null, '23', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42915-cb98-11e8-b3b4-54e1ad19c940', '6296863', 'CD636', 'CD636', '10', '10', '21.0*105*105', '21.8*106*106', 'CD636', '21.0', '105', '105', '21.8', '106', '106', '14.000000', '3.240000', '3.430000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f429b9-cb98-11e8-b3b4-54e1ad19c940', '6455245', 'CD636', 'CD636', '10', '30', '20*305L', '20*305L', 'CD636', null, null, null, '20', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42ac4-cb98-11e8-b3b4-54e1ad19c940', '6499199', 'CD636', 'CD636', '10', '30', '?6.3*20.4L', '?6.3*20.4L', 'CD636', null, null, null, '?6.3', null, '20.4L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42b8d-cb98-11e8-b3b4-54e1ad19c940', '6575280', 'CD636', 'CD636', '10', '30', '39*100L', '39*100L', 'CD636', null, null, null, '39', null, '100L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42c84-cb98-11e8-b3b4-54e1ad19c940', '6579455', 'CD636', 'CD636', '10', '20', 'ECH125.AY202RL.04-13G', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f42d56-cb98-11e8-b3b4-54e1ad19c940', '6581617', 'CD636', 'CD636', '10', '20', 'ECH125.AY200-1RL.04-13G', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f43184-cb98-11e8-b3b4-54e1ad19c940', '6588825', 'CD636', 'CD636', '10', '20', 'ECH125.AY202-1SL.04-06', null, 'CD636', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4336c-cb98-11e8-b3b4-54e1ad19c940', '525770', 'CD650', 'CD650', '10', '10', '25.0*105*105', '25.8*106*106', 'CD650', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f437b3-cb98-11e8-b3b4-54e1ad19c940', '2613489', 'CD650', 'CD650', '10', '10', '11.68*101.6*101.6', null, 'CD650', '11.68', '101.6', '101.6', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f43b5b-cb98-11e8-b3b4-54e1ad19c940', '2613497', 'CD650', 'CD650', '10', '10', '7.23*101.6*101.6', null, 'CD650', '7.23', '101.6', '101.6', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f43f6e-cb98-11e8-b3b4-54e1ad19c940', '3842635', 'CD650', 'CD650', '10', '30', '6.0*305L', '6.0*305L', 'CD650', null, null, null, '6.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f442e7-cb98-11e8-b3b4-54e1ad19c940', '3842645', 'CD650', 'CD650', '10', '30', '10.0*305L', '10.0*305L', 'CD650', null, null, null, '10.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f444df-cb98-11e8-b3b4-54e1ad19c940', '3842649', 'CD650', 'CD650', '10', '30', '12.0*305', '12.0*305', 'CD650', null, null, null, '12.0', null, '305', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4486d-cb98-11e8-b3b4-54e1ad19c940', '5005773', 'CD650', 'CD650', '10', '10', '32.0*105*105', '32.8*106*106', 'CD650', '32.0', '105', '105', '32.8', '106', '106', '14.000000', '4.940000', '5.160000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f455b8-cb98-11e8-b3b4-54e1ad19c940', '5205625', 'CD650', 'CD650', '10', '10', '1.0*105*105', '1.8*106*106', 'CD650', '1.0', '105', '105', '1.8', '106', '106', '14.000000', '0.150000', '0.280000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f45a5c-cb98-11e8-b3b4-54e1ad19c940', '5205626', 'CD650', 'CD650', '10', '10', '1.5*105*105', '2.3*106*106', 'CD650', '1.5', '105', '105', '2.3', '106', '106', '14.000000', '0.230000', '0.360000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f45dd5-cb98-11e8-b3b4-54e1ad19c940', '5205627', 'CD650', 'CD650', '10', '10', '2.0*105*105', '2.8*106*106', 'CD650', '2.0', '105', '105', '2.8', '106', '106', '14.000000', '0.310000', '0.440000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f45f19-cb98-11e8-b3b4-54e1ad19c940', '5205628', 'CD650', 'CD650', '10', '10', '2.5*105*105', '3.3*106*106', 'CD650', '2.5', '105', '105', '3.3', '106', '106', '14.000000', '0.390000', '0.520000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f460f7-cb98-11e8-b3b4-54e1ad19c940', '5205629', 'CD650', 'CD650', '10', '10', '3.0*105*105', '3.8*106*106', 'CD650', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f461de-cb98-11e8-b3b4-54e1ad19c940', '5205720', 'CD650', 'CD650', '10', '10', '3.5*105*105', '4.3*106*106', 'CD650', '3.5', '105', '105', '4.3', '106', '106', '14.000000', '0.540000', '0.680000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46297-cb98-11e8-b3b4-54e1ad19c940', '5205721', 'CD650', 'CD650', '10', '10', '4.0*105*105', '4.8*106*106', 'CD650', '4.0', '105', '105', '4.8', '106', '106', '14.000000', '0.620000', '0.760000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46389-cb98-11e8-b3b4-54e1ad19c940', '5205722', 'CD650', 'CD650', '10', '10', '4.5*105*105', '5.3*106*106', 'CD650', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46485-cb98-11e8-b3b4-54e1ad19c940', '5205723', 'CD650', 'CD650', '10', '10', '5.0*105*105', '5.8*106*106', 'CD650', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46590-cb98-11e8-b3b4-54e1ad19c940', '5205724', 'CD650', 'CD650', '10', '10', '5.5*105*105', '6.3*106*106', 'CD650', '5.5', '105', '105', '6.3', '106', '106', '14.000000', '0.850000', '0.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4662f-cb98-11e8-b3b4-54e1ad19c940', '5205725', 'CD650', 'CD650', '10', '10', '6.0*105*105', '6.8*106*106', 'CD650', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f466cf-cb98-11e8-b3b4-54e1ad19c940', '5205726', 'CD650', 'CD650', '10', '10', '6.5*105*105', '7.3*106*106', 'CD650', '6.5', '105', '105', '7.3', '106', '106', '14.000000', '1.000000', '1.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46764-cb98-11e8-b3b4-54e1ad19c940', '5205727', 'CD650', 'CD650', '10', '10', '7.0*105*105', '7.8*106*106', 'CD650', '7.0', '105', '105', '7.8', '106', '106', '14.000000', '1.080000', '1.230000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f467df-cb98-11e8-b3b4-54e1ad19c940', '5205728', 'CD650', 'CD650', '10', '10', '7.5*105*105', '8.3*106*106', 'CD650', '7.5', '105', '105', '8.3', '106', '106', '14.000000', '1.160000', '1.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46865-cb98-11e8-b3b4-54e1ad19c940', '5205729', 'CD650', 'CD650', '10', '10', '8.0*105*105', '8.8*106*106', 'CD650', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4690e-cb98-11e8-b3b4-54e1ad19c940', '5205730', 'CD650', 'CD650', '10', '10', '8.5*105*105', '9.3*106*106', 'CD650', '8.5', '105', '105', '9.3', '106', '106', '14.000000', '1.310000', '1.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46a1a-cb98-11e8-b3b4-54e1ad19c940', '5205731', 'CD650', 'CD650', '10', '10', '9.0*105*105', '9.8*106*106', 'CD650', '9.0', '105', '105', '9.8', '106', '106', '14.000000', '1.390000', '1.540000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46ab9-cb98-11e8-b3b4-54e1ad19c940', '5205732', 'CD650', 'CD650', '10', '10', '9.5*105*105', '10.3*106*106', 'CD650', '9.5', '105', '105', '10.3', '106', '106', '14.000000', '1.470000', '1.620000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46b44-cb98-11e8-b3b4-54e1ad19c940', '5205733', 'CD650', 'CD650', '10', '10', '10.0*105*105', '10.8*106*106', 'CD650', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46c4f-cb98-11e8-b3b4-54e1ad19c940', '5205734', 'CD650', 'CD650', '10', '10', '10.5*105*105', '11.3*106*106', 'CD650', '10.5', '105', '105', '11.3', '106', '106', '14.000000', '1.620000', '1.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46e51-cb98-11e8-b3b4-54e1ad19c940', '5205735', 'CD650', 'CD650', '10', '10', '11.0*105*105', '11.8*106*106', 'CD650', '11.0', '105', '105', '11.8', '106', '106', '14.000000', '1.700000', '1.860000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f46f62-cb98-11e8-b3b4-54e1ad19c940', '5205736', 'CD650', 'CD650', '10', '10', '11.5*105*105', '12.3*106*106', 'CD650', '11.5', '105', '105', '12.3', '106', '106', '14.000000', '1.780000', '1.930000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4702a-cb98-11e8-b3b4-54e1ad19c940', '5205737', 'CD650', 'CD650', '10', '10', '12.0*105*105', '12.8*106*106', 'CD650', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f470f3-cb98-11e8-b3b4-54e1ad19c940', '5205738', 'CD650', 'CD650', '10', '10', '12.5*105*105', '13.3*106*106', 'CD650', '12.5', '105', '105', '13.3', '106', '106', '14.000000', '1.930000', '2.090000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f47222-cb98-11e8-b3b4-54e1ad19c940', '5205739', 'CD650', 'CD650', '10', '10', '13.0*105*105', '13.8*106*106', 'CD650', '13.0', '105', '105', '13.8', '106', '106', '14.000000', '2.010000', '2.170000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f47314-cb98-11e8-b3b4-54e1ad19c940', '5205750', 'CD650', 'CD650', '10', '10', '13.5*105*105', '14.3*106*106', 'CD650', '13.5', '105', '105', '14.3', '106', '106', '14.000000', '2.080000', '2.250000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f47405-cb98-11e8-b3b4-54e1ad19c940', '5205753', 'CD650', 'CD650', '10', '10', '14.0*105*105', '14.8*106*106', 'CD650', '14.0', '105', '105', '14.8', '106', '106', '14.000000', '2.160000', '2.330000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f474aa-cb98-11e8-b3b4-54e1ad19c940', '5205754', 'CD650', 'CD650', '10', '10', '14.5*105*105', '15.3*106*106', 'CD650', '14.5', '105', '105', '15.3', '106', '106', '14.000000', '2.240000', '2.410000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f475ab-cb98-11e8-b3b4-54e1ad19c940', '5205755', 'CD650', 'CD650', '10', '10', '15.0*105*105', '15.8*106*106', 'CD650', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4766e-cb98-11e8-b3b4-54e1ad19c940', '5205756', 'CD650', 'CD650', '10', '10', '15.5*105*105', '16.3*106*106', 'CD650', '15.5', '105', '105', '16.3', '106', '106', '14.000000', '2.390000', '2.560000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f47746-cb98-11e8-b3b4-54e1ad19c940', '5205757', 'CD650', 'CD650', '10', '10', '16.0*105*105', '16.8*106*106', 'CD650', '16.0', '105', '105', '16.8', '106', '106', '14.000000', '2.470000', '2.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f47823-cb98-11e8-b3b4-54e1ad19c940', '5205758', 'CD650', 'CD650', '10', '10', '16.5*105*105', '17.3*106*106', 'CD650', '16.5', '105', '105', '17.3', '106', '106', '14.000000', '2.550000', '2.720000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4791f-cb98-11e8-b3b4-54e1ad19c940', '5205759', 'CD650', 'CD650', '10', '10', '17.0*105*105', '17.8*106*106', 'CD650', '17.0', '105', '105', '17.8', '106', '106', '14.000000', '2.620000', '2.800000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48108-cb98-11e8-b3b4-54e1ad19c940', '5205760', 'CD650', 'CD650', '10', '10', '17.5*105*105', '18.3*106*106', 'CD650', '17.5', '105', '105', '18.3', '106', '106', '14.000000', '2.700000', '2.880000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f482ec-cb98-11e8-b3b4-54e1ad19c940', '5205761', 'CD650', 'CD650', '10', '10', '18.0*105*105', '18.8*106*106', 'CD650', '18.0', '105', '105', '18.8', '106', '106', '14.000000', '2.780000', '2.960000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4839a-cb98-11e8-b3b4-54e1ad19c940', '5205762', 'CD650', 'CD650', '10', '10', '18.5*105*105', '19.3*106*106', 'CD650', '18.5', '105', '105', '19.3', '106', '106', '14.000000', '2.860000', '3.040000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48491-cb98-11e8-b3b4-54e1ad19c940', '5205763', 'CD650', 'CD650', '10', '10', '19.0*105*105', '19.8*106*106', 'CD650', '19.0', '105', '105', '19.8', '106', '106', '14.000000', '2.930000', '3.110000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4853b-cb98-11e8-b3b4-54e1ad19c940', '5205764', 'CD650', 'CD650', '10', '10', '19.5*105*105', '20.3*106*106', 'CD650', '19.5', '105', '105', '20.3', '106', '106', '14.000000', '3.010000', '3.190000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f485cb-cb98-11e8-b3b4-54e1ad19c940', '5205765', 'CD650', 'CD650', '10', '10', '20.0*105*105', '20.8*106*106', 'CD650', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4867f-cb98-11e8-b3b4-54e1ad19c940', '5205766', 'CD650', 'CD650', '10', '10', '21.0*105*105', '21.8*106*106', 'CD650', '21.0', '105', '105', '21.8', '106', '106', '14.000000', '3.240000', '3.430000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48794-cb98-11e8-b3b4-54e1ad19c940', '5205767', 'CD650', 'CD650', '10', '10', '22.0*105*105', '22.8*106*106', 'CD650', '22.0', '105', '105', '22.8', '106', '106', '14.000000', '3.400000', '3.590000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48843-cb98-11e8-b3b4-54e1ad19c940', '5205768', 'CD650', 'CD650', '10', '10', '23.0*105*105', '23.8*106*106', 'CD650', '23.0', '105', '105', '23.8', '106', '106', '14.000000', '3.550000', '3.740000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4893a-cb98-11e8-b3b4-54e1ad19c940', '5205769', 'CD650', 'CD650', '10', '10', '24.0*105*105', '24.8*106*106', 'CD650', '24.0', '105', '105', '24.8', '106', '106', '14.000000', '3.700000', '3.900000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f489f3-cb98-11e8-b3b4-54e1ad19c940', '5205770', 'CD650', 'CD650', '10', '10', '25.0*105*105', '25.8*106*106', 'CD650', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48a9c-cb98-11e8-b3b4-54e1ad19c940', '5205771', 'CD650', 'CD650', '10', '10', '26.0*105*105', '26.8*106*106', 'CD650', '26.0', '105', '105', '26.8', '106', '106', '14.000000', '4.010000', '4.220000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48b22-cb98-11e8-b3b4-54e1ad19c940', '5205772', 'CD650', 'CD650', '10', '10', '30.0*105*105', '30.8*106*106', 'CD650', '30.0', '105', '105', '30.8', '106', '106', '14.000000', '4.630000', '4.840000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48ba8-cb98-11e8-b3b4-54e1ad19c940', '5205773', 'CD650', 'CD650', '10', '10', '32.0*105*105', '32.8*106*106', 'CD650', '32.0', '105', '105', '32.8', '106', '106', '14.000000', '4.940000', '5.160000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48c4c-cb98-11e8-b3b4-54e1ad19c940', '5205774', 'CD650', 'CD650', '10', '10', '40.0*105*105', '40.8*106*106', 'CD650', '40.0', '105', '105', '40.8', '106', '106', '14.000000', '6.170000', '6.420000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f48d0f-cb98-11e8-b3b4-54e1ad19c940', '5205775', 'CD650', 'CD650', '10', '10', '45.0*105*105', '45.8*106*106', 'CD650', '45.0', '105', '105', '45.8', '106', '106', '14.000000', '6.950000', '7.200000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f494f4-cb98-11e8-b3b4-54e1ad19c940', '5205776', 'CD650', 'CD650', '10', '10', '51.0*105*105', '51.8*106*106', 'CD650', '51.0', '105', '105', '51.8', '106', '106', '14.000000', '7.870000', '8.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f49661-cb98-11e8-b3b4-54e1ad19c940', '5205779', 'CD650', 'CD650', '10', '10', '17.0*105*105', '17.8*106*106', 'CD650', '17.0', '105', '105', '17.8', '106', '106', '14.000000', '2.620000', '2.800000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4975d-cb98-11e8-b3b4-54e1ad19c940', '5225767', 'CD650', 'CD650', '10', '10', '22.0*105*105', '22.8*106*106', 'CD650', '22.0', '105', '105', '22.8', '106', '106', '14.000000', '3.400000', '3.590000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4980b-cb98-11e8-b3b4-54e1ad19c940', '5623700', 'CD650', 'CD650', '10', '10', '6.0*160*160', null, 'CD650', '6.0', '160', '160', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f498b5-cb98-11e8-b3b4-54e1ad19c940', '5623701', 'CD650', 'CD650', '10', '10', '8.0*160*160', null, 'CD650', '8.0', '160', '160', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f49983-cb98-11e8-b3b4-54e1ad19c940', '5623702', 'CD650', 'CD650', '10', '10', '25.0*160*160', null, 'CD650', '25.0', '160', '160', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f49a60-cb98-11e8-b3b4-54e1ad19c940', '6015349', 'CD650', 'CD650', '10', '10', '13.5*120*120', null, 'CD650', '13.5', '120', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f49e1c-cb98-11e8-b3b4-54e1ad19c940', '6097943', 'CD650', 'CD650', '10', '10', '6.5*250*250', null, 'CD650', '6.5', '250', '250', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4bf71-cb98-11e8-b3b4-54e1ad19c940', '6345829', 'CD650', 'CD650', '10', '10', '10.0*160*160', null, 'CD650', '10.0', '160', '160', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c0fd-cb98-11e8-b3b4-54e1ad19c940', '6427160', 'CD650', 'CD650', '10', '10', '108*8.4*76.4', null, 'CD650', '108', '8.4', '76.4', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c1d5-cb98-11e8-b3b4-54e1ad19c940', '6427251', 'CD650', 'CD650', '10', '10', '121*18*76.4', null, 'CD650', '121', '18', '76.4', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c298-cb98-11e8-b3b4-54e1ad19c940', '6427252', 'CD650', 'CD650', '10', '10', '159*51*32', null, 'CD650', '159', '51', '32', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c39e-cb98-11e8-b3b4-54e1ad19c940', '6478332', 'CD70', 'CD70', '10', '10', '60*120*126', null, 'CD70', '60', '120', '126', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c4af-cb98-11e8-b3b4-54e1ad19c940', '5304431', 'CD750', 'CD750', '10', '10', '18.0*105*105', '18.8*106*106', 'CD750', '18.0', '105', '105', '18.8', '106', '106', '14.000000', '2.780000', '2.960000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c5ca-cb98-11e8-b3b4-54e1ad19c940', '5329043', 'CD750', 'CD750', '10', '10', '20.0*105*105', '20.8*106*106', 'CD750', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c779-cb98-11e8-b3b4-54e1ad19c940', '5329044', 'CD750', 'CD750', '10', '10', '23.0*105*105', '23.8*106*106', 'CD750', '23.0', '105', '105', '23.8', '106', '106', '14.000000', '3.550000', '3.740000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4c93e-cb98-11e8-b3b4-54e1ad19c940', '5329045', 'CD750', 'CD750', '10', '10', '25.0*105*105', '25.8*106*106', 'CD750', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4cb07-cb98-11e8-b3b4-54e1ad19c940', '5329046', 'CD750', 'CD750', '10', '10', '53.0*105*105', '53.8*106*106', 'CD750', '53.0', '105', '105', '53.8', '106', '106', '14.000000', '8.180000', '8.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ce2e-cb98-11e8-b3b4-54e1ad19c940', '5564400', 'CD750', 'CD750', '10', '10', '10.0*105*105', '10.8*106*106', 'CD750', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4cf3a-cb98-11e8-b3b4-54e1ad19c940', '5911270', 'CD750', 'CD750', '10', '10', '35.0*105*105', '35.8*106*106', 'CD750', '35.0', '105', '105', '35.8', '106', '106', '14.000000', '5.400000', '5.630000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d054-cb98-11e8-b3b4-54e1ad19c940', '5911311', 'CD750', 'CD750', '10', '10', '2.0*105*105', '2.8*106*106', 'CD750', '2.0', '105', '105', '2.8', '106', '106', '14.000000', '0.310000', '0.440000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d0f4-cb98-11e8-b3b4-54e1ad19c940', '5952842', 'CD750', 'CD750', '10', '10', '4.0*105*105', '4.8*106*106', 'CD750', '4.0', '105', '105', '4.8', '106', '106', '14.000000', '0.620000', '0.760000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d1c1-cb98-11e8-b3b4-54e1ad19c940', '5952843', 'CD750', 'CD750', '10', '10', '5.0*105*105', '5.8*106*106', 'CD750', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d2c7-cb98-11e8-b3b4-54e1ad19c940', '5952844', 'CD750', 'CD750', '10', '10', '6.0*105*105', '6.8*106*106', 'CD750', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d3b9-cb98-11e8-b3b4-54e1ad19c940', '5952845', 'CD750', 'CD750', '10', '10', '8.0*105*105', '8.8*106*106', 'CD750', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d4ca-cb98-11e8-b3b4-54e1ad19c940', '5990520', 'CD750', 'CD750', '10', '10', '1.0*105*105', '1.8*106*106', 'CD750', '1.0', '105', '105', '1.8', '106', '106', '14.000000', '0.150000', '0.280000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d5c5-cb98-11e8-b3b4-54e1ad19c940', '5990601', 'CD750', 'CD750', '10', '10', '3.0*105*105', '3.8*106*106', 'CD750', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d69d-cb98-11e8-b3b4-54e1ad19c940', '5990602', 'CD750', 'CD750', '10', '10', '7.0*105*105', '7.8*106*106', 'CD750', '7.0', '105', '105', '7.8', '106', '106', '14.000000', '1.080000', '1.230000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d78f-cb98-11e8-b3b4-54e1ad19c940', '5990604', 'CD750', 'CD750', '10', '10', '9.0*105*105', '9.8*106*106', 'CD750', '9.0', '105', '105', '9.8', '106', '106', '14.000000', '1.390000', '1.540000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d890-cb98-11e8-b3b4-54e1ad19c940', '6091876', 'CD750', 'CD750', '10', '10', '9.5*105*105', '10.3*106*106', 'CD750', '9.5', '105', '105', '10.3', '106', '106', '14.000000', '1.470000', '1.620000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4d96d-cb98-11e8-b3b4-54e1ad19c940', '6099935', 'CD750', 'CD750', '10', '10', '2.5*105*105', '3.3*106*106', 'CD750', '2.5', '105', '105', '3.3', '106', '106', '14.000000', '0.390000', '0.520000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4da54-cb98-11e8-b3b4-54e1ad19c940', '6099936', 'CD750', 'CD750', '10', '10', '3.5*105*105', '4.3*106*106', 'CD750', '3.5', '105', '105', '4.3', '106', '106', '14.000000', '0.540000', '0.680000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4db5b-cb98-11e8-b3b4-54e1ad19c940', '6101936', 'CD750', 'CD750', '10', '10', '4.5*105*105', '5.3*106*106', 'CD750', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4dc28-cb98-11e8-b3b4-54e1ad19c940', '6130102', 'CD750', 'CD750', '10', '10', '11.0*105*105', '11.8*106*106', 'CD750', '11.0', '105', '105', '11.8', '106', '106', '14.000000', '1.700000', '1.860000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4dceb-cb98-11e8-b3b4-54e1ad19c940', '6186452', 'CD750', 'CD750', '10', '10', '1.5*105*105', '2.3*106*106', 'CD750', '1.5', '105', '105', '2.3', '106', '106', '14.000000', '0.230000', '0.360000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4dd7b-cb98-11e8-b3b4-54e1ad19c940', '6186521', 'CD750', 'CD750', '10', '10', '5.5*105*105', '6.3*106*106', 'CD750', '5.5', '105', '105', '6.3', '106', '106', '14.000000', '0.850000', '0.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ded4-cb98-11e8-b3b4-54e1ad19c940', '6186523', 'CD750', 'CD750', '10', '10', '6.5*105*105', '7.3*106*106', 'CD750', '6.5', '105', '105', '7.3', '106', '106', '14.000000', '1.000000', '1.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e0ad-cb98-11e8-b3b4-54e1ad19c940', '6186524', 'CD750', 'CD750', '10', '10', '7.5*105*105', '8.3*106*106', 'CD750', '7.5', '105', '105', '8.3', '106', '106', '14.000000', '1.160000', '1.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e1b3-cb98-11e8-b3b4-54e1ad19c940', '6186525', 'CD750', 'CD750', '10', '10', '8.5*105*105', '9.3*106*106', 'CD750', '8.5', '105', '105', '9.3', '106', '106', '14.000000', '1.310000', '1.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e290-cb98-11e8-b3b4-54e1ad19c940', '6186526', 'CD750', 'CD750', '10', '10', '10.5*105*105', '11.3*106*106', 'CD750', '10.5', '105', '105', '11.3', '106', '106', '14.000000', '1.620000', '1.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e37c-cb98-11e8-b3b4-54e1ad19c940', '6186527', 'CD750', 'CD750', '10', '10', '12.0*105*105', '12.8*106*106', 'CD750', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e44f-cb98-11e8-b3b4-54e1ad19c940', '6186528', 'CD750', 'CD750', '10', '10', '15.0*105*105', '15.8*106*106', 'CD750', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e522-cb98-11e8-b3b4-54e1ad19c940', '6187038', 'CD750', 'CD750', '10', '10', '22.0*105*105', '22.8*106*106', 'CD750', '22.0', '105', '105', '22.8', '106', '106', '14.000000', '3.400000', '3.590000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e5d6-cb98-11e8-b3b4-54e1ad19c940', '6192251', 'CD750', 'CD750', '10', '10', '26.0*105*105', '26.8*106*106', 'CD750', '26.0', '105', '105', '26.8', '106', '106', '14.000000', '4.010000', '4.220000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e66b-cb98-11e8-b3b4-54e1ad19c940', '6223416', 'CD750', 'CD750', '10', '10', '52.0*105*105', '52.8*106*106', 'CD750', '52.0', '105', '105', '52.8', '106', '106', '14.000000', '8.030000', '8.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e733-cb98-11e8-b3b4-54e1ad19c940', '6231008', 'CD750', 'CD750', '10', '10', '55.0*105*105', '55.8*106*106', 'CD750', '55.0', '105', '105', '55.8', '106', '106', '14.000000', '8.490000', '8.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e7dd-cb98-11e8-b3b4-54e1ad19c940', '6434854', 'CD750', 'CD750', '10', '10', '1*56*120', null, 'CD750', '1', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e87c-cb98-11e8-b3b4-54e1ad19c940', '6434855', 'CD750', 'CD750', '10', '10', '1.5*56*120', null, 'CD750', '1.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4e95f-cb98-11e8-b3b4-54e1ad19c940', '6434856', 'CD750', 'CD750', '10', '10', '2*56*120', null, 'CD750', '2', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ea5b-cb98-11e8-b3b4-54e1ad19c940', '6434857', 'CD750', 'CD750', '10', '10', '2.5*56*120', null, 'CD750', '2.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4eb09-cb98-11e8-b3b4-54e1ad19c940', '6434858', 'CD750', 'CD750', '10', '10', '3*56*120', null, 'CD750', '3', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ebc2-cb98-11e8-b3b4-54e1ad19c940', '6434859', 'CD750', 'CD750', '10', '10', '3.5*56*120', null, 'CD750', '3.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4eca5-cb98-11e8-b3b4-54e1ad19c940', '6434860', 'CD750', 'CD750', '10', '10', '4*56*120', null, 'CD750', '4', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4edba-cb98-11e8-b3b4-54e1ad19c940', '6434881', 'CD750', 'CD750', '10', '10', '4.5*56*120', null, 'CD750', '4.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ee97-cb98-11e8-b3b4-54e1ad19c940', '6434882', 'CD750', 'CD750', '10', '10', '5*56*120', null, 'CD750', '5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4ef74-cb98-11e8-b3b4-54e1ad19c940', '6434883', 'CD750', 'CD750', '10', '10', '5.5*56*120', null, 'CD750', '5.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f014-cb98-11e8-b3b4-54e1ad19c940', '6434884', 'CD750', 'CD750', '10', '10', '6*56*120', null, 'CD750', '6', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f0b8-cb98-11e8-b3b4-54e1ad19c940', '6434885', 'CD750', 'CD750', '10', '10', '6.5*56*120', null, 'CD750', '6.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f18b-cb98-11e8-b3b4-54e1ad19c940', '6434886', 'CD750', 'CD750', '10', '10', '7*56*120', null, 'CD750', '7', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f234-cb98-11e8-b3b4-54e1ad19c940', '6434887', 'CD750', 'CD750', '10', '10', '7.5*56*120', null, 'CD750', '7.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f2e3-cb98-11e8-b3b4-54e1ad19c940', '6434888', 'CD750', 'CD750', '10', '10', '8*56*120', null, 'CD750', '8', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f441-cb98-11e8-b3b4-54e1ad19c940', '6434889', 'CD750', 'CD750', '10', '10', '8.5*56*120', null, 'CD750', '8.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e6f4f4f5-cb98-11e8-b3b4-54e1ad19c940', '6434890', 'CD750', 'CD750', '10', '10', '9*56*120', null, 'CD750', '9', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f4dd-cb98-11e8-b3b4-54e1ad19c940', '6434891', 'CD750', 'CD750', '10', '10', '9.5*56*120', null, 'CD750', '9.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f6f8-cb98-11e8-b3b4-54e1ad19c940', '6434892', 'CD750', 'CD750', '10', '10', '10*56*120', null, 'CD750', '10', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f85b-cb98-11e8-b3b4-54e1ad19c940', '6434893', 'CD750', 'CD750', '10', '10', '10.5*56*120', null, 'CD750', '10.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f8eb-cb98-11e8-b3b4-54e1ad19c940', '6434894', 'CD750', 'CD750', '10', '10', '11*56*120', null, 'CD750', '11', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f948-cb98-11e8-b3b4-54e1ad19c940', '6434895', 'CD750', 'CD750', '10', '10', '11.5*56*120', null, 'CD750', '11.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f99f-cb98-11e8-b3b4-54e1ad19c940', '6434896', 'CD750', 'CD750', '10', '10', '12*56*120', null, 'CD750', '12', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706f9f1-cb98-11e8-b3b4-54e1ad19c940', '6434897', 'CD750', 'CD750', '10', '10', '13.1*56*120', null, 'CD750', '13.1', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fa53-cb98-11e8-b3b4-54e1ad19c940', '6434898', 'CD750', 'CD750', '10', '10', '13.5*56*120', null, 'CD750', '13.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fad8-cb98-11e8-b3b4-54e1ad19c940', '6434899', 'CD750', 'CD750', '10', '10', '14.5*56*120', null, 'CD750', '14.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fb3f-cb98-11e8-b3b4-54e1ad19c940', '6434900', 'CD750', 'CD750', '10', '10', '15.5*56*120', null, 'CD750', '15.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fba6-cb98-11e8-b3b4-54e1ad19c940', '6434901', 'CD750', 'CD750', '10', '10', '16.5*56*120', null, 'CD750', '16.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fc1c-cb98-11e8-b3b4-54e1ad19c940', '6437893', 'CD750', 'CD750', '10', '10', '10.5*56*120', null, 'CD750', '10.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fc7e-cb98-11e8-b3b4-54e1ad19c940', '6464894', 'CD750', 'CD750', '10', '10', '11*56*120', null, 'CD750', '11', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fcef-cb98-11e8-b3b4-54e1ad19c940', '6464895', 'CD750', 'CD750', '10', '10', '11.5*56*120', null, 'CD750', '11.5', '56', '120', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fd51-cb98-11e8-b3b4-54e1ad19c940', '5692749', 'G10', 'G10', '10', '10', '50.5*105*105', '51.3*106*106', 'G10', '50.5', '105', '105', '51.3', '106', '106', '14.000000', '7.790000', '8.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fdb2-cb98-11e8-b3b4-54e1ad19c940', '6284200', 'G10', 'G10', '10', '10', '3.0*105*105', '3.8*106*106', 'G10', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fe0f-cb98-11e8-b3b4-54e1ad19c940', '6284221', 'G10', 'G10', '10', '10', '4.0*105*105', '4.8*106*106', 'G10', '4.0', '105', '105', '4.8', '106', '106', '14.000000', '0.620000', '0.760000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706fe8a-cb98-11e8-b3b4-54e1ad19c940', '6284222', 'G10', 'G10', '10', '10', '5.0*105*105', '5.8*106*106', 'G10', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706feec-cb98-11e8-b3b4-54e1ad19c940', '6284223', 'G10', 'G10', '10', '10', '6.0*105*105', '6.8*106*106', 'G10', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706ff4e-cb98-11e8-b3b4-54e1ad19c940', '6284224', 'G10', 'G10', '10', '10', '8.0*105*105', '8.8*106*106', 'G10', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e706ffaf-cb98-11e8-b3b4-54e1ad19c940', '6284225', 'G10', 'G10', '10', '10', '10.0*105*105', '10.8*106*106', 'G10', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7070016-cb98-11e8-b3b4-54e1ad19c940', '6284226', 'G10', 'G10', '10', '10', '12.0*105*105', '12.8*106*106', 'G10', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7070078-cb98-11e8-b3b4-54e1ad19c940', '6284227', 'G10', 'G10', '10', '10', '16.0*105*105', '16.8*106*106', 'G10', '16.0', '105', '105', '16.8', '106', '106', '14.000000', '2.470000', '2.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70700e9-cb98-11e8-b3b4-54e1ad19c940', '6305529', 'G10', 'G10', '10', '10', '16.0*105*105', '16.8*106*106', 'G10', '16.0', '105', '105', '16.8', '106', '106', '14.000000', '2.470000', '2.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707015a-cb98-11e8-b3b4-54e1ad19c940', '6392484', 'G10', 'G10', '10', '30', 'D89*17', 'D89*17', 'G10', null, null, null, 'D89', null, '17', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70716b8-cb98-11e8-b3b4-54e1ad19c940', '6392485', 'G10', 'G10', '10', '30', 'D111*31', 'D111*31', 'G10', null, null, null, 'D111', null, '31', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707190c-cb98-11e8-b3b4-54e1ad19c940', '6032464', 'G30', 'G30', '10', '10', '50.5*105*105', '51.3*106*106', 'G30', '50.5', '105', '105', '51.3', '106', '106', '14.000000', '7.790000', '8.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70719e9-cb98-11e8-b3b4-54e1ad19c940', '5557461', 'G45C', 'G45C', '10', '10', '50.5*105*105', '51.3*106*106', 'G45C', '50.5', '105', '105', '51.3', '106', '106', '14.000000', '7.790000', '8.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071a64-cb98-11e8-b3b4-54e1ad19c940', '6163686', 'G45C', 'G45C', '10', '10', '56.0*105*105', '56.8*106*106', 'G45C', '56.0', '105', '105', '56.8', '106', '106', '14.000000', '8.640000', '8.930000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071ab7-cb98-11e8-b3b4-54e1ad19c940', '6202845', 'G45C', 'G45C', '10', '10', '60.0*105*105', '60.8*106*106', 'G45C', '60.0', '105', '105', '60.8', '106', '106', '14.000000', '9.260000', '9.560000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071b9e-cb98-11e8-b3b4-54e1ad19c940', '6312173', 'G45C', 'G45C', '10', '10', '65.0*105*105', '65.8*106*106', 'G45C', '65.0', '105', '105', '65.8', '106', '106', '14.000000', '10.030000', '10.350000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071c0a-cb98-11e8-b3b4-54e1ad19c940', '6326045', 'G45C', 'G45C', '10', '10', '60*120*127', null, 'G45C', '60', '120', '127', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071c6b-cb98-11e8-b3b4-54e1ad19c940', '6380459', 'G45C', 'G45C', '10', '30', '10.3*10.3', '10.3*10.3', 'G45C', null, null, null, '10.3', null, '10.3', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071df2-cb98-11e8-b3b4-54e1ad19c940', '6380460', 'G45C', 'G45C', '10', '30', '12.4*10.3', '12.4*10.3', 'G45C', null, null, null, '12.4', null, '10.3', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071e68-cb98-11e8-b3b4-54e1ad19c940', '6380511', 'G45C', 'G45C', '10', '30', '14.5*10.3', '14.5*10.3', 'G45C', null, null, null, '14.5', null, '10.3', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071ec0-cb98-11e8-b3b4-54e1ad19c940', '6557797', 'G45C', 'G45C', '10', '20', '', null, 'G45C', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071f31-cb98-11e8-b3b4-54e1ad19c940', '6557798', 'G45C', 'G45C', '10', '30', '25*120L', '25*120L', 'G45C', null, null, null, '25', null, '120L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7071fa7-cb98-11e8-b3b4-54e1ad19c940', '6537180', 'GE30', 'GE30', '10', '10', '4.0*105*105', '4.8*106*106', 'GE30', '4.0', '105', '105', '4.8', '106', '106', '14.000000', '0.620000', '0.760000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072051-cb98-11e8-b3b4-54e1ad19c940', '6537211', 'GE30', 'GE30', '10', '10', '14.0*105*105', '14.8*106*106', 'GE30', '14.0', '105', '105', '14.8', '106', '106', '14.000000', '2.160000', '2.330000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70720dc-cb98-11e8-b3b4-54e1ad19c940', '5394696', 'GT30', 'GT30', '10', '20', '', null, 'GT30', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707217b-cb98-11e8-b3b4-54e1ad19c940', '4151377', 'K3109', 'K3109', '10', '30', '4.83*308L', '4.83*308L', 'K3109', null, null, null, '4.83', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707234f-cb98-11e8-b3b4-54e1ad19c940', '4151378', 'K3109', 'K3109', '10', '30', '5.61*308L', '5.61*308L', 'K3109', null, null, null, '5.61', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70723b0-cb98-11e8-b3b4-54e1ad19c940', '4151379', 'K3109', 'K3109', '10', '30', '6.3*308L', '6.3*308L', 'K3109', null, null, null, '6.3', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707240d-cb98-11e8-b3b4-54e1ad19c940', '4151380', 'K3109', 'K3109', '10', '30', '7.21*308L', '7.21*308L', 'K3109', null, null, null, '7.21', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072464-cb98-11e8-b3b4-54e1ad19c940', '4151382', 'K3109', 'K3109', '10', '30', '8.7*307', '8.7*307', 'K3109', null, null, null, '8.7', null, '307', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70724bc-cb98-11e8-b3b4-54e1ad19c940', '4151437', 'K3109', 'K3109', '10', '30', '4.04*308L', '4.04*308L', 'K3109', null, null, null, '4.04', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072546-cb98-11e8-b3b4-54e1ad19c940', '4151673', 'K3109', 'K3109', '10', '30', '9.5*308L', '9.5*308L', 'K3109', null, null, null, '9.5', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707259e-cb98-11e8-b3b4-54e1ad19c940', '4151674', 'K3109', 'K3109', '10', '30', '10.38*308L', '10.38*308L', 'K3109', null, null, null, '10.38', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70725f5-cb98-11e8-b3b4-54e1ad19c940', '4151675', 'K3109', 'K3109', '10', '30', '11.6*308L', '11.6*308L', 'K3109', null, null, null, '11.6', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072647-cb98-11e8-b3b4-54e1ad19c940', '4151676', 'K3109', 'K3109', '10', '30', '13.48*308L', '13.48*308L', 'K3109', null, null, null, '13.48', null, '308L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707269a-cb98-11e8-b3b4-54e1ad19c940', '6303947', 'K3109', 'K3109', '10', '10', '55.0*105*105', '55.8*106*106', 'K3109', '55.0', '105', '105', '55.8', '106', '106', '14.000000', '8.490000', '8.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70726f1-cb98-11e8-b3b4-54e1ad19c940', '6303948', 'K3109', 'K3109', '10', '10', '65.0*105*105', '65.8*106*106', 'K3109', '65.0', '105', '105', '65.8', '106', '106', '14.000000', '10.030000', '10.350000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072749-cb98-11e8-b3b4-54e1ad19c940', '6424712', 'K3109', 'K3109', '10', '10', '25.0*105*105', '25.8*106*106', 'K3109', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707279b-cb98-11e8-b3b4-54e1ad19c940', '6595006', 'K3109', 'K3109', '10', '30', '18.0*86L', '18.0*86L', 'K3109', null, null, null, '18.0', null, '86L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70727f2-cb98-11e8-b3b4-54e1ad19c940', '6596973', 'K3109', 'K3109', '10', '30', '15.5*307L', '15.5*307L', 'K3109', null, null, null, '15.5', null, '307L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072844-cb98-11e8-b3b4-54e1ad19c940', '6458801', 'K3520', 'K3520', '10', '10', '65*105*105', '65.8*106*106', 'K3520', '65', '105', '105', '65.8', '106', '106', '14.000000', '10.030000', '10.350000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707289c-cb98-11e8-b3b4-54e1ad19c940', '6466448', 'K90', 'K90', '10', '30', 'ᴓ73.0*35.2', 'ᴓ73.0*35.2', 'K90', null, null, null, '73.0', null, '35.2', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70728f3-cb98-11e8-b3b4-54e1ad19c940', '5962914', 'K91', 'K91', '10', '20', '', null, 'K91', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072945-cb98-11e8-b3b4-54e1ad19c940', '5962916', 'K91', 'K91', '10', '20', '', null, 'K91', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707299d-cb98-11e8-b3b4-54e1ad19c940', '5315178', 'KR466', 'KR466', '10', '10', '60.5*105*105', '61.3*106*106', 'KR466', '60.5', '105', '105', '61.3', '106', '106', '14.000000', '9.340000', '9.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70729f4-cb98-11e8-b3b4-54e1ad19c940', '6294937', 'KF1', 'KF1', '10', '30', 'D79*L14.5', 'D79*L14.5', 'KF1', null, null, null, 'D79', null, 'L14.5', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072a70-cb98-11e8-b3b4-54e1ad19c940', '6140165', 'KF306', 'KF306', '10', '10', '20*65*320', null, 'KF306', '20', '65', '320', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072acc-cb98-11e8-b3b4-54e1ad19c940', '3842619', 'KF315', 'KF315', '10', '30', '3.0*305L', '3.0*305L', 'KF315', null, null, null, '3.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072b24-cb98-11e8-b3b4-54e1ad19c940', '3842620', 'KF315', 'KF315', '10', '30', '3.5*305L', '3.5*305L', 'KF315', null, null, null, '3.5', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072b7b-cb98-11e8-b3b4-54e1ad19c940', '3842621', 'KF315', 'KF315', '10', '30', '4.0*305L', '4.0*305L', 'KF315', null, null, null, '4.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072bcd-cb98-11e8-b3b4-54e1ad19c940', '3842622', 'KF315', 'KF315', '10', '30', '4.5*305L', '4.5*305L', 'KF315', null, null, null, '4.5', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072c1f-cb98-11e8-b3b4-54e1ad19c940', '3842633', 'KF315', 'KF315', '10', '30', '5.0*305L', '5.0*305L', 'KF315', null, null, null, '5.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072c72-cb98-11e8-b3b4-54e1ad19c940', '3842637', 'KF315', 'KF315', '10', '30', '7.0*305L', '7.0*305L', 'KF315', null, null, null, '7.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072cc4-cb98-11e8-b3b4-54e1ad19c940', '3842639', 'KF315', 'KF315', '10', '30', '8.0*305L', '8.0*305L', 'KF315', null, null, null, '8.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072d11-cb98-11e8-b3b4-54e1ad19c940', '3842655', 'KF315', 'KF315', '10', '30', '15.0*305L', '15.0*305L', 'KF315', null, null, null, '15.0', null, '305L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072d68-cb98-11e8-b3b4-54e1ad19c940', '6227438', 'KF315', 'KF315', '10', '30', '19.2*325L', '19.2*325L', 'KF315', null, null, null, '19.2', null, '325L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072dbb-cb98-11e8-b3b4-54e1ad19c940', '6227439', 'KF315', 'KF315', '10', '30', '25.5*325', '25.5*325', 'KF315', null, null, null, '25.5', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072e08-cb98-11e8-b3b4-54e1ad19c940', '1971715', 'KMS', 'KMS', '10', '10', '9.0*60*100', null, 'KMS', '9.0', '60', '100', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072e5f-cb98-11e8-b3b4-54e1ad19c940', '1972373', 'KMS', 'KMS', '10', '20', 'KA0020', null, 'KMS', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072eb7-cb98-11e8-b3b4-54e1ad19c940', '2885130', 'KMS', 'KMS', '10', '30', '3.25*325', '3.25*325', 'KMS', null, null, null, '3.25', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072f0e-cb98-11e8-b3b4-54e1ad19c940', '3475489', 'KMS', 'KMS', '10', '30', '12.70*325', '12.70*325', 'KMS', null, null, null, '12.70', null, '325', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072f60-cb98-11e8-b3b4-54e1ad19c940', '6308041', 'KMS', 'KMS', '10', '30', '3.25*330L', '3.25*330L', 'KMS', null, null, null, '3.25', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7072fb2-cb98-11e8-b3b4-54e1ad19c940', '6308226', 'KMS', 'KMS', '10', '30', '5.2*330L', '5.2*330L', 'KMS', null, null, null, '5.2', null, '330L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073024-cb98-11e8-b3b4-54e1ad19c940', '6308229', 'KMS', 'KMS', '10', '30', '6.7*330', '6.7*330', 'KMS', null, null, null, '6.7', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707307b-cb98-11e8-b3b4-54e1ad19c940', '6308253', 'KMS', 'KMS', '10', '30', '12.2*330', '12.2*330', 'KMS', null, null, null, '12.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70730cd-cb98-11e8-b3b4-54e1ad19c940', '6512732', 'KMS', 'KMS', '10', '10', '10*105*105', '10.8*106*106', 'KMS', '10', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073125-cb98-11e8-b3b4-54e1ad19c940', '6512733', 'KMS', 'KMS', '10', '10', '15*105*105', '15.8*106*106', 'KMS', '15', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073177-cb98-11e8-b3b4-54e1ad19c940', '6512734', 'KMS', 'KMS', '10', '10', '20*105*105', '20.8*106*106', 'KMS', '20', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70731c9-cb98-11e8-b3b4-54e1ad19c940', '6512735', 'KMS', 'KMS', '10', '10', '25*105*105', '25.8*106*106', 'KMS', '25', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073220-cb98-11e8-b3b4-54e1ad19c940', '5315129', 'KR466', 'KR466', '10', '10', '8.5*105*105', '9.3*106*106', 'KR466', '8.5', '105', '105', '9.3', '106', '106', '14.000000', '1.310000', '1.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073273-cb98-11e8-b3b4-54e1ad19c940', '5315170', 'KR466', 'KR466', '10', '10', '9.5*105*105', '10.3*106*106', 'KR466', '9.5', '105', '105', '10.3', '106', '106', '14.000000', '1.470000', '1.620000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70732c5-cb98-11e8-b3b4-54e1ad19c940', '5315173', 'KR466', 'KR466', '10', '10', '14.5*105*105', '15.3*106*106', 'KR466', '14.5', '105', '105', '15.3', '106', '106', '14.000000', '2.240000', '2.410000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073317-cb98-11e8-b3b4-54e1ad19c940', '5315174', 'KR466', 'KR466', '10', '10', '20.5*105*105', '21.3*106*106', 'KR466', '20.5', '105', '105', '21.3', '106', '106', '14.000000', '3.160000', '3.350000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073369-cb98-11e8-b3b4-54e1ad19c940', '5315176', 'KR466', 'KR466', '10', '10', '53.5*105*105', '54.3*106*106', 'KR466', '53.5', '105', '105', '54.3', '106', '106', '14.000000', '8.260000', '8.540000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70733bc-cb98-11e8-b3b4-54e1ad19c940', '5315177', 'KR466', 'KR466', '10', '10', '55.5*105*105', '56.3*106*106', 'KR466', '55.5', '105', '105', '56.3', '106', '106', '14.000000', '8.570000', '8.860000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707340e-cb98-11e8-b3b4-54e1ad19c940', '5315125', 'KR466', 'KR466', '10', '10', '4.5*105*105', '5.3*106*106', 'KR466', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073460-cb98-11e8-b3b4-54e1ad19c940', '5315126', 'KR466', 'KR466', '10', '10', '5.5*105*105', '6.3*106*106', 'KR466', '5.5', '105', '105', '6.3', '106', '106', '14.000000', '0.850000', '0.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70734d6-cb98-11e8-b3b4-54e1ad19c940', '5315127', 'KR466', 'KR466', '10', '10', '6.5*105*105', '7.3*106*106', 'KR466', '6.5', '105', '105', '7.3', '106', '106', '14.000000', '1.000000', '1.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073524-cb98-11e8-b3b4-54e1ad19c940', '5315128', 'KR466', 'KR466', '10', '10', '7.5*105*105', '8.3*106*106', 'KR466', '7.5', '105', '105', '8.3', '106', '106', '14.000000', '1.160000', '1.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073595-cb98-11e8-b3b4-54e1ad19c940', '5315171', 'KR466', 'KR466', '10', '10', '10.5*105*105', '11.3*106*106', 'KR466', '10.5', '105', '105', '11.3', '106', '106', '14.000000', '1.620000', '1.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70735e7-cb98-11e8-b3b4-54e1ad19c940', '5315172', 'KR466', 'KR466', '10', '10', '12.5*105*105', '13.3*106*106', 'KR466', '12.5', '105', '105', '13.3', '106', '106', '14.000000', '1.930000', '2.090000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073639-cb98-11e8-b3b4-54e1ad19c940', '5315175', 'KR466', 'KR466', '10', '10', '25.5*105*105', '26.3*106*106', 'KR466', '25.5', '105', '105', '26.3', '106', '106', '14.000000', '3.940000', '4.140000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073686-cb98-11e8-b3b4-54e1ad19c940', '5391771', 'KR466', 'KR466', '10', '10', '9.0*105*105', '9.8*106*106', 'KR466', '9.0', '105', '105', '9.8', '106', '106', '14.000000', '1.390000', '1.540000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70736d3-cb98-11e8-b3b4-54e1ad19c940', '5587113', 'KR466', 'KR466', '10', '10', '63.5*105*105', '64.3*106*106', 'KR466', '63.5', '105', '105', '64.3', '106', '106', '14.000000', '9.800000', '10.110000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073726-cb98-11e8-b3b4-54e1ad19c940', '5719136', 'KR466', 'KR466', '10', '20', 'HT179C S8D2', null, 'KR466', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073782-cb98-11e8-b3b4-54e1ad19c940', '5826646', 'KR466', 'KR466', '10', '10', '16.0*150*150', null, 'KR466', '16.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70737e4-cb98-11e8-b3b4-54e1ad19c940', '5954489', 'KR466', 'KR466', '10', '10', '50.0*105*105', '50.8*106*106', 'KR466', '50.0', '105', '105', '50.8', '106', '106', '14.000000', '7.720000', '7.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073893-cb98-11e8-b3b4-54e1ad19c940', '5956613', 'KR466', 'KR466', '10', '10', '2.5*105*105', '3.3*106*106', 'KR466', '2.5', '105', '105', '3.3', '106', '106', '14.000000', '0.390000', '0.520000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70738ef-cb98-11e8-b3b4-54e1ad19c940', '5969055', 'KR466', 'KR466', '10', '10', '2.0*105*105', '2.8*106*106', 'KR466', '2.0', '105', '105', '2.8', '106', '106', '14.000000', '0.310000', '0.440000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707393c-cb98-11e8-b3b4-54e1ad19c940', '5969056', 'KR466', 'KR466', '10', '10', '3.0*105*105', '3.8*106*106', 'KR466', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e707398e-cb98-11e8-b3b4-54e1ad19c940', '5969057', 'KR466', 'KR466', '10', '10', '15.0*105*105', '15.8*106*106', 'KR466', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e70739e6-cb98-11e8-b3b4-54e1ad19c940', '6084833', 'KR466', 'KR466', '10', '10', '35.0*105*105', '35.8*106*106', 'KR466', '35.0', '105', '105', '35.8', '106', '106', '14.000000', '5.400000', '5.630000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073a38-cb98-11e8-b3b4-54e1ad19c940', '6084834', 'KR466', 'KR466', '10', '10', '25.0*105*105', '25.8*106*106', 'KR466', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073a85-cb98-11e8-b3b4-54e1ad19c940', '6097944', 'KR466', 'KR466', '10', '10', '6.5*250*250', null, 'KR466', '6.5', '250', '250', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073af6-cb98-11e8-b3b4-54e1ad19c940', '6117036', 'KR466', 'KR466', '10', '10', '10.0*105*105', '10.8*106*106', 'KR466', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073b4e-cb98-11e8-b3b4-54e1ad19c940', '6167690', 'KR466', 'KR466', '10', '10', '3.5*105*105', '4.3*106*106', 'KR466', '3.5', '105', '105', '4.3', '106', '106', '14.000000', '0.540000', '0.680000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073b9b-cb98-11e8-b3b4-54e1ad19c940', '6167761', 'KR466', 'KR466', '10', '10', '5.0*105*105', '5.8*106*106', 'KR466', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073bed-cb98-11e8-b3b4-54e1ad19c940', '6167762', 'KR466', 'KR466', '10', '10', '6.0*105*105', '6.8*106*106', 'KR466', '6.0', '105', '105', '6.8', '106', '106', '14.000000', '0.930000', '1.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073c3a-cb98-11e8-b3b4-54e1ad19c940', '6225687', 'KR466', 'KR466', '10', '10', '4.0*105*105', '4.8*106*106', 'KR466', '4.0', '105', '105', '4.8', '106', '106', '14.000000', '0.620000', '0.760000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073c87-cb98-11e8-b3b4-54e1ad19c940', '6225689', 'KR466', 'KR466', '10', '10', '20.0*105*105', '20.8*106*106', 'KR466', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073cd9-cb98-11e8-b3b4-54e1ad19c940', '6306559', 'KR466', 'KR466', '10', '10', '7.0*105*105', '7.8*106*106', 'KR466', '7.0', '105', '105', '7.8', '106', '106', '14.000000', '1.080000', '1.230000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073d27-cb98-11e8-b3b4-54e1ad19c940', '6306560', 'KR466', 'KR466', '10', '10', '8.0*105*105', '8.8*106*106', 'KR466', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073d79-cb98-11e8-b3b4-54e1ad19c940', '6306561', 'KR466', 'KR466', '10', '10', '12.0*105*105', '12.8*106*106', 'KR466', '12.0', '105', '105', '12.8', '106', '106', '14.000000', '1.850000', '2.010000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073dcb-cb98-11e8-b3b4-54e1ad19c940', '6306566', 'KR466', 'KR466', '10', '10', '32.0*105*105', '32.8*106*106', 'KR466', '32.0', '105', '105', '32.8', '106', '106', '14.000000', '4.940000', '5.160000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073e18-cb98-11e8-b3b4-54e1ad19c940', '6306571', 'KR466', 'KR466', '10', '10', '55.0*105*105', '55.8*106*106', 'KR466', '55.0', '105', '105', '55.8', '106', '106', '14.000000', '8.490000', '8.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e7073e6a-cb98-11e8-b3b4-54e1ad19c940', '6306572', 'KR466', 'KR466', '10', '10', '57.0*105*105', '57.8*106*106', 'KR466', '57.0', '105', '105', '57.8', '106', '106', '14.000000', '8.800000', '9.090000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a101-cb98-11e8-b3b4-54e1ad19c940', '6309073', 'KR466', 'KR466', '10', '10', '20.0*150*150', null, 'KR466', '20.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a3cb-cb98-11e8-b3b4-54e1ad19c940', '6309074', 'KR466', 'KR466', '10', '10', '25.0*150*150', null, 'KR466', '25.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a59f-cb98-11e8-b3b4-54e1ad19c940', '6326117', 'KR466', 'KR466', '10', '10', '10.0*150*150', null, 'KR466', '10.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a702-cb98-11e8-b3b4-54e1ad19c940', '6334268', 'KR466', 'KR466', '10', '20', '预型件', null, 'KR466', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a89d-cb98-11e8-b3b4-54e1ad19c940', '6337977', 'KR466', 'KR466', '10', '10', '60.0*150*150', null, 'KR466', '60.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a92d-cb98-11e8-b3b4-54e1ad19c940', '6351035', 'KR466', 'KR466', '10', '10', '52.0*105*105', '52.8*106*106', 'KR466', '52.0', '105', '105', '52.8', '106', '106', '14.000000', '8.030000', '8.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a98a-cb98-11e8-b3b4-54e1ad19c940', '6360117', 'KR466', 'KR466', '10', '10', '30.0*105*105', '30.8*106*106', 'KR466', '30.0', '105', '105', '30.8', '106', '106', '14.000000', '4.630000', '4.840000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710a9e6-cb98-11e8-b3b4-54e1ad19c940', '6360118', 'KR466', 'KR466', '10', '10', '40.0*105*105', '40.8*106*106', 'KR466', '40.0', '105', '105', '40.8', '106', '106', '14.000000', '6.170000', '6.420000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710aa3d-cb98-11e8-b3b4-54e1ad19c940', '6361454', 'KR466', 'KR466', '10', '10', '15*150*150', null, 'KR466', '15', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710aa90-cb98-11e8-b3b4-54e1ad19c940', '6376897', 'KR466', 'KR466', '10', '10', '152.2*71.3*66.3', null, 'KR466', '152.2', '71.3', '66.3', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ab0b-cb98-11e8-b3b4-54e1ad19c940', '6463832', 'KR466', 'KR466', '10', '10', '20*115*185', null, 'KR466', '20', '115', '185', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ab81-cb98-11e8-b3b4-54e1ad19c940', '6495085', 'KR466', 'KR466', '10', '30', '7.0*178.5', '7.0*178.5', 'KR466', null, null, null, '7.0', null, '178.5', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710abde-cb98-11e8-b3b4-54e1ad19c940', '6495153', 'KR466', 'KR466', '10', '10', '125*87.48*20', null, 'KR466', '125', '87.48', '20', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ac35-cb98-11e8-b3b4-54e1ad19c940', '6532518', 'KR466', 'KR466', '10', '10', '30.0*150*150', null, 'KR466', '30.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ac8d-cb98-11e8-b3b4-54e1ad19c940', '6532519', 'KR466', 'KR466', '10', '10', '35.0*150*150', null, 'KR466', '35.0', '150', '150', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ad83-cb98-11e8-b3b4-54e1ad19c940', '6542453', 'KR466', 'KR466', '10', '30', '9.5*120L', '9.5*120L', 'KR466', null, null, null, '9.5', null, '120L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ae6b-cb98-11e8-b3b4-54e1ad19c940', '6542454', 'KR466', 'KR466', '10', '30', '11.5*120L', '11.5*120L', 'KR466', null, null, null, '11.5', null, '120L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710af0f-cb98-11e8-b3b4-54e1ad19c940', '6542456', 'KR466', 'KR466', '10', '30', '?5.5*108', '?5.5*108', 'KR466', null, null, null, '?5.5', null, '108', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710af9a-cb98-11e8-b3b4-54e1ad19c940', '6542458', 'KR466', 'KR466', '10', '30', '?8.5*127', '?8.5*127', 'KR466', null, null, null, '?8.5', null, '127', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b039-cb98-11e8-b3b4-54e1ad19c940', '6542460', 'KR466', 'KR466', '10', '30', '?0.5*226', '?0.5*226', 'KR466', null, null, null, '?0.5', null, '226', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b0b0-cb98-11e8-b3b4-54e1ad19c940', '6542481', 'KR466', 'KR466', '10', '30', '?1.5*ID7*100L', '?1.5*ID7*100L', 'KR466', null, null, null, '?1.5', null, 'ID7*100L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b10c-cb98-11e8-b3b4-54e1ad19c940', '6542482', 'KR466', 'KR466', '10', '30', '25.5*ID5*100L', '25.5*ID5*100L', 'KR466', null, null, null, '25.5', null, 'ID5*100L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b163-cb98-11e8-b3b4-54e1ad19c940', '6542483', 'KR466', 'KR466', '10', '30', '27.5*ID7*58L', '27.5*ID7*58L', 'KR466', null, null, null, '27.5', null, 'ID7*58L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b1bb-cb98-11e8-b3b4-54e1ad19c940', '6542484', 'KR466', 'KR466', '10', '30', '?9.5*ID10*140L', '?9.5*ID10*140L', 'KR466', null, null, null, '?9.5', null, 'ID10*140L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b20d-cb98-11e8-b3b4-54e1ad19c940', '6542485', 'KR466', 'KR466', '10', '30', '?4.5*ID7*100L', '?4.5*ID7*100L', 'KR466', null, null, null, '?4.5', null, 'ID7*100L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b26f-cb98-11e8-b3b4-54e1ad19c940', '6542486', 'KR466', 'KR466', '10', '30', 'OD37.5*ID15*L70', 'OD37.5*ID15*L70', 'KR466', null, null, null, 'OD37.5', null, 'ID15*L70', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b2c1-cb98-11e8-b3b4-54e1ad19c940', '6542487', 'KR466', 'KR466', '10', '30', '?0.5*ID15*100L', '?0.5*ID15*100L', 'KR466', null, null, null, '?0.5', null, 'ID15*100L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b313-cb98-11e8-b3b4-54e1ad19c940', '6583420', 'KR466', 'KR466', '10', '10', '15.0*105*200', '15.8*106*201', 'KR466', '15.0', '105', '200', '15.8', '106', '201', '14.000000', '4.410000', '4.710000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b366-cb98-11e8-b3b4-54e1ad19c940', '6583461', 'KR466', 'KR466', '10', '10', '50.0*105*200', '50.8*106*201', 'KR466', '50.0', '105', '200', '50.8', '106', '201', '14.000000', '14.700000', '15.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b405-cb98-11e8-b3b4-54e1ad19c940', '6587337', 'KR466', 'KR466', '10', '30', 'OD57*ID26.6*L15', 'OD57*ID26.6*L15', 'KR466', null, null, null, 'OD57', null, 'ID26.6*L15', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710b495-cb98-11e8-b3b4-54e1ad19c940', '6969056', 'KR466', 'KR466', '10', '10', '3.0*105*105', '3.8*106*106', 'KR466', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710bee2-cb98-11e8-b3b4-54e1ad19c940', '5144355', 'KR855', 'KR855', '10', '10', '56.4*101.6*101.6', null, 'KR855', '56.4', '101.6', '101.6', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c07d-cb98-11e8-b3b4-54e1ad19c940', '5349234', 'KR855', 'KR855', '10', '10', '56.4*105*105', '57.199999999999996*106*106', 'KR855', '56.4', '105', '105', '57.199999999999996', '106', '106', '14.000000', '8.710000', '9.000000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c15a-cb98-11e8-b3b4-54e1ad19c940', '5704684', 'KR855', 'KR855', '10', '10', '1.0*105*105', '1.8*106*106', 'KR855', '1.0', '105', '105', '1.8', '106', '106', '14.000000', '0.150000', '0.280000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c1b7-cb98-11e8-b3b4-54e1ad19c940', '5949573', 'KR855', 'KR855', '10', '10', '5.0*105*105', '5.8*106*106', 'KR855', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c20e-cb98-11e8-b3b4-54e1ad19c940', '6029869', 'KR855', 'KR855', '10', '10', '50.5*105*105', '51.3*106*106', 'KR855', '50.5', '105', '105', '51.3', '106', '106', '14.000000', '7.790000', '8.070000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c284-cb98-11e8-b3b4-54e1ad19c940', '6096163', 'KR855', 'KR855', '10', '10', '20.0*105*105', '20.8*106*106', 'KR855', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c367-cb98-11e8-b3b4-54e1ad19c940', '6111985', 'KR855', 'KR855', '10', '10', '10.0*105*105', '10.8*106*106', 'KR855', '10.0', '105', '105', '10.8', '106', '106', '14.000000', '1.540000', '1.700000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c59c-cb98-11e8-b3b4-54e1ad19c940', '6339549', 'KR855', 'KR855', '10', '10', '60.0*105*105', '60.8*106*106', 'KR855', '60.0', '105', '105', '60.8', '106', '106', '14.000000', '9.260000', '9.560000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c655-cb98-11e8-b3b4-54e1ad19c940', '6465384', 'KR855', 'KR855', '10', '10', '7.0*200*300', null, 'KR855', '7.0', '200', '300', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c737-cb98-11e8-b3b4-54e1ad19c940', '6492293', 'KR855', 'KR855', '10', '10', '55.0*105*105', '55.8*106*106', 'KR855', '55.0', '105', '105', '55.8', '106', '106', '14.000000', '8.490000', '8.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c7c2-cb98-11e8-b3b4-54e1ad19c940', '6577760', 'KR855', 'KR855', '10', '30', '外径60*内孔22.5*95L', '外径60*内孔22.5*95L', 'KR855', null, null, null, '外径60', null, '内孔22.5*95L', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c81f-cb98-11e8-b3b4-54e1ad19c940', '3041007', 'KR887', 'KR887', '10', '10', '18.79*101.6*101.6', null, 'KR887', '18.79', '101.6', '101.6', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c89a-cb98-11e8-b3b4-54e1ad19c940', '3041012', 'KR887', 'KR887', '10', '10', '23.74*101.6*101.6', null, 'KR887', '23.74', '101.6', '101.6', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c925-cb98-11e8-b3b4-54e1ad19c940', '5316724', 'KR887', 'KR887', '10', '10', '58.0*105*105', '58.8*106*106', 'KR887', '58.0', '105', '105', '58.8', '106', '106', '14.000000', '8.950000', '9.250000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710c9fd-cb98-11e8-b3b4-54e1ad19c940', '5415722', 'KR887', 'KR887', '10', '10', '53.0*105*105', '53.8*106*106', 'KR887', '53.0', '105', '105', '53.8', '106', '106', '14.000000', '8.180000', '8.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cac0-cb98-11e8-b3b4-54e1ad19c940', '5416171', 'KR887', 'KR887', '10', '10', '25.0*105*105', '25.8*106*106', 'KR887', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cb50-cb98-11e8-b3b4-54e1ad19c940', '5416709', 'KR887', 'KR887', '10', '10', '15.0*105*105', '15.8*106*106', 'KR887', '15.0', '105', '105', '15.8', '106', '106', '14.000000', '2.320000', '2.490000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cbc1-cb98-11e8-b3b4-54e1ad19c940', '5416710', 'KR887', 'KR887', '10', '10', '16.0*105*105', '16.8*106*106', 'KR887', '16.0', '105', '105', '16.8', '106', '106', '14.000000', '2.470000', '2.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cc42-cb98-11e8-b3b4-54e1ad19c940', '5416711', 'KR887', 'KR887', '10', '10', '17.0*105*105', '17.8*106*106', 'KR887', '17.0', '105', '105', '17.8', '106', '106', '14.000000', '2.620000', '2.800000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cd33-cb98-11e8-b3b4-54e1ad19c940', '5416712', 'KR887', 'KR887', '10', '10', '18.0*105*105', '18.8*106*106', 'KR887', '18.0', '105', '105', '18.8', '106', '106', '14.000000', '2.780000', '2.960000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cdf6-cb98-11e8-b3b4-54e1ad19c940', '5416713', 'KR887', 'KR887', '10', '10', '19.0*105*105', '19.8*106*106', 'KR887', '19.0', '105', '105', '19.8', '106', '106', '14.000000', '2.930000', '3.110000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ce58-cb98-11e8-b3b4-54e1ad19c940', '5416714', 'KR887', 'KR887', '10', '10', '20.0*105*105', '20.8*106*106', 'KR887', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ceb5-cb98-11e8-b3b4-54e1ad19c940', '5416715', 'KR887', 'KR887', '10', '10', '21.0*105*105', '21.8*106*106', 'KR887', '21.0', '105', '105', '21.8', '106', '106', '14.000000', '3.240000', '3.430000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710cf82-cb98-11e8-b3b4-54e1ad19c940', '5416716', 'KR887', 'KR887', '10', '10', '23.0*105*105', '23.8*106*106', 'KR887', '23.0', '105', '105', '23.8', '106', '106', '14.000000', '3.550000', '3.740000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710d20a-cb98-11e8-b3b4-54e1ad19c940', '5416717', 'KR887', 'KR887', '10', '10', '25.0*105*105', '25.8*106*106', 'KR887', '25.0', '105', '105', '25.8', '106', '106', '14.000000', '3.860000', '4.060000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710d2e2-cb98-11e8-b3b4-54e1ad19c940', '5416718', 'KR887', 'KR887', '10', '10', '32.0*105*105', '32.8*106*106', 'KR887', '32.0', '105', '105', '32.8', '106', '106', '14.000000', '4.940000', '5.160000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710d3ed-cb98-11e8-b3b4-54e1ad19c940', '5416719', 'KR887', 'KR887', '10', '10', '39.0*105*105', '39.8*106*106', 'KR887', '39.0', '105', '105', '39.8', '106', '106', '14.000000', '6.020000', '6.260000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710d4e9-cb98-11e8-b3b4-54e1ad19c940', '5416720', 'KR887', 'KR887', '10', '10', '45.0*105*105', '45.8*106*106', 'KR887', '45.0', '105', '105', '45.8', '106', '106', '14.000000', '6.950000', '7.200000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710db04-cb98-11e8-b3b4-54e1ad19c940', '5416721', 'KR887', 'KR887', '10', '10', '51.0*105*105', '51.8*106*106', 'KR887', '51.0', '105', '105', '51.8', '106', '106', '14.000000', '7.870000', '8.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710dc24-cb98-11e8-b3b4-54e1ad19c940', '5416722', 'KR887', 'KR887', '10', '10', '53.0*105*105', '53.8*106*106', 'KR887', '53.0', '105', '105', '53.8', '106', '106', '14.000000', '8.180000', '8.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710dcd8-cb98-11e8-b3b4-54e1ad19c940', '5416723', 'KR887', 'KR887', '10', '10', '55.5*105*105', '56.3*106*106', 'KR887', '55.5', '105', '105', '56.3', '106', '106', '14.000000', '8.570000', '8.860000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710dde8-cb98-11e8-b3b4-54e1ad19c940', '5416724', 'KR887', 'KR887', '10', '10', '58.0*105*105', '58.8*106*106', 'KR887', '58.0', '105', '105', '58.8', '106', '106', '14.000000', '8.950000', '9.250000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710de97-cb98-11e8-b3b4-54e1ad19c940', '5416725', 'KR887', 'KR887', '10', '10', '60.5*105*105', '61.3*106*106', 'KR887', '60.5', '105', '105', '61.3', '106', '106', '14.000000', '9.340000', '9.640000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710df17-cb98-11e8-b3b4-54e1ad19c940', '6111986', 'KR887', 'KR887', '10', '10', '3.0*105*105', '3.8*106*106', 'KR887', '3.0', '105', '105', '3.8', '106', '106', '14.000000', '0.460000', '0.600000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710dfd0-cb98-11e8-b3b4-54e1ad19c940', '6306579', 'KR887', 'KR887', '10', '10', '2.5*105*105', '3.3*106*106', 'KR887', '2.5', '105', '105', '3.3', '106', '106', '14.000000', '0.390000', '0.520000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e0a8-cb98-11e8-b3b4-54e1ad19c940', '6306580', 'KR887', 'KR887', '10', '10', '3.5*105*105', '4.3*106*106', 'KR887', '3.5', '105', '105', '4.3', '106', '106', '14.000000', '0.540000', '0.680000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e138-cb98-11e8-b3b4-54e1ad19c940', '6306581', 'KR887', 'KR887', '10', '10', '4.5*105*105', '5.3*106*106', 'KR887', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e206-cb98-11e8-b3b4-54e1ad19c940', '6306582', 'KR887', 'KR887', '10', '10', '5.0*105*105', '5.8*106*106', 'KR887', '5.0', '105', '105', '5.8', '106', '106', '14.000000', '0.770000', '0.910000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e2a0-cb98-11e8-b3b4-54e1ad19c940', '6306583', 'KR887', 'KR887', '10', '10', '5.5*105*105', '6.3*106*106', 'KR887', '5.5', '105', '105', '6.3', '106', '106', '14.000000', '0.850000', '0.990000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e2f8-cb98-11e8-b3b4-54e1ad19c940', '6306584', 'KR887', 'KR887', '10', '10', '6.5*105*105', '7.3*106*106', 'KR887', '6.5', '105', '105', '7.3', '106', '106', '14.000000', '1.000000', '1.150000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e34f-cb98-11e8-b3b4-54e1ad19c940', '6306585', 'KR887', 'KR887', '10', '10', '7.5*105*105', '8.3*106*106', 'KR887', '7.5', '105', '105', '8.3', '106', '106', '14.000000', '1.160000', '1.310000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e3b1-cb98-11e8-b3b4-54e1ad19c940', '6306586', 'KR887', 'KR887', '10', '10', '8.0*105*105', '8.8*106*106', 'KR887', '8.0', '105', '105', '8.8', '106', '106', '14.000000', '1.230000', '1.380000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e43b-cb98-11e8-b3b4-54e1ad19c940', '6306587', 'KR887', 'KR887', '10', '10', '8.5*105*105', '9.3*106*106', 'KR887', '8.5', '105', '105', '9.3', '106', '106', '14.000000', '1.310000', '1.460000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e52d-cb98-11e8-b3b4-54e1ad19c940', '6306588', 'KR887', 'KR887', '10', '10', '9.5*105*105', '10.3*106*106', 'KR887', '9.5', '105', '105', '10.3', '106', '106', '14.000000', '1.470000', '1.620000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e5bd-cb98-11e8-b3b4-54e1ad19c940', '6306598', 'KR887', 'KR887', '10', '10', '55.0*105*105', '55.8*106*106', 'KR887', '55.0', '105', '105', '55.8', '106', '106', '14.000000', '8.490000', '8.780000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e648-cb98-11e8-b3b4-54e1ad19c940', '6306601', 'KR887', 'KR887', '10', '10', '70.0*105*105', '70.8*106*106', 'KR887', '70.0', '105', '105', '70.8', '106', '106', '14.000000', '10.800000', '11.140000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e6a9-cb98-11e8-b3b4-54e1ad19c940', '6306881', 'KR887', 'KR887', '10', '10', '4.5*105*105', '5.3*106*106', 'KR887', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e7aa-cb98-11e8-b3b4-54e1ad19c940', '6480341', 'KR887', 'KR887', '10', '10', '63.0*105*105', '63.8*106*106', 'KR887', '63.0', '105', '105', '63.8', '106', '106', '14.000000', '9.720000', '10.040000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e892-cb98-11e8-b3b4-54e1ad19c940', '6574717', 'KR887', 'KR887', '10', '10', '54.0*105*105', '54.8*106*106', 'KR887', '54.0', '105', '105', '54.8', '106', '106', '14.000000', '8.330000', '8.620000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710e983-cb98-11e8-b3b4-54e1ad19c940', '6103448', 'KWH', 'KWH', '10', '20', '', null, 'KWH', null, null, null, null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ea32-cb98-11e8-b3b4-54e1ad19c940', '6456498', 'O2F', 'O2F', '10', '10', '4.5*105*105', '5.3*106*106', 'O2F', '4.5', '105', '105', '5.3', '106', '106', '14.000000', '0.690000', '0.830000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710eac2-cb98-11e8-b3b4-54e1ad19c940', '6456499', 'O2F', 'O2F', '10', '10', '12.5*105*105', '13.3*106*106', 'O2F', '12.5', '105', '105', '13.3', '106', '106', '14.000000', '1.930000', '2.090000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710eb76-cb98-11e8-b3b4-54e1ad19c940', '6346511', 'S105', 'S105', '10', '10', '20.0*105*105', '20.8*106*106', 'S105', '20.0', '105', '105', '20.8', '106', '106', '14.000000', '3.090000', '3.270000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ec39-cb98-11e8-b3b4-54e1ad19c940', '6346512', 'S105', 'S105', '10', '10', '40.0*105*105', '40.8*106*106', 'S105', '40.0', '105', '105', '40.8', '106', '106', '14.000000', '6.170000', '6.420000', null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ecce-cb98-11e8-b3b4-54e1ad19c940', '5075899', 'THA-U', 'THA-U', '10', '30', '8.2*325mm', '8.2*325mm', 'THA-U', null, null, null, '8.2', null, '325mm', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ed3a-cb98-11e8-b3b4-54e1ad19c940', '6411103', 'W80K', 'W80K', '10', '10', '65*100*100', null, 'W80K', '65', '100', '100', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('e710ed97-cb98-11e8-b3b4-54e1ad19c940', '25818005', 'W80K', 'W80K', '10', '10', '65*100*100', null, 'W80K', '65', '100', '100', null, null, null, '14.000000', null, null, null, null, null, null, null, null, null, null, null, '20', '1', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_material VALUES ('f81fecbd692b4b1485d072dd42ac2aa2', '6621571', 'CD650', null, null, '10', '15*160*160', '15.8*161*161', 'CD650', '15', '160', '160', '15.8', '161', '161', '14.000000', '5.380000', '5.730000', null, null, null, null, null, null, null, null, null, '20', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 21:24:35', null, null, null);
INSERT INTO baseinfo_material VALUES ('fb368b08fe994de8bda9ea96c1629878', '6611142', 'KR466', null, null, '30', null, 'φ50*82', 'KR466', null, null, null, '50', null, '82', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-08 23:45:12', null, null, null);
INSERT INTO baseinfo_material VALUES ('fedf754e6b614cd8a6fb0c41d891c073', '6308004', '2210', null, null, '30', null, 'φ16.2*330', '2210', null, null, null, '16.2', null, '330', '14.000000', null, null, null, null, null, null, null, null, null, null, null, '10', '1', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 16:41:03', null, null, null);

-- ----------------------------
-- Table structure for `baseinfo_materialselect`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_materialselect`;
CREATE TABLE `baseinfo_materialselect` (
  `MATERIALSELECT_ID` varchar(100) NOT NULL COMMENT '物料选择ID',
  `SELECT_TYPE` varchar(50) DEFAULT NULL COMMENT '选择类型（出入库类型）',
  `SELECT_STATUS` varchar(10) DEFAULT NULL COMMENT '选择的状态',
  `PRIMARY_QTY` decimal(30,6) DEFAULT NULL COMMENT '主单位数量',
  `PRIMARY_UNIT` varchar(100) DEFAULT NULL COMMENT '主单位',
  `SECOND_QTY` decimal(30,6) DEFAULT NULL COMMENT '辅单位数量',
  `SECOND_UNIT` varchar(100) DEFAULT NULL COMMENT '辅单位',
  `QUALITY_LEVEL` varchar(100) DEFAULT NULL COMMENT '物料质量等级',
  `MATERIAL_ID` varchar(100) DEFAULT NULL COMMENT '物料ID',
  `MATERIAL_BARCODE` varchar(100) DEFAULT NULL COMMENT '物料条码',
  `MATERIAL_LOTCODE` varchar(100) DEFAULT NULL COMMENT '物料批次号',
  `STOCKHAND_ID` varchar(100) DEFAULT NULL COMMENT '库存现有量ID',
  `PRICE_TYPE` varchar(20) DEFAULT NULL COMMENT '计价方式',
  `OBJECT_MAIN_ID` varchar(100) DEFAULT NULL COMMENT '对象MAIN ID',
  `OBJECT_ID` varchar(100) DEFAULT NULL COMMENT '对象ID',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`MATERIALSELECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已选择物料表';

-- ----------------------------
-- Records of baseinfo_materialselect
-- ----------------------------

-- ----------------------------
-- Table structure for `baseinfo_material_class`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_material_class`;
CREATE TABLE `baseinfo_material_class` (
  `MATERIAL_CLASS_ID` varchar(100) NOT NULL,
  `MATERIAL_CLASS_CODE` varchar(100) DEFAULT NULL COMMENT '物料分类编号',
  `MATERIAL_CLASS_NAME` varchar(100) DEFAULT NULL COMMENT '物料分类名称',
  `TYPE` varchar(10) DEFAULT '' COMMENT '分类类型：10配件，20材料,30模具',
  `GPR_RATE` decimal(30,6) DEFAULT NULL COMMENT '毛利率',
  `MONTH_SUM_ITEM` varchar(100) DEFAULT NULL COMMENT '月度汇总项目名称',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态（1：在用；2：停用）',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`MATERIAL_CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料分类信息表';

-- ----------------------------
-- Records of baseinfo_material_class
-- ----------------------------

-- ----------------------------
-- Table structure for `baseinfo_rest_time`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_rest_time`;
CREATE TABLE `baseinfo_rest_time` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `begindatetime` datetime DEFAULT NULL COMMENT '开始休息时间',
  `enddatetime` datetime DEFAULT NULL COMMENT '结束休息时间',
  `diff_minute` int(11) DEFAULT NULL COMMENT '合计休息多少分钟',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='休息日期的记录表';

-- ----------------------------
-- Records of baseinfo_rest_time
-- ----------------------------
INSERT INTO baseinfo_rest_time VALUES ('1', '2017-12-11 13:43:17', '2017-12-13 19:43:38', '3240');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit`;
CREATE TABLE `baseinfo_tradeunit` (
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `TRADEUNIT_CODE` varchar(100) DEFAULT NULL COMMENT '客商编号',
  `TRADEUNIT_NAME` varchar(100) DEFAULT NULL COMMENT '客商名称',
  `TRADEUNIT_ALT` varchar(500) DEFAULT NULL COMMENT '客商简称',
  `AREA_INFO` varchar(200) DEFAULT NULL COMMENT '单位所在区域，记录客户所在地区',
  `LABEL_INFO` varchar(1000) DEFAULT NULL COMMENT '标签信息（用于对客户进行标注）',
  `GRADE_INFO` varchar(30) DEFAULT NULL COMMENT '客户等级：A,B,C',
  `TAX_NO` varchar(200) DEFAULT NULL COMMENT '税号',
  `SALES_MAN` varchar(100) DEFAULT NULL COMMENT '所属业务员ID',
  `TRADEUNIT_TYPE` varchar(100) DEFAULT NULL COMMENT '客商属性（1：客户:2：供应商:3：客户和供应商）',
  `REGISTER_ADDRESS` varchar(100) DEFAULT NULL COMMENT '注册地址',
  `RECORD_FLG` varchar(10) DEFAULT NULL COMMENT '备案标记：10，未备案；20，已经备案',
  `INFO_SOURCE` varchar(500) DEFAULT NULL COMMENT '信息来源',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态（1：在用；2：停用）',
  `BILL_PREFIX` varchar(20) DEFAULT NULL COMMENT '单据号前缀',
  `PARAM_SET` varchar(2000) DEFAULT NULL COMMENT '客商参数设置',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit
-- ----------------------------
INSERT INTO baseinfo_tradeunit VALUES ('001c3bc15b49456a9ab8cf94dc5b44d9', 'TU000585', '温州迈祥电子有限公司', '迈祥', '乐清', null, '', '', '', '1', '乐清市北白象镇旺林村', '10', '洛菲奥', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-04-01 12:41:27', null, null, '低压电器及配件、电子元器件、马达机壳、弹簧片、接线端子、五金冲压件、塑料件制造、加工、销售');
INSERT INTO baseinfo_tradeunit VALUES ('0038f8634443435fa4261a097cbb15e9', 'TU000515', '昆山铨精精密机械有限公司', '昆山铨精', '江苏昆山', null, '', '', '方剑波', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'fangjianbo', '2018-11-03 13:23:47', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('0044232e30034889b4b1888a81f254dd', 'TU000522', '苏州工业园区东晟模具有限公司', '东晟模具', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-11-08 17:28:24', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('019b8b20de1b42c490d8dcba2450dcd8', 'TU000527', '泰州市创新电子有限公司', '创新电子', '江苏泰州', null, 'B', '', '', '1', '江苏省泰州市高港区临港经济园友谊港路189号', '10', '付先生介绍13776319970', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-23 10:58:23', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('03a667ae1b5b495dbc6c123397cb3bb1', 'TU000632', '苏州昀石精密模具有限公司', '苏州昀石', '江苏苏州', null, null, '', '', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-04 18:57:41', 'chenyongqing', '2019-06-04 18:58:13', '');
INSERT INTO baseinfo_tradeunit VALUES ('073861c720bb4868a2055ee6505df942', 'TU000581', '昆山勋望精密模具有限公司', '昆山勋望', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-27 20:41:31', null, null, '3台沙迪克 平磨等    旁边他们朋友有5台冲床');
INSERT INTO baseinfo_tradeunit VALUES ('09955b888b10417d96792603068b2198', 'TU000565', '苏州腾尤电子科技有限公司', '苏州腾尤', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-14 18:56:55', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('0b509a87773f41adbe94c85b67e351f4', 'TU000563', '昆山汇格精密机械有限公司', '汇格', '昆山', null, '', '', '', '1', '', '10', '施宝得王俭华，王总介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-03-13 15:02:02', null, null, '拉伸');
INSERT INTO baseinfo_tradeunit VALUES ('0b824b98d7194ef59d1578043a12015e', 'TU000603', '苏州联晟精密机械厂', '苏州联晟', '江苏苏州', null, '', '', '陈永清', '1', '江苏苏州', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-27 21:39:03', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('0c1b7ddd0b3345f7bea97fb981891f4a', 'TU000531', '莱州市恒锐刀具有限公司', '恒锐刀具', '山东烟台', null, '', '', '', '1', '山东省烟台市莱州市文峰路街道毛家村', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-01-17 13:42:33', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('10bdad8eb6f54ba0ab3dcaafbefc5d36', 'TU000525', '无锡恒联精密机械制造有限公司', '无锡恒联', '江苏无锡', null, 'C', '', '', '1', '江苏无锡梅村工业配套园新锡路203号', '10', '客户介绍，', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-14 22:58:36', null, null, '微研出来的');
INSERT INTO baseinfo_tradeunit VALUES ('145e25d439cc4ba7a3fcaa3b165b80dd', 'TU000629', '昆山九恒昕模具科技有限公司', '昆山九恒昕', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-30 16:15:50', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('147ec133-b24e-11e8-bfc6-00163e10d37d', 'TU000001', '铜陵丰山三佳微电子有限公司 ', '铜陵丰山', '安徽铜陵', null, null, null, null, '1', '铜陵市石城路电子工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec37c-b24e-11e8-bfc6-00163e10d37d', 'TU000002', '常熟泓淋连接技术有限公司', '常熟泓淋', '江苏常熟', null, null, null, null, '1', '常熟市虞山高新开发区柳州路8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec458-b24e-11e8-bfc6-00163e10d37d', 'TU000003', '江苏盛业拉链制造有限公司', '江苏盛业', '江苏常熟', null, null, null, null, '1', '江苏常熟市南三环路八号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec4bd-b24e-11e8-bfc6-00163e10d37d', 'TU000004', '奕东电子（常熟）有限公司 ', '常熟奕东', '江苏常熟', null, null, null, null, '1', '江苏省常熟市董浜镇华烨大道46号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec522-b24e-11e8-bfc6-00163e10d37d', 'TU000005', '常州铂胜工具有限公司', '常州铂胜', '江苏常州', null, null, null, null, '1', '常州市新北区孟河镇小河工业园沿江路188号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec57e-b24e-11e8-bfc6-00163e10d37d', 'TU000006', '常州市天人精密电子科技有限公司', '常州天人', '江苏常州', null, null, null, null, '1', '常州市邹区镇工业区标准厂房10号楼 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec5d5-b24e-11e8-bfc6-00163e10d37d', 'TU000007', '常州思成凯业精密制针有限公司', '常州思成', '江苏常州', null, null, null, null, '1', '江苏省常州市天宁区采华路3号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec629-b24e-11e8-bfc6-00163e10d37d', 'TU000008', '森萨塔科技（常州)有限公司', '常州森萨塔', '江苏常州', null, null, null, null, '1', '江苏省常州市新北区创新大道18号', '20', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec683-b24e-11e8-bfc6-00163e10d37d', 'TU000009', '成都怡得乐电子有限公司', '成都怡得乐', '四川成都', null, null, null, null, '1', '成都市郫县红光镇港通北三路1899号成都技师学院内\n', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec6d6-b24e-11e8-bfc6-00163e10d37d', 'TU000010', '大连锦泽精密模具有限公司', '大连锦泽', '辽宁大连', null, null, null, null, '1', '辽宁大连开发区松翠路6号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec727-b24e-11e8-bfc6-00163e10d37d', 'TU000011', '怡得乐电子（大连）有限公司', '大连怡得乐', '辽宁大连', null, null, null, null, '1', '大连经济开发区双D港数字2路6号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec770-b24e-11e8-bfc6-00163e10d37d', 'TU000012', '东阳市白云创新地毯机械配件厂', '东阳白云', '浙江东阳', null, null, null, null, '1', '浙江省东阳市东景路107号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec7bf-b24e-11e8-bfc6-00163e10d37d', 'TU000013', '杭州东华链条集团有限公司', '杭州东华链条', '浙江杭州', null, null, null, null, '1', '杭州市（临平）余杭区运河镇圣塘河社区（豪迪企业对面）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec83f-b24e-11e8-bfc6-00163e10d37d', 'TU000014', '杭州嘉力讯电子科技有限公司', '杭州嘉力讯', '浙江杭州', null, null, null, null, '1', '杭州市余杭中泰工业园富泰街', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec8e5-b24e-11e8-bfc6-00163e10d37d', 'TU000015', '杭州美磁科技有限公司 ', '杭州美磁', '浙江杭州', null, null, null, null, '1', '浙江省杭州市桐庐县下城路56号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec934-b24e-11e8-bfc6-00163e10d37d', 'TU000016', '杭州天时轻工机械有限公司', '杭州天时', '浙江杭州', null, null, null, null, '1', '杭州临平钱江经济开发区宏达西路20号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec97f-b24e-11e8-bfc6-00163e10d37d', 'TU000017', '杭州统奔模具制造有限公司  ', '杭州统奔', '浙江杭州', null, null, null, null, '1', '浙江省杭州市瓶窑镇凤都工业区       ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ec9cd-b24e-11e8-bfc6-00163e10d37d', 'TU000018', '杭州旭鹤五金有限公司', '杭州旭鹤', '浙江杭州', null, null, null, null, '1', '杭州余杭区余杭镇余昌路52号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eca1d-b24e-11e8-bfc6-00163e10d37d', 'TU000019', '杭州永利百合实业有限公司', '杭州永利百合', '浙江杭州', null, null, null, null, '1', '浙江省杭州市萧山区义桥工业园 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eca6d-b24e-11e8-bfc6-00163e10d37d', 'TU000020', '杭州中好电子有限公司  ', '杭州中好', '浙江杭州', null, null, null, null, '1', '浙江省杭州下沙经济技术开发区松元路328号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecaba-b24e-11e8-bfc6-00163e10d37d', 'TU000021', '怡得乐电子（杭州）有限公司', '杭州怡得乐', '浙江杭州', null, null, null, null, '1', '杭州经济开发区10号大街280号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecb1e-b24e-11e8-bfc6-00163e10d37d', 'TU000022', '安徽大德智能装备有限公司 ', '安徽大德', '安徽合肥', null, null, null, null, '1', '安徽省合肥市高新区文曲路919号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecb66-b24e-11e8-bfc6-00163e10d37d', 'TU000023', '合肥市永达电器有限公司', '合肥永达', '安徽合肥', null, null, null, null, '1', '合肥市经济技术开发区紫云路1288号水安工业园', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecbc1-b24e-11e8-bfc6-00163e10d37d', 'TU000024', '南皮锡峰五金制品有限公司', '南皮锡峰', '河北南皮', null, null, null, null, '1', '河北省沧州市南皮县东环南大街国税局南纸箱厂院内', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecc34-b24e-11e8-bfc6-00163e10d37d', 'TU000025', '光山白鲨针布有限公司', '光山白鲨', '河南光山', null, null, null, null, '1', '河南省光山县南城工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecca6-b24e-11e8-bfc6-00163e10d37d', 'TU000026', '鸿事达纺织针业有限公司', '湖南鸿事达', '湖南常德', null, null, null, null, '1', '湖南省常德市澧县澧澹工业园东区4号楼 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecd8d-b24e-11e8-bfc6-00163e10d37d', 'TU000027', '今朝电气（湖州）有限公司', '今朝电气', '浙江湖州', null, null, null, null, '1', '浙江省湖州市长兴县经济开发区经四路666号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecddf-b24e-11e8-bfc6-00163e10d37d', 'TU000028', '江苏双环齿轮有限公司', '江苏双环', '江苏淮安', null, null, null, null, '1', '淮安市淮安区经济开发区山阳大道72号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ece2e-b24e-11e8-bfc6-00163e10d37d', 'TU000029', '海宁市新艺机电有限公司', '海宁新艺', '浙江嘉兴海宁', null, null, null, null, '1', '浙江省嘉兴市海宁市盐官镇工业园区杏花路6号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ece79-b24e-11e8-bfc6-00163e10d37d', 'TU000030', '江苏宇特光电科技有限公司', '江苏宇特', '江苏盱眙', null, null, null, null, '1', '江苏省盱眙县工业开发区合欢大道19号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eceec-b24e-11e8-bfc6-00163e10d37d', 'TU000031', '江阴凯澄起重设备有限公司', '江阴凯澄', '江苏江阴', null, null, null, null, '1', '中国江苏省江阴市澄江东路18号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecf3d-b24e-11e8-bfc6-00163e10d37d', 'TU000032', '晋江市精帛针织机械有限公司', '晋江精帛', '福建晋江', null, null, null, null, '1', '福建省晋江市深沪镇狮峰工业区精帛企业 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecf88-b24e-11e8-bfc6-00163e10d37d', 'TU000033', '龙泽盛服装有限公司', '福建龙泽盛', '福建晋江', null, null, null, null, '1', '福建省晋江市英林镇旧西湖村 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ecfd5-b24e-11e8-bfc6-00163e10d37d', 'TU000034', '爱亿精密机械（昆山）有限公司', '昆山爱亿', '江苏昆山', null, null, null, null, '1', '江苏省昆山市玉山镇城北优德路69号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed01c-b24e-11e8-bfc6-00163e10d37d', 'TU000035', '宝博精密模具有限公司 ', '昆山宝博', '江苏昆山', null, null, null, null, '1', '昆山市周市镇新镇民管路25号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed067-b24e-11e8-bfc6-00163e10d37d', 'TU000036', '铂翔超精密模具科技（昆山）有限公司', '昆山铂翔超', '江苏昆山', null, '', '', '陈永清', '1', '中国江苏省昆山市长江北路199号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-29 21:06:49', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ed0b2-b24e-11e8-bfc6-00163e10d37d', 'TU000037', '德乾恩精密模具（昆山）有限公司', '昆山德乾恩', '江苏昆山', null, null, null, null, '1', '江苏省昆山市玉山镇环庆路2188号5号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed0fa-b24e-11e8-bfc6-00163e10d37d', 'TU000038', '皇裕精密冲件（昆山）有限公司', '昆山皇裕', '江苏昆山', null, null, null, null, '1', '昆山市昆山市锦溪镇锦发路8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed145-b24e-11e8-bfc6-00163e10d37d', 'TU000039', '江苏华富精密高速模具工程技术研究有限公司', '江苏华富', '江苏昆山', null, null, null, null, '1', '昆山市高科技工业园模具区华富路8号，华富模具公司五金仓库', '20', null, null, null, '{WeightDigit:\'3\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'JSHF\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed193-b24e-11e8-bfc6-00163e10d37d', 'TU000040', '江苏华英光宝科技股份有限公司     ', '江苏华英', '江苏昆山', null, null, null, null, '1', '昆山市城北望山南路239号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed1e5-b24e-11e8-bfc6-00163e10d37d', 'TU000041', '昆山博俊精密模具有限公司', '昆山博俊', '江苏昆山', null, null, null, null, '1', '昆山开发区龙江路88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed22f-b24e-11e8-bfc6-00163e10d37d', 'TU000042', '昆山博朗特精密组件有限公司', '昆山博朗特', '江苏昆山', null, '', '', '陈永清', '1', '昆山市石牌镇新建路218号8栋1楼', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:11:27', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ed27b-b24e-11e8-bfc6-00163e10d37d', 'TU000043', '昆山博思达自动化设备科技有限公司  ', '昆山博思达', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇东平路232号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed2c4-b24e-11e8-bfc6-00163e10d37d', 'TU000044', '昆山诚业德通讯科技有限公司 ', '昆山诚业德', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北高新区玉城南路196号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed312-b24e-11e8-bfc6-00163e10d37d', 'TU000045', '昆山创嘉汇精密机械有限公司 ', '昆山创嘉汇', '江苏昆山', null, '', '', '陈永清', '1', '昆山市永丰余路2555号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-21 22:38:40', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ed36f-b24e-11e8-bfc6-00163e10d37d', 'TU000046', '昆山创联鑫精密模具有限公司', '昆山创联鑫', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇南港阳光西路502号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed3ce-b24e-11e8-bfc6-00163e10d37d', 'TU000047', '昆山德朋电子科技有限公司', '昆山德朋', '江苏昆山', null, null, null, null, '1', '昆山市锦溪镇锦昌路428号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed43a-b24e-11e8-bfc6-00163e10d37d', 'TU000048', '昆山德盛精密模具有限公司 ', '昆山德盛', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北优德路9号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed5f3-b24e-11e8-bfc6-00163e10d37d', 'TU000050', '昆山多平洋精密模具厂', '昆山多平洋', '江苏昆山', null, null, null, null, '1', '昆山市城北模具制造区15幢13号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed660-b24e-11e8-bfc6-00163e10d37d', 'TU000051', '昆山飞亚精密模具有限公司', '昆山飞亚', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北五联路883号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed6c3-b24e-11e8-bfc6-00163e10d37d', 'TU000052', '昆山福尔瑞精密模具有限公司', '昆山福尔瑞', '江苏昆山', null, null, null, null, '1', '昆山市周市镇新纬路202号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed72e-b24e-11e8-bfc6-00163e10d37d', 'TU000053', '昆山富铭创精密模具厂', '昆山富铭创', '江苏昆山', null, null, null, null, '1', '昆山城北路1333号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed7a6-b24e-11e8-bfc6-00163e10d37d', 'TU000054', '昆山海德微电子科技有限公司', '昆山海德微', '江苏昆山', null, null, null, null, '1', null, '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed805-b24e-11e8-bfc6-00163e10d37d', 'TU000055', '昆山禾益精密电子工业有限公司', '昆山禾益', '江苏昆山', null, null, null, null, '1', '昆山市花桥镇花安璐1369号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed84b-b24e-11e8-bfc6-00163e10d37d', 'TU000056', '昆山泓铭精密模具有限公司  ', '昆山泓铭', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市长江北路8号5号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed898-b24e-11e8-bfc6-00163e10d37d', 'TU000057', '昆山鸿茂精密模具有限公司', '昆山鸿茂', '江苏昆山', null, null, null, null, '1', '昆山市五联路', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed8e4-b24e-11e8-bfc6-00163e10d37d', 'TU000058', '昆山华宝德电子科技有限公司', '昆山华宝德', '江苏昆山', null, '', '', '陈永清', '1', '昆山市亿升路48-2号A2栋北门', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:11:12', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ed97f-b24e-11e8-bfc6-00163e10d37d', 'TU000060', '昆山杰冉精密模具有限公司', '昆山杰冉', '江苏昆山', null, null, null, null, '1', '昆山市周市镇茂源路66号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ed9c5-b24e-11e8-bfc6-00163e10d37d', 'TU000061', '昆山杰顺通精密组件有限公司 ', '昆山杰顺通', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇紫竹路1389号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eda0d-b24e-11e8-bfc6-00163e10d37d', 'TU000062', '昆山捷诺尔精密模具有限公司   ', '昆山捷诺尔', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北路1012号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eda53-b24e-11e8-bfc6-00163e10d37d', 'TU000063', '昆山晋基精密机械模具有限公司', '昆山晋基', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇滨江北路150号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eda9e-b24e-11e8-bfc6-00163e10d37d', 'TU000064', '昆山晶瑞鼎电子科技有限公司', '昆山晶瑞鼎', '江苏昆山', null, null, null, null, '1', '昆山市周市鎮橫涇路自由都市二單元7幢805室 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edafd-b24e-11e8-bfc6-00163e10d37d', 'TU000065', '昆山精冲五金有限公司', '昆山精冲', '江苏昆山', null, null, null, null, '1', '昆山市蓬朗镇蓬溪中路12号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edb45-b24e-11e8-bfc6-00163e10d37d', 'TU000066', '昆山精创模具有限公司', '昆山精创', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇东盛路262号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edbd0-b24e-11e8-bfc6-00163e10d37d', 'TU000067', '昆山久锦精密模具有限公司', '昆山久锦', '江苏昆山', null, null, null, null, '1', '昆山市玉城镇北门路3888号模具制造区19幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edc1d-b24e-11e8-bfc6-00163e10d37d', 'TU000068', '昆山钧硕模具有限公司', '昆山钧硕', '江苏昆山', null, null, null, null, '1', '昆山市迎宾路10号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edcae-b24e-11e8-bfc6-00163e10d37d', 'TU000070', '昆山科森科技股份有限公司 ', '昆山科森', '江苏昆山', null, null, null, null, '1', '昆山开发区高科技工业园汉浦路1999号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edcf4-b24e-11e8-bfc6-00163e10d37d', 'TU000071', '昆山霖茂精密模具有限公司   ', '昆山霖茂', '江苏昆山', null, null, null, null, '1', '昆山城北富宏路63号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edd3c-b24e-11e8-bfc6-00163e10d37d', 'TU000072', '昆山龙仕达电子材料有限公司', '昆山龙仕达', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇花苑路1220号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edd88-b24e-11e8-bfc6-00163e10d37d', 'TU000073', '昆山麦克诺机械有限公司 ', '昆山麦克诺', '江苏昆山', null, '', '', '陈永清', '1', '昆山市周市镇金茂工业园区环球路358号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:16:04', '');
INSERT INTO baseinfo_tradeunit VALUES ('147eddd2-b24e-11e8-bfc6-00163e10d37d', 'TU000074', '昆山贸德精密模具有限公司', '昆山贸德', '江苏昆山', null, null, null, null, '1', '昆山市高科技工业园模具路55号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ede1a-b24e-11e8-bfc6-00163e10d37d', 'TU000075', '昆山纳比特电子科技有限公司', '昆山纳比特', '江苏昆山', null, '', '', '陈永清', '1', '昆山石牌东岳路369号 ', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:15:04', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ede63-b24e-11e8-bfc6-00163e10d37d', 'TU000076', '昆山品嘉上电子科技有限公司', '昆山品嘉上', '江苏昆山', null, null, null, null, '1', '江苏省昆山市玉山镇模具工业园区亿升路13号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edeb0-b24e-11e8-bfc6-00163e10d37d', 'TU000077', '昆山奇美佳电子科技有限公司', '昆山奇美佳', '江苏昆山', null, '', '', '陈永清', '1', '昆山市富士康路1285号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:12:19', '');
INSERT INTO baseinfo_tradeunit VALUES ('147edefc-b24e-11e8-bfc6-00163e10d37d', 'TU000078', '昆山庆威精密模具有限公司', '昆山庆威', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇水秀路1888号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edf49-b24e-11e8-bfc6-00163e10d37d', 'TU000079', '昆山全方位精密模具有限公司', '昆山全方位', '江苏昆山', null, null, null, null, '1', '昆山市水秀路1258号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147edf91-b24e-11e8-bfc6-00163e10d37d', 'TU000080', '昆山仁飞精密模具有限公司', '昆山仁飞', '江苏昆山', null, '', '', '陈永清', '1', '昆山市中环路115号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:10:12', '');
INSERT INTO baseinfo_tradeunit VALUES ('147edfd8-b24e-11e8-bfc6-00163e10d37d', 'TU000081', '昆山仁硕精密模具有限公司', '昆山仁硕', '江苏昆山', null, null, null, null, '1', '昆山市环庆路2518号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee01b-b24e-11e8-bfc6-00163e10d37d', 'TU000082', '昆山日腾精密模具有限公司', '昆山日腾', '江苏昆山', null, null, null, null, '1', '昆山市玉城南路208号', '20', null, null, null, '{WeightDigit:\'3\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'0\',Template:\'\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee063-b24e-11e8-bfc6-00163e10d37d', 'TU000083', '昆山瑞格电子科技有限公司', '昆山瑞格', '江苏昆山', null, null, null, null, '1', '昆山市都市路88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee0af-b24e-11e8-bfc6-00163e10d37d', 'TU000084', '昆山瑞杰精密模具有限公司 ', '昆山瑞杰', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇虹桥路1188号E栋', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee0fd-b24e-11e8-bfc6-00163e10d37d', 'TU000085', '昆山瑞捷精密模具有限公司', '昆山瑞捷', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇虹桥路1188号E栋', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee143-b24e-11e8-bfc6-00163e10d37d', 'TU000086', '昆山三景科技股份有限公司 ', '昆山三景', '江苏昆山', null, null, null, null, '1', '昆山市经济开发区三港路423号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee18b-b24e-11e8-bfc6-00163e10d37d', 'TU000087', '昆山蜃悉精密模具有限公司', '昆山蜃悉', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇万步路虹桥新村179号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee1d3-b24e-11e8-bfc6-00163e10d37d', 'TU000088', '昆山施宝得精密模具有限公司', '昆山施宝得', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇利尔路168号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee21d-b24e-11e8-bfc6-00163e10d37d', 'TU000089', '昆山世代光摩精密机械有限公司  ', '昆山世代光摩', '江苏昆山', null, '', '', '陈永清', '1', '昆山市玉山镇富士康路1388号1号厂房', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:10:24', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ee268-b24e-11e8-bfc6-00163e10d37d', 'TU000090', '昆山世瑞精密模具有限公司', '昆山世瑞', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇苇城路1436号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee2ad-b24e-11e8-bfc6-00163e10d37d', 'TU000091', '昆山市巴城镇俊翔精密模具厂', '昆山俊翔', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇光晟路339号5号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee2ef-b24e-11e8-bfc6-00163e10d37d', 'TU000092', '昆山迪乐宝精密科技有限公司  ', '昆山迪乐宝', '江苏昆山', null, null, null, null, '1', '江苏省昆山市巴城镇石牌工业园东岳路201号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee338-b24e-11e8-bfc6-00163e10d37d', 'TU000093', '昆山市和尔胜五金制品有限公司', '昆山和尔胜', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇滨江北路422号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee382-b24e-11e8-bfc6-00163e10d37d', 'TU000094', '昆山市杰瑞昌精密模具有限公司', '昆山杰瑞昌', '江苏昆山', null, null, null, null, '1', '昆山市环庆路2488号A栋楼北二楼', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee8e0-b24e-11e8-bfc6-00163e10d37d', 'TU000095', '昆山市霹基精密模具有限公司', '昆山霹基', '江苏昆山', null, null, null, null, '1', '昆山市陆扬友谊北路153号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee93f-b24e-11e8-bfc6-00163e10d37d', 'TU000096', '昆山市文唐五金模具有限公司 ', '昆山文唐', '江苏昆山', null, null, null, null, '1', '昆山市城北望山北路388號', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ee98f-b24e-11e8-bfc6-00163e10d37d', 'TU000097', '昆山市兴凯胜精密模具有限公司', '昆山兴凯胜', '江苏昆山', null, '', '', '陈永清', '1', '昆山市巴城镇仁和路6号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:12:46', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ee9dd-b24e-11e8-bfc6-00163e10d37d', 'TU000098', '昆山市旭富康精密模具有限公司', '昆山旭富康', '江苏昆山', null, null, null, null, '1', '昆山市城北望山南路239号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eea2b-b24e-11e8-bfc6-00163e10d37d', 'TU000099', '昆山市玉山镇宏顶精密模具厂', '昆山宏顶', '江苏昆山', null, null, null, null, '1', '昆山市周市镇朱家湾路7号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eea77-b24e-11e8-bfc6-00163e10d37d', 'TU000100', '昆山市玉山镇华容道精密模具厂', '昆山华容道', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇古城路4009号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeac2-b24e-11e8-bfc6-00163e10d37d', 'TU000101', '昆山市卓凡精密模具厂', '昆山卓凡', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北玉城南路129号4幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeb0c-b24e-11e8-bfc6-00163e10d37d', 'TU000102', '昆山苏力电子科技有限公司', '昆山苏力', '江苏昆山', null, null, null, null, '1', '昆山市千灯镇善浦西路28-A', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeb59-b24e-11e8-bfc6-00163e10d37d', 'TU000103', '昆山苏阳精密模具有限公司', '昆山苏阳', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇大市南吉山村中吉山路12号1号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeba0-b24e-11e8-bfc6-00163e10d37d', 'TU000104', '昆山泰瑞精密零组件有限公司 ', '昆山泰瑞', '江苏昆山', null, null, null, null, '1', '昆山市周市镇许龚路106号近青阳北路与长兴路交叉口）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eebe7-b24e-11e8-bfc6-00163e10d37d', 'TU000105', '昆山天洋热熔胶有限公司', '昆山天洋', '江苏昆山', null, null, null, null, '1', '昆山市千灯镇石浦汶浦东路366号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eec30-b24e-11e8-bfc6-00163e10d37d', 'TU000106', '昆山五环精工模具有限公司', '昆山五环', '江苏昆山', null, null, null, null, '1', '昆山市中环路163号2号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eec79-b24e-11e8-bfc6-00163e10d37d', 'TU000107', '昆山欣宏康精密模具有限公司  ', '昆山欣宏康', '江苏昆山', null, null, null, null, '1', '昆山市周市镇陆扬富强路68-1幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eecc2-b24e-11e8-bfc6-00163e10d37d', 'TU000108', '昆山新远征精密机械有限公司 ', '昆山新远征', '江苏昆山', null, null, null, null, '1', '昆山市红杨路1100号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eed97-b24e-11e8-bfc6-00163e10d37d', 'TU000111', '昆山勖研精密模具公司  ', '昆山勖研', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇同心路2068号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eede1-b24e-11e8-bfc6-00163e10d37d', 'TU000112', '昆山研讯精密模具有限公司', '昆山研讯', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇同心路2068号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eee21-b24e-11e8-bfc6-00163e10d37d', 'TU000113', '昆山扬煜精密组件有限公司', '昆山扬煜', '江苏昆山', null, null, null, null, '1', '昆山市城北望山北路455号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eee66-b24e-11e8-bfc6-00163e10d37d', 'TU000114', '昆山易诺迪模具五金有限公司', '昆山易诺迪', '江苏昆山', null, null, null, null, '1', '昆山市石牌镇相石路1288号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeeb3-b24e-11e8-bfc6-00163e10d37d', 'TU000115', '昆山优瑞全精密组件有限公司', '昆山优瑞全', '江苏昆山', null, null, null, null, '1', '昆山市周市镇陆扬富强路68号1幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eeefc-b24e-11e8-bfc6-00163e10d37d', 'TU000116', '昆山宇鑫泰精密模具公司', '昆山宇鑫泰', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇城北夏浜路20号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eef43-b24e-11e8-bfc6-00163e10d37d', 'TU000117', '昆山昱安精密模具有限公司 ', '昆山昱安', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇诚翔路9号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eef89-b24e-11e8-bfc6-00163e10d37d', 'TU000118', '昆山长盈精密技术有限公司', '昆山长盈', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇滨江北路100号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eefd3-b24e-11e8-bfc6-00163e10d37d', 'TU000119', '昆山致贸精密模具有限公司', '昆山致贸', '江苏昆山', null, null, null, null, '1', '昆山市巴城镇正义环城西路12号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef01a-b24e-11e8-bfc6-00163e10d37d', 'TU000120', '昆山众异特机械工业有限公司', '昆山众异特', '江苏昆山', null, null, null, null, '1', '昆山市锦溪镇锦昌路181号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef05c-b24e-11e8-bfc6-00163e10d37d', 'TU000121', '昆山准威精密模具有限公司', '昆山准威', '江苏昆山', null, null, null, null, '1', '昆山市淀山湖镇南苑路158号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef0a2-b24e-11e8-bfc6-00163e10d37d', 'TU000122', '乐清市百艺精密五金科技有限公司 ', '乐清百艺', '浙江乐清', null, null, null, null, '1', '浙江省温州市乐清市虹桥镇模具中心建虹路1号C幢 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef0ed-b24e-11e8-bfc6-00163e10d37d', 'TU000123', '轮兴机械工业（昆山）有限公司', '昆山轮兴', '江苏昆山', null, null, null, null, '1', '昆山市张浦镇港浦东路56号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef135-b24e-11e8-bfc6-00163e10d37d', 'TU000124', '日佳力机电工业(昆山)有限公司', '昆山日佳力', '江苏昆山', null, null, null, null, '1', '昆山市花桥镇顺杨路101号', '20', null, null, null, '{WeightDigit:\'3\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'RJL\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef17b-b24e-11e8-bfc6-00163e10d37d', 'TU000125', '唯安科技有限公司', '唯安科技', '江苏昆山', null, null, null, null, '1', '昆山开发区高科技工业园汉浦路1999号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef1c0-b24e-11e8-bfc6-00163e10d37d', 'TU000126', '旭昆精密模具有限公司', '昆山旭昆', '江苏昆山', null, '', '', '陈永清', '1', '昆山城北高科技园中环路9号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-21 22:37:27', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ef20d-b24e-11e8-bfc6-00163e10d37d', 'TU000127', '勖祥精密模具（昆山）有限公司', '昆山勖祥', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市高科技工业园模具路169号 ', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:05:56', '');
INSERT INTO baseinfo_tradeunit VALUES ('147ef253-b24e-11e8-bfc6-00163e10d37d', 'TU000128', '乐清市方氏电气有限公司', '乐清方氏', '浙江乐清', null, null, null, null, '1', '浙江省乐清市天成工业区方氏电气收', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef296-b24e-11e8-bfc6-00163e10d37d', 'TU000129', '乐清市联茂电气科技有限公司', '乐清联茂', '浙江乐清', null, null, null, null, '1', '浙江乐清市柳市镇七西村', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef2f0-b24e-11e8-bfc6-00163e10d37d', 'TU000130', '乐清市强锐电子有限公司', '乐清强锐', '浙江乐清', null, null, null, null, '1', '乐清市清江镇渡头村南街24号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef334-b24e-11e8-bfc6-00163e10d37d', 'TU000131', '乐清万杰电子有限公司', '乐清万杰', '浙江乐清', null, null, null, null, '1', '浙江省乐清市石帆镇下河头村路口 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef379-b24e-11e8-bfc6-00163e10d37d', 'TU000132', '温州市群英电子有限公司', '温州群英', '浙江乐清', null, null, null, null, '1', '浙江省乐清市天成工业区东区北一座', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef3bf-b24e-11e8-bfc6-00163e10d37d', 'TU000133', '宇辉电子有限公司 ', '宇辉电子', '浙江乐清', null, null, null, null, '1', '乐清市天城工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef45b-b24e-11e8-bfc6-00163e10d37d', 'TU000134', '连云港天成精密机械模具有限公司', '连云港天成', '江苏连云港', null, null, null, null, '1', '江苏东海县东开发区明珠路198号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef4aa-b24e-11e8-bfc6-00163e10d37d', 'TU000135', '本科电器有限公司', '福建本科', '福建南安', null, null, null, null, '1', '福建南安市成功开发区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef4f6-b24e-11e8-bfc6-00163e10d37d', 'TU000136', '博世汽车技术服务（中国）有限公司', '博世汽车', '江苏南京', null, null, null, null, '1', '江苏省南京市西夏区润博路1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef53c-b24e-11e8-bfc6-00163e10d37d', 'TU000137', '南京航手机电有限公司', '南京航手', '江苏南京', null, null, null, null, '1', '南京市鼓楼区中山北路309号虎踞楼饭店1217座', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef57f-b24e-11e8-bfc6-00163e10d37d', 'TU000138', '南京通东机电设备有限公司', '南京通东', '江苏南京', null, null, null, null, '1', '江苏省南京市马群创业园28号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef5c7-b24e-11e8-bfc6-00163e10d37d', 'TU000139', '金轮针布（江苏）有限公司', '江苏南通金轮针布', '江苏南通', null, null, null, null, '1', '江苏省南通经济技术开发区滨水卢6号柳 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef63e-b24e-11e8-bfc6-00163e10d37d', 'TU000140', '南通东洋精密模具有限公司', '南通东洋', '江苏南通', null, null, null, null, '1', '江苏省如皋市磨头镇磨头居委会 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef692-b24e-11e8-bfc6-00163e10d37d', 'TU000141', '南通三角洲超硬刀具有限公司 ', '南通三角洲', '江苏南通', null, null, null, null, '1', '南通市人民中路127号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef6da-b24e-11e8-bfc6-00163e10d37d', 'TU000142', '小巧精密科技（南通）有限公司', '南通小巧', '江苏南通', null, null, null, null, '1', '江苏南通经济技术开发区青岛路2号B座标准厂', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef93f-b24e-11e8-bfc6-00163e10d37d', 'TU000143', '华通模具厂', '慈溪华通', '浙江慈溪', null, null, null, null, '1', '慈溪市天元镇坛北路115号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef989-b24e-11e8-bfc6-00163e10d37d', 'TU000144', '宁波埃生达精密模具有限公司 ', '宁波埃生达', '浙江宁波', null, null, null, null, '1', '宁波北仑小港江滨路329号    ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147ef9cc-b24e-11e8-bfc6-00163e10d37d', 'TU000145', '宁波埃斯科光电有限公司', '宁波埃斯科', '浙江宁波', null, null, null, null, '1', '宁波经济技术开发区G6义成路88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efa13-b24e-11e8-bfc6-00163e10d37d', 'TU000146', '宁波华龙电子股份有限公司', '宁波华龙', '浙江宁波', null, null, null, null, '1', '宁波市东钱湖旅游度假区旧宅村工业园', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efa59-b24e-11e8-bfc6-00163e10d37d', 'TU000147', '宁波建欣精密模具有限公司', '宁波建欣', '浙江宁波', null, null, null, null, '1', '宁波宁海县西店镇海张村', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efa9e-b24e-11e8-bfc6-00163e10d37d', 'TU000148', '宁波前锋精密模具有限公司', '宁波前锋', '浙江宁波', null, null, null, null, '1', '中国浙江省宁波市北仑区大港工业城北海路3号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efae4-b24e-11e8-bfc6-00163e10d37d', 'TU000149', '宁波市江北阿军模具制造厂', '宁波阿军', '浙江宁波', null, null, null, null, '1', '宁波市江北区洪塘镇大朗家村畈立 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efb27-b24e-11e8-bfc6-00163e10d37d', 'TU000150', '宁波市江北区双剑剃须刀有限公司', '宁波双剑', '浙江宁波', null, null, null, null, '1', '宁波市江北区洪塘街道赵家村', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efb67-b24e-11e8-bfc6-00163e10d37d', 'TU000151', '宁波市鄞州汇金属制品有限公司 ', '宁波鄞州汇', '浙江宁波', null, null, null, null, '1', '浙江省宁波市鄞州区高桥镇合心村兴业路3号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efc4a-b24e-11e8-bfc6-00163e10d37d', 'TU000152', '宁波市鄞州精艺机电厂', '宁波精艺', '浙江宁波', null, null, null, null, '1', '宁波市鄞州区集土港工业园区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efcb9-b24e-11e8-bfc6-00163e10d37d', 'TU000153', '宁波速普电子有限公司', '宁波速普', '浙江宁波', null, null, null, null, '1', '宁波市慈溪坎墩兴镇街625号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efd1f-b24e-11e8-bfc6-00163e10d37d', 'TU000154', '宁波天波港联电子有限公司', '宁波天波港联', '浙江宁波', null, null, null, null, '1', '宁波市横溪工业园', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efd7e-b24e-11e8-bfc6-00163e10d37d', 'TU000155', '宁波中瑞精密技术有限公司', '宁波中瑞', '浙江宁波', null, null, null, null, '1', '宁波市慈禧市长河镇芦庵公路旁中兴电子厂', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efde5-b24e-11e8-bfc6-00163e10d37d', 'TU000156', '中美合资金华辉煌三联工具实业有限公司', '金华辉煌', '浙江金华', null, null, null, null, '1', '浙江省金华市神丽路1078号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efe46-b24e-11e8-bfc6-00163e10d37d', 'TU000157', '启东乾朔电子有限公司   ', '启东乾朔', '江苏南通启东', null, null, null, null, '1', '江苏省启东经济开发区华石南路688号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efea4-b24e-11e8-bfc6-00163e10d37d', 'TU000158', '浙江康盛股份有限公司', '浙江康盛', '浙江淳安', null, null, null, null, '1', '浙江省淳安县千岛湖镇康盛路268号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147efeff-b24e-11e8-bfc6-00163e10d37d', 'TU000159', '青岛埃科斯精密机械有限公司', '青岛埃科斯', '山东青岛', null, null, null, null, '1', '青岛市城阳区空港工业园长白上路1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147eff5c-b24e-11e8-bfc6-00163e10d37d', 'TU000160', '青岛宝拓精密模具有限公司', '青岛宝拓', '山东青岛', null, null, null, null, '1', '青岛市城阳区夏庄电子信息产业园书虹路7号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147effbb-b24e-11e8-bfc6-00163e10d37d', 'TU000161', '青岛三聚隆精密模具有限公司', '青岛三聚隆', '山东青岛', null, null, null, null, '1', '山东青岛城阳区赵红路裕亭路', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0060-b24e-11e8-bfc6-00163e10d37d', 'TU000163', '青岛利华鑫机电有限公司', '青岛利华鑫', '山东青岛', null, null, null, null, '1', '青岛市城阳区夏庄电子信息产业园书虹路7号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f00a0-b24e-11e8-bfc6-00163e10d37d', 'TU000164', '青岛壹广机电有限公司', '青岛壹广', '山东青岛', null, null, null, null, '1', '青岛市城阳区夏庄电子信息产业园书虹路7号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f00e3-b24e-11e8-bfc6-00163e10d37d', 'TU000165', '青岛义顺宝机电有限公司', '青岛义顺宝', '山东青岛', null, null, null, null, '1', '青岛市城阳区夏庄电子信息产业园书虹路7号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0122-b24e-11e8-bfc6-00163e10d37d', 'TU000166', '青岛泰科电子有限公司', '青岛泰科', '山东青岛', null, null, null, null, '1', '山东省青岛市城阳区河套出口加工区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0161-b24e-11e8-bfc6-00163e10d37d', 'TU000167', '厦门富力或姆光电技术有限公司', '厦门富力或姆', '福建厦门', null, null, null, null, '1', '厦门市海沧区新阳街道新美路26号B栋', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f01a0-b24e-11e8-bfc6-00163e10d37d', 'TU000168', '厦门合兴诚精密模具有限公司', '厦门合兴诚', '福建厦门', null, null, null, null, '1', '厦门市杏林锦亭北路233号一层  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f01e6-b24e-11e8-bfc6-00163e10d37d', 'TU000169', '厦门加新精密金属有限公司', '厦门加新', '福建厦门', null, null, null, null, '1', '厦门市同安区西柯镇环东海域湖里工业园33号楼', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0229-b24e-11e8-bfc6-00163e10d37d', 'TU000170', '厦门捷昕精密科技有限公司', '厦门捷昕', '福建厦门', null, null, null, null, '1', '厦门市湖里区湖里大道78号万山厂房1层', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0269-b24e-11e8-bfc6-00163e10d37d', 'TU000171', '厦门金源海精密模具有限公司 ', '厦门金源海', '福建厦门', null, null, null, null, '1', '厦门火炬高新区（翔安）产业区翔虹路26号102单元', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f02ae-b24e-11e8-bfc6-00163e10d37d', 'TU000172', '厦门金越电器有限公司', '厦门金越', '福建厦门', null, null, null, null, '1', '厦门市集美区北部工业区孙坂南路91-101号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f02eb-b24e-11e8-bfc6-00163e10d37d', 'TU000173', '厦门锐腾电子科技有限公司', '厦门锐腾', '福建厦门', null, null, null, null, '1', '厦门市集美区杏北三路19号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f032d-b24e-11e8-bfc6-00163e10d37d', 'TU000174', '厦门市特克模具工业有限公司', '厦门特克', '福建厦门', null, null, null, null, '1', '厦门市湖里区湖里大道40号A栋1F', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f036c-b24e-11e8-bfc6-00163e10d37d', 'TU000175', '厦门鑫河机电科技有限公司  ', '厦门鑫河', '福建厦门', null, null, null, null, '1', '厦门市集美区金龙路891号1楼（汽车工业城零部件配套中心', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f03ac-b24e-11e8-bfc6-00163e10d37d', 'TU000176', '厦门奕铨精密五金有限公司 ', '厦门奕铨', '福建厦门', null, null, null, null, '1', '福建省厦门市集美区杏林中亚城锦园西二路502号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f03ee-b24e-11e8-bfc6-00163e10d37d', 'TU000177', '厦门永红科技有限公司', '厦门永红', '福建厦门', null, null, null, null, '1', '厦门市翔安区马巷镇舫阳西路11-29号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0431-b24e-11e8-bfc6-00163e10d37d', 'TU000178', '百盛精工精密模具科技（枣庄）有限公司', '枣庄百盛', '山东枣庄', null, null, null, null, '1', '山东省枣庄市薛城区常庄镇永福南路6号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f046f-b24e-11e8-bfc6-00163e10d37d', 'TU000179', '临朐县祥源包装厂', '山东祥源', '山东潍坊', null, null, null, null, '1', '山东省潍坊市临朐县冶源镇米山工业园区 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f04ac-b24e-11e8-bfc6-00163e10d37d', 'TU000180', '山东东阿兴达保持器有限公司', '山东东阿兴达', '山东东阿', null, null, null, null, '1', '山东省东阿县环球商城仿估街23号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f04ea-b24e-11e8-bfc6-00163e10d37d', 'TU000181', '山东丽鹏股份有限公司 ', '山东丽鹏', '山东烟台', null, null, null, null, '1', '山东省烟台市牟平区姜各庄街道', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f052b-b24e-11e8-bfc6-00163e10d37d', 'TU000182', '德尔福中央电气（上海）有限公司', '上海德尔福', '上海嘉定', null, null, null, null, '1', '上海市嘉定区安亭园国路200号', '20', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f056a-b24e-11e8-bfc6-00163e10d37d', 'TU000183', '莱特巴斯光学仪器（上海）有限公司', '上海莱特巴斯', '上海嘉定', null, null, null, null, '1', '上海市嘉定工业区叶城路1211号3撞 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f05a9-b24e-11e8-bfc6-00163e10d37d', 'TU000184', '日马精密电子（上海）有限公司', '上海日马', '上海松江', null, null, null, null, '1', '上海市松江区新桥镇春申村申徐路8号9幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f05e5-b24e-11e8-bfc6-00163e10d37d', 'TU000185', '上海艾查斯贸易有限公司', '上海艾查斯', '上海长宁', null, null, null, null, '1', '上海市长宁区虹桥路996弄71号5楼503室', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f062a-b24e-11e8-bfc6-00163e10d37d', 'TU000186', '上海贝奇精密机械有限公司', '上海贝奇', '上海松江', null, null, null, null, '1', '上海市松江区九亭镇九富经济开发区易富路531弄1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0669-b24e-11e8-bfc6-00163e10d37d', 'TU000187', '上海斌跃精密机械有限公司 ', '上海斌跃', '上海嘉定', null, null, null, null, '1', '上海市嘉定区外青松公路长泾村580号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f06ad-b24e-11e8-bfc6-00163e10d37d', 'TU000188', '上海博绝精密模具有限公司', '上海博绝', '上海嘉定', null, null, null, null, '1', '上海是嘉定区沪宜公路5846号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f06ef-b24e-11e8-bfc6-00163e10d37d', 'TU000189', '上海晨昌精密模具有限公司', '上海晨昌', '上海嘉定', null, null, null, null, '1', '上海市嘉定区安亭汽车城百安公路1558号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f072d-b24e-11e8-bfc6-00163e10d37d', 'TU000190', '上海杜文有限公司', '上海杜文', '上海杨浦', null, null, null, null, '1', '上海市杨浦区宁武路269号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f076b-b24e-11e8-bfc6-00163e10d37d', 'TU000191', '上海丰威织针制造有限公司', '上海丰威', '上海松江', null, '', '', '', '1', '上海市松江区九亭镇伴亭路15号  ', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'zhudafeng', '2018-09-18 23:08:21', '');
INSERT INTO baseinfo_tradeunit VALUES ('147f07b1-b24e-11e8-bfc6-00163e10d37d', 'TU000192', '上海富有精密钨钢有限公司 ', '上海富有', '上海松江', null, null, null, null, '1', '上海市松江区洞泾工业二区洞库路51号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0805-b24e-11e8-bfc6-00163e10d37d', 'TU000193', '上海航传电子科技有限公司 ', '上海航传', '上海闵行', null, null, null, null, '1', '上海市闵行区紫星路666号1号楼5楼 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0886-b24e-11e8-bfc6-00163e10d37d', 'TU000195', '上海华奥精密模具有限公司', '上海华奥', '上海闵行', null, '', '', '陈永清', '1', '上海市闵行区银都路508弄18号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 20:41:54', '');
INSERT INTO baseinfo_tradeunit VALUES ('147f08cc-b24e-11e8-bfc6-00163e10d37d', 'TU000196', '上海淮轩自动化设备有限公司', '上海淮轩', '上海黄埔', null, null, null, null, '1', '上海市广西北路528号811室', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f090b-b24e-11e8-bfc6-00163e10d37d', 'TU000197', '上海集强金属工业有限公司', '上海集强', '上海松江', null, null, null, null, '1', '上海市松江区小昆山镇昆港路889号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f094c-b24e-11e8-bfc6-00163e10d37d', 'TU000198', '上海杰雁精密模具有限公司', '上海杰雁', '上海浦东', null, null, null, null, '1', '上海市浦东新区周浦镇瓦屑镇北路1号32丙室', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f098b-b24e-11e8-bfc6-00163e10d37d', 'TU000199', '上海晶阁电子有限公司 ', '上海晶阁', '上海松江', null, null, null, null, '1', '上海松江区李塔汇镇育新路211弄恒瑞都市园7幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f09d2-b24e-11e8-bfc6-00163e10d37d', 'TU000200', '上海精典精密模具有限公司', '上海精典', '上海嘉定', null, null, null, null, '1', '上海市嘉定区江桥镇封杨路1708号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0a12-b24e-11e8-bfc6-00163e10d37d', 'TU000201', '上海凯门希贸易有限公司', '上海凯门希', '上海徐汇', null, null, null, null, '1', '上海市徐汇区龙吴路1500号A楼315室', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0a55-b24e-11e8-bfc6-00163e10d37d', 'TU000202', '上海柯升精密模具厂', '上海柯升', '上海嘉定', null, null, null, null, '1', '上海市嘉定区黄渡镇春意路277号5F楼', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0aa3-b24e-11e8-bfc6-00163e10d37d', 'TU000203', '上海徕木电子股份有限公司', '上海徕木', '上海松江', null, null, null, null, '1', '上海市松江区洞泾镇洞薛路651弄88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0b40-b24e-11e8-bfc6-00163e10d37d', 'TU000205', '上海民一模具有限公司', '上海民一', '上海普陀', null, null, null, null, '1', '上海市普陀区真南路635弄99支弄95号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0b80-b24e-11e8-bfc6-00163e10d37d', 'TU000206', '上海耐锋精密工具有限公司', '上海耐锋', '上海嘉定', null, null, null, null, '1', '上海市嘉定区安亭镇黄渡工业园区星塔路1102号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0bbe-b24e-11e8-bfc6-00163e10d37d', 'TU000207', '上海青浦启佳模具厂 ', '上海青浦启佳', '上海青浦', null, null, null, null, '1', '上海青浦燕怡橡塑五金厂', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0bfb-b24e-11e8-bfc6-00163e10d37d', 'TU000208', '上海庆德纺织有限公司', '上海庆德', '上海青浦', null, null, null, '陈永清', '1', '上海市青浦区赵巷镇崧达路395号', '20', null, null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-06-03 14:30:10', null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0c42-b24e-11e8-bfc6-00163e10d37d', 'TU000209', '上海锐昌电子有限公司', '上海锐昌', '上海松江', null, null, null, null, '1', '上海市松江区新桥这句话春申村金都西路889号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0c81-b24e-11e8-bfc6-00163e10d37d', 'TU000210', '上海瑞斯乐复合金属材料有限公司', '上海瑞斯乐', '上海松江', null, null, null, null, '1', '上海市松江区车墩镇欣浪路155号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0cc5-b24e-11e8-bfc6-00163e10d37d', 'TU000211', '上海天仪精密模具有限公司', '上海天仪', '上海浦东', null, null, null, null, '1', '上海市浦东新区浦东南路2230号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0d08-b24e-11e8-bfc6-00163e10d37d', 'TU000212', '上海天泽精密模具有限公司', '上海天泽', '上海嘉定', null, null, null, null, '1', '上海市嘉定区外青松公路长泾村588号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0d44-b24e-11e8-bfc6-00163e10d37d', 'TU000213', '上海天湛精密机械有限公司', '上海天湛', '上海嘉定', null, null, null, null, '1', '上海南翔德力西路128号7号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0d81-b24e-11e8-bfc6-00163e10d37d', 'TU000214', '上海维科精密模塑有限公司', '上海维科', '上海闵行', null, null, null, null, '1', '上海市华泾路1250号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0dc8-b24e-11e8-bfc6-00163e10d37d', 'TU000215', '上海西渥电器有限公司', '上海西渥', '上海嘉定', null, null, null, null, '1', '上海是嘉定区马陆镇丰年路201号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0e08-b24e-11e8-bfc6-00163e10d37d', 'TU000216', '上海心诚工具有限公司', '上海心诚', '上海宝山', null, null, null, null, '1', '上海市宝山区长江南路188弄7号楼 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0e4a-b24e-11e8-bfc6-00163e10d37d', 'TU000217', '上海鑫勋模具有限公司 ', '上海鑫勋', '上海浦东', null, null, null, null, '1', '上海市浦东新区高东镇赵高路1008号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0ecc-b24e-11e8-bfc6-00163e10d37d', 'TU000219', '上海银点电子科技有限公司', '上海银点', '上海浦东', null, null, null, null, '1', '上海市浦东新区东胜路1095号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0f09-b24e-11e8-bfc6-00163e10d37d', 'TU000220', '上海鹰卫精密机械有限公司', '上海鹰卫', '上海嘉定', null, null, null, null, '1', '上海市嘉定区马陆镇陈宝路501号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0f4e-b24e-11e8-bfc6-00163e10d37d', 'TU000221', '上海应用精密制造有限公司', '上海应用', '上海闵行', null, null, null, null, '1', '上海市闵行区莘庄镇友东路288号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0f8e-b24e-11e8-bfc6-00163e10d37d', 'TU000222', '上海优瑞杰精密机械制造有限公司  ', '上海优瑞杰 ', '上海松江', null, null, null, null, '1', '上海市松江区申北五路21号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f0fd1-b24e-11e8-bfc6-00163e10d37d', 'TU000223', '上海宇声针业有限公司', '上海宇声', '上海嘉定', null, null, null, null, '1', '上海市嘉定区昌翔路2弄8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1013-b24e-11e8-bfc6-00163e10d37d', 'TU000224', '上海煜舜精密模具厂', '上海煜舜', '上海松江', null, '', '', '陈永清', '1', '上海市松江区石湖荡镇李塔汇塔中路39号 ', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 20:42:23', '');
INSERT INTO baseinfo_tradeunit VALUES ('147f1050-b24e-11e8-bfc6-00163e10d37d', 'TU000225', '上海渊虹超高压水射流技术有限公司', '上海渊虹超', '上海奉贤', null, null, null, null, '1', '上海奉贤区南桥镇沪杭公路1028号（近平庄公路）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f108f-b24e-11e8-bfc6-00163e10d37d', 'TU000226', '拓帕实业（上海）有限公司', '上海拓帕', '上海嘉定', null, null, null, null, '1', '上海市嘉定区曹安公路4042号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f10d4-b24e-11e8-bfc6-00163e10d37d', 'TU000227', '依工汽车零部件（上海）有限公司', '上海依工', '上海青浦', null, null, null, null, '1', '青浦工业园区久业路768弄168号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1113-b24e-11e8-bfc6-00163e10d37d', 'TU000228', '石狮市汇星机械有限公司 ', '石狮汇星', '山东石狮', null, null, null, null, '1', '石狮市石湖港工业区 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1156-b24e-11e8-bfc6-00163e10d37d', 'TU000229', '安特集团技术能力中心     ', '安特集团', '江苏苏州', null, null, null, null, '1', '江苏省苏州工业园区娄阳路21号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1199-b24e-11e8-bfc6-00163e10d37d', 'TU000230', '进喜金属科技有限公司  ', '进喜金属', '江苏昆山', null, null, null, null, '1', '昆山市千灯镇石浦机电路166号2号厂房', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f11d9-b24e-11e8-bfc6-00163e10d37d', 'TU000231', '苏州爱恩机械有限公司 ', '苏州爱恩', '江苏苏州', null, null, null, null, '1', '江苏省苏州市高新区嵩山路56号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1215-b24e-11e8-bfc6-00163e10d37d', 'TU000232', '苏州帝华精密五金有限公司', '苏州帝华', '江苏苏州吴江', null, null, null, null, '1', '吴江汾湖经济开发区国赵路98号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f125a-b24e-11e8-bfc6-00163e10d37d', 'TU000233', '苏州海创电子有限公司', '苏州海创', '江苏苏州', null, null, null, null, '1', '苏州市吴中区横泾工业园木东路8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f129a-b24e-11e8-bfc6-00163e10d37d', 'TU000234', '苏州航鼎精密模具有限公司', '苏州航鼎', '江苏苏州', null, null, null, null, '1', '苏州相城区元和科技园玉航路8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f13e0-b24e-11e8-bfc6-00163e10d37d', 'TU000235', '苏州昊聪精密工业有限公司', '苏州昊聪', '江苏昆山', null, null, null, null, '1', '昆山市玉山镇同心路1898号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f142e-b24e-11e8-bfc6-00163e10d37d', 'TU000236', '苏州和瑞机械科技有限公司', '苏州和瑞', '江苏苏州', null, '', '', '陈永清', '1', '苏州市高新区浒关工业园浒牌路32号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:40:14', '');
INSERT INTO baseinfo_tradeunit VALUES ('147f1472-b24e-11e8-bfc6-00163e10d37d', 'TU000237', '苏州华之耀电子有限公司 ', '苏州华之耀', '江苏苏州', null, null, null, null, '1', '苏州高新区金燕路19号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f14b6-b24e-11e8-bfc6-00163e10d37d', 'TU000238', '苏州精实电子科技有限公司', '苏州精实', '江苏苏州吴江', null, null, null, null, '1', '江苏省吴江市经济开发区227省道复线8518（云龙大桥南侧）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f14fc-b24e-11e8-bfc6-00163e10d37d', 'TU000239', '苏州景弘胜精密模具有限公司', '苏州景弘胜', '江苏苏州', null, null, null, null, '1', '苏州工业园区胜浦镇澄浦路15号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f153b-b24e-11e8-bfc6-00163e10d37d', 'TU000240', '苏州科遐电子科技有限公司', '苏州科遐', '江苏苏州', null, '', '', '陈永清', '1', '苏州高新区山林路9号', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-17 20:51:19', '');
INSERT INTO baseinfo_tradeunit VALUES ('147f157c-b24e-11e8-bfc6-00163e10d37d', 'TU000241', '苏州零点精密模具有限公司', '苏州零点', '江苏苏州', null, null, null, null, '1', '苏州市吴中区胥口镇苏福路2号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f15bd-b24e-11e8-bfc6-00163e10d37d', 'TU000242', '苏州铭青机电有限公司', '苏州铭青机电', '江苏苏州', null, null, null, null, '1', '苏州工业园区胜浦路佳胜路40号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1602-b24e-11e8-bfc6-00163e10d37d', 'TU000243', '苏州铭青模塑有限公司', '苏州铭青模塑', '江苏苏州', null, null, null, null, '1', '苏州工业园区胜浦路润胜路25号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1642-b24e-11e8-bfc6-00163e10d37d', 'TU000244', '苏州鹏旭精密模具有限公司', '苏州鹏旭', '江苏苏州', null, null, null, null, '1', '苏州市西园路37号2楼底层', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1685-b24e-11e8-bfc6-00163e10d37d', 'TU000245', '苏州山德精密工具有限公司', '苏州山德', '江苏苏州', null, null, null, null, '1', '苏州市吴中区横泾镇鹅港路2880号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f16c9-b24e-11e8-bfc6-00163e10d37d', 'TU000246', '苏州深锐刀片有限公司', '苏州深锐', '江苏苏州', null, null, null, null, '1', '苏州市吴江经济开发区同里镇屯村西路155号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1708-b24e-11e8-bfc6-00163e10d37d', 'TU000247', '苏州神马织针器材有限公司', '苏州神马', '江苏苏州', null, null, null, null, '1', '苏州市相城区阳澄湖镇陆巷1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f178b-b24e-11e8-bfc6-00163e10d37d', 'TU000249', '苏州钛盟科技精密模具有限公司', '苏州钛盟', '江苏苏州', null, null, null, null, '1', '苏州吴中区甪直镇东庄路38号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f17d2-b24e-11e8-bfc6-00163e10d37d', 'TU000250', '苏州泰嘉电子有限公司', '苏州泰嘉', '江苏苏州', null, null, null, null, '1', '苏州相城经济开发区漕湖产业园朝阳工业坊B6幢', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1815-b24e-11e8-bfc6-00163e10d37d', 'TU000251', '苏州同荣精密模具有限公司', '苏州同荣', '江苏苏州', null, null, null, null, '1', '苏州市相城经济开发区澄云路480号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f185a-b24e-11e8-bfc6-00163e10d37d', 'TU000252', '苏州先创精密模具有限公司', '苏州先创', '江苏苏州', null, null, null, null, '1', '江苏省 苏州市 吴中区甪直镇迎新一路89号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f18a7-b24e-11e8-bfc6-00163e10d37d', 'TU000253', '苏州协诚永达五金制品有限公司', '苏州协诚永达', '江苏苏州', null, null, null, null, '1', null, '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f18f0-b24e-11e8-bfc6-00163e10d37d', 'TU000254', '苏州鑫伟捷精密模具有限公司', '苏州鑫伟捷', '江苏苏州', null, null, null, null, '1', '江苏省苏州市工业园区胜浦镇佳胜路40号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f192f-b24e-11e8-bfc6-00163e10d37d', 'TU000255', '苏州英维尔精密机械有限公司', '苏州英维尔', '江苏苏州', null, null, null, null, '1', '苏州市吴中区胥口镇灵山路399号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f196d-b24e-11e8-bfc6-00163e10d37d', 'TU000256', '苏州中兴联精密工业有限公司', '苏州中兴联', '江苏苏州', null, null, null, null, '1', '苏州市高新区鸿禧路69号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f19b9-b24e-11e8-bfc6-00163e10d37d', 'TU000257', '台州市中瑞电子有限公司杭州分公司', '台州中瑞', '浙江杭州', null, null, null, null, '1', '杭州经济技术开发区10号大街(东)675号5幢德明科技（杭州）有限公司三层厂房 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f19fc-b24e-11e8-bfc6-00163e10d37d', 'TU000258', '泰科电子（苏州）有限公司', '苏州泰科', '江苏苏州', null, null, null, null, '1', '苏州工业园区出口加工区B区启明路88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1a3c-b24e-11e8-bfc6-00163e10d37d', 'TU000259', '吴江翔实模具有限公司', '吴江翔实', '江苏苏州吴江', null, null, null, null, '1', '吴江经济开发区全德路11号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1a7a-b24e-11e8-bfc6-00163e10d37d', 'TU000260', '信音电子（中国）股份有限公司', '苏州信音', '江苏苏州', null, null, null, null, '1', '苏州吴中区胥口镇胥江工业园新峰路509号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1abd-b24e-11e8-bfc6-00163e10d37d', 'TU000261', '优艺精密模具（苏州）有限公司', '苏州优艺', '江苏苏州吴江', null, null, null, null, '1', '江苏省吴江市松陵镇中山北路1355号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1afc-b24e-11e8-bfc6-00163e10d37d', 'TU000262', '迈得医疗工业设备股份有限公司', '迈得医疗', '浙江台州', null, null, null, null, '1', '浙江省台州市玉环县沙门滨港工业城天佑路3号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1b8f-b24e-11e8-bfc6-00163e10d37d', 'TU000263', '福丰联合精密模具有限公司  ', '福丰联合', '江苏太仓', null, null, null, null, '1', '江苏省太仓市沙溪镇印溪南路8383号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1bcf-b24e-11e8-bfc6-00163e10d37d', 'TU000264', '舍弗勒（中国）有限公司', '太仓舍弗勒', '江苏太仓', null, null, null, null, '1', '江苏省太仓经济开发区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1c12-b24e-11e8-bfc6-00163e10d37d', 'TU000265', '苏州富锐多精密模具有限公司', '苏州富锐多', '江苏太仓', null, null, null, null, '1', '江苏省太仓市城厢镇东古路6号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1c54-b24e-11e8-bfc6-00163e10d37d', 'TU000266', '太仓明皓精密模具厂', '太仓明皓', '江苏太仓', null, null, null, null, '1', '太仓市陆渡镇富达路80号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1c95-b24e-11e8-bfc6-00163e10d37d', 'TU000267', '恩希通讯配件有限公司', '恩希通讯', '浙江嘉善', null, null, null, null, '1', '浙江嘉善金嘉大道65号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1cd2-b24e-11e8-bfc6-00163e10d37d', 'TU000268', '可胜科技(泰州)有限公司', '泰州可胜', '江苏泰州', null, null, null, null, '1', '泰州市经济开发区祥泰路西侧、狮子河南侧', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1d3e-b24e-11e8-bfc6-00163e10d37d', 'TU000269', '泰州华龙电子有限公司', '泰州华龙', '江苏泰州', null, null, null, null, '1', '泰州市海陵工业园凤凰东路86号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1d84-b24e-11e8-bfc6-00163e10d37d', 'TU000270', '天津市津海伟业科技有限公司 ', '津海伟业', '天津', null, null, null, null, '1', '天津市津南区双港工业区鑫港五号路百顺路   ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1e04-b24e-11e8-bfc6-00163e10d37d', 'TU000272', '鸿达电子加工有限公司', '浙江鸿达电子', '浙江乐清', null, null, null, null, '1', '浙江省乐清市清江镇江沿村  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1e41-b24e-11e8-bfc6-00163e10d37d', 'TU000273', '温达电子有限公司', '温达电子', '浙江乐清', null, null, null, null, '1', '浙江省乐清市虹桥镇孙家洋村山前路1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1e82-b24e-11e8-bfc6-00163e10d37d', 'TU000274', '温州钢锐模具有限公司', '温州钢锐', '浙江乐清', null, null, null, null, '1', '浙江申温州市内乐清市石帆镇湖一村郑宅路39号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1ec3-b24e-11e8-bfc6-00163e10d37d', 'TU000275', '温州京桥高精密模具有限公司', '温州京桥', '浙江乐清', null, null, null, null, '1', '浙江省乐清市天成工业区东区北一座', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1f07-b24e-11e8-bfc6-00163e10d37d', 'TU000276', '温州永盛电子有限公司', '温州永盛', '浙江乐清', null, null, null, null, '1', '浙江省乐清市象阳镇深河工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1f43-b24e-11e8-bfc6-00163e10d37d', 'TU000277', '无锡贝卡尔特纺织机械器材有限公司 ', '无锡贝卡尔特', '江苏无锡', null, null, null, null, '1', '无锡市锡山经济开发区兴塘东路216号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1f8a-b24e-11e8-bfc6-00163e10d37d', 'TU000278', '永嘉县顺达汽车配件有限公司', '永嘉顺达', '浙江温州', null, null, null, null, '1', '浙江省温州市永嘉县乌牛镇工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f1fca-b24e-11e8-bfc6-00163e10d37d', 'TU000279', '浙江海顺电工有限公司', '浙江海顺', '浙江温州', null, null, null, null, '1', '浙江省温州工业园区中兴路156号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f200c-b24e-11e8-bfc6-00163e10d37d', 'TU000280', '浙江合丰科技有限公司', '浙江合丰', '浙江乐清', null, null, null, null, '1', '浙江省乐清市淡溪第二工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f204a-b24e-11e8-bfc6-00163e10d37d', 'TU000281', '浙江申华电子科技有限公司', '浙江申华', '浙江乐清', null, null, null, null, '1', '浙江省乐清市清江镇江沿工业园', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f208b-b24e-11e8-bfc6-00163e10d37d', 'TU000282', '格罗茨贝克特针布（无锡）有限公司', '无锡格罗茨贝克', '江苏无锡', null, null, null, null, '1', '无锡市锡山经济开发区兴塘东路216号（原来无锡贝卡尔特）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f20d7-b24e-11e8-bfc6-00163e10d37d', 'TU000283', '国玮精密制造科技（无锡）有限公司', '无锡国玮', '江苏无锡', null, null, null, null, '1', '无锡市锡山经济开发区芙蓉三路中五号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2115-b24e-11e8-bfc6-00163e10d37d', 'TU000284', '江阴恒通电器有限公司 ', '江阴恒通', '江苏无锡', null, null, null, null, '1', '江苏省 无锡市 江阴市南闸镇南焦璐219号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2159-b24e-11e8-bfc6-00163e10d37d', 'TU000285', '苏州鼎康精密模具配件有限公司', '苏州鼎康', '江苏苏州', null, null, null, null, '1', '苏州市吴中区胥口镇合丰路136号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f219e-b24e-11e8-bfc6-00163e10d37d', 'TU000286', '无锡创意精密模具有限公司', '无锡创意', '江苏无锡', null, null, null, null, '1', '无锡新区鸿山镇负锦鸿路286号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f21e4-b24e-11e8-bfc6-00163e10d37d', 'TU000287', '无锡高晟成型科技有限公司', '无锡高晟', '江苏无锡', null, null, null, null, '1', '无锡市滨湖区贡湖大道554号 ', '20', null, null, null, '{WeightDigit:\'3\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'WXGS\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2224-b24e-11e8-bfc6-00163e10d37d', 'TU000288', '无锡格瑞斯精密机械有限公司', '无锡格瑞斯', '江苏无锡', null, null, null, null, '1', '无锡市新区荆同工业园1号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2266-b24e-11e8-bfc6-00163e10d37d', 'TU000289', '无锡国盛精密模具有限公司', '无锡国盛', '江苏无锡', null, null, null, null, '1', '无锡市杨高路8号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f22a9-b24e-11e8-bfc6-00163e10d37d', 'TU000290', '无锡恒耀模具材料科技有限公司      ', '无锡恒耀      ', '江苏无锡', null, null, null, null, '1', '无锡市惠山区江海西路990-502 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2357-b24e-11e8-bfc6-00163e10d37d', 'TU000291', '无锡华晶利达电子有限公司', '无锡华晶利达', '江苏无锡', null, null, null, null, '1', '无锡市惠山区杨市镇富士路8号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f239f-b24e-11e8-bfc6-00163e10d37d', 'TU000292', '无锡佳普特自动控制设备有限公司', '无锡佳普特', '江苏无锡', null, null, null, null, '1', '无锡南湖大道789号H幢1楼', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f23f4-b24e-11e8-bfc6-00163e10d37d', 'TU000293', '无锡金合精密机械有限公司', '无锡金合', '江苏无锡', null, null, null, null, '1', '无锡市滨湖开发区高运路105号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2455-b24e-11e8-bfc6-00163e10d37d', 'TU000294', '无锡金盟精密机械有限公司', '无锡金盟', '江苏无锡', null, null, null, null, '1', '江苏省无锡市无锡新吴区梅村南丰一路15号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f24ad-b24e-11e8-bfc6-00163e10d37d', 'TU000295', '无锡金田元丰科技股份有限公司', '无锡金田元丰', '江苏无锡', null, null, null, null, '1', '无锡市锡兴北路5号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f250c-b24e-11e8-bfc6-00163e10d37d', 'TU000296', '无锡市蓝旗精密模具制造有限公司', '无锡蓝旗', '江苏无锡', null, null, null, null, '1', '江苏省无锡市胡埭工业园联合路8号 ', '20', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2568-b24e-11e8-bfc6-00163e10d37d', 'TU000297', '无锡迈卓精密机械有限公司', '无锡迈卓', '江苏无锡', null, null, null, null, '1', '无锡滨湖开发区大通路5009号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f25c8-b24e-11e8-bfc6-00163e10d37d', 'TU000298', '无锡润光机械有限公司', '无锡润光', '江苏无锡', null, null, null, null, '1', '无锡市硕放镇新宅路31号硕放工业园12幢厂房  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f262a-b24e-11e8-bfc6-00163e10d37d', 'TU000299', '无锡赛鼎科技有限公司', '无锡赛鼎', '江苏无锡', null, null, null, null, '1', '江苏无锡市新吴区城南路223-2号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2689-b24e-11e8-bfc6-00163e10d37d', 'TU000300', '无锡市成锦科技有限公司', '无锡成锦', '江苏无锡', null, null, null, null, '1', '无锡滨湖区东绛镇锡南路58号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f274d-b24e-11e8-bfc6-00163e10d37d', 'TU000302', '无锡市金圣康机械设备有限公司  ', '无锡金圣康', '江苏无锡', null, null, null, null, '1', '江苏省无锡市滨湖区钱姚路88-C1', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f27af-b24e-11e8-bfc6-00163e10d37d', 'TU000303', '无锡市立创动力精密机械有限公司', '无锡立创动力', '江苏无锡', null, null, null, null, '1', '无锡市扬名高科技创业园C楼 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f280d-b24e-11e8-bfc6-00163e10d37d', 'TU000304', '无锡市新逵机械设备有限公司', '无锡新逵', '江苏无锡', null, null, null, null, '1', '无锡市滨湖区胡埭工业园南区联合路9号（城建电信器材厂区）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f284f-b24e-11e8-bfc6-00163e10d37d', 'TU000305', '无锡泰石精密电子有限公司', '无锡泰石', '江苏无锡', null, null, null, null, '1', '无锡市新区新加坡工业园新达路28-1', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2898-b24e-11e8-bfc6-00163e10d37d', 'TU000306', '无锡特文博精密模具有限公司 ', '无锡特文博', '江苏无锡', null, null, null, null, '1', '江苏无锡市锡兴路18号（贝贝帕克内）', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f28db-b24e-11e8-bfc6-00163e10d37d', 'TU000307', '无锡微研股份有限公司', '无锡微研', '江苏无锡', null, null, null, null, '1', '无锡市滨湖区胡埭工业园冬青路19号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f291c-b24e-11e8-bfc6-00163e10d37d', 'TU000308', '无锡新展鸿机电制造有限公司', '无锡新展鸿', '江苏无锡', null, null, null, null, '1', '无锡洛社镇杨市环镇南路12号-3  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f295c-b24e-11e8-bfc6-00163e10d37d', 'TU000309', '无锡耀宇精密模具有限公司', '无锡耀宇', '江苏无锡', null, null, null, null, '1', '江苏省无锡新区梅村锡贤路162-1', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f299b-b24e-11e8-bfc6-00163e10d37d', 'TU000310', '无锡亿锞精密模具有限公司', '无锡亿锞', '江苏无锡', null, null, null, null, '1', '无锡滨湖开发区胡埭工业园陆藕路29-3号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f29d8-b24e-11e8-bfc6-00163e10d37d', 'TU000311', '无锡源思达模具有限公司', '无锡源思达', '江苏无锡', null, null, null, null, '1', '无锡新区硕放镇新东安路11号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2a16-b24e-11e8-bfc6-00163e10d37d', 'TU000312', '无锡中翔盛精密模具有限公司', '无锡中翔盛', '江苏无锡', null, null, null, null, '1', '无锡市新区梅村新华路135号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2a59-b24e-11e8-bfc6-00163e10d37d', 'TU000313', '无锡众恒精密模具有限公司', '无锡众恒', '江苏无锡', null, null, null, null, '1', '无锡新村梅村锡贤路141号  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2a9b-b24e-11e8-bfc6-00163e10d37d', 'TU000314', '无锡天凌精密模具有限公司', '无锡天凌', '江苏无锡', null, null, null, null, '1', '无锡市新吴区硕放镇新东安路33号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2ad7-b24e-11e8-bfc6-00163e10d37d', 'TU000315', '江苏兴达钢帘线股份有限公司', '江苏兴达钢', '江苏兴化', null, null, null, null, '1', '江苏省兴化市戴南人民西路88号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2b17-b24e-11e8-bfc6-00163e10d37d', 'TU000316', '盐城方瑞电气机械有限公司 ', '盐城方瑞', '江苏盐城', null, null, null, null, '1', '江苏省盐城市阜宁县经济开发区窑桥一路7号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2b5d-b24e-11e8-bfc6-00163e10d37d', 'TU000317', '江苏扬碟钻石工具有限公司 ', '江苏扬碟', '江苏扬中', null, null, null, null, '1', '扬中经济开发区港隆路127号科创中心内', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2ba4-b24e-11e8-bfc6-00163e10d37d', 'TU000318', '李尔汽车系统（扬州）有限公司', '李尔汽车', '江苏扬州', null, null, null, null, '1', '江苏省扬州市司徒庙路518号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2be5-b24e-11e8-bfc6-00163e10d37d', 'TU000319', '仪征双环活塞有限公司', '仪征双环', '江苏仪征', null, null, null, null, '1', '仪征市大庆南路5号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2c27-b24e-11e8-bfc6-00163e10d37d', 'TU000320', '江苏三恒高技术窑具有限公司 ', '江苏三恒高', '江苏宜兴', null, null, null, null, '1', '江苏宜兴市丁蜀镇陶瓷产业园区通蠡路11号 ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2c6e-b24e-11e8-bfc6-00163e10d37d', 'TU000321', '义乌市易开盖实业公司   ', '义乌易开盖', '浙江义乌', null, null, null, null, '1', '浙江省义乌市丹溪北路711号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2caf-b24e-11e8-bfc6-00163e10d37d', 'TU000322', '余姚市亚玛森特种链锯有限公司', '余姚亚玛森', '浙江余姚', null, null, null, null, '1', '余姚市梁辉开发区凤仪路99号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2ced-b24e-11e8-bfc6-00163e10d37d', 'TU000323', '玉环县兴隆机械厂', '玉环兴隆', '浙江玉环', null, null, null, null, '1', '浙江省玉环县漩门二期工业城风屿西路28号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2d2e-b24e-11e8-bfc6-00163e10d37d', 'TU000324', '顺德工业(江苏)有限公司', '江苏顺德', '江苏张家港', null, null, null, null, '1', '江苏省张家港保税区上海路6号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2d6e-b24e-11e8-bfc6-00163e10d37d', 'TU000325', '福建长乐万达纺织机械有限公司    ', '福建万达 ', '福建长乐', null, null, null, null, '1', '福建省长乐市金峰镇华阳工业区', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2db2-b24e-11e8-bfc6-00163e10d37d', 'TU000326', '慈溪市慈惠电子元件厂 ', '慈溪慈惠', '浙江慈溪', null, null, null, null, '1', '浙江省乐慈溪逍遥林樟新南路301号', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2ef2-b24e-11e8-bfc6-00163e10d37d', 'TU000327', '佳友工具有限公司', '佳友工具', '浙江诸暨', null, null, null, null, '1', '浙江省诸暨市安华镇', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2f41-b24e-11e8-bfc6-00163e10d37d', 'TU000328', '福建优特', '福建优特', '福建', null, null, null, null, '1', null, '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2f86-b24e-11e8-bfc6-00163e10d37d', 'TU000329', '福建三明普诺维', '福建三明普诺维', '福建', null, null, null, null, '1', null, '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('147f2fcf-b24e-11e8-bfc6-00163e10d37d', 'TU000330', '鸿达模具有限公司', '浙江鸿达模具', '浙江乐清', null, null, null, null, '1', '浙江省乐清市清江镇江沿村  ', '20', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('199a61f1e5fd40fcb59aa3847f7b5d97', 'TU000572', '昆山彩美伟业精密电子有限公司', '昆山彩美伟业', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 14:01:19', null, null, '邹开龙 冲压主管  18550815570');
INSERT INTO baseinfo_tradeunit VALUES ('1e4ee88ef1a64671a3e662384256f256', 'TU000638', '宁波微米精密机械有限公司', '微米', '宁波', null, null, '', '', '1', '', '10', 'DMC会展', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-06-12 23:18:48', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('200c3afec1874ce58964234cd163e9a6', 'TU000520', '苏州冠铭盛业精密五金有限公司', '苏州冠铭盛业', '昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市工茂路299号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-11-07 16:26:45', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('23975c2e6b3d4198927a8f59d146bcb5', 'TU000579', '苏州福弘电子工业有限公司', '苏州福弘', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-25 15:12:59', null, null, '张伟  13913519871');
INSERT INTO baseinfo_tradeunit VALUES ('2474ebe2575749f48f9231bfa5570e30', 'TU000529', '西德克精密拉深技术（上海）有限公司', '西德克', '上海浦东', null, 'A', '', '', '1', '上海市浦东新区临港万祥产业园万航路33号', '10', '模具展', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-30 12:00:06', null, null, '西德克精密拉深技术（上海）有限公司隶属于德国历史悠久的专门生产精密五金拉深件的西德克集团。母公司目前已经有80多年的历史，其产品在全球广泛用于电子、汽车以及消费产品领域，如彩电，发动机燃油喷射，手机，汽车ABS系统，电子元件，安全气囊等。在精密拉深领域，西德克是世界一流的供应商');
INSERT INTO baseinfo_tradeunit VALUES ('2789a9690ffb406796f1ca5993a5a586', 'TU000608', '昆山欣程康精密模具有限公司', '昆山欣程康', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-04 17:07:26', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('29a2a8734bbf45c9b910dd21c2288e66', 'TU000610', '吉安市创鑫精密模具有限公司', '吉安市创鑫', '江西吉安', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-05 17:02:20', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('29ecfd5e19cb4c3a81d57de609523feb', 'TU000536', '上海弘拓金属制品有限公司', '弘拓', '上海奉贤', null, '', '', '', '1', '上海市奉贤区青村镇钱桥路1100号1号厂房', '10', '客户找来，张良', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-12-19 15:27:55', 'chenyongqing', '2019-03-02 13:07:39', '');
INSERT INTO baseinfo_tradeunit VALUES ('318f9e0a9c4740e589d3c808d513e150', 'TU000551', '厦门恒翔诚精密模具有限公司', '恒翔', '厦门', null, '', '', '', '1', '', '10', '朋友介绍，金越的备件供应商', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-02-28 15:08:38', 'yaoqiaohui', '2019-02-28 15:13:24', '');
INSERT INTO baseinfo_tradeunit VALUES ('3675a64f078e4240aeeb4440c448f29f', 'TU000531', '江苏尚诚精密模具科技有限公司', '无锡尚诚', '江苏无锡', null, '', '', '', '1', '江苏省无锡市锡山区芙蓉中三路99号锡山科技创业园青云六座', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-12-07 10:53:06', 'yaoqiaohui', '2018-12-07 11:07:08', '一胜百\r\n尚诚科技与艾度科技为同一控股股东，尚诚科技全称江苏尚诚精密模具科技有限公司，艾度科技全称为无锡艾度科技有限公司。公司位于太湖之滨风景秀丽的无锡锡山经济开发区锡山科技创业园内拥有2000万精密加工设备和检测设备。\r\n尚诚科技的研发核心团队从事模具设计及加工行业18年余，公司专业从事精密冷冲压级进模具的设计制造和自动化生产线设计以及销售。主要服务于国内外大型家电和汽车零部件领域，专注于制造洗衣机内桶、洗衣机箱体、冰箱门壳等薄型不锈钢级进冲压模具，以及非标自动化生产线。尚诚科技的产品以高品质、智能化替代了国外进口设备为客户大大降低了采购成本。\r\n无锡艾度科技有限公司依托于尚诚科技成熟的研发团队和稳固的基础，成功研发出了适合于国内冲压企业的冲压机械手。此类智能化创新产品得到了当地政府的大力支持，艾度科技已进入批量生产及销售的快速发展阶段。\r\n公司目前主要客户有：杭州松下、海信惠而浦、合肥三洋、合肥荣事达、无锡小天鹅、常州倍科、TCL、宁波吉德、宁波新乐等洗衣机制造企业。');
INSERT INTO baseinfo_tradeunit VALUES ('38ba8819b12946d4857ed32ff5a68465', 'TU000630', '昆山致浩景精密模具有限公司', '昆山致浩景', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-03 16:07:32', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('396a3408da4a408d9aa53fc0e873570e', 'TU000616', '苏州海力士光电科技有限公司', '苏州海力士', '江苏苏州', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-15 21:22:37', 'admin', '2019-05-16 08:48:34', '');
INSERT INTO baseinfo_tradeunit VALUES ('3ba0c5a390f24a6aa6dceaeb47639ded', 'TU000600', '昆山福源达电子有限公司', '昆山福源达', '江苏昆山', null, '', '', '陈永清', '1', '江苏昆山', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-23 17:00:38', null, null, '模切');
INSERT INTO baseinfo_tradeunit VALUES ('3c0d71e071664bbd8002a67ec8fb45a0', 'TU000534', '昆山泰尼韦尔精密模具有限公司', '昆山泰尼韦尔', '江苏苏州昆山', null, '', '', '陈永清', '1', '昆山市玉山镇环庆路2980号（中节能）循环经济产业园30幢厂房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 20:55:41', 'chenyongqing', '2019-03-04 15:51:32', '');
INSERT INTO baseinfo_tradeunit VALUES ('408e3550070e4bacbdb68b9d20155b27', 'TU000535', '肯纳飞硕', '肯纳', '上海浦东', null, '', '', '', '2', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-12-19 15:03:29', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('41dfceb0aed4467ca94714a911780d8b', 'TU000639', '泰兴市迎幸模具厂', '迎幸', '泰兴', null, null, '', '', '1', '', '10', 'DMC会展', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-06-12 23:25:06', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('45348d273e1c4183a3fe8f53480517ac', 'TU000623', '昆山广义源精密模具有限公司', '昆山广义源', '江苏昆山', null, null, '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-20 17:32:30', 'chenyongqing', '2019-05-20 17:32:43', '');
INSERT INTO baseinfo_tradeunit VALUES ('471fc515c7504c4e94bc9dfccd07115f', 'TU000628', '上海克劳德刀片制造有限公司', '上海克劳德', '上海松江', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-30 15:39:41', 'chenyongqing', '2019-05-30 16:16:38', '');
INSERT INTO baseinfo_tradeunit VALUES ('4d0d0c675d7e4367b3fe1fc9e1c58855', 'TU000537', '昆山精峰达精密模具有限公司', '昆山精峰达', '昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-12-23 16:16:32', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('4e9b6af7e9304b96aa2d577dc7bd3834', 'TU000611', '昆山玉山镇钧淮精密模具厂', '昆山钧淮', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-08 21:34:10', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('52d24da01a3d49aab70a064a9b051884', 'TU000331', '苏州升驭精密机械有限公司', '苏州升驭', '江苏苏州', null, null, '', null, '1', '苏州市吴中区郭巷镇西村路35号', '10', null, null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'zhudafeng', '2018-09-18 13:47:54', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('53b884eb46c647eebc12c8061c625c45', 'TU000580', '昆山泰源吉精密模具有限公司', '昆山泰源吉', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-26 21:15:11', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('5559d6f406334b5b958360ff7fdb3789', 'TU000637', '宁波富技精工汽车零部件有限公司', '宁波富技精工汽车零部件有限公司', '宁波', null, null, '', '', '1', '', '10', 'DMC展会', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-06-12 23:08:37', 'yaoqiaohui', '2019-06-12 23:08:51', '');
INSERT INTO baseinfo_tradeunit VALUES ('5761c7639f8244c9bc5a17659ae0634d', 'TU000618', '昆山昊诚盟精密模具有限公司', '昆山昊诚盟', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-17 16:48:27', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('57b149396ea543bcb70655073b6cf853', 'TU000521', '浙江正泰电器股份有限公司', '正泰', '浙江乐清', null, 'B', '', '', '1', '', '10', '冉工介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-08 17:11:02', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('59e51831606644ecbe20843b93e0dfc6', 'TU000553', '莱克电气绿能科技（苏州）有限公司', '莱克电气', '江苏苏州', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-02-28 20:22:12', null, null, '主要做高端清洁电气-孔厂长部门是冲压部门   目前有5台冲床。主要做扫地机里面电机外壳及矽钢片冲压');
INSERT INTO baseinfo_tradeunit VALUES ('5cb40a23286d4406810b6cc706a26363', 'TU000605', '苏州新亚电通有限公司', '苏州新亚', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-29 16:44:45', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('5db0e1f8215c469c823d777a504514d7', 'TU000514', '立讯精密工业（昆山）有限公司', '立讯汽车电子', '昆山', null, 'A', '', '', '1', '昆山锦溪锦商路851号', '10', '模具展', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-10-23 22:17:22', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('5e5b42b1c5b24568b41c1b8b2804a659', 'TU000533', '可功科技(宿迁)有限公司', '可功科技', '江苏宿迁', null, '', '', '', '1', '江苏省宿迁市苏宿工业园区古城路21号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-12-15 19:33:47', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('61c5275a565a44c5971e2f9cd94e666b', 'TU000615', '昆山吴诚盟精密模具有限公司', '昆山吴诚盟', '江苏昆山', null, null, '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-15 21:03:55', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('648718b7563843bfaccffb8ae1e76a11', 'TU000617', '苏州维通精密机械有限公司', '苏州维通', '江苏苏州', null, 'B', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-17 16:43:32', 'chenyongqing', '2019-05-17 16:44:01', '');
INSERT INTO baseinfo_tradeunit VALUES ('69744db965674223bbcdbcd7a4d9488f', 'TU000517', '陈先生（待确认）', '陈先生', '浙江宁波', null, '', '', '', '1', '宁波市江北区洪塘街道明圆宾馆后面的厂房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-05 21:25:43', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('6c9109cbc4e64adda25ed94d29288b95', 'TU000567', '梁留喜  暂定', '梁留喜  暂定', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-16 18:12:15', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('6ddcc368dbe640cc8ba3a2fe0a2ed32b', 'TU000555', '昆山五源星精密模具有限公司', '昆山五源星', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-02-28 21:33:01', null, null, '4台PG  4台冲床');
INSERT INTO baseinfo_tradeunit VALUES ('6ed4ae77dc66436b8418cff1b423e92b', 'TU000625', '适新电子（苏州）有限公司', '苏州适新', '江苏苏州', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-24 12:05:54', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('6f097398aa0b487eb432e56175ff194a', 'TU000550', '上海珂玉实业有限公司', '上海珂玉', '上海市金山区', null, 'C', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-02-25 19:37:56', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('6f846ee5cef6451e814a1d002ae6c45e', 'TU000554', '昆山旗顺精密模具机械有限公司', '昆山旗顺', '江苏昆山', null, 'B', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-02-28 21:19:10', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('74a5170b3a314246ad571b7952d0bca3', 'TU000574', '昆山市玉山镇永开运精密模具厂', '昆山市玉山镇永开运', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '冲压行业联盟', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 14:52:58', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('75017bb1ece84645b95fa74b383fcfce', 'TU000558', '昆山兆锦精密电子有限公司', '昆山兆锦', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '冲压行业联盟', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-04 14:41:47', 'chenyongqing', '2019-03-04 14:42:08', '');
INSERT INTO baseinfo_tradeunit VALUES ('77ac40c0d8e14a2fa25a6eb2515dd1fa', 'TU000621', '昆山坤硕精密组件有限公司', '昆山坤硕', '江苏昆山', null, null, '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-17 16:54:44', 'chenyongqing', '2019-05-17 16:54:51', '');
INSERT INTO baseinfo_tradeunit VALUES ('78c16e93942a409bab80f1d203342968', 'TU000604', '浙江永嘉县瓯北上轮泵阀有限公司', '上轮', '温州', null, 'C', '', '', '1', '温州市永嘉瓯北街道白水东路37号', '10', '客户百度', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-04-28 09:44:19', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('797286e851e24a52a593e6a6e7d63c6b', 'TU000587', '温岭市麒元汽配有限公司 ', '温岭市麒元', '浙江温州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-01 16:17:07', 'chenyongqing', '2019-04-08 22:54:08', '');
INSERT INTO baseinfo_tradeunit VALUES ('82de7a28f65440759713cd70b6286fe0', 'TU000530', '毅结特紧固件系统（太仓）有限公司', '毅结特', '江苏太仓', null, 'A', '', '', '1', '江苏省太仓经济开发区发达路165号, 邮编: 215413', '10', '刘防雷', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-12-07 10:42:17', null, null, '德资，毅结特集团公司（EJOT Group）是一家生产和销售高端紧固件的德国中型企业，其产品在汽车工业、机械制造业、电子技术和建筑领域有较高的知名度。集团前身Adolf Boehl螺钉厂成立于1922年，目前毅结特集团公司在全世界有三十多个分支机构，员工3000多人。在欧洲毅结特集团在紧固件行业占领先地位，另外，毅结特也是全球紧固件联盟发起人之一。该联盟的目标是为其成员在世界各地的客户提供高端的紧固件产品和技术服务。毅结特紧固件系统（太仓）有限公司成立于2005年11月24日，是德国毅结特集团的一个全资子公司。本公司是毅结特集团在亚太区生产和销售基地，将竭诚为亚太区客户提供高端的紧固件产品和技术服务。 ');
INSERT INTO baseinfo_tradeunit VALUES ('83f8d55f11634481b8211c1be243085d', 'TU000591', '吴中区横泾晟机械厂', '吴中横泾', '江苏苏州', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-03 16:23:56', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('84a962714daf47b8aa8d4236006f255c', 'TU000607', '苏州文飞五金实业有限公司', '苏州文飞', '江苏苏州', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-03 09:11:53', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('8775caa5610743398d8ff6af714205af', 'TU000627', '杭州结达激光刀模有限公司', '结达', '杭州余杭', null, null, '', '', '1', '杭州市余杭区瓶窑镇风都工业区前程路 2-2号', '10', '杭州嘉力讯', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-05-29 18:03:16', null, null, '新能源');
INSERT INTO baseinfo_tradeunit VALUES ('888a25e5e92a45c3bb042da128504393', 'TU000573', '上海理顺精密模具有限公司', '上海理顺', '上海浦东', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 14:22:47', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('88beacdea11140e7a04a229d775da9f4', 'TU000584', '昆山威得莱精密模具有限公司', '昆山威得莱', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-31 12:53:01', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('8a12edb6f6174f958cdb5e6ddee3e178', 'TU000635', '杭州临安家乐电器厂', '杭州临安家乐', '浙江杭州', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-12 20:27:43', 'chenyongqing', '2019-06-12 20:31:34', '');
INSERT INTO baseinfo_tradeunit VALUES ('8a3692f26880436ba3aaccdd36c2d95e', 'TU000505', '上海伊斯曼电气股份有限公司', '上海伊斯曼', '上海松江', null, 'C', '', '', '1', '上海市松江区泖港工业区新波路500号', '10', 'Eric介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-09-20 11:15:06', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('8a3c12c2a0c1481888f30fb30225d30e', 'TU000506', '宁波市江北区焱丰磨具厂', '宁波焱丰', '浙江宁波', null, 'C', '', '', '1', '宁波市江北区洪塘街道明圆宾馆后面的厂房', '10', '客户找来', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-09-26 12:44:56', 'yaoqiaohui', '2018-09-26 14:16:00', '');
INSERT INTO baseinfo_tradeunit VALUES ('8be7e1d10e6f4c639a3f0ee5a2eefbe7', 'TU000596', '昆山湘北精密金属有限公司', '昆山湘北', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-10 20:24:31', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('8d317fc8c91b45b4b0d72652484c6e50', 'TU000518', '昆山巴城镇精锋达模具厂', '昆山精锋达', '江苏昆山', null, '', '', '', '1', '昆山市玉山镇城北路1012号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'zhudafeng', '2018-11-07 00:06:00', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('8ed9ad847df54f4a89e166245aef8118', 'TU000582', '苏州威弗电气有限公司', '苏州威弗', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-28 16:29:31', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('935a39d68181495f9143776fad7c7faf', 'TU000613', '苏州金致鼎精密模具有限公司', '昆山金致鼎', '昆山', null, '', '', '李峰', '1', '', '10', '天泽曹经理', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-05-10 10:55:15', 'wuxiumei', '2019-05-10 11:56:05', '');
INSERT INTO baseinfo_tradeunit VALUES ('94abc3cf2ff84e5c8734bc565b5e52df', 'TU000633', '昆山仁之杰精密电子组件有限公司', '昆山仁之杰', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-05 22:53:57', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('97335b20fe2e4585a2e72f6e03a91571', 'TU000602', '昆山贝格海姆精密部件有限公司', '昆山贝格海姆', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-26 17:20:00', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('9adec59ae8fe4275baa802d93cd6f888', 'TU000532', '亚奇拉科技（宿迁）有限公司   ', '亚奇拉', '江苏宿迁', null, '', '', '', '1', '江苏省宿迁市宿城区青海湖西路苏宿工业坊内A10厂房', '10', '客户来电-从可胜', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-12-10 14:43:12', null, null, '为可胜集体的下属企业。\r\n\r\n从事精密模具和电子行业用金属电脑内构件及金属中心按钮的机械加工，销售本公司所生产的产品。');
INSERT INTO baseinfo_tradeunit VALUES ('9b23b404644042adbde35b83dbb66b00', 'TU000556', '杭州君鼎科技有限公司', '杭州君鼎', '浙江杭州桐庐', null, '', '', '陈永清', '1', '浙江杭州桐庐', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-02 10:04:33', null, null, '主要做空调铜管自动化设备');
INSERT INTO baseinfo_tradeunit VALUES ('9b5a8754d92f427681e3e0a67379100a', 'TU000507', '浙江普兴电子科技有限公司 ', '普兴', '浙江杭州余杭', null, 'B', '', '', '1', '余杭区中泰街道中泰工业区旺泰路3号', '10', '小陈介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-09-29 12:31:29', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('9b876969c7294ba493a0eaf6ccec1edf', 'TU000576', '昆山卓尔精密模具有限公司', '昆山卓尔', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-21 21:31:32', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('9c3d07b7ad734cae8a3c9d4629020cfe', 'TU000569', '昆山富朋精密模具有限公司', '昆山富朋', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 12:42:19', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('a2df30301e354d46802b3722e94c1716', 'TU000559', '昆山合恒长精密模具有限公司', '昆山合恒长', '江苏昆山巴城', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-04 14:45:26', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('a62d1a587b36482992ac2f3292a7d64f', 'TU000578', '苏州高田精密模具有限公司 ', '苏州高田', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-25 14:52:05', 'chenyongqing', '2019-03-27 21:41:50', '李赞强 18662337288');
INSERT INTO baseinfo_tradeunit VALUES ('a6387eff9b294037969a62db372e258d', 'TU000622', '昆山市玉山镇坤硕精密模具厂', '昆山坤硕', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-20 09:15:11', 'chenyongqing', '2019-05-20 09:15:20', '');
INSERT INTO baseinfo_tradeunit VALUES ('a75b472ecaec473392c47d07ba2c0a9a', 'TU000619', '昆山求华精密模具有限公司', '昆山求华', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-17 16:50:51', 'chenyongqing', '2019-05-17 16:51:30', '6台沙迪克慢丝  1台PG    大小水磨   NC等');
INSERT INTO baseinfo_tradeunit VALUES ('a86accb9e5f04b8694756e01628e1d74', 'TU000541', '苏州平山精密部件有限公司', '苏州平山', '江苏省昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-12-27 22:30:51', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('a8cde0e69cd948b8a515fc30e503d9f0', 'TU000589', '扬州诚益电子有限公司', '扬州诚益', '江苏扬州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-01 20:03:27', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('a9a58f46e93943b5a72badab113d5771', 'TU000612', '宁波协宏测控设备有限公司  ', '宁波协宏', '宁波', null, '', '913302013406092508', '王建平 ', '1', '', '10', '肯纳谢经理', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-05-10 10:36:19', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('abe9ab41627c41b48e92b19a5548608a', 'TU000586', '昆山乔均精密模具有限公司', '昆山乔均', '江苏昆山', null, '', '', '', '1', '', '10', '周乔喜介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-04-01 14:38:47', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ad5189e9714e4b6cb028f75b7a9d42d2', 'TU000624', '盾特精密模具（上海）有限公司', '上海盾特', '上海松江', null, null, '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-05-22 22:15:29', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ada7d5ff39ad4cd4a1e1d25431d0c91c', 'TU000609', '瑞声科技（常州）有限公司', '瑞声', '常州', null, '', '', '', '1', '江苏省常州市武进区高新技术产业开发区凤栖路8号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-05-05 11:50:14', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ae0dbd6b24bb475f8f0d3d77b3c82dce', 'TU000332', '无锡联南精密机械科技有限公司', '无锡联南', '江苏无锡', null, 'C', '', '', '1', '江苏省无锡市滨湖区胡埭镇福安村张野58号', '10', '无锡微研陆小虎解释', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-09-19 10:19:01', 'yaoqiaohui', '2018-09-19 10:43:17', '客户材料选型');
INSERT INTO baseinfo_tradeunit VALUES ('b38581d9e23c4ed0a7faaf421500732e', 'TU000516', '昆山巧匠精密模具有限公司', '昆山巧匠', '江苏昆山', null, '', '', '陈永清', '1', '苏州市吴中区联谊路98-18', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-11-05 21:06:00', 'chenyongqing', '2019-04-17 20:53:59', '');
INSERT INTO baseinfo_tradeunit VALUES ('b451b5c8e2804220a74d63860a4ddd64', 'TU000511', '昆山涵佳腾精密电子科技有限公司', '昆山涵佳腾', '江苏昆山', null, '', '', '陈永清', '1', '昆山市高新区燕桥浜路168号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-22 13:38:10', 'chenyongqing', '2019-03-02 13:14:32', '');
INSERT INTO baseinfo_tradeunit VALUES ('b72dd07bc4f5461ca7c503ef3a94240f', 'TU000510', '昆山瑞琪元电子有限公司', '昆山瑞琪元', '江苏昆山', null, '', '91320583MA1WNL73X2', '', '1', '昆山市玉山镇北门路1588号8号厂房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'fangjianbo', '2018-10-20 18:59:24', 'fangjianbo', '2018-10-22 09:21:20', '');
INSERT INTO baseinfo_tradeunit VALUES ('b974ed6fae524dc4a4c1a1825e295bbd', 'TU000564', '昆山瑞兴源精密机械有限公司', '瑞兴源', '江苏昆山', null, '', '', '田双龙', '1', '', '20', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-03-14 12:25:21', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('bda05cd68d584ed1b3df81f23ab86c55', 'TU000547', '青岛富瑞鸿精密模具有限公司', '青岛富瑞鸿', '山东青岛', null, 'B', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-01-26 12:43:22', 'chenyongqing', '2019-04-29 21:04:46', '');
INSERT INTO baseinfo_tradeunit VALUES ('c4fa9f3884584c069b3c91c8a159f9c6', 'TU000508', '青岛钜祥精密模具有限公司', '青岛钜祥', '青岛', null, 'C', '', '', '1', '山東省青島市城陽區城中工業園豔陽路108號', '10', '庄挺介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-10-12 14:31:09', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('c59c170aeaff4da3a5044b4a99a8173a', 'TU000531', '江苏创扬机电设备股份有限公司', '江苏创扬', '江苏无锡', null, 'C', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-01-04 17:20:41', null, null, '博士第三方采购');
INSERT INTO baseinfo_tradeunit VALUES ('c71556ba90d94ac3a12e41d521d65f27', 'TU000599', '苏州同部精密模具科技有限公司', '苏州同部', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-23 16:59:10', 'chenyongqing', '2019-04-29 20:55:16', '');
INSERT INTO baseinfo_tradeunit VALUES ('c87f7f1798fc4f20a8735ef74a8d0a09', 'TU000636', '咸阳彩联金属制品有限公司', '咸阳彩联', '陕西咸阳', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-12 20:35:16', 'chenyongqing', '2019-06-12 20:36:02', '');
INSERT INTO baseinfo_tradeunit VALUES ('c9719523669d4955846a432519f78088', 'TU000634', '苏州昀冢电子科技有限公司', '苏州昀冢', '江苏昆山', null, null, '', '陈永清', '1', '', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-06-05 23:13:23', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('c9d840db01df4e99bfc3899e91e15bdc', 'TU000641', '浙江司泰克材料科技有限公司', '泰克', '绍兴', null, null, '', '', '2', '浙江省绍兴市柯桥区西环路586号科创大厦A座810室', '10', '', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-06-17 21:43:43', null, null, '无粘结相碳化钨材料');
INSERT INTO baseinfo_tradeunit VALUES ('cba13bfd84614aa78e495b70a84be6d5', 'TU000526', '三明普诺维机械有限公司', '普诺维', '福建三明', null, 'A', '', '张三', '1', '福建省三明市梅列区瑞云高源工业区6号', '10', '佳通张经理介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-16 21:53:03', 'admin', '2019-08-14 22:29:02', '');
INSERT INTO baseinfo_tradeunit VALUES ('cc36099af2194ac7a83b4cf06e7ed4b4', 'TU000549', '赫比国际有限公司', '赫比', '上海浦东金桥', null, 'A', '', '', '1', '上海市浦东新区新金桥路28号11楼', '10', '小陈', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-02-21 14:31:40', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ce121081f6da4795b97b65e127aeb2a6', 'TU000333', '得意精密电子(苏州)有限公司', '苏州得意', '江苏苏州', null, 'A', '', '', '1', '江苏省苏州市相城区漕湖大道26号', '20', '客户介绍', null, null, '{WeightDigit:\'1\',WeightUpdate:\'T\',PriceType:\'PRICETYPE20\',PriceTaxFlg:\'20\',NumPriceDigit:\'2\',Template:\'\'}', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-09-19 10:54:47', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ce2a6ecd3ba64e829e3e9e3f95c91d2b', 'TU000595', '艾俊超-平磨', '艾俊超-平磨', '江苏昆山', null, '', '', '', '1', '江苏昆山', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-08 22:13:24', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ce7768b1e5c84b95bfeebd0c11836cb2', 'TU000539', '昆山卓海精密模具有限公司', '昆山卓海', '昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-12-23 17:05:03', 'chenyongqing', '2019-03-02 13:11:06', '');
INSERT INTO baseinfo_tradeunit VALUES ('d1b34257c55646c892603d0be70b12d2', 'TU000570', '昆山信德优精密模具组件有限公司', '昆山信德优', '江苏昆山', null, '', '', '陈永清', '1', '江苏昆山', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 13:10:38', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('d22e9f349de14ea5a5398a772bd46b58', 'TU000606', '东莞昆仲电子有限公司', '东莞昆仲', '广东东莞', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-29 17:27:27', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('d31e85d9d9e14e01a8cc7b53d8e5b0b4', 'TU000597', '苏州永信德精密模具公司', '苏州永信德', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-12 21:38:28', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('d3346761340649bbb1078bef02c79e54', 'TU000566', '杰微宝精密模具（昆山）有限公司', '杰微宝', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-14 19:00:06', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('d70be459af074426b3ff8ae13d505f70', 'TU000540', '昆山必凡精密模具有限公司', '昆山必凡', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-12-25 21:23:46', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('d72dbdf228d74ddea20c507ec9b37602', 'TU000523', '协荣模具技研（苏州）有限公司', '苏州协荣', '江苏苏州', null, '', '', '陈永清', '1', '江苏省苏州市苏州工业园区春晖路3号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-11-08 21:36:40', 'chenyongqing', '2019-04-29 21:01:28', '');
INSERT INTO baseinfo_tradeunit VALUES ('d8a007a2ea734245ad77609a7c2cdb3f', 'TU000513', '浙江省诸暨市金虹机械有限公司', '金虹永利', '诸暨', null, 'C', '', '', '1', '浙江省诸暨市店口镇解放路118号', '10', '上海国际紧固件工业博览会', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-10-22 22:36:02', null, null, '客户做中冲棒有6年，原是台湾老金指导的，目前用的是山东的三友的日资棒料。');
INSERT INTO baseinfo_tradeunit VALUES ('e24bb89986314b388a437a963df7080a', 'TU000545', '昆山康亿泽精密模具有限公司', '昆山康亿泽', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-01-09 20:58:49', 'chenyongqing', '2019-03-04 15:49:44', '3台沙迪克 3台西部  2台PG   主要加工');
INSERT INTO baseinfo_tradeunit VALUES ('e32ae848a9554feeb339ee4f1031d70d', 'TU000544', '苏州和林微纳科技有限公司', '苏州和林', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-01-09 20:37:40', null, null, '20多台冲床   高端精微成型面向全球服务的高成长型高科技企业');
INSERT INTO baseinfo_tradeunit VALUES ('e41cb432d9084763804a8ffe4d53f623', 'TU000557', '昆山精义准精密模具科技有限公司', '昆山精义准', '昆山', null, '', '', '', '1', '昆山市成北兰泾支路25号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-03-04 11:21:23', 'chenyongqing', '2019-04-08 22:01:38', '天泽 曹经理介绍');
INSERT INTO baseinfo_tradeunit VALUES ('e431a4474c9c48649b46eb4275733aa4', 'TU000598', '苏州洋吉精密模具有限公司', '苏州洋吉', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-17 20:34:54', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('e5348d00eb02478db9d1b41d7c78eeb6', 'TU000593', '昆山恒奕铭精密模具有限公司', '昆山恒奕铬', '江苏昆山', null, '', '91320583MA1WEN6PXH', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-04-08 14:06:01', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('e6c81a3798e145989b3d467480ef77ad', 'TU000528', '泰兴市龙腾电子有限公司 ', '泰兴龙腾', '江苏省泰兴市元竹镇工业集聚区兴源路1号  ', null, 'C', '', '', '1', '江苏泰兴', '10', '金圣康吴总介绍', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2018-11-30 11:17:55', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('ed180876045544f9a46f734c2cc706a4', 'TU000590', '苏州华丰电子科技有限公司', '华丰', '苏州', null, '', '', '', '1', '', '10', '朱颂国', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-04-02 10:15:34', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('eda130bab5b24d24abf19f16fcda2cf0', 'TU000538', '昆山博智精密模具有限公司', '昆山博智', '昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2018-12-23 16:27:29', 'chenyongqing', '2019-03-02 13:11:21', '');
INSERT INTO baseinfo_tradeunit VALUES ('ee40a71643be40ea84338b4ecb449b14', 'TU000562', '昆山玉山镇仁科精密模具厂', '昆山仁科', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-11 10:42:13', 'chenyongqing', '2019-03-11 10:42:44', '2台PG  4台慢丝  2台放电');
INSERT INTO baseinfo_tradeunit VALUES ('eee8713cea8d410799e54eada7fc4ba3', 'TU000571', '苏州炬鸿通讯电脑科技有限公司', '苏州炬鸿', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-18 13:29:13', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f0c6a1b617984be4a0f7aa5021da02cd', 'TU000512', '扬州利松模具有限公司', '扬州利松', '江苏扬州', null, '', '', '', '1', '扬州市江都区郭村镇工业园区周楼', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-22 13:18:56', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f1ed302f9bf34a23a351d0d84a676357', 'TU000575', '昆山缔微致精密电子有限公司', '昆山缔微致', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-19 21:16:29', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f21e45afc8714aa2848d2f9d7fcbac8a', 'TU000543', '昆山千冈精密模具有限公司', '昆山千冈', '江苏昆山', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-01-09 20:24:09', 'chenyongqing', '2019-03-21 22:38:22', '1台PG    刘德周   昆山爱亿发到这家做PG      爱亿丁经理介绍');
INSERT INTO baseinfo_tradeunit VALUES ('f2c77452-bc23-11e8-aef9-00163e10d37d', 'TU000334', '昆山盛天朗精密模具有限公司', '昆山盛天朗', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市巴城镇古城北路4080号14栋', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:14:41', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c778ff-bc23-11e8-aef9-00163e10d37d', 'TU000335', '昆山鑫陆达精密模具科技有限公司', '昆山鑫陆达', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市巴城镇东定路361号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:38:37', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c77cfa-bc23-11e8-aef9-00163e10d37d', 'TU000336', '上海科晶精密制造有限公司', '上海科晶', '上海奉贤', null, null, null, null, '1', '上海市奉贤区柘林镇沪杭公路2554号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77d6c-bc23-11e8-aef9-00163e10d37d', 'TU000337', '联钢紧固系统(上海)有限公司', '上海联钢', '上海嘉定', null, null, null, null, '1', '上海市嘉定区马陆镇尚学路988号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77dc7-bc23-11e8-aef9-00163e10d37d', 'TU000338', '无锡东启金属制品有限公司', '无锡东启', '江苏无锡', null, null, null, null, '1', '江苏省无锡市新吴区锡兴路18号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77e1c-bc23-11e8-aef9-00163e10d37d', 'TU000339', '东莞盛翔精密金属有限公司', '东莞盛翔', '广东东莞', null, null, null, null, '1', '广东省东莞市黄江镇裕元工业区精诚二路南  新领益厂', '10', null, '1', null, '{WeightDigit:\'2\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'DGSX\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77e6d-bc23-11e8-aef9-00163e10d37d', 'TU000340', '淄博奥诺新材料科技有限公司', '淄博奥诺', '山东淄博', null, '', '', '陈永清', '1', '山东省淄博市张店区房镇镇淄博科技工业园南支一路5号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2018-11-03 12:20:43', '主要研发和生产精密陶瓷基板、无线充磁性材料和氧化锆手机背板等精密陶瓷元件');
INSERT INTO baseinfo_tradeunit VALUES ('f2c77ec0-bc23-11e8-aef9-00163e10d37d', 'TU000341', '浙江久立特材科技股份有限公司南浔分公司', '浙江久立', '浙江湖州', null, null, null, null, '1', '浙江省湖州市南浔区双林镇镇西', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77f79-bc23-11e8-aef9-00163e10d37d', 'TU000343', '奕铨精密五金有限公司', '奕铨精密', '福建厦门', null, null, null, null, '1', '福建省厦门市集美区杏林中亚城锦园西二路502号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c77fe7-bc23-11e8-aef9-00163e10d37d', 'TU000344', '仪征亚新科双环活塞有限公司', '仪征亚新科', '江苏扬州仪征', null, null, null, null, '1', '江苏省扬州市仪征市大庆南路5号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7804f-bc23-11e8-aef9-00163e10d37d', 'TU000345', '亚狮精密刀具（苏州）有限公司', '苏州亚狮', '江苏苏州', null, null, null, null, '1', '江苏省苏州市工业园区唯新路9号A1-3厂房', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c780ba-bc23-11e8-aef9-00163e10d37d', 'TU000346', '鑫长顺五金', '鑫长顺', '广东东莞', null, null, null, null, '1', '广东省东莞市石碣镇四甲工业区榴洲村中心路二巷', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78129-bc23-11e8-aef9-00163e10d37d', 'TU000347', '新基电子设备制造有限公司', '江阴新基', '江苏无江阴', null, null, null, null, '1', '江苏省无锡市江阴市长山路2号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7819b-bc23-11e8-aef9-00163e10d37d', 'TU000348', '无锡星德诺精工科技有限公司', '无锡星德诺', '江苏无锡', null, null, null, null, '1', '江苏省无锡市江阴市江阴澄江东路18号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7827a-bc23-11e8-aef9-00163e10d37d', 'TU000350', '无锡微硕精密机械制造有限公司', '无锡微硕', '江苏无锡', null, null, null, null, '1', '江苏省无锡市无锡市新吴区城南路226-1', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c782ec-bc23-11e8-aef9-00163e10d37d', 'TU000351', '无锡市普高精密机械科技有限公司', '无锡普高', '江苏无锡', null, '', '', '陈永清', '1', '江苏省无锡市锡山区锡山科技创业园祥云二座105-106', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:08:37', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c783d3-bc23-11e8-aef9-00163e10d37d', 'TU000353', '无锡市和润远达科技有限公司', '无锡和润远达', '江苏无锡', null, null, null, null, '1', '江苏省无锡市新区梅村锡贤路162-1', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78448-bc23-11e8-aef9-00163e10d37d', 'TU000354', '无锡市费斯特模具有限公司', '无锡费斯特', '江苏无锡', null, '', '', '陈永清', '1', '江苏省无锡市新区硕放镇新宅路118号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:08:51', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7849a-bc23-11e8-aef9-00163e10d37d', 'TU000355', '无锡铭青初创机电有限公司', '无锡铭青', '江苏无锡', null, null, null, null, '1', '江苏省无锡市新区江溪街道锡贤路78号森义大厦8405', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c784e4-bc23-11e8-aef9-00163e10d37d', 'TU000356', '无锡琅得精密机械有限公司', '无锡琅得', '江苏无锡', null, null, null, null, '1', '江苏省无锡市新区梅村锡勤路1号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7852e-bc23-11e8-aef9-00163e10d37d', 'TU000357', '无锡合悦机械制造有限公司', '无锡合悦', '江苏无锡', null, null, null, null, '1', '江苏省无锡市新区梅村锡达路569-5号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78574-bc23-11e8-aef9-00163e10d37d', 'TU000358', '温岭荣辉模具有限公司', '温岭荣辉', '浙江台州', null, null, null, null, '1', '浙江省台州市温岭市泽国镇荣时路8号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c785cb-bc23-11e8-aef9-00163e10d37d', 'TU000359', '潍坊裕元电子有限公司', '潍坊裕元', '山东潍坊', null, null, null, null, '1', '山东省潍坊市高新技术开发区高新产业园内）', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78694-bc23-11e8-aef9-00163e10d37d', 'TU000361', '泰州市荣晟磨具有限公司', '泰州荣晟', '江苏泰州', null, null, null, null, '1', '江苏省泰州市姜堰市姜堰区民营经济产业中心南工业集中区中心路', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c786f7-bc23-11e8-aef9-00163e10d37d', 'TU000362', '泰州市博义模具有限公司', '泰州博义', '江苏泰州', null, null, null, null, '1', '江苏省泰州市姜堰市沈高万众工业园（五环路）', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7875c-bc23-11e8-aef9-00163e10d37d', 'TU000363', '泰科电子有限公司', '泰科电子', '山东青岛', null, null, null, null, '1', '山东省青岛市城阳区河套出口加工区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c787c1-bc23-11e8-aef9-00163e10d37d', 'TU000364', '钛盟科技', '钛盟科技', '江苏苏州', null, null, null, null, '1', '江苏省苏州市吴中区甪直镇东庄路38号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78825-bc23-11e8-aef9-00163e10d37d', 'TU000365', '苏州昀灏精密模具有限公司', '苏州昀灏', '江苏苏州', null, 'A', '', '陈永清', '1', '江苏省苏州市昆山市陆杨倪家浜路1222号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2018-10-22 17:34:10', '慢丝6台  3台夏米尔   3台西部    CNC   平磨   PG 11月份要上1台\r\n肯纳CD650钨钢3-4万左右，其他KD20也在用，具体其他钨钢用量未知\r\n主要配套自己冲压厂加工整套模具，做手机配件，华为、苹果');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78889-bc23-11e8-aef9-00163e10d37d', 'TU000366', '苏州崯德合金工具有限公司', '苏州崯德', '江苏苏州', null, null, null, null, '1', '江苏省苏州市工业园区自由水岸花园16幢1905室', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c788f5-bc23-11e8-aef9-00163e10d37d', 'TU000367', '苏州熊颉电子科技有限公司', '苏州熊颉', '江苏苏州', null, '', '', '陈永清', '1', '江苏省苏州市吴中区甪直镇澄东村庆丰', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:41:05', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78959-bc23-11e8-aef9-00163e10d37d', 'TU000368', '苏州雄颉电子科技有限公司', '苏州雄颉', '江苏苏州', null, '', '', '陈永清', '1', '江苏省苏州市吴中区甪直镇澄东村庆丰', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-29 20:53:54', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c789b2-bc23-11e8-aef9-00163e10d37d', 'TU000369', '苏州特精模具有限公司', '苏州特精', '江苏苏州', null, null, null, null, '1', '江苏省苏州市苏州高新区联港路255号四号厂房一楼', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78a01-bc23-11e8-aef9-00163e10d37d', 'TU000370', '苏州市泰秀精密机械有限公司', '苏州泰秀', '江苏苏州', null, null, null, null, '1', '江苏省苏州市吴中区临湖镇湖桥湖中路88号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78a4a-bc23-11e8-aef9-00163e10d37d', 'TU000371', '苏州铭益嘉精密机械有限公司', '苏州铭益嘉', '江苏苏州', null, '', '', '陈永清', '1', '江苏省苏州市吴中区郭巷镇姜庄工业园九盛路503号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-28 20:47:50', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78a94-bc23-11e8-aef9-00163e10d37d', 'TU000372', '苏州隆升弹性元件有限公司', '苏州隆升', '江苏苏州', null, null, null, null, '1', '江苏省苏州市吴中区横泾镇木东路7554号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78b7e-bc23-11e8-aef9-00163e10d37d', 'TU000373', '苏州领裕电子科技有限公司', '苏州领裕', '江苏苏州', null, null, null, null, '1', '江苏省苏州市相城区黄埭镇春兰路8号', '10', null, '1', null, '{WeightDigit:\'2\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'SZLY\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78bcc-bc23-11e8-aef9-00163e10d37d', 'TU000374', '苏州领裕电子科技（领胜集团）', '苏州领裕（领胜集团）', '江苏苏州', null, null, null, null, '1', '江苏省苏州市相城区黄埭镇春兰路8号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78c1a-bc23-11e8-aef9-00163e10d37d', 'TU000375', '苏州福丰联合电子有限公司', '苏州福丰联合', '江苏太仓', null, null, null, null, '1', '江苏省苏州市太仓市沙溪镇印溪南路8383号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78cb1-bc23-11e8-aef9-00163e10d37d', 'TU000377', '苏州费斯塔精密工具有限公司', '苏州费斯塔', '江苏太仓', null, null, null, null, '1', '江苏省苏州市太仓市兴业南路11号太胜工业园2栋', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78cff-bc23-11e8-aef9-00163e10d37d', 'TU000378', '苏州鼎翔精密模具厂', '苏州鼎翔', '江苏苏州吴中', null, null, null, null, '1', '江苏省苏州市吴中区临湖镇浦庄大道石庄工业园A3幢', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78d43-bc23-11e8-aef9-00163e10d37d', 'TU000379', '苏州冲融金属制品有限公司', '苏州冲融', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市巴城镇石牌益伸路81号1#厂房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:39:53', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78d92-bc23-11e8-aef9-00163e10d37d', 'TU000380', '苏州安凯精密具有限公司', '苏州安凯', '江苏苏州', null, null, null, null, '1', '江苏省苏州市工业园区工业园浒牌路1号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78df3-bc23-11e8-aef9-00163e10d37d', 'TU000381', '沈阳威斯塑胶有限公司', '沈阳威斯', '辽宁沈阳', null, null, null, null, '1', '辽宁省沈阳市浑南新区高科路9号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78e41-bc23-11e8-aef9-00163e10d37d', 'TU000382', '舍弗勒大中华区', '舍弗勒', '江苏太仓', null, null, null, null, '1', '江苏省苏州市太仓市上海东路168号8栋汇金大厦7楼', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78e8e-bc23-11e8-aef9-00163e10d37d', 'TU000383', '上海溢妥贸易发展有限公司', '上海溢妥', '上海金山', null, null, null, null, '1', '上海市金山区朱泾镇商园街42号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78ed8-bc23-11e8-aef9-00163e10d37d', 'TU000384', '上海鑫技轴承配件有限公司', '上海鑫技', '上海松江', null, '', '', '陈永清', '1', '上海市松江区佘山强业路759号三幢北', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-21 22:34:00', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78f21-bc23-11e8-aef9-00163e10d37d', 'TU000385', '上海三觉金属制造有限公司', '上海三觉', '上海嘉定', null, null, null, null, '1', '上海市嘉定区金宝工业园区西区宝园四路500号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78f65-bc23-11e8-aef9-00163e10d37d', 'TU000386', '上海蒙恩电子科技有限公司', '上海蒙恩', '上海松江', null, '', '', '', '1', '上海上海市松江区徐塘路88号玛伊沙科创园1号楼', '10', '', null, null, '{WeightDigit:\'3\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'SHME\'}', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2018-12-25 21:39:25', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c78fa9-bc23-11e8-aef9-00163e10d37d', 'TU000387', '上海精元机械有限公司', null, null, null, null, null, null, '1', '上海上海市青浦区徐泾镇盈港东路1371号1幢', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c78fec-bc23-11e8-aef9-00163e10d37d', 'TU000388', '上海进日金属制品有限公司', '上海进日', '上海嘉定', null, null, null, null, '1', '上海上海市嘉定区黄渡镇东街村6号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7907b-bc23-11e8-aef9-00163e10d37d', 'TU000390', '上海广奇电气有限公司', '上海广奇', '上海嘉定', null, null, null, null, '1', '上海上海市嘉定区华亭工业园华高路535号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c790c3-bc23-11e8-aef9-00163e10d37d', 'TU000391', '厦门捷昕精密科技股份有限公司', null, null, null, null, null, null, '1', '福建省厦门市翔安区文勤路8号厦门技师学院崇技楼4号楼', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79156-bc23-11e8-aef9-00163e10d37d', 'TU000393', '荣华精密具加工厂', null, null, null, null, null, null, '1', '广东省东莞市寮步镇新旧围黄沙河西路17号B栋', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79199-bc23-11e8-aef9-00163e10d37d', 'TU000394', '日泰（上海）汽车标准件有限公司', null, null, null, null, null, null, '1', '上海上海市青浦区青浦工业园区天盈路555号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79222-bc23-11e8-aef9-00163e10d37d', 'TU000396', '泉州市汉威机械制造有限公司', null, null, null, null, null, null, '1', '福建省泉州市鲤城区江南高新科技园斗南街123号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79268-bc23-11e8-aef9-00163e10d37d', 'TU000397', '青岛永存竣电子科技有限公司', '青岛永存竣', '山东青岛', null, '', '', '', '1', '山东省青岛市城阳区夏庄街道华岭路北华安路东200米', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-29 21:06:29', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c79323-bc23-11e8-aef9-00163e10d37d', 'TU000399', '青岛沁泽悦机电有限公司', null, null, null, null, null, null, '1', '山东省青岛市城阳区流亭街道王家女姑社区西300米', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c793e0-bc23-11e8-aef9-00163e10d37d', 'TU000401', '青岛沁辰科机电有限公司', '青岛沁辰科', '山东青岛', null, null, null, null, '1', '山东省青岛市城阳区夏庄电子信息产业园书虹路7号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79442-bc23-11e8-aef9-00163e10d37d', 'TU000402', '青岛埃德法兹精密模具有限公司', '青岛埃德法兹', '山东青岛', null, null, null, null, '1', '山东省青岛市城阳区流亭空港工业园长江路供电所东侧', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c794a9-bc23-11e8-aef9-00163e10d37d', 'TU000403', '莆田市华达电子有限公司', null, null, null, null, null, null, '1', '福建省莆田市涵江区江口镇石庭赤港华侨经济开发区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7950c-bc23-11e8-aef9-00163e10d37d', 'TU000404', '盘起工业（大连）有限公司', '大连盘起', '辽宁大连', null, null, null, null, '1', '辽宁省大连市甘井子区大连开发区锦州街5号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79572-bc23-11e8-aef9-00163e10d37d', 'TU000405', '宁德新能源科技有限公司', '宁德新能源', '福建宁德', null, '', '', '', '1', '福建省宁德市蕉城区漳湾镇新港路1号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-10 21:10:58', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c795d7-bc23-11e8-aef9-00163e10d37d', 'TU000406', '宁波万佳电器有限公司', '宁波万佳', '浙江宁波', null, null, null, null, '1', '浙江省宁波市慈溪市长河镇工业区278号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79637-bc23-11e8-aef9-00163e10d37d', 'TU000407', '宁波市鄞州汇江金属制品有限公司', '宁波汇江', '浙江宁波', null, null, null, null, '1', '浙江省宁波市鄞州区高桥镇合心村兴业路3号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79691-bc23-11e8-aef9-00163e10d37d', 'TU000408', '宁波市普盛磁电科技有限公司', '宁波普盛', '浙江宁波', null, null, null, null, '1', '浙江省宁波市余姚市大隐镇工业园区9号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c796de-bc23-11e8-aef9-00163e10d37d', 'TU000409', '宁波润剑刀片有限公司', null, null, null, null, null, null, '1', '浙江省宁波市江北区洪塘街道赵家村', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7972c-bc23-11e8-aef9-00163e10d37d', 'TU000410', '宁波百盛荣金属制品有限公司', '宁波百盛荣', '浙江宁波', null, null, null, null, '1', '浙江省宁波市鄞州区云龙镇顿岙村隐学岭', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79777-bc23-11e8-aef9-00163e10d37d', 'TU000411', '南通捷硕自动化设备有限公司', '南通捷硕', '江苏南通', null, null, null, null, '1', '江苏省南通市如东县岔河镇汽车站东加油站森润纺织东隔壁', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79809-bc23-11e8-aef9-00163e10d37d', 'TU000413', '轮兴机械工业(昆山)有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市张浦镇港浦东路56号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7992f-bc23-11e8-aef9-00163e10d37d', 'TU000417', '乐清市中大通用汽配厂', null, null, null, null, null, null, '1', '浙江省温州市乐清市蒲岐特色工业区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79973-bc23-11e8-aef9-00163e10d37d', 'TU000418', '乐清市远浦电气有限公司', '乐清远浦', '浙江乐清', null, null, null, null, '1', '浙江省温州市乐清市柳市镇象阳工业区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c799bd-bc23-11e8-aef9-00163e10d37d', 'TU000419', '乐清市宇辉有限公司', null, null, null, null, null, null, '1', '浙江省温州市乐清市天成乡天成工业区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79a06-bc23-11e8-aef9-00163e10d37d', 'TU000420', '乐清市三和模具有限公司', null, null, null, null, null, null, '1', '浙江省温州市乐清市虹桥镇虹桥中路96号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79a47-bc23-11e8-aef9-00163e10d37d', 'TU000421', '昆山卓力特精密模具有限公司', '昆山卓力特', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市城北强安路10号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:10:57', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c79ad7-bc23-11e8-aef9-00163e10d37d', 'TU000423', '昆山准嘉鑫精密模具有限公司', '昆山准嘉鑫', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市花桥镇花安路1463号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79b1f-bc23-11e8-aef9-00163e10d37d', 'TU000424', '昆山泽华精密模具有限公司', '昆山泽华', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市张浦镇同舟路98号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79b67-bc23-11e8-aef9-00163e10d37d', 'TU000425', '昆山玉山镇诺博克精密模具厂', '昆山诺博克', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市城北五联路921号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79d8d-bc23-11e8-aef9-00163e10d37d', 'TU000426', '昆山优美特电子科技有限公司', '昆山优美特', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市玉山镇玉城北路189号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79df5-bc23-11e8-aef9-00163e10d37d', 'TU000427', '昆山毅润机械设备有限公司', '昆山毅润', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市北门路3888号E6-3#', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79e5e-bc23-11e8-aef9-00163e10d37d', 'TU000428', '昆山亚兆精密模具有限公司', '昆山亚兆', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市巴城镇石牌光晟路339号5号厂区', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79f2d-bc23-11e8-aef9-00163e10d37d', 'TU000430', '昆山勖研精密模具有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市玉山镇同心路2068号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c79ff4-bc23-11e8-aef9-00163e10d37d', 'TU000432', '昆山鑫智望精密机械有限公司', '昆山鑫智望', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市巴城镇石牌瑞安路8号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:15:46', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a0d0-bc23-11e8-aef9-00163e10d37d', 'TU000433', '昆山天兴电子有限公司', '昆山天兴', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市巴城镇石牌欣基路78号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:12:25', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a134-bc23-11e8-aef9-00163e10d37d', 'TU000434', '昆山市玉山镇大泰精密模具厂', null, null, null, null, null, null, '1', '江苏省苏州市昆山市玉山镇城北创新路99号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a181-bc23-11e8-aef9-00163e10d37d', 'TU000435', '昆山市益金美模具厂', '昆山益金美', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市古城北路4885号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a1c6-bc23-11e8-aef9-00163e10d37d', 'TU000436', '昆山市瑞捷精密有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市玉山镇虹桥路1188号E栋', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a20e-bc23-11e8-aef9-00163e10d37d', 'TU000437', '昆山市牧丰模具工业有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市水秀路1881号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a258-bc23-11e8-aef9-00163e10d37d', 'TU000438', '昆山市晋基精密机械模具有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市张浦镇滨江北路150号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a2a1-bc23-11e8-aef9-00163e10d37d', 'TU000439', '昆山市东成胜精密模具有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市周市镇青阳北路319号松岗工业园B栋', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a3bd-bc23-11e8-aef9-00163e10d37d', 'TU000443', '昆山上迈电子科技有限公司', '昆山上迈', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市玉山镇玉城中路2号3号房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-21 22:37:53', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a404-bc23-11e8-aef9-00163e10d37d', 'TU000444', '昆山锐铭精密模具有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市玉山镇城北丁泾路158号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a44e-bc23-11e8-aef9-00163e10d37d', 'TU000445', '昆山日鑫特模具有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市昆山模具城製造區四期33-1號', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a4e4-bc23-11e8-aef9-00163e10d37d', 'TU000447', '昆山仁齐飞电子科技有限公司', '昆山仁齐飞', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市玉山镇中环路115号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:10:05', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a52d-bc23-11e8-aef9-00163e10d37d', 'TU000448', '昆山品越精密模具有限公司', '昆山品越', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市陆杨镇富强路68号1幢', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a578-bc23-11e8-aef9-00163e10d37d', 'TU000449', '昆山品耀精密机械有限公司', '昆山品耀', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市昆山高新区包家桥路228号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:12:10', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a5bb-bc23-11e8-aef9-00163e10d37d', 'TU000450', '昆山纳川机械有限公司', '昆山纳川', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市北门路3888号模具城E11-4', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:14:57', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a649-bc23-11e8-aef9-00163e10d37d', 'TU000452', '昆山凯意纺织机械有限公司', '昆山凯意', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市正仪农场路198号凯意织针有限公司', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-29 21:02:56', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a697-bc23-11e8-aef9-00163e10d37d', 'TU000453', '昆山进荣中川五金有限公司', '昆山进荣中川', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市张浦镇同创路139号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:15:39', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a6da-bc23-11e8-aef9-00163e10d37d', 'TU000454', '昆山惠乐精密工业有限公司', '昆山惠乐', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市汉浦路1999号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a761-bc23-11e8-aef9-00163e10d37d', 'TU000456', '昆山宏泽电子有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市张浦镇俱巷路168号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a7b7-bc23-11e8-aef9-00163e10d37d', 'TU000457', '昆山恒兴泰自动化技术有限公司', '昆山恒兴泰', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市北门路738号都市汇1号楼703室', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a81f-bc23-11e8-aef9-00163e10d37d', 'TU000458', '昆山富得康精密模具有限公司', '昆山富得康', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市玉山镇永丰余路1899号2号房', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a882-bc23-11e8-aef9-00163e10d37d', 'TU000459', '昆山鼎瑞电子科技有限公司', '昆山鼎瑞', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市玉山镇同心路2018号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:16:10', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a957-bc23-11e8-aef9-00163e10d37d', 'TU000461', '昆山达通精密机械有限公司', '昆山达通', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市周市镇超英西路2号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:15:15', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7a9b8-bc23-11e8-aef9-00163e10d37d', 'TU000462', '昆山博润纳精密电子有限公司', '昆山博润纳', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市玉山镇高新区丁泾路5号3号厂房', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7aa24-bc23-11e8-aef9-00163e10d37d', 'TU000463', '昆山安诺伊精密模具有限公司', '昆山安诺伊', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市北门路1430号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ab5b-bc23-11e8-aef9-00163e10d37d', 'TU000466', '可发科技(宿迁)有限公司', null, null, null, null, null, null, '1', '江苏省宿迁市宿迁市苏宿工业园区古城路21号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7abc8-bc23-11e8-aef9-00163e10d37d', 'TU000467', '可发科技(宿迁)有限公司', null, null, null, null, null, null, '1', '江苏省宿迁市宿迁市苏宿工业园区古城路21号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ac2f-bc23-11e8-aef9-00163e10d37d', 'TU000468', '金荣公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市千灯镇石浦街道仁成路79号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ac7f-bc23-11e8-aef9-00163e10d37d', 'TU000469', '江阴市恒通电器有限公司', null, null, null, null, null, null, '1', '江苏省无锡市江阴市南闸镇南焦璐219号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7acca-bc23-11e8-aef9-00163e10d37d', 'TU000470', '江阴康强电子有限公司', '江阴康强', '江苏江阴', null, null, null, null, '1', '江苏省无锡市江阴市经济开发区东定路3号', '10', null, '1', null, '{WeightDigit:\'2\',WeightUpdate:\'F\',PriceType:\'PRICETYPE10\',PriceTaxFlg:\'10\',NumPriceDigit:\'2\',Template:\'JYKQ\'}', null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ad12-bc23-11e8-aef9-00163e10d37d', 'TU000471', '江苏旭虹精密零组件有限公司', '江苏旭虹', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市周市镇陆杨友谊北路93号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:36:56', '外发供应商：昆山卓凡  昆山麦克诺  昆山诺博克  昆山多平洋  江苏华富  昆山泰源吉  昆山霖茂    晨杰');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ad59-bc23-11e8-aef9-00163e10d37d', 'TU000472', '江苏省靖江华旺地毯针厂', '江苏华旺', '江苏靖江', null, null, null, null, '1', '江苏省泰州市靖江市靖城镇城南开发区五圩港闸东路1号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ada1-bc23-11e8-aef9-00163e10d37d', 'TU000473', '江苏沙龙机电科技有限公司', '江苏沙龙', '江苏靖江', null, null, null, null, '1', '江苏省泰州市靖江市新港园区夏仕港套闸北首800米（新世纪大道友谊金属厂后）', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7adef-bc23-11e8-aef9-00163e10d37d', 'TU000474', '江苏茂厚汇机械设备有限公司', '江苏茂厚汇', '江苏扬中', null, null, null, null, '1', '江苏省镇江市扬中市三茅街道三二线（永兴集团内）', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ae44-bc23-11e8-aef9-00163e10d37d', 'TU000475', '江苏金成机械科技有限公司', '江苏金成', '江苏淮安', null, null, null, null, '1', '江苏省淮安市淮安经济开发区淮安区永怀东路99号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7ae8b-bc23-11e8-aef9-00163e10d37d', 'TU000476', '江苏博俊工业科技股份有限公司', null, null, null, null, null, null, '1', '江苏省苏州市昆山市昆山开发区龙江路88号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7aed9-bc23-11e8-aef9-00163e10d37d', 'TU000477', '江苏艾锐博精密属科技有限公司', '江苏艾锐博', '江苏昆山', null, '', '', '陈永清', '1', '江苏省苏州市昆山市青阳北路923号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-27 21:39:25', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7af23-bc23-11e8-aef9-00163e10d37d', 'TU000478', '健伦精密机械（中国)有限公司', '健伦精密', '江苏昆山', null, null, null, null, '1', '江苏省苏州市昆山市千灯镇石浦玉溪东路289号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7afb1-bc23-11e8-aef9-00163e10d37d', 'TU000480', '河南龙华纺织器材有限公司', '河南龙华', '河南三门峡', null, null, null, null, '1', '河南省三门峡市三门峡市经济技术开发区分陕路168号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7aff9-bc23-11e8-aef9-00163e10d37d', 'TU000481', '河间市诗经标准件模具厂', '河间诗经', '河北河间', null, null, null, null, '1', '河北省沧州市河间市西村乡西村', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b040-bc23-11e8-aef9-00163e10d37d', 'TU000482', '杭州英思睿信息科技有限公司', '杭州英思睿', '浙江杭州', null, '', '', '陈永清', '1', '浙江省杭州市萧山区萧山经济开发区鸿达路201号1号厂房', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-03-02 13:16:32', 'SIM卡');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b084-bc23-11e8-aef9-00163e10d37d', 'TU000483', '歌尔股份有限公司', '歌尔股份', '山东潍坊', null, null, null, null, '1', '山东省潍坊市潍坊市高新区东方路268号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b1ed-bc23-11e8-aef9-00163e10d37d', 'TU000488', '番禺得意精密電子工業有限公司', null, null, null, null, null, null, '1', '广东省广州市广州市廣東省廣州市南沙區金嶺北路526號', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b294-bc23-11e8-aef9-00163e10d37d', 'TU000489', '东莞市祥展精密模具有限公司', null, null, null, null, null, null, '1', '广东省东莞市长安镇沙头社区大井街73号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b2e2-bc23-11e8-aef9-00163e10d37d', 'TU000490', '东莞市美合钢金属材料有限公司', '东莞美合钢', '广东东莞', null, null, null, null, '1', '广东省东莞市大岭山镇大岭山鸡翅岭工业区雅迪路3号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b324-bc23-11e8-aef9-00163e10d37d', 'TU000491', '东莞市晶瓷精密模具有限公司', '东莞晶瓷', '广东东莞', null, null, null, null, '1', '广东省东莞市长安镇厦边社区大板地2路1号厂房', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b36b-bc23-11e8-aef9-00163e10d37d', 'TU000492', '东莞市和运精密模具有限公司', null, null, null, null, null, null, '1', '广东省东莞市长安镇沙头大井街', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b44d-bc23-11e8-aef9-00163e10d37d', 'TU000495', '慈溪市英嘉光电有限公司', null, null, null, null, null, null, '1', '浙江省宁波市慈溪市崇寿东大道378号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b49c-bc23-11e8-aef9-00163e10d37d', 'TU000496', '成都铭吉丰机电有限公司', '成都铭吉', '四川成都', null, null, null, null, '1', '四川省成都市成都市/资阳市/眉山市金府路555号16号大厅4号门', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b4ea-bc23-11e8-aef9-00163e10d37d', 'TU000497', '常州市润霟制针有限公司', '常州润霟', '江苏常州', null, null, null, null, '1', '江苏省常州市新北区奔牛祁家工业园新宇齿轮厂内润霟制针', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b52d-bc23-11e8-aef9-00163e10d37d', 'TU000498', '常州固吉模具技术有限公司', '常州固吉', '江苏常州', null, null, null, null, '1', '江苏省常州市武进区江苏常州武进高新区长三角模具城1303/05A', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b571-bc23-11e8-aef9-00163e10d37d', 'TU000499', '常熟万克精密工具有限公司', '常熟万克', '江苏苏州常熟', null, '', '', '', '1', '江苏省苏州市常熟市辛庄镇张桥工业区', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null, null, 'chenyongqing', '2019-04-29 21:02:25', '');
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b5b5-bc23-11e8-aef9-00163e10d37d', 'TU000500', '标通标准技术（上海）有限公司', null, null, null, null, null, null, '1', '上海上海市浦东新区浦东康桥东路1159弄69号11号楼', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b642-bc23-11e8-aef9-00163e10d37d', 'TU000502', '安特（惠州）工业有限公司', null, null, null, null, null, null, '1', '广东省惠州市惠州市斜下平南工业区平南路3号财务部', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f2c7b68d-bc23-11e8-aef9-00163e10d37d', 'TU000503', '安徽大华半导体科技有限公司', null, null, null, null, null, null, '1', '安徽省合肥市合肥市高新区文曲路919号', '10', null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO baseinfo_tradeunit VALUES ('f389bfe25cb140438ea9bf1918c8f404', 'TU000640', '宁波启克', '宁波启克电子有限公司', '宁波', null, null, '', '', '1', '', '10', '宁波华龙', null, '', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'wuxiumei', '2019-06-17 11:15:14', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f51dac101815476daf6e6c24ed42f94d', 'TU000583', '江苏讯齐微模具科技有限公司', '江苏讯齐微', '江苏昆山', null, '', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-30 20:06:07', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f6143e4e48734968b484e366b5f302e0', 'TU000588', '苏州恒辉精密钨钢模具厂', '苏州恒辉', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-01 17:10:41', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f646d97ca9f146908b214c7772a2b2aa', 'TU000560', '上海若瑾精密模具有限公司', '上海若瑾', '上海松江', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-03-06 19:56:59', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('f89c70ce236845c1802339589f4f2fca', 'TU000542', '无锡誉至机电设备有限公司', '誉至机电', '无锡', null, 'C', '', '', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-01-03 15:52:50', null, null, '博士第三采购');
INSERT INTO baseinfo_tradeunit VALUES ('fa6c2be235d24d87a4fdf43e140dd5f6', 'TU000601', '苏州优熠精密机械有限公司', '苏州优熠', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-04-26 17:17:13', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('fa9e9f66b7454806a70c8b417250a116', 'TU000524', '上海莫仕连接器有限公司', '上海莫仕', '上海自由贸易试验区', null, 'A', '', '', '1', '中国(上海)自由贸易试验区英伦路889号', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'zhudafeng', '2018-11-14 10:30:11', null, null, '');
INSERT INTO baseinfo_tradeunit VALUES ('fac16281ff524846aa44c0323cef0bd3', 'TU000546', '瀚荃电子科技(苏州)有限公司 ', '苏州瀚荃', '江苏苏州', null, '', '', '陈永清', '1', '', '10', '', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'chenyongqing', '2019-01-11 09:53:36', 'chenyongqing', '2019-03-27 21:39:39', '电子连接器，软排线以及线材组件，产品应用遍布于消费性电子、电脑、通讯以及光电产业');
INSERT INTO baseinfo_tradeunit VALUES ('fdaa520f375b4202ad3b74877197fad6', 'TU000626', '浙江自贸区哈瓦特金属材料科技有限公司', '哈瓦特', '宁波', null, null, '', '', '1', '宁波余姚模具城金型路450号', '10', 'Erci', null, null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'yaoqiaohui', '2019-05-28 11:43:59', null, null, '模具材料经销商');

-- ----------------------------
-- Table structure for `baseinfo_tradeunitlinkman`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunitlinkman`;
CREATE TABLE `baseinfo_tradeunitlinkman` (
  `LINKMAN_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) DEFAULT NULL,
  `LINKMAN_NAME` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `MOBILE_NO` varchar(500) DEFAULT NULL COMMENT '联系人手机',
  `TELPHONE_NO` varchar(500) DEFAULT NULL COMMENT '联系人电话',
  `FAX_NO` varchar(200) DEFAULT NULL COMMENT '联系人传真',
  `OFFICE_ADDRESS_INFO` varchar(1000) DEFAULT NULL COMMENT '联系人办公地址',
  `HOME_ADDRESS_INFO` varchar(200) DEFAULT NULL COMMENT '联系人家庭地址',
  `POSITION_INFO` varchar(100) DEFAULT NULL COMMENT '联系人的职位信息',
  `ENTRY_DATE` date DEFAULT NULL COMMENT '入职日期',
  `IS_JOB` varchar(100) DEFAULT NULL COMMENT '联系人是否在职（1：在职；2：离职）',
  `IS_PURCHASE` varchar(10) DEFAULT NULL COMMENT '是否采购员',
  `REF_LINKMAN_ID` varchar(10) DEFAULT NULL COMMENT '关联联系人ID，用于记录联系人离职之前的所在公司信息',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LINKMAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商联系人信息表';

-- ----------------------------
-- Records of baseinfo_tradeunitlinkman
-- ----------------------------
INSERT INTO baseinfo_tradeunitlinkman VALUES ('2ba720235f9a46cbb29e1eb94616e82f', '147f21e4-b24e-11e8-bfc6-00163e10d37d', 'asfas', '23412412', '2341234', '1234132', '', '', '12341234', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:21:51', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('3b7c2fc4636b4e81ac5eaa5a9b93aec2', '147f0fd1-b24e-11e8-bfc6-00163e10d37d', '徐传斌', '2432432421', '123424', '', '是的发生', '', '阿斯顿发', '2019-07-01', '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-01 13:52:58', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('3e5263f9feb14229a52ead57acbe62d8', 'cba13bfd84614aa78e495b70a84be6d5', '24', '认为', '发送', '', '', '', '', '2019-06-25', '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-26 12:50:28', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('48f0864f57204f6bb68c45fffafdd121', '147ef135-b24e-11e8-bfc6-00163e10d37d', '32412', '1234123', '23412', '213412', '', '', '213412', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:16:23', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('4ada30fa07704d23909dd77bf7880d24', '147ec37c-b24e-11e8-bfc6-00163e10d37d', '撒旦法', '撒旦法', '撒旦法', '撒旦法', '', '', '', '2019-06-25', null, '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-11 16:26:01', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('555ace4a8f504062a67608ea309805d3', 'f2c77e1c-bc23-11e8-aef9-00163e10d37d', '测试', '34534523', 'wqrqewrqew', '', '', '', '', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-16 10:14:26', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('577eb73c5bdf408097139b24f0817207', '147f1050-b24e-11e8-bfc6-00163e10d37d', '于连涛', '13391221223', '021-57464677', '', '', '', '', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-22 13:37:05', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('5a74184c479b4f7a8795896fcd61a36e', '99249b3eeec44514ae6284ef289c7202', '张军伟', '18550252980', '', '', '', '', '', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-22 13:18:07', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('5b775fb112ec46eebf4d08bdae4f8470', '147ec133-b24e-11e8-bfc6-00163e10d37d', '出传播', '12345573456', '021-98763456', '021-98763456', '', '', '采购', '2019-05-20', null, '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-25 18:29:38', 'admin', '2019-05-27 23:18:31', '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('768adae03ec44ad9961baef320ea3465', '9b876969c7294ba493a0eaf6ccec1edf', '234343', '2343', '', '', '', '', '', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-17 09:52:35', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('7c427e1f408b4f258a36f9697c7ba50c', 'b451b5c8e2804220a74d63860a4ddd64', '丁总', '13358053747', '', '', '', '', '', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-10-22 13:38:31', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('8cff7d41f1b24a4fa88074fb632b1d95', 'cba13bfd84614aa78e495b70a84be6d5', '242', '234', '1243', '', '', '', '', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-29 17:41:38', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('8d127704891644de87d6d55c21bd0361', '147ed84b-b24e-11e8-bfc6-00163e10d37d', 'wera', 'asdf', 'aasdf', 'asdf', 'asdf', 'asdf', 'adsf', '2019-06-26', null, '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-21 16:39:17', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('9020989a3f0c4519ab99861ee9c7772c', 'cc889230bcd642f38b674a3a2b136cce', '324', '玩儿', '万人次', '我认为', '我认为', ' 让我去', ' 我去', '2019-05-28', null, '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-27 22:01:56', 'admin', '2019-05-27 23:14:42', '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('926b3756698b40408c3af275afb33901', '147f076b-b24e-11e8-bfc6-00163e10d37d', '测试联系人', '123332543543', '14324', '12312', '123', '124123', '423', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2018-09-18 12:54:23', 'admin', '2018-09-18 12:54:46', '1243');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('b34115b7b9d9482782f891c7c6231146', 'f2c78f65-bc23-11e8-aef9-00163e10d37d', '测试12', '234234214', '2342134', '12341234', '', '', '', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 11:20:08', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('ba3f6f2eec704762a28ce118f04def3e', 'f2c78b7e-bc23-11e8-aef9-00163e10d37d', 'sfsdf', '2423423', '2421', '23423', '', '', '', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 11:00:18', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('c6b669a4d5dc4c83822ff107429ae378', 'f2c7acca-bc23-11e8-aef9-00163e10d37d', '江小姐', '242424234', '242424234', '242424234', '', '', '', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-09-05 22:25:18', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('c9a4551d0d384d97a6885625cd18a906', 'ce121081f6da4795b97b65e127aeb2a6', 'sdf', '2432', '234', '234', '', '', '', '2019-07-16', '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-02 13:55:12', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('e18641f0e54346868b1043fedfa2dcd9', 'cba13bfd84614aa78e495b70a84be6d5', '24', '认为', '发送', '', '', '', '', '2019-06-25', '2', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-26 12:52:44', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman VALUES ('ef8a3898ebef425093e0ee6970347362', '147ed145-b24e-11e8-bfc6-00163e10d37d', '345324', '12421', '234', '213412', '', '', '23412', null, '1', '10', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:18:55', null, null, '');

-- ----------------------------
-- Table structure for `baseinfo_tradeunitlinkman_resumes`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunitlinkman_resumes`;
CREATE TABLE `baseinfo_tradeunitlinkman_resumes` (
  `LINKMAN_RESUMES_ID` varchar(100) NOT NULL,
  `LINKMAN_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) DEFAULT NULL,
  `TRADEUNIT_NAME` varchar(100) DEFAULT NULL,
  `LINKMAN_NAME` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `MOBILE_NO` varchar(500) DEFAULT NULL COMMENT '联系人手机',
  `TELPHONE_NO` varchar(500) DEFAULT NULL COMMENT '联系人电话',
  `FAX_NO` varchar(200) DEFAULT NULL COMMENT '联系人传真',
  `OFFICE_ADDRESS_INFO` varchar(1000) DEFAULT NULL COMMENT '联系人办公地址',
  `HOME_ADDRESS_INFO` varchar(200) DEFAULT NULL COMMENT '联系人家庭地址',
  `POSITION_INFO` varchar(100) DEFAULT NULL COMMENT '联系人的职位信息',
  `ENTRY_DATE` date DEFAULT NULL COMMENT '入职日期',
  `LEAVE_DATE` date DEFAULT NULL COMMENT '离职日期',
  `IS_JOB` varchar(100) DEFAULT NULL COMMENT '联系人是否在职（1：在职；2：离职）',
  `RESUME_TYPE` varchar(100) DEFAULT NULL COMMENT '履历信息分类（入职；离职；变更地址；变更联系方式）',
  `RESUME_INFO` text COMMENT '履历信息说明',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LINKMAN_RESUMES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商联系人履历表';

-- ----------------------------
-- Records of baseinfo_tradeunitlinkman_resumes
-- ----------------------------
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('0f07d87a7a7f42ee8ad7c373cf66a2d6', '8cff7d41f1b24a4fa88074fb632b1d95', 'cba13bfd84614aa78e495b70a84be6d5', null, '242', '234', '1243', '', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-29 17:41:38', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('490ebd4d8edf4a0f9b4a3dc2d3d80723', 'e18641f0e54346868b1043fedfa2dcd9', 'cba13bfd84614aa78e495b70a84be6d5', null, '24', '认为', '发送', '', '', '', '', '2019-06-25', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-26 12:52:44', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('52047a87627f4c40b3b0ce4606d3ce4c', 'ef8a3898ebef425093e0ee6970347362', '147ed145-b24e-11e8-bfc6-00163e10d37d', null, '345324', '12421', '234', '213412', '', '', '23412', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:18:55', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('53fe9f7ecce54940a6d4cd00584169bd', '3b7c2fc4636b4e81ac5eaa5a9b93aec2', '147f0fd1-b24e-11e8-bfc6-00163e10d37d', null, '徐传斌', '2432432421', '123424', '', '是的发生', '', '阿斯顿发', '2019-07-01', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-01 13:52:58', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('58eea67504ee464ab6655d96198097ad', 'c6b669a4d5dc4c83822ff107429ae378', 'f2c7acca-bc23-11e8-aef9-00163e10d37d', null, '江小姐', '242424234', '242424234', '242424234', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-09-05 22:25:18', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('60769a373fe945489d7843deca1bec05', 'ba3f6f2eec704762a28ce118f04def3e', 'f2c78b7e-bc23-11e8-aef9-00163e10d37d', null, 'sfsdf', '2423423', '2421', '23423', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 11:00:18', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('62dc6ab134dc408484003f70d829e85c', 'e18641f0e54346868b1043fedfa2dcd9', 'cba13bfd84614aa78e495b70a84be6d5', '三明普诺维机械有限公司', '24', '认为', '发送', '', '', '', '', '2019-06-25', null, '2', '', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-26 12:53:40', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('b5e51bffe52d473b83d31b7a320adc8e', 'c9a4551d0d384d97a6885625cd18a906', 'ce121081f6da4795b97b65e127aeb2a6', null, 'sdf', '2432', '234', '234', '', '', '', '2019-07-16', null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-02 13:55:12', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('cd4e2082858c40ecb7a5d857a85f0388', '48f0864f57204f6bb68c45fffafdd121', '147ef135-b24e-11e8-bfc6-00163e10d37d', null, '32412', '1234123', '23412', '213412', '', '', '213412', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:16:23', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('ddeb0868ca1d460b9563132547c63548', '768adae03ec44ad9961baef320ea3465', '9b876969c7294ba493a0eaf6ccec1edf', null, '234343', '2343', '', '', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-17 09:52:35', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('e031466c7a23447d843e19cc7ae8b097', '2ba720235f9a46cbb29e1eb94616e82f', '147f21e4-b24e-11e8-bfc6-00163e10d37d', null, 'asfas', '23412412', '2341234', '1234132', '', '', '12341234', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 11:21:51', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('e346c3f298574aa1a4dc5f92f9176a27', 'b34115b7b9d9482782f891c7c6231146', 'f2c78f65-bc23-11e8-aef9-00163e10d37d', null, '测试12', '234234214', '2342134', '12341234', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 11:20:08', null, null, '');
INSERT INTO baseinfo_tradeunitlinkman_resumes VALUES ('ffe54085c23c43228685597ef597c762', '555ace4a8f504062a67608ea309805d3', 'f2c77e1c-bc23-11e8-aef9-00163e10d37d', null, '测试', '34534523', 'wqrqewrqew', '', '', '', '', null, null, '1', null, null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-07-16 10:14:26', null, null, '');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_dept`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_dept`;
CREATE TABLE `baseinfo_tradeunit_dept` (
  `TRADEUNIT_DEPT_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL COMMENT '客户部门名称',
  `DEPT_LEADER` varchar(100) DEFAULT NULL COMMENT '客户部门负责人',
  `DEPT_TYPE` varchar(100) DEFAULT NULL COMMENT '客户部门类型',
  `DEPT_FUNCTION` varchar(1000) DEFAULT NULL COMMENT '客户部门职能',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK_DEPT` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商部门信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit_dept
-- ----------------------------
INSERT INTO baseinfo_tradeunit_dept VALUES ('a72cbcfd316844be93296596bdf32501', 'cc889230bcd642f38b674a3a2b136cce', '测试住在', '234', '水电费', '发斯蒂芬', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-27 22:01:11', null, null, '');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_grade`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_grade`;
CREATE TABLE `baseinfo_tradeunit_grade` (
  `TRADEUNIT_GRADE_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `GRADE_INFO` varchar(30) DEFAULT NULL COMMENT '客户等级：A,B,C',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK_GRADE` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_GRADE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商等级信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit_grade
-- ----------------------------
INSERT INTO baseinfo_tradeunit_grade VALUES ('d0918f6b-7238-11e9-ba11-54e1ad19c940', 'cc889230bcd642f38b674a3a2b136cce', 'C', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-09 16:56:11', null, null, '热污染');
INSERT INTO baseinfo_tradeunit_grade VALUES ('e915295d-7235-11e9-ba11-54e1ad19c940', 'cc889230bcd642f38b674a3a2b136cce', 'D', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-09 16:35:23', null, null, '爱是飞洒的\nsfsdf安抚\n爱是飞洒的');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_machine`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_machine`;
CREATE TABLE `baseinfo_tradeunit_machine` (
  `TRADEUNIT_MACHINE_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `MACHINE_NAME` varchar(100) DEFAULT NULL COMMENT '设备名称',
  `MACHINE_TYPE` varchar(1000) DEFAULT NULL COMMENT '设备类型',
  `MACHINE_NUM` varchar(100) DEFAULT NULL COMMENT '设备数量',
  `MACHINE_BRAND` varchar(1000) DEFAULT NULL COMMENT '设备品牌',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK_MACHINE` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_MACHINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商设备信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit_machine
-- ----------------------------
INSERT INTO baseinfo_tradeunit_machine VALUES ('0ac7509611bc4d4eaf151926a70d7323', 'cc889230bcd642f38b674a3a2b136cce', '34325', '3253', '345', '3245', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-27 22:04:13', null, null, '345');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_material`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_material`;
CREATE TABLE `baseinfo_tradeunit_material` (
  `TRADEUNIT_MATERIAL_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `MATERIAL_NAME` varchar(100) DEFAULT NULL COMMENT '材料牌号	',
  `MATERIAL_SPEC` varchar(1000) DEFAULT NULL COMMENT '材料规格',
  `MATERIAL_USENUM` varchar(100) DEFAULT NULL COMMENT '材料使用量',
  `MATERIAL_PROVIDER` varchar(1000) DEFAULT NULL COMMENT '材料供应商',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK_MATERIAL` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_MATERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商使用材料信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit_material
-- ----------------------------
INSERT INTO baseinfo_tradeunit_material VALUES ('0b86c9424566488d9d4c305e53a10700', 'cc889230bcd642f38b674a3a2b136cce', '53245', '3245', '435', '235', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-27 22:04:24', null, null, '3425');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_production`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_production`;
CREATE TABLE `baseinfo_tradeunit_production` (
  `TRADEUNIT_PRODUCTION_ID` varchar(100) NOT NULL,
  `TRADEUNIT_ID` varchar(100) NOT NULL,
  `PRODUCTION_NAME` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `PRODUCTION_INFO` varchar(1000) DEFAULT NULL COMMENT '产品描述',
  `PRODUCTION_CUSTOMER` varchar(100) DEFAULT NULL COMMENT '产品主要客户',
  `PRODUCTION_OUTPUT` varchar(1000) DEFAULT NULL COMMENT '产量',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK_PRODUCTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TRADEUNIT_PRODUCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客商产品信息表';

-- ----------------------------
-- Records of baseinfo_tradeunit_production
-- ----------------------------
INSERT INTO baseinfo_tradeunit_production VALUES ('4f407cf2ace640fcb4f3ce3fe67c8700', 'cc889230bcd642f38b674a3a2b136cce', '认为', ' 发的', ' 发', ' 发', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-05-27 22:02:20', null, null, '');

-- ----------------------------
-- Table structure for `baseinfo_tradeunit_receive_address`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_tradeunit_receive_address`;
CREATE TABLE `baseinfo_tradeunit_receive_address` (
  `RECEIVE_ADDR_ID` varchar(100) NOT NULL COMMENT '收货地址ID',
  `TRADEUNIT_ID` varchar(100) DEFAULT NULL COMMENT '客户ID',
  `LINKMAN_ID` varchar(100) DEFAULT NULL COMMENT '联系人',
  `ADDRESS_CLASS` varchar(1000) DEFAULT NULL COMMENT '地址分类',
  `RECEIVE_ADDRESS` varchar(1000) DEFAULT NULL COMMENT '收货地址',
  `RECEIVE_USER` varchar(200) DEFAULT NULL COMMENT '收货人',
  `RECEIVE_USER_TEL` varchar(200) DEFAULT NULL COMMENT '收货人电话',
  `RECEIVE_CUSTOMER` varchar(100) DEFAULT NULL COMMENT '收货客户',
  `RECEIVE_CUSTOMER_ID` varchar(100) DEFAULT NULL COMMENT '收货客户ID',
  `IS_DEFAULT` varchar(10) DEFAULT NULL COMMENT '是否默认',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`RECEIVE_ADDR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户收货地址表';

-- ----------------------------
-- Records of baseinfo_tradeunit_receive_address
-- ----------------------------
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('20dfc8753ba640a7b40922d4806d534d', '147f21e4-b24e-11e8-bfc6-00163e10d37d', null, null, '撒大范围服务器服务器', '无人区文', '324321432', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 14:52:36', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('3d5fb98dae2443d08f0859133289d73d', '147ef135-b24e-11e8-bfc6-00163e10d37d', null, null, 'sarfqewrqwr', 'wererasfd', 'asdf', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 14:48:50', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('403de2ef57f645e8872290b306b4c58d', '147ed145-b24e-11e8-bfc6-00163e10d37d', null, null, '的算法撒的发生的', '水电费', '23432423', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-26 14:57:57', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('43ec013fa41e4a4e8c7ffb2559802adb', 'f2c7acca-bc23-11e8-aef9-00163e10d37d', null, null, '23432432污染物而嗡', '我认为', '32432234', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-09-05 22:47:29', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('5247bfa0f81f4e0bb58b9a08ec313526', 'f2c78f65-bc23-11e8-aef9-00163e10d37d', null, null, '啊沙发沙发', '撒的发生', '阿斯顿发', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 15:53:00', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('579cf4522c7e449c981f961e96ea89eb', '147ec133-b24e-11e8-bfc6-00163e10d37d', null, null, '撒范德萨', '擦水电费', '水电费', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-03 15:43:41', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('88af3113977146019232aa181a6f4875', 'f2c78b7e-bc23-11e8-aef9-00163e10d37d', null, null, '235324532453245', '水电费', '23432', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-08-19 15:06:52', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('97166d12a38b4036b4a37d4f0cab0673', '147f0fd1-b24e-11e8-bfc6-00163e10d37d', null, null, '阿斯顿发', '阿斯顿发', '阿斯顿发', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-26 13:35:48', null, null, null);
INSERT INTO baseinfo_tradeunit_receive_address VALUES ('c839bd81266141248ea1cb6493610ebe', 'cc889230bcd642f38b674a3a2b136cce', null, null, ' 士大夫撒放三', '是的分散的', '2423342', null, null, '10', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-06-03 23:08:28', null, null, null);

-- ----------------------------
-- Table structure for `baseinfo_weekinfo`
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo_weekinfo`;
CREATE TABLE `baseinfo_weekinfo` (
  `weekID` int(11) NOT NULL DEFAULT '0' COMMENT '星期ID，1：星期日，7：星期六',
  `weekName` varchar(20) DEFAULT NULL COMMENT '星期几',
  `is_Work` varchar(1) DEFAULT NULL COMMENT '是否工作日标志：Y：工作日；N：休息日',
  PRIMARY KEY (`weekID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录每星期的工作日';

-- ----------------------------
-- Records of baseinfo_weekinfo
-- ----------------------------
INSERT INTO baseinfo_weekinfo VALUES ('1', '星期一', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('2', '星期二', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('3', '星期三', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('4', '星期四', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('5', '星期五', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('6', '星期六', 'Y');
INSERT INTO baseinfo_weekinfo VALUES ('7', '星期日', 'Y');

-- ----------------------------
-- Table structure for `hr_hrmanpower`
-- ----------------------------
DROP TABLE IF EXISTS `hr_hrmanpower`;
CREATE TABLE `hr_hrmanpower` (
  `HRMANPOWER_ID` varchar(100) NOT NULL,
  `WORK_DATE` date DEFAULT NULL COMMENT '工作日期',
  `WORKTIME_NUMBER` decimal(30,6) DEFAULT NULL COMMENT '正常上班人数',
  `WORKTIME_TIME` decimal(30,6) DEFAULT NULL COMMENT '正常上班时间',
  `OVERTIME_NUMBER` decimal(30,6) DEFAULT NULL COMMENT '加班人数',
  `OVERTIME_TIME` decimal(30,6) DEFAULT NULL COMMENT '加班时间',
  `OVERTIME_RATE` decimal(30,6) DEFAULT NULL COMMENT '加班费率',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`HRMANPOWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全厂人力维护';

-- ----------------------------
-- Records of hr_hrmanpower
-- ----------------------------
INSERT INTO hr_hrmanpower VALUES ('0c0d6534ddca4f969ff15127f7921d08', '2017-02-02', '32.000000', '8.000000', '23.000000', '3.000000', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-02-24 16:12:50', null, null, '');
INSERT INTO hr_hrmanpower VALUES ('a8e81cfcbf2f446f9772f12031c9968a', '2017-02-18', '23.000000', '8.000000', '23.000000', '2.000000', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-02-18 15:24:34', null, null, 'wr\r\nwer\r\nwer');
INSERT INTO hr_hrmanpower VALUES ('db304d2b98114824b66eb4f19595afa5', '2017-02-19', '32.000000', '8.000000', '23.000000', '2.000000', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2017-02-18 15:29:51', null, null, 'asdf\r\nsadf\r\ndsaf');

-- ----------------------------
-- Table structure for `office_comment`
-- ----------------------------
DROP TABLE IF EXISTS `office_comment`;
CREATE TABLE `office_comment` (
  `COMMENT_ID` varchar(100) NOT NULL,
  `BILL_ID` varchar(100) NOT NULL COMMENT '单据编号',
  `COMMENT_USER` varchar(100) DEFAULT NULL COMMENT '评论人ID',
  `COMMENT_USER_NAME` varchar(100) DEFAULT NULL COMMENT '评论用户系统名称',
  `COMMENT_USER_FULLNAME` varchar(100) DEFAULT NULL COMMENT '评论用户姓名',
  `BILL_USER` varchar(100) DEFAULT NULL COMMENT '被评论人ID',
  `BILL_USER_NAME` varchar(100) DEFAULT NULL COMMENT '被评论用户系统名称',
  `BILL_USER_FULLNAME` varchar(100) DEFAULT NULL COMMENT '被评论用户姓名',
  `COMMENT_INFO` varchar(1000) NOT NULL COMMENT '评论内容',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论信息记录表';

-- ----------------------------
-- Records of office_comment
-- ----------------------------
INSERT INTO office_comment VALUES ('0b88dd3384c14d33ad2ccccfafaa81c6', '275d04f08fa843b299d35a53203eeb3f', '1', 'admin', '系统管理员', '1', 'admin', '系统管理员', '啊沙发沙发说', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 16:44:52', null, null);
INSERT INTO office_comment VALUES ('3bcd82527aae4bb5acfcc65e182a7427', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', '是否是', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 14:39:08', null, null);
INSERT INTO office_comment VALUES ('4a00f109414440fba1540a74423fc964', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', 'atetw\nsafasf\nasfasfdaf', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 15:21:52', null, null);
INSERT INTO office_comment VALUES ('4d57af5591644a4e843ae8dee36d9b08', '37881a14d4e34df58c0ea5e1a23fe873', '1', 'admin', '系统管理员', '1', 'admin', '系统管理员', '啊沙发沙发', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 16:44:10', null, null);
INSERT INTO office_comment VALUES ('4ee6881edb7b40f2954abebd03939855', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', 'asdfas\nasfdasf\n阿萨德法师法师', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 13:37:29', null, null);
INSERT INTO office_comment VALUES ('844362046df34fe78c1888726f78ac28', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', '特侧特特额\nastetwea', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 14:37:32', null, null);
INSERT INTO office_comment VALUES ('b05166794e57442dbd9c30e0226b4245', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', 'asdfas\nasfdasf\n阿萨德法师法师', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 13:43:40', null, null);
INSERT INTO office_comment VALUES ('c486f6fac6244098b79fe5c5bf6ba7a0', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', '特侧特特额\nastetwea', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 14:37:41', null, null);
INSERT INTO office_comment VALUES ('cb5912c6658d45099cbbc877ae530853', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', '测试留言的邮件', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-05 21:25:35', null, null);
INSERT INTO office_comment VALUES ('de1a7acd48124ad1837052a1d14cbdd0', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', 'sdffsa士大夫撒放', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 14:41:14', null, null);
INSERT INTO office_comment VALUES ('ffedb7f4925540e0bd303ba62102d50c', '8d5ec81917974324866edb663fadda56', '1', 'admin', '系统管理员', 'e29149962e944589bb7da23ad18ddeed', 'zhangsan', '张三', '是否是是的分散的', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'd41af567914a409893d011aa53eda797', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-04 14:39:54', null, null);

-- ----------------------------
-- Table structure for `pj_approve`
-- ----------------------------
DROP TABLE IF EXISTS `pj_approve`;
CREATE TABLE `pj_approve` (
  `APPROVE_ID` varchar(100) NOT NULL,
  `PROJECT_ID` varchar(100) DEFAULT NULL COMMENT '项目id',
  `PROJECT_STAGE` varchar(10) DEFAULT NULL COMMENT '阶段',
  `APPROVE_NAME` varchar(10) DEFAULT NULL COMMENT '评审人',
  `APPROVE_NAME_CUSTOMER` varchar(10) DEFAULT NULL COMMENT '客户评审人',
  `APPROVE_DATE` datetime DEFAULT NULL COMMENT '开始时间',
  `APPROVE_DESC` varchar(2000) DEFAULT NULL COMMENT '评审内容',
  `APPROVE_DESC_CUSTOMER` varchar(2000) DEFAULT NULL COMMENT '客户评审内容',
  `APPROVE_RESULT` varchar(10) NOT NULL COMMENT '评审结果 00不通过 10通过',
  `APPROVE_TIMES` int(10) DEFAULT '0' COMMENT '评审次数',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态 00作废 10新增 20已提交',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`APPROVE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目评审表';

-- ----------------------------
-- Records of pj_approve
-- ----------------------------
INSERT INTO pj_approve VALUES ('493798b2d571440cbb41a8f4cfb90247', '4b5e073db04b4238949076e15ae3ffa6', '3', 'admin', '', '2018-04-01 22:20:40', '1', '', '10', null, null, '', 'admin', '2018-04-01 22:20:42', 'admin', '2018-04-01 22:20:42');
INSERT INTO pj_approve VALUES ('4f48c114e78b4b9ba3a8ffc0c745bf37', '4b5e073db04b4238949076e15ae3ffa6', '3', 'admin', '', '2018-04-01 22:49:33', '测试通过', '', '10', null, null, '', 'admin', '2018-04-01 22:49:34', 'admin', '2018-04-01 22:49:34');
INSERT INTO pj_approve VALUES ('64b1768bb7c0490f86ae5c213e6c84fa', 'fdc269b3b8a0433f94298646b885d23f', '3', 'admin', '', '2018-04-01 22:21:24', '不通过测试', '', '00', null, null, '', 'admin', '2018-04-01 22:21:26', 'admin', '2018-04-01 22:21:26');
INSERT INTO pj_approve VALUES ('6c69669975e14302b08f8b71f4c31799', '4b5e073db04b4238949076e15ae3ffa6', '3', 'admin', '', '2018-04-01 22:19:27', '通过', '', '10', null, null, '', 'admin', '2018-04-01 22:19:31', 'admin', '2018-04-01 22:19:31');
INSERT INTO pj_approve VALUES ('98af5804acbe498ab14149c28a0bc56e', 'fdc269b3b8a0433f94298646b885d23f', '5', 'admin', null, '2018-04-02 06:09:04', '测试不通过', null, '00', null, null, '', 'admin', '2018-04-02 06:09:04', 'admin', '2018-04-02 06:09:04');
INSERT INTO pj_approve VALUES ('a020df65d93141e68763616a57645509', 'fdc269b3b8a0433f94298646b885d23f', '3', 'ADMIN', '', '2018-04-01 23:21:05', 'ADMIN', '', '10', null, null, '', 'admin', '2018-04-01 23:21:07', 'admin', '2018-04-01 23:21:07');
INSERT INTO pj_approve VALUES ('c3af13e649c8485ab4d77551fdfad7b0', 'fdc269b3b8a0433f94298646b885d23f', '5', 'admin', null, '2018-04-02 06:11:02', '测试阶段5细评审通过', null, '10', null, null, '', 'admin', '2018-04-02 06:11:02', 'admin', '2018-04-02 06:11:02');
INSERT INTO pj_approve VALUES ('d9ee7cb97e664850aa19c299942a6ad8', '4b5e073db04b4238949076e15ae3ffa6', '3', 'admin', '瞬硕', '2018-04-01 22:16:44', '通过', '通过', '10', null, null, '通过', 'admin', '2018-04-01 22:16:44', 'admin', '2018-04-01 22:16:44');

-- ----------------------------
-- Table structure for `pj_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `pj_feedback`;
CREATE TABLE `pj_feedback` (
  `FEEDBACK_ID` varchar(100) NOT NULL,
  `TASK_ID` varchar(100) NOT NULL COMMENT '任务id',
  `PROJECT_ID` varchar(100) DEFAULT NULL COMMENT '项目id',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '反馈人',
  `START_DATE` datetime DEFAULT NULL COMMENT '开始时间',
  `END_DATE` datetime DEFAULT NULL COMMENT '结束时间',
  `WORK_TIME` float(20,2) DEFAULT '0.00' COMMENT '工时',
  `FEEDBACK_DESC` varchar(2000) DEFAULT NULL COMMENT '反馈内容',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态 10新增 20已提交',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FEEDBACK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务反馈表';

-- ----------------------------
-- Records of pj_feedback
-- ----------------------------
INSERT INTO pj_feedback VALUES ('c84060e6b0594518a07a98eea1e72bdf', '41dd7148ef7c4136803bfe430980afc9', 'fdc269b3b8a0433f94298646b885d23f', 'admin', '2018-04-02 00:00:00', '2018-04-02 00:00:00', '2.00', ' ', null, '', 'admin', '2018-04-02 06:41:40', null, null);

-- ----------------------------
-- Table structure for `pj_project`
-- ----------------------------
DROP TABLE IF EXISTS `pj_project`;
CREATE TABLE `pj_project` (
  `PROJECT_ID` varchar(100) NOT NULL,
  `PROJECT_NO` varchar(100) NOT NULL COMMENT '项目编号',
  `PROJECT_NAME` varchar(100) DEFAULT NULL COMMENT '项目编号',
  `PROJECT_DESC` varchar(500) DEFAULT NULL COMMENT '项目描述',
  `CUSTOMER_ID` varchar(100) DEFAULT NULL COMMENT '客户id',
  `CUSTOMER_NAME` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `PRE_WORKTIME` float(20,2) DEFAULT NULL COMMENT '预计工时',
  `ACT_WORKTIME` float(20,2) DEFAULT NULL COMMENT '实际工时',
  `PRE_START_DATE` datetime DEFAULT NULL COMMENT '预计开始时间',
  `ACT_START_DATE` datetime DEFAULT NULL COMMENT '实际开始时间',
  `PRE_END_DATE` datetime DEFAULT NULL COMMENT '预计结束时间',
  `ACT_END_DATE` datetime DEFAULT NULL COMMENT '实际结束时间',
  `PROJECT_STAGE` varchar(10) DEFAULT NULL COMMENT '阶段',
  `STATUS` varchar(10) NOT NULL COMMENT '项目状态（进度）',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目主表';

-- ----------------------------
-- Records of pj_project
-- ----------------------------
INSERT INTO pj_project VALUES ('4b5e073db04b4238949076e15ae3ffa6', 'PJ18032500000004', 'test3', 'test3', null, 'test3test3test3test3test3test3test3test3test3', '3.00', null, '2018-03-25 00:00:00', null, '2018-03-29 00:00:00', null, '4', '20', '通过', 'admin', '2018-03-25 16:53:12', 'admin', '2018-04-01 22:49:40');
INSERT INTO pj_project VALUES ('93c14b0d4a014f66902df60b28d669f2', 'PJ18032500000003', 'test2', 'test2', null, 'test2', '2.00', null, '2018-03-25 00:00:00', null, '2018-03-28 00:00:00', null, '2', '10', 'test2', 'admin', '2018-03-25 10:01:11', 'admin', '2018-04-03 14:26:13');
INSERT INTO pj_project VALUES ('fd2a2efc89cd4ee1aee85c05eabe22d3', '', 'ewte', 'sadfs', null, 'af', '2.00', null, '2018-04-11 00:00:00', null, '2018-04-27 00:00:00', null, '2', '10', '', 'admin', '2018-04-03 14:36:21', 'admin', '2018-04-03 14:36:36');
INSERT INTO pj_project VALUES ('fdc269b3b8a0433f94298646b885d23f', 'PJ18032500000002', 'test1', 'test1', null, 'test1', '1.00', null, '2018-03-25 00:00:00', null, '2018-03-30 00:00:00', null, '6', '10', '1', 'admin', '2018-03-25 09:34:22', 'admin', '2018-04-02 06:11:02');

-- ----------------------------
-- Table structure for `pj_task`
-- ----------------------------
DROP TABLE IF EXISTS `pj_task`;
CREATE TABLE `pj_task` (
  `TASK_ID` varchar(100) NOT NULL COMMENT '任务id',
  `PROJECT_ID` varchar(100) DEFAULT NULL COMMENT '项目id',
  `PROJECT_STAGE` varchar(10) DEFAULT NULL COMMENT '阶段',
  `TASK_TYPE` varchar(10) DEFAULT NULL COMMENT '任务类型 20粗任务 40细任务',
  `TASK_DESC` varchar(1000) DEFAULT NULL COMMENT '任务描述',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态 10新增 20已提交 30执行中 40已完成',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '负责人',
  `PRE_WORKTIME` float(20,2) DEFAULT NULL COMMENT '预计工时',
  `ACT_WORKTIME` float(20,2) DEFAULT NULL COMMENT '实际工时',
  `PRE_START_DATE` datetime DEFAULT NULL COMMENT '预计开始时间',
  `ACT_START_DATE` datetime DEFAULT NULL COMMENT '实际开始时间',
  `PRE_END_DATE` datetime DEFAULT NULL COMMENT '预计结束时间',
  `ACT_END_DATE` datetime DEFAULT NULL COMMENT '实际结束时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目任务表';

-- ----------------------------
-- Records of pj_task
-- ----------------------------
INSERT INTO pj_task VALUES ('0a89ff83f4c3470b8869df89d5d76741', '4b5e073db04b4238949076e15ae3ffa6', '1', '', '23423', '10', '23', '2.00', null, '2018-04-03 00:00:00', null, '2018-04-06 00:00:00', null, '', 'admin', '2018-04-03 15:53:27', 'admin', '2018-04-03 15:53:27');
INSERT INTO pj_task VALUES ('1fb2aa2d02cb40f381c7a5a4e750dc01', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '4', null, 'admin', '5.00', null, '2018-03-31 00:00:00', null, '2018-03-31 00:00:00', null, '', 'admin', '2018-03-31 11:41:02', null, null);
INSERT INTO pj_task VALUES ('37edd54099374f9d9cb5ee975dd4a77d', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '4', null, 'admin', '5.00', null, '2018-02-28 00:00:00', null, '2018-04-07 00:00:00', null, '2', 'admin', '2018-03-31 11:47:12', null, null);
INSERT INTO pj_task VALUES ('41dd7148ef7c4136803bfe430980afc9', 'fdc269b3b8a0433f94298646b885d23f', '4', '40', '11', '10', 'admin', '2.00', null, '2018-03-29 00:00:00', null, '2018-04-19 00:00:00', null, '', 'admin', '2018-04-01 23:21:08', 'admin', '2018-04-01 23:21:08');
INSERT INTO pj_task VALUES ('636d847e4f814b7a87747388f0235405', 'fdc269b3b8a0433f94298646b885d23f', '2', '20', '11', '10', 'admin', '2.00', null, '2018-03-29 00:00:00', null, '2018-04-19 00:00:00', null, '', 'admin', '2018-04-01 22:21:02', 'admin', '2018-04-01 22:21:02');
INSERT INTO pj_task VALUES ('6cc9e9b337ac4718afe46e87fb766baa', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '4', null, 'admin', '2.00', null, '2018-03-31 00:00:00', null, '2018-03-31 00:00:00', null, '', 'admin', '2018-03-31 11:44:11', null, null);
INSERT INTO pj_task VALUES ('7daccd4678f649349adf1b1c10e2fd34', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '3', null, 'admin', '4.00', null, '2018-03-22 00:00:00', null, '2018-03-31 00:00:00', null, '4', 'admin', '2018-03-31 11:48:18', null, null);
INSERT INTO pj_task VALUES ('83cc1e1ab8e34c4d8d6bab9e17460ba3', '93c14b0d4a014f66902df60b28d669f2', '1', '', '是否', '10', 'sdf', '2.00', null, '2018-04-04 00:00:00', null, '2018-04-12 00:00:00', null, '', 'admin', '2018-04-03 15:51:22', 'admin', '2018-04-03 15:51:22');
INSERT INTO pj_task VALUES ('8dde7f4b10634c8a94cba9e72222de21', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '111', null, 'admin', '2.00', null, '2018-03-21 00:00:00', null, '2018-03-30 00:00:00', null, '11', 'admin', '2018-03-31 11:08:37', null, null);
INSERT INTO pj_task VALUES ('93253b8605ab426782ef03777474886f', '93c14b0d4a014f66902df60b28d669f2', '2', '20', 'wr', '10', '34', '23.00', null, '2018-04-12 00:00:00', null, '2018-04-11 00:00:00', null, '', 'admin', '2018-04-03 14:29:49', 'admin', '2018-04-03 14:29:49');
INSERT INTO pj_task VALUES ('b86f85c552d343dd9d7e852817d81ece', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '1', null, 'admin', '4.00', null, '2018-03-31 00:00:00', null, '2018-03-31 00:00:00', null, '', 'admin', '2018-03-31 11:38:09', null, null);
INSERT INTO pj_task VALUES ('d4a76e4620304ef5b56f2c2b22d5e8d3', '4b5e073db04b4238949076e15ae3ffa6', null, 'admin', '1231', null, 'admin', '3.00', null, '2018-03-31 00:00:00', null, '2018-04-28 00:00:00', null, '3', 'admin', '2018-03-31 11:37:37', null, null);
INSERT INTO pj_task VALUES ('e0b14a24fafe41da8f66fa7fd1892f3a', '93c14b0d4a014f66902df60b28d669f2', '2', '20', 'sadf', '10', 'asf', '23.00', null, '2018-04-03 00:00:00', null, '2018-04-26 00:00:00', null, '', 'admin', '2018-04-03 14:29:24', 'admin', '2018-04-03 14:29:24');

-- ----------------------------
-- Table structure for `sales_order`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order` (
  `ORDER_ID` varchar(100) NOT NULL,
  `ORDER_NO` varchar(100) DEFAULT NULL COMMENT '销售订单编号',
  `ORDER_DATE` date DEFAULT NULL COMMENT '销售订单日期',
  `COMMIT_DATE` date DEFAULT NULL COMMENT '提交日期',
  `CUSTOMER_ID` varchar(100) DEFAULT NULL COMMENT '客户ID',
  `CUSTOMER_LINKMAN_ID` varchar(100) DEFAULT NULL COMMENT '客户联系人',
  `CUSTOMER_ORDER_NO` varchar(100) DEFAULT NULL COMMENT '客户订单号',
  `OUTPUT_TYPE` varchar(100) DEFAULT NULL COMMENT '出货条件',
  `PAY_TYPE` varchar(100) DEFAULT NULL COMMENT '付款条件',
  `PRICE_TAX_FLG` varchar(20) DEFAULT NULL COMMENT '单价税率标志：10，含税单价；20，不含税单价',
  `PRICE_TYPE` varchar(20) DEFAULT NULL COMMENT '计价方式:10,按数量计价;20,按重量计价',
  `TAX_RATE` decimal(20,2) DEFAULT NULL COMMENT '税率',
  `TOTAL_NUM` int(20) DEFAULT NULL COMMENT '总数量',
  `TOTAL_WEIGHT` decimal(20,6) DEFAULT NULL COMMENT '总重量',
  `MATERIAL_TAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '材料税额',
  `MATERIAL_EXD_TAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '材料不含税总金额',
  `MATERIAL_TOTAL_AMT` decimal(20,2) DEFAULT NULL COMMENT '材料费总金额',
  `MAKE_TOTAL_AMT` decimal(20,2) DEFAULT NULL COMMENT '加工费',
  `DISCOUNT_AMT` decimal(20,2) DEFAULT NULL COMMENT '折扣金额',
  `TOTAL_AMT` decimal(20,2) DEFAULT NULL COMMENT '含税总金额',
  `DELIVERY_DATE` date DEFAULT NULL COMMENT '交货期/出船日期',
  `DESTINATION` varchar(200) DEFAULT NULL COMMENT '目的地',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态；10，新增；30，已提交；40，已配工艺；50，已计划；60，已经派工；70，加工中；75，已暂停；80，已完成加工',
  `IMPORT_BATCH` varchar(100) DEFAULT NULL COMMENT '导入批次信息',
  `EXT1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `EXT2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `EXT3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `EXT4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段4',
  `EXT5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段5',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单主表';

-- ----------------------------
-- Records of sales_order
-- ----------------------------

-- ----------------------------
-- Table structure for `sales_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_detail`;
CREATE TABLE `sales_order_detail` (
  `ORDER_DETAIL_ID` varchar(100) NOT NULL,
  `ORDER_ID` varchar(100) NOT NULL,
  `ORDER_TYPE_NO` varchar(200) DEFAULT NULL COMMENT '订货牌号',
  `ORDER_SPEC` varchar(200) DEFAULT NULL COMMENT '订货规格',
  `ORDER_SPEC_THICKNESS` varchar(200) DEFAULT NULL COMMENT '订货规格-厚度',
  `ORDER_SPEC_WIDTH` varchar(200) DEFAULT NULL COMMENT '订货规格-宽度',
  `ORDER_SPEC_LENGTH` varchar(200) DEFAULT NULL COMMENT '订货规格-长度',
  `DEMAND_SPEC` varchar(200) DEFAULT NULL COMMENT '客户需求规格',
  `LINE_ORDER` decimal(20,6) DEFAULT NULL COMMENT '行序号',
  `MATERIAL_ID` varchar(100) DEFAULT NULL COMMENT '物料编号',
  `MATERIAL_NUM` int(20) DEFAULT NULL COMMENT '物料数量',
  `ORDER_DENSITY_NUM` decimal(30,6) DEFAULT NULL COMMENT '订货密度',
  `SINGLE_WEIGHT` decimal(30,6) DEFAULT NULL COMMENT '单件重量',
  `MATERIAL_WEIGHT` decimal(30,6) DEFAULT NULL COMMENT '物料重量',
  `MATERIAL_NUM_PRICE` decimal(30,6) DEFAULT NULL COMMENT '物料数量单价',
  `MATERIAL_WEIGHT_PRICE` decimal(30,6) DEFAULT NULL COMMENT '物料重量单价',
  `MATERIAL_TAX_RATE` decimal(30,6) DEFAULT NULL COMMENT '材料税率',
  `MATERIAL_TAX_AMT` decimal(30,2) DEFAULT NULL COMMENT '材料税额',
  `MATERIAL_EXD_TAX_AMT` decimal(30,2) DEFAULT NULL COMMENT '材料不含税总金额',
  `MATERIAL_TOTAL_AMT` decimal(30,2) DEFAULT NULL COMMENT '材料费金额',
  `SET_PRICE_FLAG` varchar(20) DEFAULT NULL COMMENT '定价标志：10，先发货后定价',
  `MAKE_TYPE` varchar(20) DEFAULT NULL COMMENT '加工标志：20，新模装配；30，旧模保养；10，旧模异常维修',
  `MAKE_PRICE` decimal(30,6) DEFAULT NULL COMMENT '加工费单价',
  `MAKE_TOTAL_AMT` decimal(30,2) DEFAULT NULL COMMENT '加工费',
  `DISCOUNT_AMT` decimal(30,2) DEFAULT NULL COMMENT '折扣金额',
  `TOTAL_AMT` decimal(30,2) DEFAULT NULL COMMENT '含税总金额',
  `PACK_TYPE` varchar(100) DEFAULT NULL COMMENT '包装方式',
  `CUSTOMER_DRAWING_NO` varchar(100) DEFAULT NULL COMMENT '客户图号',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `REMARK_DETAIL` varchar(2000) DEFAULT NULL COMMENT '备注',
  `DETAIL_STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态；10，新增；20，已采购；30，已完成',
  `EXT1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `EXT2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `EXT3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `EXT4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段4',
  `EXT5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段5',
  PRIMARY KEY (`ORDER_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单明细表';

-- ----------------------------
-- Records of sales_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO sys_app_user VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO sys_app_user VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'bcbe3365e6ac95ea2c0343a2395834dd', '会员乙', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '121', '978336446@qq.com');

-- ----------------------------
-- Table structure for `sys_billno`
-- ----------------------------
DROP TABLE IF EXISTS `sys_billno`;
CREATE TABLE `sys_billno` (
  `BILLNO_ID` varchar(100) NOT NULL,
  `BILLNO_TYPE` varchar(100) DEFAULT NULL COMMENT '单据类型',
  `BILLNO_NAME` varchar(100) DEFAULT NULL COMMENT '单据名称',
  `BILLNO_PREFIX` varchar(100) DEFAULT NULL COMMENT '单据号前缀',
  `BILLNO_YMDFLG` varchar(10) DEFAULT NULL COMMENT '单据年月标志：10,年;20,年月;30,年月日',
  `BILLNO_NOWNO` int(11) DEFAULT NULL COMMENT '单据编号当前值',
  `BILLNO_GETTYPE` int(10) DEFAULT NULL COMMENT '编号类型：10，主表获取编号；20，子表获取编号',
  `BILLNO_LEN` int(10) DEFAULT NULL COMMENT '编号序号长度',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BILLNO_ID`),
  UNIQUE KEY `index_BILLNO_TYPE` (`BILLNO_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据编号记录表';

-- ----------------------------
-- Records of sys_billno
-- ----------------------------
INSERT INTO sys_billno VALUES ('1', 'InstockBillNo', '入库单', 'RK', '20', '39', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('10', 'SalesOrder', '销售订单', 'SO', '30', null, '20', '4', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('11', 'SalesStatement', '销售结算单', 'SS', '30', '11', '10', '4', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('2', 'OutstockBillNo', '出库单', 'CK', '30', '9', '20', '4', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('3', 'BarcodeNo', '条形码', 'P', '20', '61', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('4', 'ProductionPlan', '生产计划', 'PP', '20', '1725', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('5', 'DemandNo', '生产订单', 'PD', '20', '57', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('6', 'TradeunitCode', '客户代码', 'TU', '40', '337', '10', '6', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('7', 'ProductionWork', '生产工单', 'PW', '20', '510', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('8', 'ProductionDispatch', '生产派工单', 'PS', '20', '49', '10', '8', null, null, null, null, null, null, null, null);
INSERT INTO sys_billno VALUES ('9', 'PurchaseOrder', '采购订单', 'PO', '30', '0', '20', '4', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_billno_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_billno_detail`;
CREATE TABLE `sys_billno_detail` (
  `BILLNO_DETAIL_ID` varchar(100) NOT NULL,
  `BILLNO_ID` varchar(100) NOT NULL,
  `BILLNO_TYPE` varchar(100) DEFAULT NULL COMMENT '单据类型',
  `GETTYPE_NAME` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `BILLNO_PREFIX` varchar(100) DEFAULT NULL COMMENT '单据号前缀',
  `BILLNO_YMDFLG` varchar(10) DEFAULT NULL COMMENT '单据年月标志：10,年;20,年月;30,年月日',
  `BILLNO_NOWNO` int(11) DEFAULT NULL COMMENT '单据编号当前值',
  `BILLNO_LEN` int(10) DEFAULT NULL COMMENT '编号序号长度',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '录入员工所在部门ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `MODIFY_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `MODIFY_DATE` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BILLNO_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据编号记录明细表';

-- ----------------------------
-- Records of sys_billno_detail
-- ----------------------------
INSERT INTO sys_billno_detail VALUES ('55b91931-8152-11e9-babd-54e1ad19c940', '2', 'OutstockBillNo', 'CK', 'CK', '30', '28', '4', null, null, null, null, '2019-05-28 22:10:16', null, null, null);
INSERT INTO sys_billno_detail VALUES ('8fbd2a1c-809d-11e9-a8b2-54e1ad19c940', '10', 'SalesOrder', 'SO', 'SO', '30', '22', '4', null, null, null, null, '2019-05-28 00:33:38', null, null, null);
INSERT INTO sys_billno_detail VALUES ('9b25eedd-809c-11e9-a8b2-54e1ad19c940', '10', 'SalesOrder', 'YSSO', 'YSSO', '30', '14', '4', null, null, null, null, '2019-05-28 00:26:48', null, null, null);
INSERT INTO sys_billno_detail VALUES ('bc04079a-809c-11e9-a8b2-54e1ad19c940', '10', 'SalesOrder', 'nullSO', 'nullSO', '30', '2', '4', null, null, null, null, '2019-05-28 00:27:43', null, null, null);
INSERT INTO sys_billno_detail VALUES ('cf04b46e-81ff-11e9-babd-54e1ad19c940', '2', 'OutstockBillNo', 'YSCK', 'YSCK', '30', '4', '4', null, null, null, null, '2019-05-29 18:51:54', null, null, null);

-- ----------------------------
-- Table structure for `sys_createcode`
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO sys_createcode VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限');
INSERT INTO sys_createcode VALUES ('01005586099e4bb5a4dd6d77c18d17d7', 'system', 'Deptuser', 'SYS_,fh,DEPTUSER', 'ADSF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2017-12-19 22:28:52', '系统管理模块');
INSERT INTO sys_createcode VALUES ('02c88d895c6546eeb24ad58d71035475', 'warehouse', 'Winstockdetail', 'WAREHOUSE_,fh,WINSTOCKDETAIL', 'SAT,fh,String,fh,at,fh,是,fh,无,fh,255Q313596790', '2017-04-18 14:15:53', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('02e10cf4f4324e5192c345b3d6b0d0dd', 'productionpm', 'Process', 'PRODUCTIONPM_,fh,PROCESS', 'ADSF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:04:33', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('03483164529f4476abeca45f7fcf316d', 'wew', 'Ser', 'TB_,fh,SER', null, '2016-10-26 11:27:11', null);
INSERT INTO sys_createcode VALUES ('038566973d71435587e4582a34927832', 'warehouse', 'Mexpendfee', 'WAREHOUSE_,fh,MEXPENDFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-18 16:19:52', '仓储管理');
INSERT INTO sys_createcode VALUES ('064c86398bf447cdb1818aee970ae037', 'production', 'Manfee', 'PRODUCTION_,fh,MANFEE', 'SADF,fh,String,fh,sadf,fh,是,fh,无,fh,255Q313596790', '2017-02-18 15:38:37', '生产管理模块');
INSERT INTO sys_createcode VALUES ('07f4500b46084470954feba31e2a21d9', 'production', 'Penergyfee', 'PRODUCTION_,fh,PENERGYFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-18 16:44:34', '生产管理模块');
INSERT INTO sys_createcode VALUES ('08d49d3043df4660b113315dde363517', 'sales', 'Statement_detail', 'SALES_,fh,STATEMENT_DETAIL', 'SF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:29:29', '销售结算模块');
INSERT INTO sys_createcode VALUES ('095ffbf395fd47caa222f6496dc075a8', 'warehouse', 'Mexpendfee', 'WAREHOUSE_,fh,MEXPENDFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-18 16:19:48', '仓储管理');
INSERT INTO sys_createcode VALUES ('0bc074fb14c94509ac2929c0b974d24c', 'warehouse', 'Woutstockdetail', 'WAREHOUSE_,fh,WOUTSTOCKDETAIL', 'WER,fh,String,fh,qwre,fh,是,fh,无,fh,255Q313596790', '2017-05-08 22:20:21', '仓储模块');
INSERT INTO sys_createcode VALUES ('0bcfaa49d41e41868f12f52840a9d1f0', 'system', 'Billno', 'SYS_,fh,BILLNO', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-30 17:32:33', '系统模块');
INSERT INTO sys_createcode VALUES ('12c43a975859498689ddeffe3964eccc', 'system', 'DepartmentExInfo', 'TB_,fh,DEPARTMENTEXINFO', null, '2016-10-20 16:13:50', null);
INSERT INTO sys_createcode VALUES ('13bab6f89edf4c28b27a4d56b0de559f', 'sales', 'ORDER', 'SALES_,fh,ORDER', 'TE,fh,String,fh,te,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:27:52', '销售模块');
INSERT INTO sys_createcode VALUES ('155e34e6f7d547d9810ffc6827525b95', 'productionpm', 'Pmplanorderdetail', 'PRODUCTIONPM_,fh,PMPLANORDERDETAIL', 'SAF,fh,String,fh,asf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:02:51', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('16e9c11f7ce84a75b03e5f1d1d885980', 'sales', 'Price_agreement', 'sales_price_agreement,fh,PRICE_AGREEMENT', 'E234,fh,String,fh,324,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:17:30', '销售模块');
INSERT INTO sys_createcode VALUES ('1823568a1d484bfeaab2f07751a040d4', 'purchase', 'ORDER_DETAIL', 'PURCHASES_,fh,ORDER_DETAIL', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:43:55', '采购模块');
INSERT INTO sys_createcode VALUES ('1a15bcc7251346529ab45e8bd095c505', 'warehouse', 'Winstockmain', 'WAREHOUSE_,fh,WINSTOCKMAIN', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-18 14:14:43', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('1ac74d3f22b142f7aa892efcbbb95eaf', 'warehouse', 'Woutstockmain', 'WAREHOUSE_,fh,WOUTSTOCKMAIN', 'SFS,fh,String,fh,adsf,fh,是,fh,无,fh,255Q313596790', '2017-05-08 22:21:47', '仓储管理');
INSERT INTO sys_createcode VALUES ('1da644cca7f34f77bc07a33ac882d43e', 'warehouse', 'Dayincomefee', 'WAREHOUSE_,fh,DAYINCOMEFEE', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:33:22', '每日收支管理');
INSERT INTO sys_createcode VALUES ('1f72bd21efd443959967908acd7e8579', 'hr', 'Hrmanpower', 'HR_,fh,HRMANPOWER', 'STE,fh,String,fh,特,fh,是,fh,无,fh,255Q313596790', '2017-02-18 12:29:49', '人事管理');
INSERT INTO sys_createcode VALUES ('1f90b96ec2b04ad8b144955abcfff346', 'sales', 'Price_agreement', 'sales_price_agreement,fh,PRICE_AGREEMENT', 'E343,fh,String,fh,asd,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:21:38', '销售模块');
INSERT INTO sys_createcode VALUES ('229e27d39b074db7b9d663671144de92', 'sales', 'Price_agreement', 'sales_,fh,PRICE_AGREEMENT', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:25', '销售模块');
INSERT INTO sys_createcode VALUES ('24fbffa9f6054ccfbb9216f1ce5d02c0', 'warehouse', 'Woutstockdetail', 'WAREHOUSE_,fh,WOUTSTOCKDETAIL', 'WER,fh,String,fh,qwre,fh,是,fh,无,fh,255Q313596790', '2017-05-08 22:20:18', '仓储模块');
INSERT INTO sys_createcode VALUES ('25fe37f1c1354e99a1eca3c0c76261aa', 'production', 'Penergyfee', 'PRODUCTION_,fh,PENERGYFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-18 16:44:38', '生产管理模块');
INSERT INTO sys_createcode VALUES ('283591189dd746f19512945cccdf3847', 'warehouse', 'Winputfee', 'WAREHOUSE_,fh,WINPUTFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:37:09', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('2b6f3c7b67824893bd61f5530359a579', 'productionpm', 'Processset', 'PRODUCTIONPM_,fh,PROCESSSET', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-05-29 22:41:01', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('2bdcaff3dffa43cb8360dacab0aa236f', 'system', 'Deptuser', 'SYS_,fh,DEPTUSER', 'ADSF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2017-12-19 22:28:44', '系统管理模块');
INSERT INTO sys_createcode VALUES ('2e8ac0bc4d16404ba8f4e7d255f5cf4a', 'report', 'Sisday', 'REPORT_,fh,SISDAY', 'TR,fh,String,fh,tr,fh,是,fh,无,fh,255Q313596790', '2017-02-21 16:53:03', '报表分析模块');
INSERT INTO sys_createcode VALUES ('2ec4c32da9d648d597da0a1273c9893b', 'purchases', 'ORDER', 'PURCHASES_,fh,ORDER', 'SF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:42:37', '采购模块');
INSERT INTO sys_createcode VALUES ('32777a6c96124ad494a08e7673baced8', 'production', 'Manfee', 'PRODUCTION_,fh,MANFEE', 'SADF,fh,String,fh,sadf,fh,是,fh,无,fh,255Q313596790', '2017-02-18 15:38:42', '生产管理模块');
INSERT INTO sys_createcode VALUES ('329dcc88f45c46a08d17da4ff0c21ddd', 'baseinfo', 'Tradeunitlinkman', 'BASEINFO_,fh,TRADEUNITLINKMAN', 'WER,fh,String,fh,2r,fh,是,fh,无,fh,255Q313596790', '2017-08-10 14:57:23', '基础管理模块');
INSERT INTO sys_createcode VALUES ('345b1453bf62494eb5c554e2d0ce3a3f', 'system', 'Billno', 'SYS_,fh,BILLNO', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-30 17:32:29', '系统模块');
INSERT INTO sys_createcode VALUES ('397381309ed2438584ed517a1c0ca89c', 'sales', 'ORDER_DETAIL', 'SALES_,fh,ORDER_DETAIL', 'ER,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:41:16', '销售模块');
INSERT INTO sys_createcode VALUES ('3dd77a4d625148448a6ddf253f4b545e', 'system', 'Role', 'SYS_,fh,ROLE', 'TEST,fh,String,fh,test,fh,是,fh,无,fh,255Q313596790', '2017-02-03 10:45:59', 'SYSTEM');
INSERT INTO sys_createcode VALUES ('3f45b2e0ac7f43e7af1a58a8611190d8', 'productionpm', 'Process', 'PRODUCTIONPM_,fh,PROCESS', 'ADSF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:04:35', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('417da0d20a0642c29363d27d69956a77', 'productionpm', 'Processunit', 'PRODUCTIONPM_,fh,PROCESSUNIT', 'SAFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:05:36', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('426bb24a52ab490890cd6fbd7eadb651', 'system', 'Role', 'SYS_,fh,ROLE', 'TEST,fh,String,fh,test,fh,是,fh,无,fh,255Q313596790', '2017-02-03 10:46:08', 'SYSTEM');
INSERT INTO sys_createcode VALUES ('438e1f0ea41d4b07bf680a6ab1c2e145', 'system', 'Department_ExInfo', 'SYS_,fh,DEPARTMENT_EXINFO', '', '2016-10-20 21:18:19', '');
INSERT INTO sys_createcode VALUES ('44b4698e38d643d1919b1ff476308516', 'warehouse', 'Woutputfee', 'WAREHOUSE_,fh,WOUTPUTFEE', 'TRR,fh,String,fh,rrt,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:38:09', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('46bd319bdae74fa791b451b610db338b', 'office', 'Comment', 'OFFICE_,fh,COMMENT', 'SAFDV,fh,String,fh,wrew,fh,是,fh,无,fh,255Q313596790', '2019-03-04 11:36:22', '办公管理模块');
INSERT INTO sys_createcode VALUES ('499501ef1b7b4330b952a2e2fbc7aa02', 'baseinfo', 'Tradeunitlinkman', 'BASEINFO_,fh,TRADEUNITLINKMAN', 'WER,fh,String,fh,2r,fh,是,fh,无,fh,255Q313596790', '2017-08-09 11:06:55', '基础管理模块');
INSERT INTO sys_createcode VALUES ('4c43c2a2e6b244998a315309b9270f06', 'system', 'Test', 'sys_,fh,TEST', null, '2016-10-20 16:26:43', null);
INSERT INTO sys_createcode VALUES ('4fbb52c395a149e3bf88fa2dbd6769e2', 'system', 'Deptuser', 'SYS_,fh,DEPTUSER', 'ADSF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2017-12-19 22:28:57', '系统管理模块');
INSERT INTO sys_createcode VALUES ('5422e4e265b4443a9d6f991c1b5bd9c5', 'purchases', 'ORDER', 'PURCHASES_,fh,ORDER', 'SF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:42:35', '采购模块');
INSERT INTO sys_createcode VALUES ('56e4c13bb3cb409b9039ef4e5001b860', 'baseinfo', 'Barcodelist', 'Baseinfo_,fh,BARCODELIST', 'ASFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:16:04', '基础管理模块');
INSERT INTO sys_createcode VALUES ('5ce15e661cb142e6800685dcd842ed5e', 'hr', 'Hrmanpower', 'HR_,fh,HRMANPOWER', 'STE,fh,String,fh,特,fh,是,fh,无,fh,255Q313596790', '2017-02-18 12:29:51', '人事管理');
INSERT INTO sys_createcode VALUES ('5f5ae6c43f404b23bd5981f30f71943e', 'baseinfo', 'Tradeunitlinkman', 'BASEINFO_,fh,TRADEUNITLINKMAN', 'WER,fh,String,fh,2r,fh,是,fh,无,fh,255Q313596790', '2017-08-09 11:06:52', '基础管理模块');
INSERT INTO sys_createcode VALUES ('5fa11b72b2814f808232daf8a5afac7c', 'productionpm', 'Processset', 'PRODUCTIONPM_,fh,PROCESSSET', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-05-29 22:40:58', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('6257ae5bf11040d9810033dcae7556e8', 'warehouse', 'Stockhand', 'WAREHOUSE_,fh,STOCKHAND', 'ET,fh,String,fh,werw,fh,是,fh,无,fh,255Q313596790', '2017-05-01 08:48:22', '仓储模块');
INSERT INTO sys_createcode VALUES ('632a152a18fc417da378e9525db0c74d', 'production', 'Demand_Craft', 'PRODUCTION_,fh,DEMAND_CRAFT', 'ASDFSD,fh,String,fh,asdfs,fh,是,fh,无,fh,255Q313596790', '2017-11-23 10:31:43', '生产管理模块');
INSERT INTO sys_createcode VALUES ('6408ef523fcd43edad921656a55b244b', 'production', 'Manfee', 'PRODUCTION_,fh,MANFEE', 'SADF,fh,String,fh,sadf,fh,是,fh,无,fh,255Q313596790', '2017-02-18 15:38:40', '生产管理模块');
INSERT INTO sys_createcode VALUES ('661370b409924fc89610c049327d92c0', 'sales', 'Price_agreement_detail', 'sales_,fh,PRICE_AGREEMENT_DETAIL', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:55', '销售模块');
INSERT INTO sys_createcode VALUES ('6635f9626c8e4c13b35fc5c7edd611aa', 'sales', 'Statement_detail', 'SALES_,fh,STATEMENT_DETAIL', 'SF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:29:25', '销售结算模块');
INSERT INTO sys_createcode VALUES ('680f584bd9d94d889556ecd2c77fe716', 'warehouse', 'Stockhand', 'WAREHOUSE_,fh,STOCKHAND', 'ET,fh,String,fh,werw,fh,是,fh,无,fh,255Q313596790', '2017-05-01 08:48:26', '仓储模块');
INSERT INTO sys_createcode VALUES ('6b7076a17e93463f8709c459bd5d0e86', 'warehouse', 'Winputfee', 'WAREHOUSE_,fh,WINPUTFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:37:11', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('6b8adadc599640eb96eff577359dd5c5', 'baseinfo', 'Materialselect', 'BASEINFO_,fh,MATERIALSELECT', 'EWR,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-28 08:52:14', '基础信息管理');
INSERT INTO sys_createcode VALUES ('6c26e681f50849bab1530e6420f47fed', 'baseinfo', 'Material', 'BASEINFO_,fh,MATERIAL', 'EWE,fh,String,fh,sd,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:04:45', '基础数据模块');
INSERT INTO sys_createcode VALUES ('71464cdda74649a69473fc74987f71cb', 'warehouse', 'Woutputfee', 'WAREHOUSE_,fh,WOUTPUTFEE', 'TRR,fh,String,fh,rrt,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:38:12', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('71d7f3e5ec9a4b119b527037136bb851', 'warehouse', 'Dayfeesum', 'WAREHOUSE_,fh,DAYFEESUM', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:34:14', '每日收支管理');
INSERT INTO sys_createcode VALUES ('73e996b5ec3a4cd8aba80eda392cc184', 'productionpm', 'Processunit', 'PRODUCTIONPM_,fh,PROCESSUNIT', 'SAFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:05:34', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('78c2c3e9bf2b4dd09d4459ad4e26ecd2', 'report', 'Sisday', 'REPORT_,fh,SISDAY', 'TR,fh,String,fh,tr,fh,是,fh,无,fh,255Q313596790', '2017-02-21 16:52:58', '报表分析模块');
INSERT INTO sys_createcode VALUES ('7c61ade0f572431bb29ea9d008992450', 'sales', 'Statement_detail_list', 'SALES_,fh,STATEMENT_DETAIL_LIST', 'SDF,fh,String,fh,sdfs,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:32:03', '销售结算');
INSERT INTO sys_createcode VALUES ('7e815f5a237248e69723f674761014c9', 'system', 'DepartmentExInfo', 'SYS_Department_ExInfo,fh,DEPARTMENTEXINFO', '', '2016-10-20 17:48:23', '');
INSERT INTO sys_createcode VALUES ('8239c7f03393477d84e4a32f8e63c6c1', 'sales', 'Statement', 'SALES_,fh,STATEMENT', 'ERE,fh,String,fh,ewre,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:28:33', '销售结算管理');
INSERT INTO sys_createcode VALUES ('8292ba3a0d20405b8f4e905f53563a40', 'baseinfo', 'Barcodelist', 'Baseinfo_,fh,BARCODELIST', 'ASFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:16:01', '基础管理模块');
INSERT INTO sys_createcode VALUES ('82d3cd55399d46dab9a3fc75088f4fb6', 'sales', 'Price_agreement', 'sales_,fh,PRICE_AGREEMENT', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:25:13', '销售模块');
INSERT INTO sys_createcode VALUES ('83154bcd2009412fb88e0876d3f0ccbd', 'warehouse', 'Winstockdetail', 'WAREHOUSE_,fh,WINSTOCKDETAIL', 'SAT,fh,String,fh,at,fh,是,fh,无,fh,255Q313596790', '2017-04-18 14:15:56', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('86178a25b1154ec0980871b9c61fdfe6', 'productionpm', 'Processunit', 'PRODUCTIONPM_,fh,PROCESSUNIT', 'SAFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:05:38', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('86e75727740648d88a4a4767dd776494', 'warehouse', 'Winstockmain', 'WAREHOUSE_,fh,WINSTOCKMAIN', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-18 14:14:46', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('87e1035f006a479d8915a064c913815a', 'warehouse', 'Dayexpendfee', 'WAREHOUSE_,fh,DAYEXPENDFEE', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:34:57', '每日收支管理');
INSERT INTO sys_createcode VALUES ('889f6a89c50f46c8913fc0c2e12bcef8', 'sales', 'Price_agreement_detail', 'sales_,fh,PRICE_AGREEMENT_DETAIL', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:53', '销售模块');
INSERT INTO sys_createcode VALUES ('88e06ed199154040844ad8be1c03aecd', 'system', 'DepartmentExInfo', 'SYS_Department_ExInfo,fh,DEPARTMENTEXINFO', '', '2016-10-20 17:48:26', '');
INSERT INTO sys_createcode VALUES ('8a3b67b0b9564a2896f94208792405e3', 'production', 'Manpower', 'PRODUCTION_,fh,MANPOWER', 'TET,fh,String,fh,特,fh,是,fh,无,fh,255Q313596790', '2017-02-18 09:54:02', '生产管理');
INSERT INTO sys_createcode VALUES ('8a5bd6ec567149d88d20c94ef05eafbf', 'baseinfo', 'Tradeunit', 'BASEINFO_,fh,TRADEUNIT', 'DSF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:05:44', '基础数据模块');
INSERT INTO sys_createcode VALUES ('8a7c055a39dd4864bd94bbb99aff21e7', 'baseinfo', 'Tradeunit', 'BASEINFO_,fh,TRADEUNIT', 'DSF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:05:40', '基础数据模块');
INSERT INTO sys_createcode VALUES ('8fa4d338bda842c8a026bd64a8dedcc5', 'system', 'Billno', 'SYS_,fh,BILLNO', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-30 17:32:36', '系统模块');
INSERT INTO sys_createcode VALUES ('92ad12aae4d54287bf9be1281a1703e7', 'sales', 'ORDER_DETAIL', 'SALES_,fh,ORDER_DETAIL', 'ER,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:41:18', '销售模块');
INSERT INTO sys_createcode VALUES ('9463eba03baa447bb36886884c3cdc9b', 'productionpm', 'Process', 'PRODUCTIONPM_,fh,PROCESS', 'ADSF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:04:31', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('9539aad483e84da382aff467350e6688', 'sales', 'Price_agreement', 'sales_price_agreement,fh,PRICE_AGREEMENT', 'E234,fh,String,fh,234,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:16:30', '销售模块');
INSERT INTO sys_createcode VALUES ('979691d043134c63aff14a888177b387', 'sales', 'ORDER', 'SALES_,fh,ORDER', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790SADF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:40:26', '销售模块');
INSERT INTO sys_createcode VALUES ('9cb0b9baa80f47e59e788f17c389c479', 'baseinfo', 'Materialselect', 'BASEINFO_,fh,MATERIALSELECT', 'EWR,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-28 08:52:17', '基础信息管理');
INSERT INTO sys_createcode VALUES ('9cdaa6f3699f43aa99c75cf900d705c5', 'purchase', 'ORDER_DETAIL', 'PURCHASES_,fh,ORDER_DETAIL', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:43:54', '采购模块');
INSERT INTO sys_createcode VALUES ('9ff682acc2634e22bb2c4735803841c8', 'production', 'Demand_craft_machine', 'PRODUCTION_,fh,DEMAND_CRAFT_MACHINE', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-11-29 11:18:31', '生产管理模块');
INSERT INTO sys_createcode VALUES ('a019c5c38ace4231bacbfbf915bca69c', 'sales', 'Statement', 'SALES_,fh,STATEMENT', 'ERE,fh,String,fh,ewre,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:28:27', '销售结算管理');
INSERT INTO sys_createcode VALUES ('a11648d6e2284b2bb3cc9f80503fb382', 'warehouse', 'Winstockdetail', 'WAREHOUSE_,fh,WINSTOCKDETAIL', 'SAT,fh,String,fh,at,fh,是,fh,无,fh,255Q313596790', '2017-04-18 14:15:58', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('a2047143ed144a60aff0d8cd2c9d1dd5', 'office', 'Comment', 'OFFICE_,fh,COMMENT', 'SAFDV,fh,String,fh,wrew,fh,是,fh,无,fh,255Q313596790', '2019-03-04 11:36:24', '办公管理模块');
INSERT INTO sys_createcode VALUES ('a26774865c4c477c90ae44f11f42b67e', 'sales', 'Price_agreement', 'sales_,fh,PRICE_AGREEMENT', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:22', '销售模块');
INSERT INTO sys_createcode VALUES ('a32217a44b1747048ddcb95245e19aee', 'sales', 'ORDER', 'SALES_,fh,ORDER', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790SADF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:40:23', '销售模块');
INSERT INTO sys_createcode VALUES ('a76d5742f66845f3a641b4fb4ac304c0', 'system', 'User', 'SYS_,fh,USER', 'TEST,fh,String,fh,test,fh,是,fh,无,fh,255Q313596790', '2017-02-03 10:20:06', 'system');
INSERT INTO sys_createcode VALUES ('a79b9b0b2d3d4d519fd4ad6fec63dd0e', 'warehouse', 'Dayfeesum', 'WAREHOUSE_,fh,DAYFEESUM', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:34:16', '每日收支管理');
INSERT INTO sys_createcode VALUES ('a910f315b4e2491985a1c043d1b792fe', 'baseinfo', 'Tradeunit', 'BASEINFO_,fh,TRADEUNIT', 'DSF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:05:42', '基础数据模块');
INSERT INTO sys_createcode VALUES ('a91624ad73e141688b3b9c38a013a41f', 'system', 'User', 'SYS_,fh,USER', 'TTETB,fh,String,fh,asf,fh,是,fh,无,fh,255Q313596790', '2017-01-24 17:22:48', 'System');
INSERT INTO sys_createcode VALUES ('ab4f0b51e0fe4952815b1c113d47be5c', 'hr', 'Hrmanpower', 'HR_,fh,HRMANPOWER', 'STE,fh,String,fh,特,fh,是,fh,无,fh,255Q313596790', '2017-02-18 12:29:45', '人事管理');
INSERT INTO sys_createcode VALUES ('ad734f451da745368fd89f27cfd41a62', 'sales', 'Statement_detail_list', 'SALES_,fh,STATEMENT_DETAIL_LIST', 'SDF,fh,String,fh,sdfs,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:32:00', '销售结算');
INSERT INTO sys_createcode VALUES ('af4fbf8205f24dec84d4019347280128', 'production', 'Demand_craft_machine', 'PRODUCTION_,fh,DEMAND_CRAFT_MACHINE', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-11-29 11:18:29', '生产管理模块');
INSERT INTO sys_createcode VALUES ('b15e4d5497e84bd6ba8b6b0d6017ab21', 'system', 'User', 'SYS_,fh,USER', 'TEST,fh,String,fh,test,fh,是,fh,无,fh,255Q313596790', '2017-02-03 09:54:48', 'system');
INSERT INTO sys_createcode VALUES ('b19b2a2ef44f42da8c959bfb6514a514', 'system', 'Role', 'SYS_,fh,ROLE', 'TEST,fh,String,fh,test,fh,是,fh,无,fh,255Q313596790', '2017-02-03 10:46:06', 'SYSTEM');
INSERT INTO sys_createcode VALUES ('b30c77a9377446dcbdf8263f395af8d1', 'system', 'Department_ExInfo', 'SYS_,fh,DEPARTMENT_EXINFO', '', '2016-10-20 21:18:22', '');
INSERT INTO sys_createcode VALUES ('be10bcdfdeae405e830da5124297bfa0', 'system', 'DepartmentExInfo', 'TB_,fh,DEPARTMENTEXINFO', null, '2016-10-20 16:13:46', null);
INSERT INTO sys_createcode VALUES ('bf160e0729cd42d796b551d5cceb20e8', 'sales', 'Statement', 'SALES_,fh,STATEMENT', 'ERE,fh,String,fh,ewre,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:28:36', '销售结算管理');
INSERT INTO sys_createcode VALUES ('c34f68205aa74523a8819bfc6df292c9', 'production', 'Manpower', 'PRODUCTION_,fh,MANPOWER', 'TET,fh,String,fh,特,fh,是,fh,无,fh,255Q313596790', '2017-02-18 09:54:06', '生产管理');
INSERT INTO sys_createcode VALUES ('c39a3ad18bd34965851a0dab5c17163a', 'warehouse', 'Woutstockmain', 'WAREHOUSE_,fh,WOUTSTOCKMAIN', 'SFS,fh,String,fh,adsf,fh,是,fh,无,fh,255Q313596790', '2017-05-08 22:21:45', '仓储管理');
INSERT INTO sys_createcode VALUES ('c3e995afd30f4ea4984dcb472bc2b0f9', 'sale', 'Plan', 'SALE_,fh,PLAN', 'YR,fh,String,fh,yr,fh,是,fh,无,fh,255Q313596790', '2017-02-03 11:17:34', '销售模块-销售计划');
INSERT INTO sys_createcode VALUES ('c48e85ff8fb34a5db087db7955d90363', 'warehouse', 'Dayincomefee', 'WAREHOUSE_,fh,DAYINCOMEFEE', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:33:19', '每日收支管理');
INSERT INTO sys_createcode VALUES ('c6074d5eb2e445cd9f924c7e857425ee', 'sale', 'Plan', 'SALE_,fh,PLAN', 'YR,fh,String,fh,yr,fh,是,fh,无,fh,255Q313596790', '2017-02-03 11:17:30', '销售模块-销售计划');
INSERT INTO sys_createcode VALUES ('c71eab43e26f42e1a3f87a54886a9184', 'system', 'DepartmentExInfo', 'SYS_,fh,DEPARTMENTEXINFO', null, '2016-10-20 17:44:17', null);
INSERT INTO sys_createcode VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构');
INSERT INTO sys_createcode VALUES ('ca33832fb00f4263a99be2c15372d45f', 'system', 'DepartmentExInfo', 'TB_,fh,DEPARTMENTEXINFO', null, '2016-10-20 16:13:42', null);
INSERT INTO sys_createcode VALUES ('cb1a888c26f34521874145893a6779dc', 'sales', 'Statement_detail_list', 'SALES_,fh,STATEMENT_DETAIL_LIST', 'SDF,fh,String,fh,sdfs,fh,是,fh,无,fh,255Q313596790', '2019-06-15 16:31:57', '销售结算');
INSERT INTO sys_createcode VALUES ('cb50f0cb29c2443d8892b105359dd75e', 'sales', 'ORDER', 'SALES_,fh,ORDER', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790SADF,fh,String,fh,asdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:28:46', '销售模块');
INSERT INTO sys_createcode VALUES ('d270dfd15fd749288d09037afdb2f36f', 'production', 'Penergyfee', 'PRODUCTION_,fh,PENERGYFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-18 16:44:39', '生产管理模块');
INSERT INTO sys_createcode VALUES ('d514dbd2474d4b6c8b6ab9904cc9cc7c', 'new', 'News', 'TB_,fh,NEWS', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255Q313596790', '2016-01-25 16:38:14', '新闻管理');
INSERT INTO sys_createcode VALUES ('d6e19299c8734cd396ffb80e8e3ad32e', 'baseinfo', 'Material', 'BASEINFO_,fh,MATERIAL', 'EWE,fh,String,fh,sd,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:04:43', '基础数据模块');
INSERT INTO sys_createcode VALUES ('d7d202fdc2d545f299021fb1aa61bf7b', 'sales', 'Price_agreement_detail', 'sales_,fh,PRICE_AGREEMENT_DETAIL', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:51', '销售模块');
INSERT INTO sys_createcode VALUES ('d80852769c3e40c6bbc2f930427d3868', 'system', 'DepartmentExInfo', 'SYS_Department_ExInfo,fh,DEPARTMENTEXINFO', '', '2016-10-20 17:48:28', '');
INSERT INTO sys_createcode VALUES ('d9b3f97375e34879980c90568f1f73e6', 'system', 'Test', 'sys_,fh,TEST', null, '2016-10-20 16:26:41', null);
INSERT INTO sys_createcode VALUES ('da7f02dc381a4169bd65ec009af3e7a6', 'baseinfo', 'Tradeunitlinkman', 'BASEINFO_,fh,TRADEUNITLINKMAN', 'WER,fh,String,fh,2r,fh,是,fh,无,fh,255Q313596790', '2017-08-10 14:57:21', '基础管理模块');
INSERT INTO sys_createcode VALUES ('db075c601e3e4e919b56ca39c3655b8c', 'productionpm', 'Processset', 'PRODUCTIONPM_,fh,PROCESSSET', 'WER,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-05-29 22:40:55', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('dbd7b8330d774dcabd184eca8668a295', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-01-23 01:44:15', '站内信');
INSERT INTO sys_createcode VALUES ('e04aeb0831bb4505b70dddbd06c43c3b', 'office', 'Comment', 'OFFICE_,fh,COMMENT', 'SAFDV,fh,String,fh,wrew,fh,是,fh,无,fh,255Q313596790', '2019-03-04 11:36:18', '办公管理模块');
INSERT INTO sys_createcode VALUES ('e1a2d4485fe0406894f1c6b480305a50', 'productionpm', 'Pmplanorderdetail', 'PRODUCTIONPM_,fh,PMPLANORDERDETAIL', 'SAF,fh,String,fh,asf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:02:48', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('e1a5ff2c9b0f40d788961a7dfc0b36a1', 'warehouse', 'Woutstockmain', 'WAREHOUSE_,fh,WOUTSTOCKMAIN', 'SFS,fh,String,fh,adsf,fh,是,fh,无,fh,255Q313596790', '2017-05-08 22:21:49', '仓储管理');
INSERT INTO sys_createcode VALUES ('e753e784a08941afb999cf16a65c0667', 'report', 'Sisday', 'REPORT_,fh,SISDAY', 'TR,fh,String,fh,tr,fh,是,fh,无,fh,255Q313596790', '2017-02-21 16:53:04', '报表分析模块');
INSERT INTO sys_createcode VALUES ('e813b092aa1b4945b6b8cd935194657b', 'warehouse', 'Woutputfee', 'WAREHOUSE_,fh,WOUTPUTFEE', 'TRR,fh,String,fh,rrt,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:38:13', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('ea0834c97ab549708caebec4b9c1678e', 'sales', 'Price_agreement', 'sales_price_agreement,fh,PRICE_AGREEMENT', 'E23423,fh,String,fh,wqer,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:22:27', '销售模块');
INSERT INTO sys_createcode VALUES ('ee0a3cace1c84925b6cee83ab047d41c', 'purchases', 'ORDER', 'PURCHASES_,fh,ORDER', 'SF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:42:38', '采购模块');
INSERT INTO sys_createcode VALUES ('ef3afeb0f94d4f06b9a0835410bd8065', 'warehouse', 'Winputfee', 'WAREHOUSE_,fh,WINPUTFEE', 'TET,fh,String,fh,tet,fh,是,fh,无,fh,255Q313596790', '2017-02-21 10:37:05', '仓储管理模块');
INSERT INTO sys_createcode VALUES ('efdca96cbf8c482295972a4861079019', 'baseinfo', 'Material', 'BASEINFO_,fh,MATERIAL', 'EWE,fh,String,fh,sd,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:04:40', '基础数据模块');
INSERT INTO sys_createcode VALUES ('efe016b6e17e46e8936c235fc0c44de6', 'system', 'DepartmentExInfo', 'SYS_,fh,DEPARTMENTEXINFO', null, '2016-10-20 17:44:18', null);
INSERT INTO sys_createcode VALUES ('f032e9cde5e74596841c4478f2f422b6', 'baseinfo', 'Tradeunit', 'BASEINFO_,fh,TRADEUNIT', 'TET,fh,String,fh,t,fh,是,fh,无,fh,255Q313596790', '2017-03-04 10:02:16', '基础信息模块');
INSERT INTO sys_createcode VALUES ('f454d922af694c158abfde2411ff8bdd', 'production', 'Demand_Craft', 'PRODUCTION_,fh,DEMAND_CRAFT', 'ASDFSD,fh,String,fh,asdfs,fh,是,fh,无,fh,255Q313596790', '2017-11-23 10:31:46', '生产管理模块');
INSERT INTO sys_createcode VALUES ('f5fd581833984f9b872d94b4f028c2c5', 'sales', 'Price_agreement', 'sales_,fh,PRICE_AGREEMENT', 'E23432,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-11-03 15:26:19', '销售模块');
INSERT INTO sys_createcode VALUES ('f731d34d6d4e48bb98ae5f40bfab88d1', 'productionpm', 'Pmplanorderdetail', 'PRODUCTIONPM_,fh,PMPLANORDERDETAIL', 'SAF,fh,String,fh,asf,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:02:45', '生产执行管理模块');
INSERT INTO sys_createcode VALUES ('f81afd6c8a7c4d1c8e504976f8952933', 'system', 'DepartmentExInfo', 'SYS_,fh,DEPARTMENTEXINFO', null, '2016-10-20 17:44:14', null);
INSERT INTO sys_createcode VALUES ('f8e6881c189149aea8637c0c6a1ac7e8', 'purchase', 'ORDER_DETAIL', 'PURCHASES_,fh,ORDER_DETAIL', 'SDF,fh,String,fh,sdf,fh,是,fh,无,fh,255Q313596790', '2018-07-15 18:43:52', '采购模块');
INSERT INTO sys_createcode VALUES ('f97a6c38f15249e6b7384cc08e0d312f', 'baseinfo', 'Barcodelist', 'Baseinfo_,fh,BARCODELIST', 'ASFD,fh,String,fh,asfd,fh,是,fh,无,fh,255Q313596790', '2017-05-28 21:16:06', '基础管理模块');
INSERT INTO sys_createcode VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理');
INSERT INTO sys_createcode VALUES ('ff0d98a0fc8f42f980c5ba9f10cb64c1', 'baseinfo', 'Materialselect', 'BASEINFO_,fh,MATERIALSELECT', 'EWR,fh,String,fh,wer,fh,是,fh,无,fh,255Q313596790', '2017-04-28 08:52:20', '基础信息管理');
INSERT INTO sys_createcode VALUES ('ffd3ef421be0455484643b10b9ea798b', 'warehouse', 'Dayexpendfee', 'WAREHOUSE_,fh,DAYEXPENDFEE', 'ADF,fh,String,fh,adf,fh,是,fh,无,fh,255Q313596790', '2017-12-20 22:34:56', '每日收支管理');

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `DEPT_FUNC` varchar(100) DEFAULT NULL ,  
  `DEPTTYPE` varchar(50) DEFAULT NULL COMMENT '部门类型：com：公司；dept：部门；gro：集团',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO sys_department VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', null,null, '', '', '', '', '');
INSERT INTO sys_department VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', null, null,'', '', '', '', '');
INSERT INTO sys_department VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', null, null,'挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO sys_department VALUES ('d41af567914a409893d011aa53eda797', '生产部', 'Produciton', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null,'dept', '负责发工资', '王武', '11236', '管理财务', '308办公室');
INSERT INTO sys_department VALUES ('f55f5638101b4dac9b398a276550b02f', '金鼎店', 'production', '0002', 'a6c6695217ba4a4dbfe9f7e9d2c06730', null,'dept', '', '', '', '', '');

-- ----------------------------
-- Table structure for `sys_department_exinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department_exinfo`;
CREATE TABLE `sys_department_exinfo` (
  `DEPARTMENT_EXINFO_ID` varchar(100) NOT NULL DEFAULT '' COMMENT 'ID',
  `DEPARTMENT_ID` varchar(100) NOT NULL COMMENT '部门ID',
  `DEPARTMENT_TYPE` varchar(30) DEFAULT NULL COMMENT '部门类型',
  `USE_FLAG` varchar(10) DEFAULT NULL COMMENT '有效标记',
  `LEGAL_AGENT` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `TAX_NUM` varchar(100) DEFAULT NULL COMMENT '税号',
  `EXT_COL1` varchar(255) DEFAULT NULL,
  `EXT_COL2` varchar(255) DEFAULT NULL,
  `EXT_COL3` varchar(255) DEFAULT NULL,
  `EXT_COL4` varchar(255) DEFAULT NULL,
  `EXT_COL5` varchar(255) DEFAULT NULL,
  `EXT_COL6` varchar(255) DEFAULT NULL,
  `EXT_COL7` varchar(255) DEFAULT NULL,
  `EXT_COL8` varchar(255) DEFAULT NULL,
  `EXT_COL9` varchar(255) DEFAULT NULL,
  `EXT_COL10` varchar(255) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `MODIFY_USER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_EXINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构扩展信息';

-- ----------------------------
-- Records of sys_department_exinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_deptuser`
-- ----------------------------
DROP TABLE IF EXISTS `sys_deptuser`;
CREATE TABLE `sys_deptuser` (
  `DEPTUSER_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(100) NOT NULL COMMENT '人员ID',
  `DEPARTMENT_ID` varchar(100) NOT NULL COMMENT '所在部门ID',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '岗位ID',
  `COMPANY_ID` varchar(100) DEFAULT NULL COMMENT '公司ID',
  `GROUP_ID` varchar(100) DEFAULT NULL COMMENT '公司对应的集团公司ID',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '录入员工编号',
  `CREATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '修改员工编号',
  `UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`DEPTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门员工表';

-- ----------------------------
-- Records of sys_deptuser
-- ----------------------------
INSERT INTO sys_deptuser VALUES ('4403cea4ad164a998aaf5d4a9dc7026e', 'e29149962e944589bb7da23ad18ddeed', 'd41af567914a409893d011aa53eda797', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-05 21:08:20', null, null);
INSERT INTO sys_deptuser VALUES ('47b6f214046e412493e473da919fae01', '9991f4d7782a4ccfb8a65bd96ea7aafa', 'd41af567914a409893d011aa53eda797', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-05 21:08:39', null, null);
INSERT INTO sys_deptuser VALUES ('8f911c31cf654237ba728c7d56eb5bc6', 'baa641e08b88411b854c07ce41e2125f', 'd41af567914a409893d011aa53eda797', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-05 21:08:33', null, null);
INSERT INTO sys_deptuser VALUES ('c6f2adb74f3a4832b5e6a2710e9fb2d0', '69177258a06e4927b4639ab1684c3320', 'd41af567914a409893d011aa53eda797', null, 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'a6c6695217ba4a4dbfe9f7e9d2c06730', 'admin', '2019-03-05 21:08:28', null, null);

-- ----------------------------
-- Table structure for `sys_dictionaries`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  `PROCESS_ID` varchar(100) DEFAULT NULL COMMENT '出入库类型对应的工序信息',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO sys_dictionaries VALUES ('090e61eb0b3c4be8884c16dab460d313', '采购入库', 'CGRK', 'CGRK', '1', '8146d7c4153649738a6aa59ef8ac7de3', '', '', null);
INSERT INTO sys_dictionaries VALUES ('1b31b4ba918e437f909be4909614dbd5', '数量计价', 'PRICETYPE10', 'PRICETYPE10', '1', '74d9c29a013340d0b3a42efb5392dd70', '', '', '');
INSERT INTO sys_dictionaries VALUES ('1bc79220586d4540945fc609da8f094e', '发货', 'TASKTYPE20', 'TASKTYPE20', '2', 'ddfbbc15a2bb48099c44ceca4c000fd6', '', '', '');
INSERT INTO sys_dictionaries VALUES ('22a80752428a4dd6b0c306ae13dfe88d', '见票后30天付款', 'PAY30', 'PAY30', '3', 'd03f60405e364482a13f8177b66ab098', '', '', '');
INSERT INTO sys_dictionaries VALUES ('2db578d6f683428fa137838f5ee77714', '包装方式', 'PACKTYPE', 'PACKTYPE', '4', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('31fb3fdb9df049429fdf259b51d93a4e', '重量计价', 'PRICETYPE20', 'PRICETYPE20', '2', '74d9c29a013340d0b3a42efb5392dd70', '', '', '');
INSERT INTO sys_dictionaries VALUES ('4c043243fdd04f7da9578f070b6a0ac1', '牌号', 'TYPENO', 'TYPENO', '6', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('714736f4db404d4c9f84ea18cb9f8af1', '微信', 'VISITWAY20', 'VISITWAY20', '2', 'd82facf4b9e243b1ad20e927c10bacfc', '', '', '');
INSERT INTO sys_dictionaries VALUES ('74d9c29a013340d0b3a42efb5392dd70', '计价方式', 'PRICETYPE', 'PRICETYPE', '5', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('7d4285382d9649adbfc486999f4c4954', '电话', 'VISITWAY10', 'VISITWAY10', '1', 'd82facf4b9e243b1ad20e927c10bacfc', '', '', '');
INSERT INTO sys_dictionaries VALUES ('8146d7c4153649738a6aa59ef8ac7de3', '入库类型', 'INSTOCKTYPE', 'INSTOCKTYPE', '2', '0', '入库类型', '', null);
INSERT INTO sys_dictionaries VALUES ('972818c1f27d472f9d7e4f4b3ade9015', '出库类型', 'OUTSTOCKTYPE', 'OUTSTOCKTYPE', '1', '0', '', '', null);
INSERT INTO sys_dictionaries VALUES ('9818708f9e864c8ab94849b9309da219', '款到发货', 'PAY0', 'PAY0', '1', 'd03f60405e364482a13f8177b66ab098', '', '', '');
INSERT INTO sys_dictionaries VALUES ('a8dfd733-cbc0-11e8-b3b4-54e1ad19c940', '2210', '2210', '2210', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfdd2f-cbc0-11e8-b3b4-54e1ad19c940', 'CD3109', 'CD3109', 'CD3109', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfde59-cbc0-11e8-b3b4-54e1ad19c940', 'CD337', 'CD337', 'CD337', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfdf3b-cbc0-11e8-b3b4-54e1ad19c940', 'CD630', 'CD630', 'CD630', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe01d-cbc0-11e8-b3b4-54e1ad19c940', 'CD636', 'CD636', 'CD636', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe0f5-cbc0-11e8-b3b4-54e1ad19c940', 'CD650', 'CD650', 'CD650', '1', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe1cd-cbc0-11e8-b3b4-54e1ad19c940', 'CD70', 'CD70', 'CD70', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe2a5-cbc0-11e8-b3b4-54e1ad19c940', 'CD750', 'CD750', 'CD750', '4', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe359-cbc0-11e8-b3b4-54e1ad19c940', 'G10', 'G10', 'G10', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe3ee-cbc0-11e8-b3b4-54e1ad19c940', 'G30', 'G30', 'G30', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe4c1-cbc0-11e8-b3b4-54e1ad19c940', 'G45C', 'G45C', 'G45C', '5', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe594-cbc0-11e8-b3b4-54e1ad19c940', 'GE30', 'GE30', 'GE30', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe666-cbc0-11e8-b3b4-54e1ad19c940', 'GT30', 'GT30', 'GT30', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe734-cbc0-11e8-b3b4-54e1ad19c940', 'K3109', 'K3109', 'K3109', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe802-cbc0-11e8-b3b4-54e1ad19c940', 'K3520', 'K3520', 'K3520', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe897-cbc0-11e8-b3b4-54e1ad19c940', 'K90', 'K90', 'K90', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfe927-cbc0-11e8-b3b4-54e1ad19c940', 'K91', 'K91', 'K91', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfedda-cbc0-11e8-b3b4-54e1ad19c940', 'KF1', 'KF1', 'KF1', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff04d-cbc0-11e8-b3b4-54e1ad19c940', 'KF306', 'KF306', 'KF306', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff1e8-cbc0-11e8-b3b4-54e1ad19c940', 'KF315', 'KF315', 'KF315', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff355-cbc0-11e8-b3b4-54e1ad19c940', 'KMS', 'KMS', 'KMS', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff6b5-cbc0-11e8-b3b4-54e1ad19c940', 'KR466', 'KR466', 'KR466', '2', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff7a1-cbc0-11e8-b3b4-54e1ad19c940', 'KR855', 'KR855', 'KR855', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff879-cbc0-11e8-b3b4-54e1ad19c940', 'KR887', 'KR887', 'KR887', '3', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dff95b-cbc0-11e8-b3b4-54e1ad19c940', 'KWH', 'KWH', 'KWH', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dffa2e-cbc0-11e8-b3b4-54e1ad19c940', 'O2F', 'O2F', 'O2F', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dffb9b-cbc0-11e8-b3b4-54e1ad19c940', 'S105', 'S105', 'S105', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dffd64-cbc0-11e8-b3b4-54e1ad19c940', 'THA-U', 'THA-U', 'THA-U', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('a8dfff05-cbc0-11e8-b3b4-54e1ad19c940', 'W80K', 'W80K', 'W80K', '6', '4c043243fdd04f7da9578f070b6a0ac1', null, null, null);
INSERT INTO sys_dictionaries VALUES ('afbb93873e8a4475b31d4aa0fc2db91f', '见票付款', 'PAY1', 'PAY1', '2', 'd03f60405e364482a13f8177b66ab098', '', '', '');
INSERT INTO sys_dictionaries VALUES ('b05780b0326b49819f8f87907f1bf6c4', '纸箱', 'PACKTYPE10', 'PACKTYPE10', '1', '2db578d6f683428fa137838f5ee77714', '', '', '');
INSERT INTO sys_dictionaries VALUES ('c1c7cb162ce04139a7b3a7aeb2d3715a', '托盘', 'PACKTYPE20', 'PACKTYPE20', '2', '2db578d6f683428fa137838f5ee77714', '', '', '');
INSERT INTO sys_dictionaries VALUES ('d03f60405e364482a13f8177b66ab098', '付款方式', 'PAYTYPE', 'PAYTYPE', '3', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('d82facf4b9e243b1ad20e927c10bacfc', '沟通方式', 'VISITWAY', 'VISITWAY', '122', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('ddfbbc15a2bb48099c44ceca4c000fd6', '任务类型', 'TASKTYPE', 'TASKTYPE', '12', '0', '', '', '');
INSERT INTO sys_dictionaries VALUES ('def44545eca84f98874b21f5d16679ef', '报价', 'TASKTYPE10', 'TASKTYPE10', '1', 'ddfbbc15a2bb48099c44ceca4c000fd6', '', '', '');
INSERT INTO sys_dictionaries VALUES ('f770a2795d1f4a3d945005ef2442b48a', '销售出库', 'XSCK', 'XSCK', '4', '972818c1f27d472f9d7e4f4b3ade9015', '', '', null);

-- ----------------------------
-- Table structure for `sys_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO sys_fhbutton VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO sys_fhbutton VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO sys_fhbutton VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO sys_fhbutton VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO sys_fhbutton VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO sys_fhbutton VALUES ('f008c9a528f5463e88e3d87dfc1f9034', '新增', 'add', '新增按钮');

-- ----------------------------
-- Table structure for `sys_fhsms`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO sys_fhsms VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO sys_fhsms VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO sys_fhsms VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO sys_fhsms VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO sys_fhsms VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO sys_fhsms VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO sys_fhsms VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO sys_fhsms VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO sys_fhsms VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO sys_fhsms VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for `sys_function_value`
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_value`;
CREATE TABLE `sys_function_value` (
  `FUNCTION_ID` varchar(100) NOT NULL,
  `OBJECT_ID` varchar(100) DEFAULT NULL,
  `FUNCTION_TYPE` varchar(100) DEFAULT NULL,
  `FUNCTION_VALUE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_value
-- ----------------------------
INSERT INTO sys_function_value VALUES ('1', 'f3e28dc2507a4912a2ec205e03037a2a', 'LOGIN_TYPE', '20');
INSERT INTO sys_function_value VALUES ('2', 'f3e28dc2507a4912a2ec205e03037a2a', 'MENU_PARENTID', '53');
INSERT INTO sys_function_value VALUES ('3', 'c21cecf84048434b93383182b1d98cba', 'LOGIN_DEFAULT_PAGE', 'customervisit/visitPlanList.do?salesman=Y');
INSERT INTO sys_function_value VALUES ('4', 'APP', 'MENU_PARENTID', '138');
INSERT INTO sys_function_value VALUES ('5', '1', 'LOGIN_DEFAULT_PAGE_APP', 'customervisit/visitPlanList_APP.do');
INSERT INTO sys_function_value VALUES ('6', '1', '1', '1');

-- ----------------------------
-- Table structure for `sys_gl_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO sys_gl_qx VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO sys_gl_qx VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO sys_gl_qx VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO sys_gl_qx VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO sys_gl_qx VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO sys_gl_qx VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO sys_gl_qx VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO sys_gl_qx VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO sys_gl_qx VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO sys_menu VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO sys_menu VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO sys_menu VALUES ('6', '信息管理', '#', '0', '90', 'menu-icon fa fa-credit-card green', '2', '0');
INSERT INTO sys_menu VALUES ('7', '图片管理', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO sys_menu VALUES ('8', '性能监控', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO sys_menu VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO sys_menu VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO sys_menu VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO sys_menu VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO sys_menu VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO sys_menu VALUES ('15', '微信管理', '#', '0', '91', 'menu-icon fa fa-comments purple', '2', '0');
INSERT INTO sys_menu VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO sys_menu VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO sys_menu VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO sys_menu VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO sys_menu VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO sys_menu VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO sys_menu VALUES ('22', '一级菜单', '#', '0', '9', 'menu-icon fa fa-fire orange', '2', '0');
INSERT INTO sys_menu VALUES ('23', '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('24', '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('30', '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('31', '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('32', '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('33', '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('34', '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('35', '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO sys_menu VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO sys_menu VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO sys_menu VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO sys_menu VALUES ('40', '基础数据', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO sys_menu VALUES ('41', '系统用户', 'user/listUsers.do', '40', '2', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO sys_menu VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '99', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO sys_menu VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO sys_menu VALUES ('44', '代码生成', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO sys_menu VALUES ('45', '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('46', '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('47', '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO sys_menu VALUES ('49', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO sys_menu VALUES ('50', '站内信', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO sys_menu VALUES ('66', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '40', '1', 'menu-icon fa fa-home blue', '1', '1');
INSERT INTO sys_menu VALUES ('68', '物料管理', 'material/list.do', '40', '4', 'menu-icon fa fa-briefcase green', '1', '1');
INSERT INTO sys_menu VALUES ('75', '标签打印', 'barcodelist/list.do', '40', '5', 'menu-icon fa fa-barcode blue', '1', '1');
INSERT INTO sys_menu VALUES ('91', '项目管理', '#', '0', '20', 'menu-icon fa fa-leaf black', '2', '0');
INSERT INTO sys_menu VALUES ('92', '项目维护', 'project/list.do', '91', '10', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('93', '项目任务维护', 'pjTask/listForTask1.do', '91', '20', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('94', '客户评审', 'pjApprove/listForApprove1.do', '91', '31', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('95', '细任务维护', 'pjTask/listForTask2.do', '91', '40', 'menu-icon fa fa-leaf black', '1', '0');
INSERT INTO sys_menu VALUES ('96', '内部评审', 'pjApprove/listForApprove2.do', '91', '50', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('97', '工作日报', 'pjFeedback/listForFeedback1.do', '91', '60', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('98', 'EasyUITest', 'work/easyuitest.do', '9', '90', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO sys_menu VALUES ('99', '生产日历设置', 'process/listCalendar.do', '53', '11', 'menu-icon fa fa-leaf black', '1', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` text,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO sys_role VALUES ('1', '系统管理组', '2251798773489606', '0', '1', '1', '1', '1', '1', null);
INSERT INTO sys_role VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '498', '2', '0', '0', '0', '0', '115b386ff04f4352b060dffcd2b5d1da', null);
INSERT INTO sys_role VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '498', '2', '0', '0', '0', '0', '1b67fc82ce89457a8347ae53e43a347e', null);
INSERT INTO sys_role VALUES ('2', '会员组', '498', '0', '0', '0', '0', '1', '2', null);
INSERT INTO sys_role VALUES ('3', '职位组', '', '0', '0', '0', '0', '0', '46294b31a71c4600801724a6eb06bb26', '2018-04-02 12:49:39');
INSERT INTO sys_role VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '37204236521706627260358', '1', '9007198214545350', '2251798773489606', '1125898866646982', '4132649385062016475078', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-12-20 21:31:22');
INSERT INTO sys_role VALUES ('5466347ac07044cb8d82990ec7f3a90e', '生产主管', '1208170240986377230726725632', '3', '1208170240986377230726725632', '1208170240986377230726725632', '1208170240986377230726725632', '1208170240986377230726725632', '5466347ac07044cb8d82990ec7f3a90e', '2018-04-02 12:49:50');
INSERT INTO sys_role VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '9007198214545350', '1', '0', '0', '2251798773489606', '0', '68f8e4a39efe47c7bb869e9d15ab925d', null);
INSERT INTO sys_role VALUES ('856849f422774ad390a4e564054d8cc8', '生产计划员', '274728392516431679206719488', '3', '274728392516431679206719488', '274728392516431679206719488', '274728392516431679206719488', '274728392516431679206719488', '856849f422774ad390a4e564054d8cc8', '2018-04-02 12:49:56');
INSERT INTO sys_role VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '498', '2', '0', '0', '0', '0', '8b70a7e67f2841e7aaba8a4d92e5ff6f', null);
INSERT INTO sys_role VALUES ('c21cecf84048434b93383182b1d98cba', '班组长', '10933942380079628428678169655541093927747584', '3', '10933942380079628428678169655541093927747584', '10933942380079628428678169655541093927747584', '10933942380079628428678169655541093927747584', '10933942380079628428678169655541093927747584', 'c21cecf84048434b93383182b1d98cba', '2019-02-16 20:18:18');
INSERT INTO sys_role VALUES ('d0da981d80584d58b4c54c83663debe0', 'test', '9007198214545350', '1', '0', '0', '0', '0', null, null);
INSERT INTO sys_role VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '29014238117495173902499840', '1', '29014238117495173902499840', '29014238117495173902499840', '29014238117495173902499840', '29014238117495173902499840', 'de9de2f006e145a29d52dfadda295353', '2017-12-21 23:24:11');
INSERT INTO sys_role VALUES ('f3e28dc2507a4912a2ec205e03037a2a', '操作工', '618970019651697336704303104', '3', '0', '0', '0', '0', null, '2018-04-02 12:50:01');

-- ----------------------------
-- Table structure for `sys_role_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO sys_role_fhbutton VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO sys_role_fhbutton VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO sys_role_fhbutton VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO sys_role_fhbutton VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO sys_role_fhbutton VALUES ('90a546cea56f413abdfd4e0e7c84ff15', '3264c8e83d0248bb9e3ea6195b4c0216', 'f008c9a528f5463e88e3d87dfc1f9034');
INSERT INTO sys_role_fhbutton VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO sys_role_fhbutton VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO sys_role_fhbutton VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO sys_role_fhbutton VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO sys_role_fhbutton VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO sys_role_fhbutton VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO sys_user VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2019-11-04 17:33:07', '0:0:0:0:0:0:0:1', '0', '最高统治者', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO sys_user VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '075a9a05bfe3daacb769f9570df669ff5d9a2fa8', '三', '', 'c21cecf84048434b93383182b1d98cba', '2019-05-30 16:22:28', '0:0:0:0:0:0:0:1', '0', '111', 'default', 'zhudafeng@foxmail.com', '333', '13562202556');
INSERT INTO sys_user VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '41009ccf47f70965bed820412e63e3c46a455ba3', '李四', '', 'f3e28dc2507a4912a2ec205e03037a2a', '2018-04-10 01:46:56', '0:0:0:0:0:0:0:1', '0', '小李', 'default', 'zhudafeng@foxmail.com', '1102', '13566233663');
INSERT INTO sys_user VALUES ('baa641e08b88411b854c07ce41e2125f', 'zhangjiong', '43dc075ca38a8eca94cb98b93a48c0d2a1bd33c9', '张炯', '', 'c21cecf84048434b93383182b1d98cba', '2018-11-04 19:21:31', '0:0:0:0:0:0:0:1', '0', '', 'default', 'zhudafeng@foxmail.com', 'zhangjiong', '13917659092');
INSERT INTO sys_user VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', '173c2a01f31a0edea4428217a8b834cccb383bf4', '张三', '', 'c21cecf84048434b93383182b1d98cba', '2019-03-01 23:49:59', '0:0:0:0:0:0:0:1', '0', '小张', 'default', 'zhudafeng@foxmail.com', '1101', '13917559094');

DROP TABLE IF EXISTS `sys_user_resume`;
CREATE TABLE `sys_user_resume` (
  `ID` varchar(100) NOT NULL,
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '�û�ID',
  `USER_CODE` varchar(100) DEFAULT NULL COMMENT '�û����',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT '����',
  `TYPE` varchar(100) DEFAULT NULL COMMENT '���ͣ�10����ְ��20��ְ',
  `RESUME_DATE` date DEFAULT NULL COMMENT '����',
  `INFO` varchar(2000) DEFAULT NULL COMMENT '˵��',
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(100) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `EXT1` varchar(100) DEFAULT NULL,
  `EXT2` varchar(100) DEFAULT NULL,
  `EXT3` varchar(100) DEFAULT NULL,
  `EXT4` varchar(100) DEFAULT NULL,
  `EXT5` varchar(100) DEFAULT NULL,
  `COMPANY_ID` varchar(100) DEFAULT NULL,
  `GROUP_ID` varchar(100) DEFAULT NULL,
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
-- ----------------------------
-- Table structure for `sys_user_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO sys_user_qx VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO sys_user_qx VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO sys_user_qx VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `table_name`
-- ----------------------------
DROP TABLE IF EXISTS `table_name`;
CREATE TABLE `table_name` (
  `WORK_DATE` date DEFAULT NULL,
  `CRAFT_NO` varchar(100) DEFAULT NULL,
  `CRAFT_NAME` varchar(100) DEFAULT NULL,
  `WORK_TIME` decimal(18,2) DEFAULT NULL,
  `WORK_ALL` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_name
-- ----------------------------
INSERT INTO table_name VALUES ('2018-03-19', '041b39f4e665437aab7ce2de898f4ae2', '铣床', '7.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-19', '3761f5ceab1040699190549aaf17e64a', 'PG', '9.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-19', '3d90adbf6801493287d3d69757c81f9c', '磨床', '8.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-19', '48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '4.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-20', '6770f6747d294a269ea5b1cc4847d1a2', '热处理', '3.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-27', '3d90adbf6801493287d3d69757c81f9c', '磨床', '16.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-27', '48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '0.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-27', 'fa220891f15f4ccd8a03cc2cc6e882ec', '放电', '6.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-28', '3d90adbf6801493287d3d69757c81f9c', '磨床', '3.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-28', '48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '4.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-28', '6770f6747d294a269ea5b1cc4847d1a2', '热处理', '8.00', '42.00');
INSERT INTO table_name VALUES ('2018-03-28', '81abd179791e4795ada0c8404cd65b5d', '车床', '16.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-28', 'b8b76eb289f64fdfaba745d7a746937a', '慢丝', '6.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-28', 'c812cdf9ef164b5dbc28018639afb4a2', '快丝', '1.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-28', 'fa220891f15f4ccd8a03cc2cc6e882ec', '放电', '12.00', '63.00');
INSERT INTO table_name VALUES ('2018-03-29', 'b9a3045ac005407894fa97e91cd90aa0', '组装', '5.00', '84.00');
INSERT INTO table_name VALUES ('2018-03-27', '48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '5.00', '0.00');
INSERT INTO table_name VALUES ('2018-04-03', '48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '0.00', '63.00');

-- ----------------------------
-- Table structure for `table_name2`
-- ----------------------------
DROP TABLE IF EXISTS `table_name2`;
CREATE TABLE `table_name2` (
  `CRAFT_NO` varchar(100) DEFAULT NULL,
  `CRAFT_NAME` varchar(100) DEFAULT NULL,
  `WORK_TIME` decimal(18,2) DEFAULT NULL,
  `WORK_ALL` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_name2
-- ----------------------------
INSERT INTO table_name2 VALUES ('041b39f4e665437aab7ce2de898f4ae2', '铣床', '63.00', null);
INSERT INTO table_name2 VALUES ('3761f5ceab1040699190549aaf17e64a', 'PG', '42.00', null);
INSERT INTO table_name2 VALUES ('fa220891f15f4ccd8a03cc2cc6e882ec', '放电', '63.00', null);
INSERT INTO table_name2 VALUES ('3d90adbf6801493287d3d69757c81f9c', '磨床', '42.00', null);
INSERT INTO table_name2 VALUES ('48185fe5db394e3eab927be9e3b173ef', 'CNC加工', '63.00', null);
INSERT INTO table_name2 VALUES ('6770f6747d294a269ea5b1cc4847d1a2', '热处理', '42.00', null);
INSERT INTO table_name2 VALUES ('81abd179791e4795ada0c8404cd65b5d', '车床', '63.00', null);
INSERT INTO table_name2 VALUES ('b8b76eb289f64fdfaba745d7a746937a', '慢丝', '63.00', null);
INSERT INTO table_name2 VALUES ('c812cdf9ef164b5dbc28018639afb4a2', '快丝', '63.00', null);
INSERT INTO table_name2 VALUES ('b9a3045ac005407894fa97e91cd90aa0', '组装', '84.00', null);

-- ----------------------------
-- Table structure for `tb_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO tb_pictures VALUES ('b06010340ee54cfab49b8bfbe2387557', '图片', '5cc13076eb83419889b2482f4dd653a2.jpg', '20170302/5cc13076eb83419889b2482f4dd653a2.jpg', '2016-01-25 16:49:44', '1', '图片管理处上传');
INSERT INTO tb_pictures VALUES ('c9f1eca620c94c27bfa7028c66911f41', '图片', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for `weixin_command`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO weixin_command VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO weixin_command VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO weixin_command VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '关闭浏览器操作');
INSERT INTO weixin_command VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO weixin_command VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for `weixin_imgmsg`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO weixin_imgmsg VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `weixin_textmsg`
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO weixin_textmsg VALUES ('63681adbe7144f10b66d6863e07f23c2', '你好', '你也好', '2015-05-09 02:39:23', '1', '文本回复');
INSERT INTO weixin_textmsg VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO weixin_textmsg VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', '1', '关注回复');

-- ----------------------------
-- Function structure for `FUNC_GET_BILL_NO`
-- ----------------------------
DROP FUNCTION IF EXISTS `FUNC_GET_BILL_NO`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FUNC_GET_BILL_NO`(billType varchar(100)) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	declare intBillNoNowNo INT;
	declare strBillNoPrefix varchar(100);
	declare strBillNo varchar(100);
	
	select BILLNO_PREFIX,BILLNO_NOWNO
		into strBillNoPrefix,intBillNoNowNo				
	from SYS_BILLNO
	where BILLNO_TYPE = billType for update;

	set intBillNoNowNo = intBillNoNowNo + 1;

	if intBillNoNowNo >= 100000000 THEN
		set intBillNoNowNo = 1;
	end if;

	update SYS_BILLNO
	set BILLNO_NOWNO = intBillNoNowNo
	where BILLNO_TYPE = billType;

	set strBillNo = CONCAT(strBillNoPrefix,DATE_FORMAT(now(),'%y%m%d'),LPAD(intBillNoNowNo, 8, 0));

	return strBillNo;

end
;;
DELIMITER ;
