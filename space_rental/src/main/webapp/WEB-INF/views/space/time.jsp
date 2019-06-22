<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
						<c:forEach var="time" begin="${ host.openStart }" end="${ host.openEnd }" varStatus="i">
								<label class="py-1 px-2 border time" id="timelabel${ i.index }"
								<c:forEach var="rent" items="${ rents }">
								<c:set var="start" value="${ rent.startTime }"/>
								<c:set var="end" value="${ rent.endTime }"/>
								<c:choose>
									<c:when test="${ i.index >=start && i.index <= end  }">
										<c:if test="${ loginuser.id ne rent.id }">
										style="background: #a9a9a92e; color: #c1c1c1;"
										</c:if>
										<c:if test="${ loginuser.id eq rent.id }">
										style="background: #ccccff; color: #8d119a;"
										</c:if>
									</c:when>
									<c:otherwise>
										onclick="javascript:timeClick(${ i.index },${ time })"
									</c:otherwise>
								</c:choose>
							</c:forEach>
									>${ time }</label>
							</c:forEach>
							<input type="radio" hidden="hidden" name="startTime" id="startTime" value="0">
							<input type="radio" hidden="hidden" name="endTime" id="endTime" value="0">