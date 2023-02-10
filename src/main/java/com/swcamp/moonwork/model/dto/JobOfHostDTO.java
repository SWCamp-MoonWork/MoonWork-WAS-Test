package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class JobOfHostDTO {
	
	public long JobId;
	public String JobName;
	public String LastRun;
	public String NextRun;
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
	public String getLastRun() {
		return LastRun;
	}
	public void setLastRun(String lastRun) {
		LastRun = lastRun;
	}
	public String getNextRun() {
		return NextRun;
	}
	public void setNextRun(String nextRun) {
		NextRun = nextRun;
	}


}
