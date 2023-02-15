package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class HostDTO {
	
	public long HostId;
	public String HostName;
	public String HostIp;
	public boolean IsUse;
	public String Role;
	public String EndPoint;
	public String Note;
	public Date SaveDate;
	public long UserId;
	public String PrivateIp;
	
	
	public String getPrivateIp() {
		return PrivateIp;
	}
	public void setPrivateIp(String privateIp) {
		PrivateIp = privateIp;
	}
	public long getHostId() {
		return HostId;
	}
	public void setHostId(long hostId) {
		HostId = hostId;
	}
	public String getHostName() {
		return HostName;
	}
	public void setHostName(String hostName) {
		HostName = hostName;
	}
	public String getHostIp() {
		return HostIp;
	}
	public void setHostIp(String hostIp) {
		HostIp = hostIp;
	}
	public boolean isIsUse() {
		return IsUse;
	}
	public void setIsUse(boolean isUse) {
		IsUse = isUse;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getEndPoint() {
		return EndPoint;
	}
	public void setEndPoint(String endPoint) {
		EndPoint = endPoint;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}
	public Date getSaveDate() {
		return SaveDate;
	}
	public void setSaveDate(Date saveDate) {
		SaveDate = saveDate;
	}
	public long getUserId() {
		return UserId;
	}
	public void setUserId(long userId) {
		UserId = userId;
	}


}
