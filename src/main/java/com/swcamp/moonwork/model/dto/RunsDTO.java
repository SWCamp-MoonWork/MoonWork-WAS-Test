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
	public Date getStartDT() {
		return StartDT;
	}
	public void setStartDT(Date startDT) {
		StartDT = startDT;
	}
	public Date getEndDT() {
		return EndDT;
	}
	public void setEndDT(Date endDT) {
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
	public long RunId;
    public String WorkflowName;
    public Date StartDT;
    public Date EndDT;
    public String State;
    public long JobId;
    public long HostId;
    public Date SaveDate;

	
}
