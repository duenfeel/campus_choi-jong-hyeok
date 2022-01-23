package kr.campus.domain;

import lombok.Getter;
import lombok.Setter;
import java.util.Date;
@Getter
@Setter
public class BoardAdminVO {
	private Long code;
    private boolean reply;
    private boolean answer;
    private boolean editor;
    private boolean attach;
    private boolean declar;
    private boolean auth;
    private String title;
    private String writer;
    private Date day;
    private String updater;
    private Date updatedate;
    private String ip;
}