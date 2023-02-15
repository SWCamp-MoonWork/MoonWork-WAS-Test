package com.swcamp.moonwork.model.dto;

import java.util.List;
import java.util.ArrayList;

public class ChartDataDTO {
	public List<String> y_data = new ArrayList<>();
	public List<String> x_data = new ArrayList<>();
	
	public String label;
	public String borderColor;
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public List<String> getY_data() {
		return y_data;
	}
	public void setY_data(List<String> y_data) {
		this.y_data = y_data;
	}
	public List<String> getX_data() {
		return x_data;
	}
	public void setX_data(List<String> x_data) {
		this.x_data = x_data;
	}
	


}
