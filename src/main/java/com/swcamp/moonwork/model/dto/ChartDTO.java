package com.swcamp.moonwork.model.dto;

public class ChartDTO {
	public long getRunId() {
		return RunId;
	}
	public void setRunId(long runId) {
		RunId = runId;
	}
	public String getJobName() {
		return JobName;
	}
	public void setJobName(String jobName) {
		JobName = jobName;
	}
	public long getJobId() {
		return JobId;
	}
	public void setJobId(long jobId) {
		JobId = jobId;
	}
	public String getStartDT() {
		return StartDT;
	}
	public void setStartDT(String startDT) {
		StartDT = startDT;
	}
	public String getDuration() {
		return Duration;
	}
	public void setDuration(String duration) {
		Duration = duration;
	}
	public long RunId;
	public String JobName;
	public long JobId;
	public String StartDT;
	public String Duration;
}
