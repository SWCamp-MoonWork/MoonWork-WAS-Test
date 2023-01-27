package com.swcamp.moonwork.model.dto;

import java.time.LocalDate;
import java.util.Date;

public class ScheduleDTO {
	public int jobId;
	public String scheduleName;
	public boolean scheduleType;
	public LocalDate  startDate;
	public LocalDate  endDate;
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
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public String getCronExpression() {
		return CronExpression;
	}
	public void setCronExpression(String cronExpression) {
		CronExpression = cronExpression;
	}


}
