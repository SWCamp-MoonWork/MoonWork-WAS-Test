package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class JobDetailDTO {
	
	public long jobId;
    public String jobName;
    public Boolean jobIsUse;
    public String workflowName;
    public String jobNote;
    public Date jobSaveDate;
    public String userName;
    public String hostIp;
    public String hostName;
    public long scheduleID;
	public String scheduleName;
    public Boolean scheduleIsUse;
    public Boolean scheduleType;
    public Date oneTimeOccurDT;
    public Date scheduleStartDT;
    public Date scheduleEndDT;
    public Date scheduleSaveDate;
    public String cronExpression;
    
    
    public String getCronExpression() {
		return cronExpression;
	}
	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}
	public String getScheduleName() {
    	return scheduleName;
    }
    public void setScheduleName(String scheduleName) {
    	this.scheduleName = scheduleName;
    }
	public long getJobId() {
		return jobId;
	}
	public void setJobId(long jobId) {
		this.jobId = jobId;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public Boolean getJobIsUse() {
		return jobIsUse;
	}
	public void setJobIsUse(Boolean jobIsUse) {
		this.jobIsUse = jobIsUse;
	}
	public String getWorkflowName() {
		return workflowName;
	}
	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}
	public String getJobNote() {
		return jobNote;
	}
	public void setJobNote(String jobNote) {
		this.jobNote = jobNote;
	}
	public Date getJobSaveDate() {
		return jobSaveDate;
	}
	public void setJobSaveDate(Date jobSaveDate) {
		this.jobSaveDate = jobSaveDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public long getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(long scheduleID) {
		this.scheduleID = scheduleID;
	}
	public Boolean getScheduleIsUse() {
		return scheduleIsUse;
	}
	public void setScheduleIsUse(Boolean scheduleIsUse) {
		this.scheduleIsUse = scheduleIsUse;
	}
	public Boolean getScheduleType() {
		return scheduleType;
	}
	public void setScheduleType(Boolean scheduleType) {
		this.scheduleType = scheduleType;
	}
	public Date getOneTimeOccurDT() {
		return oneTimeOccurDT;
	}
	public void setOneTimeOccurDT(Date oneTimeOccurDT) {
		this.oneTimeOccurDT = oneTimeOccurDT;
	}
	public Date getScheduleStartDT() {
		return scheduleStartDT;
	}
	public void setScheduleStartDT(Date scheduleStartDT) {
		this.scheduleStartDT = scheduleStartDT;
	}
	public Date getScheduleEndDT() {
		return scheduleEndDT;
	}
	public void setScheduleEndDT(Date scheduleEndDT) {
		this.scheduleEndDT = scheduleEndDT;
	}
	public Date getScheduleSaveDate() {
		return scheduleSaveDate;
	}
	public void setScheduleSaveDate(Date scheduleSaveDate) {
		this.scheduleSaveDate = scheduleSaveDate;
	}

}
