package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class JobDetailDTO {
	
	public long JobId;
    public String JobName;
    public Boolean JobIsUse;
    public String WorkflowName;
    public String JobNote;
    public Date JobSaveDate;
    public String UserName;
    public long ScheduleId;
	public String ScheduleName;
    public Boolean ScheduleIsUse;
    public Boolean ScheduleType;
    public Date OneTimeOccurDT;
    public Date ScheduleStartDT;
    public Date ScheduleEndDT;
    public Date ScheduleSaveDate;
    public String CronExpression;
	
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
	public Boolean getJobIsUse() {
		return JobIsUse;
	}
	public void setJobIsUse(Boolean jobIsUse) {
		JobIsUse = jobIsUse;
	}
	public String getWorkflowName() {
		return WorkflowName;
	}
	public void setWorkflowName(String workflowName) {
		WorkflowName = workflowName;
	}
	public String getJobNote() {
		return JobNote;
	}
	public void setJobNote(String jobNote) {
		JobNote = jobNote;
	}
	public Date getJobSaveDate() {
		return JobSaveDate;
	}
	public void setJobSaveDate(Date jobSaveDate) {
		JobSaveDate = jobSaveDate;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public long getScheduleId() {
		return ScheduleId;
	}
	public void setScheduleId(long scheduleId) {
		ScheduleId = scheduleId;
	}
	public String getScheduleName() {
		return ScheduleName;
	}
	public void setScheduleName(String scheduleName) {
		ScheduleName = scheduleName;
	}
	public Boolean getScheduleIsUse() {
		return ScheduleIsUse;
	}
	public void setScheduleIsUse(Boolean scheduleIsUse) {
		ScheduleIsUse = scheduleIsUse;
	}
	public Boolean getScheduleType() {
		return ScheduleType;
	}
	public void setScheduleType(Boolean scheduleType) {
		ScheduleType = scheduleType;
	}
	public Date getOneTimeOccurDT() {
		return OneTimeOccurDT;
	}
	public void setOneTimeOccurDT(Date oneTimeOccurDT) {
		OneTimeOccurDT = oneTimeOccurDT;
	}
	public Date getScheduleStartDT() {
		return ScheduleStartDT;
	}
	public void setScheduleStartDT(Date scheduleStartDT) {
		ScheduleStartDT = scheduleStartDT;
	}
	public Date getScheduleEndDT() {
		return ScheduleEndDT;
	}
	public void setScheduleEndDT(Date scheduleEndDT) {
		ScheduleEndDT = scheduleEndDT;
	}
	public Date getScheduleSaveDate() {
		return ScheduleSaveDate;
	}
	public void setScheduleSaveDate(Date scheduleSaveDate) {
		ScheduleSaveDate = scheduleSaveDate;
	}
	public String getCronExpression() {
		return CronExpression;
	}
	public void setCronExpression(String cronExpression) {
		CronExpression = cronExpression;
	}

    


}
