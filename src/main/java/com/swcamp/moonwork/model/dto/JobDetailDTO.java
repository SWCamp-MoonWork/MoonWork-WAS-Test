package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class JobDetailDTO {
	
	public long JobId;
    public String JobName;
    public Boolean JobIsUse;
    public String WorkflowName;
    public String JobNote;
    public String JobSaveDate;
    public String UserName;
    public long ScheduleId;
	public String ScheduleName;
    public Boolean ScheduleIsUse;
    public Boolean ScheduleType;
    public String OneTimeOccurDT;
    public String ScheduleStartDT;
    public String ScheduleEndDT;
    public String ScheduleSaveDate;
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
	public String getJobSaveDate() {
		return JobSaveDate;
	}
	public void setJobSaveDate(String jobSaveDate) {
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
	public String getOneTimeOccurDT() {
		return OneTimeOccurDT;
	}
	public void setOneTimeOccurDT(String oneTimeOccurDT) {
		OneTimeOccurDT = oneTimeOccurDT;
	}
	public String getScheduleStartDT() {
		return ScheduleStartDT;
	}
	public void setScheduleStartDT(String scheduleStartDT) {
		ScheduleStartDT = scheduleStartDT;
	}
	public String getScheduleEndDT() {
		return ScheduleEndDT;
	}
	public void setScheduleEndDT(String scheduleEndDT) {
		ScheduleEndDT = scheduleEndDT;
	}
	public String getScheduleSaveDate() {
		return ScheduleSaveDate;
	}
	public void setScheduleSaveDate(String scheduleSaveDate) {
		ScheduleSaveDate = scheduleSaveDate;
	}
	public String getCronExpression() {
		return CronExpression;
	}
	public void setCronExpression(String cronExpression) {
		CronExpression = cronExpression;
	}

    


}
