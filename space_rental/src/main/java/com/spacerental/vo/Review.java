package com.spacerental.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;
	private int groupNo;
	private int step;
	private int depth;
	private String content;
	private Date regDate;
	private String writer;
	private int spaceNo;
	private double rating;
}
