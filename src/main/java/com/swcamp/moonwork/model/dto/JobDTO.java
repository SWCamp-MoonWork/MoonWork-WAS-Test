package com.swcamp.moonwork.model.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class JobDTO {
	public long JobId;
    public String JobName;
    public Boolean IsUse;
    public String WorkflowName;
    public String WorkflowBlob;
    public String Note;
    public Date SaveDate;
    public long UserId;
    public String UserName;
    public String Name;
    
    public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String State;
    
    public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
    
    public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public long getJobId() {
		return JobId;
	}
	public void setJobId(long jobId) {
		JobId = jobId;
	}
	public String getJobName() {
		return JobName;
	}
	public void setJobName(String jobName) {
		JobName = jobName;
	}
	public Boolean getIsUse() {
		return IsUse;
	}
	public void setIsUse(Boolean isUse) {
		IsUse = isUse;
	}
	public String getWorkflowName() {
		return WorkflowName;
	}
	public void setWorkflowName(String workflowName) {
		WorkflowName = workflowName;
	}
	public String getWorkflowBlob() {
		return WorkflowBlob;
	}
	public void setWorkflowBlob(String workflowBlob) {
		WorkflowBlob = workflowBlob;
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
