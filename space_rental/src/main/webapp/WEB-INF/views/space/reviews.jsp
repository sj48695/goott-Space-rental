<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						<c:forEach var="review" items="${ reviews }">
						<fmt:formatDate value="${ review.regDate }" var="regDate" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
							<tr id="tr${ review.reviewNo }">
								<td class="border-bottom text-left" style="padding-left:${ review.depth*20 + 10 }px">
									<div id='reviewview${ review.reviewNo }' class="container">
										<div class="col-sm-12 row justify-content-between py-1">
											${ review.writer } &nbsp;&nbsp; [${ regDate }] 
											<div style='display:${ loginuser.id eq review.writer ? "block" : "none" }'>
												<a class="editreview" data-reviewno='${ review.reviewNo }' href="javascript:">
													편집
												</a> &nbsp; 
												<a class="deletereview" href="javascript:" data-reviewno="${ review.reviewNo }">삭제</a>
											</div>
										</div>
										<span>${ review.content }</span>
										
										<div style="width: 30px;height: 30px">
											<a class="comment-link"
												data-toggle="collapse" href="#comment-collapse${ review.reviewNo }"
												aria-controls="comment-collapse${ review.reviewNo }">
													<img src="/spacerental/resources/images/comment.svg" class="svg">
											</a>
										</div>

									</div>
									<div>
									<div class="row">
										<div class="col">
											<div class="collapse multi-collapse" id="comment-collapse${ review.reviewNo }">
												<div class="card card-body">
												<form id="comment-form" class="form-inline row">
													<input type="hidden" name="reviewNo" value="${ review.reviewNo }">
									               <input type="hidden" name="spaceNo" id="spaceNo" value=""> 
									               <input type="hidden" name="writer" value="${ loginuser.id }">
									               <div class="col-md-12">
									                  <textarea class="form-control mr-1" name="content" cols="${ 60 - review.depth*5 }" rows="3"></textarea>
									                  <a class="btn btn-primary py-3 px-4" id="write-comment" 
									                  	data-reviewno='${ review.reviewNo }' href="javascript:">댓글<br>등록</a>
									               </div>
									            </form>
									            </div>
											</div>
										</div>
									</div>
									</div>
									<div id='reviewedit${ review.reviewNo }' style="display: none" class="container">
										<div class="col-sm-12 row justify-content-between py-1">
											${ review.writer } &nbsp;&nbsp; [${ regDate }]
										</div>
										<form id="updateform${ review.reviewNo }">
											<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
											<textarea class="form-control" name="content" style="width: 550px" rows="3"
												maxlength="200">${ review.content }</textarea>
										</form>
										<div>
											<a class="updatereview" href="javascript:" data-reviewno="${ review.reviewNo }">수정</a> &nbsp; 
											<a class="cancel" data-reviewno="${ review.reviewNo }" href="javascript:">취소</a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>