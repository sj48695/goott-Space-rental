package com.spacerental.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Lose {
	private int loseNo;
	private String title;
	private String content;
	private Date loseDate;
	private int spaceNo;
	private String type;
	private String uploader;
	
	private ArrayList<Lose> files;
}