package com.spacerental.vo;

import lombok.Data;

@Data
public class LoseFile {
	private int loseFileNo;
	private String userFileName;
	private String savedFileName;
	private int loseNo;
}