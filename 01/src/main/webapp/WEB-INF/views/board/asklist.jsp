<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<a href="register">문의글 작성하러가기</a>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="ask">
						<tr>
							<td><c:out value="${ask.bno}" /></td>
							<td><a href='/board/get?bno=<c:out value="${ask.bno}"/>'><c:out
										value="${ask.title}" /></a></td>
							<td><c:out value="${ask.writer}" /></td>
							<td><f:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${ask.regdate}" /></td>
							<td><f:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${ask.updatedate}" /></td>
							<td><c:out value="${ask.viewcnt }" /></td>
						</tr>

					</c:forEach>
				</table>
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pm.prev}">
							<li class="paginate_button previous"><a
								href="${pm.startPage-1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
							<li class="paginate_button"${pm.cri.page == num ? "active": ""}">
								<a href= 
								'${num}'>${num}</a>
							</li>


						</c:forEach>
						<c:if test="${pm.next} ">
							<li class="paginate_button next"><a href="${pm.endPage +1} ">NEXT</a></li>
						</c:if>


					</ul>

				</div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLable" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLable">게시글 작성 결과</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									Changes</button>

							</div>
						</div>
					</div>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
<form action="/board/asklist" method="get" id="actionForm">
<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum} " />
<input type="hidden" name="page" value="${pm.cri.page }"  />

</form>

<script>
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				});
				
				var actionForm=$("#actionForm");
				$(".paginate_button a").on("click",function(e){
					e.preventDefault();
					console.log('clcik');
					actionForm.find("input[name='perPageNum']").val($(this).attr("href"));
					actionForm.submit;
				});
				
				
			});
</script>

<%@include file="../includes/footer.jsp"%>