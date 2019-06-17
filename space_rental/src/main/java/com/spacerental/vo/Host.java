package com.spacerental.vo;

import lombok.Data;

@Data
public class Host {
	private String hostId;
	private String name;
	private boolean ok;
	private String content;
	private String type;
	private String address;
	private String parking;
	private String open;
}
