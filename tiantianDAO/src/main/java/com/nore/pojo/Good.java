package com.nore.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Author:nore
 * CREATE TABLE `t_goods` (
 *   `id` int(11) NOT NULL AUTO_INCREMENT,
 *   `goodname` varchar(100) NOT NULL,
 *   `simg` varchar(100) DEFAULT NULL,
 *   `bimg` varchar(100) DEFAULT NULL,
 *   `price` decimal(8,2) DEFAULT NULL,
 *   `time` date DEFAULT NULL,
 *   `mark` varchar(200) DEFAULT NULL,
 *   PRIMARY KEY (`id`)
 * ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Good {
    private Integer id;
    private String goodName;
    private String simg;
    private String bimg;
    private BigDecimal price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;
    private String mark;
}
