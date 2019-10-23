package com.nore.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @Author:nore
 * CREATE TABLE `t_goods_type` (
 *   `id` int(11) NOT NULL AUTO_INCREMENT,
 *   `typename` varchar(100) NOT NULL,
 *   `bimg` varchar(100) DEFAULT NULL,
 *   `simg` varchar(100) DEFAULT NULL,
 *   `createTime` date DEFAULT NULL,
 *   PRIMARY KEY (`id`)
 * ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GoodType {
    private Integer id;
    private String typeName;
    private String bimg;
    private String simg;
    private Date createTime;
    private List<Good> goods;
}
