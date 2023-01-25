package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class ScheduleDTO {
	public int jobId;
	public String scheduleName;
	public boolean scheduleType;
	public Date startDate;
	public Date endDate;
	public String CronExpression;
	
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public String getScheduleName() {
		return scheduleName;
	}
	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}
	public boolean isScheduleType() {
		return scheduleType;
	}
	public void setScheduleType(boolean scheduleType) {
		this.scheduleType = scheduleType;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCronExpression() {
		return CronExpression;
	}
	public void setCronExpression(String cronExpression) {
		CronExpression = cronExpression;
	}


}
