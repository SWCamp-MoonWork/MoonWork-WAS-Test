package com.swcamp.moonwork.model.dto;

import java.util.Date;

public class RunsDTO {
    public long getRunId() {
		return RunId;
	}
	public void setRunId(long runId) {
		RunId = runId;
	}
	public String getWorkflowName() {
		return WorkflowName;
	}
	public void setWorkflowName(String workflowName) {
		WorkflowName = workflowName;
	}
	public String getStartDT() {
		return StartDT;
	}
	public void setStartDT(String startDT) {
		StartDT = startDT;
	}
	public String getEndDT() {
		return EndDT;
	}
	public void setEndDT(String endDT) {
		EndDT = endDT;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public long getJobId() {
		return JobId;
	}
	public void setJobId(long jobId) {
		JobId = jobId;
	}
	public long getHostId() {
		return HostId;
	}
	public void setHostId(long hostId) {
		HostId = hostId;
	}
	public Date getSaveDate() {
		return SaveDate;
	}
	public void setSaveDate(Date saveDate) {
		SaveDate = saveDate;
	}
	public String getResultData() {
		return ResultData;
	}
	public void setResultData(String resultData) {
		ResultData = resultData;
	}
	
    public String getDuration() {
		return Duration;
	}
	public void setDuration(String duration) {
		Duration = duration;
	}
	
	public long RunId;
    public String WorkflowName;
    public String StartDT;
    public String EndDT;
    public String State;
    public long JobId;
    public long HostId;
    public String Duration;
	public String ResultData;
	public Date SaveDate;


	
}
