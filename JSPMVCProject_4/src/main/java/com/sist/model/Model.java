package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Model {
	public String requestHandler(HttpServletRequest request, HttpServletResponse response);
}
