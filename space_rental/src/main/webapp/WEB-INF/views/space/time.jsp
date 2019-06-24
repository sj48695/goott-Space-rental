<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
					<div class="select">
						<c:forEach var="time" begin="${ host.openStart }" end="${ host.openEnd }">
							<label class="py-1 px-2 border time" id="timelabel${ time }"
							<c:forEach var="rent" items="${ rents }">
							<c:set var="start" value="${ rent.startTime }"/>
							<c:set var="end" value="${ rent.endTime }"/>
								<c:choose>
									<c:when test="${ time >= rent.startTime && time <= rent.endTime  }">
										
										style="background: ${ loginuser.id eq rent.id ? '#ccccff' : '#a9a9a92e'}; 
												color:${ loginuser.id eq rent.id ? '#8d119a' : '#c1c1c1'};"
									</c:when>
									<c:when test="${ time < rent.startTime || time > rent.endTime  }">
										onclick="javascript:timeClick(${ time })"
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${ empty rents }">onclick="javascript:timeClick(${ time })"</c:if>
									>${ time }</label>
						</c:forEach>
						<input type="hidden" name="startTime" id="startTime" required="required">
						<input type="hidden" name="endTime" id="endTime" value="0">
					</div>