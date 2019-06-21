<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
						<tr bgcolor="#ccccff">
							<c:forEach var="week" varStatus="i" items="${ strWeek }">
								<td class="text-center py-1 px-2">
									<font color=<c:choose>
													<c:when test="${ i.index eq 0 }">"red"</c:when>
													<c:when test="${ i.index eq 6 }">"blue"</c:when>
													<c:otherwise>"black"</c:otherwise>
												</c:choose>><b>${ week }</b>
									</font>
								</td>
							</c:forEach>
						</tr>


				<c:forEach var="i" begin="1" end="${ lastDay }">
					<c:if test="${ i eq 1 }">
						<tr>
						<c:forEach begin="0" end="${ week-1 }">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
							<td class="text-center py-1 px-2" 
								<c:if test="${ year >= nowYear }">
									<c:choose>
									<c:when test="${ month < nowMonth }">style="background: #a9a9a92e;color: #c1c1c1;"</c:when>
									<c:when test="${ month eq nowMonth }">
										<c:choose>
											<c:when test="${ i eq nowDay }">style="background:#e2d6b79e"</c:when>
											<c:when test="${ i > nowDay }">style="cursor: pointer;"</c:when>
											<c:when test="${ i < nowDay }">style="background: #a9a9a92e;color: #c1c1c1;"</c:when>
										</c:choose>
									</c:when>
									<c:when test="${ month > nowMonth }">style="cursor: pointer;"</c:when>
									</c:choose>
								</c:if>>
								<c:if test="${ year >= nowYear }">
									<c:choose>
										<c:when test="${ month eq nowMonth && i > nowDay }">
											<input type="radio" id="day${i}" name="day" value="${i}"
												hidden="hidden" onclick="javascript:dayCheck(${ i })">
										</c:when>
										<c:when test="${ month > nowMonth }">
											<input type="radio" id="day${i}" name="day" value="${i}"
												hidden="hidden" onclick="javascript:dayCheck(${ i })">
										</c:when>
									</c:choose>
								</c:if>
								<label for="day${i}" class="date m-0">${i}</label>
							</td>
					<c:if test="${ i eq lastDay }">
						<c:forEach begin="${ week+1 }" end="6">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>

					<c:set var="week" value="${week+1}" />
					<c:if test="${ week > 6 }">
						<c:set var="week" value="0" /> 
						</tr>
						<tr>
					</c:if>
				</c:forEach>
						</tr>