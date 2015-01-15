<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Project management</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
  	<div id="wrapper">
		<jsp:include page="navbar.jsp" />

		<div id="page-wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> <c:out value="${project.name}"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="formTask()" data-toggle="tooltip" data-placement="top" title="" data-original-title="Create Task"><i class="fa fa-link"></i> </button>
                    </h1>
                </div>
            </div>

            <!-- /.row -->
            <div class="row">
                <c:if test="${not empty listTask}">
                    <c:forEach var="listValue" items="${listTask}">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                        ${listValue.name}
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="formMiniTask('${listValue.id}')" data-toggle="tooltip" data-placement="top" title="" data-original-title="Create Mini Task" class="btn btn-info btn-circle"><i class="fa fa-check"></i></button>
                                </div>
                                <!-- /.panel-heading -->
                                <c:if test="${not empty listValue.taskChild}">
                                    <div class="panel-body" id="${listValue.id}">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs">
                                            <c:forEach var="listChild" items="${listValue.taskChild}">
                                                <li ><a href="#${listChild.id}" data-toggle="tab">${listChild.name}</a></li>
                                                    <!-- Tab panes -->
                                            </c:forEach>
                                            <div class="tab-content">
                                                <c:forEach var="listChild" items="${listValue.taskChild}">
                                                    <div class="tab-pane fade" id="${listChild.id}">
                                                        <h4>Task name : ${listChild.name}</h4>
                                                        <p>Task cha :${listChild.parent}</p>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </ul>
                                    </div>
                                </c:if>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <!-- /.row -->

        </div>
        <!-- /#page-wrapper -->

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Project Detail</h4>
                        </div>
                        <div class="modal-body">
                            <div>
                                <fieldset>
                                    <div class="form-group">
                                        <label>Task name</label>
                                        <input class="form-control" placeholder="Enter text" id="nameTask">
                                    </div>

                                    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="submitButton" onclick="createTask()">Submit</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
            </div>
        <!-- /.modal -->

        <!-- Modal -->
        <div class="modal fade" id="myMiniModal" tabindex="-1" role="dialog" aria-labelledby="myMiniModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myMiniModalLabel">Mini task </h4>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <fieldset>
                                        <div class="form-group">
                                            <label>Task name</label>
                                            <input class="form-control" placeholder="Enter text" id="nameChildTask">
                                        </div>
                                        <input type="hidden" id="id_parentTask" value="">
                                        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                                    </fieldset>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="createMiniTask()">Submit</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
            </div>

    <!-- /#wrapper -->
    </div>
    <!-- jQuery Version 1.11.0 -->
    <script src="/resources/js/jquery-1.11.0.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/plugins/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>
    <!-- My JavaScript -->
    <script>
        var user_data={
            "name": "${account.name}",
            "email": "${account.email}"
        };
        var project_data={
            "id":"${project.id}",
            "name":"${project.name}",
            "accountOwner":"${project.accountOwner}"
        };
        var urlPostTask="http://localhost:8080/rest/task/create";
        function formTask(){
            clearModal();
            $("#myModal").modal("show");
        }
        function formMiniTask(parent){
            $("#myMiniModal").modal("show");
            $("#id_parentTask").val(parent);
        }
        function createTask(){
            var name=$("#nameTask").val();
            var json = {"name":name,"rootProject":project_data.id,"parent":project_data.id};
            $.ajax({
                url: urlPostTask,
                data: JSON.stringify(json),
                type: "POST",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
                success: function(result) {
                    if(result.id=='fail'){
                        alert("Submit bị lỗi !! ");
                    }else{
                        alert("Submit dữ liệu mới thành công !! ");

                    }
                }
            });
            $("#myModal").modal("hide");
            location.reload();
            clearModal();
        }
        function createMiniTask(){
            var name=$("#nameChildTask").val();
            var parent=$("#id_parentTask").val();
            var json = {"name":name,"rootProject":project_data.id,"parent":parent};
            $.ajax({
                url: urlPostTask,
                data: JSON.stringify(json),
                type: "POST",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
                success: function(result) {
                    if(result.id=='fail'){
                        alert("Submit bị lỗi !! ");
                    }else{
                        alert("Submit dữ liệu mới thành công !! ");

                    }
                }
            });
            $("#myMiniModal").modal("hide");
            location.reload();
            clearModal();
        }
        function clearModal(){
            $("#nameTask").val("");
            $("#id_parentTask").val("");
            $("#nameChildTask").val("");
        }

        $('.row').tooltip({
            selector: "[data-toggle=tooltip]",
            container: "body"
        })
    </script>
</body>
</html>
