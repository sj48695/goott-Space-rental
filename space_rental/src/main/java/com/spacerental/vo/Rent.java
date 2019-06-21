package com.spacerental.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Rent {

	private int rentNo;
	private Date rentDate;
	private String headCount;
	private int startTime;
	private int endTime;
	private int spaceNo;
	private String id;

	private String spaceName;
	private String hostNo;

}
