package com.spacerental.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Host {
	private int hostNo;
	private String hostId;
	private String name;
	private boolean ok;
	private String content;
	private String type;
	private String address;
	private String parking;
    private int openStart;
    private int openEnd;
	private String holiday;
	
	private SpaceFile file;//대표사진 flag=1
	private ArrayList<SpaceFile> files; //flag=0

}
