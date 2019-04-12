<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%  String pageTitle =  "OntoMate - Publications search engine";
	String pageDescription ="OntoMate";
	String headContent = "";%>
<%@ include file="/common/headerarea.jsp"%>



<link rel="stylesheet" href="/QueryBuilder/css/jquery-ui-1.8.18.custom.css" type="text/css" media="all" />

<script type="text/javascript" src="/QueryBuilder/js/jquery-1.7.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="http://green.rgd.mcw.edu:8080/OntoSolr/admin/file?file=/velocity/main.css&contentType=text/css"/>
<link rel="stylesheet" href="http://green.rgd.mcw.edu:8080/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.css&contentType=text/css" type="text/css" />

<script type="text/javascript" src="/QueryBuilder/js/jquery-ui-1.8.18.js"></script>
<script type="text/javascript" src="http://green.rgd.mcw.edu:8080/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.js&contentType=text/javascript"></script>
<!--script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script-->

<style>
	tr.alt td {
		background: #ecf6fc;
	}
</style>
<script type="text/javascript">

	var row_count=0;
	var sort_row_count = 0;

	$(document).ready(function(){
		$('#qb-options').hide();
		$("#dateFrom").datepicker({dateFormat: "yy-mm-dd"});
		$("#dateTo").datepicker({dateFormat: "yy-mm-dd"});
		$(".button").button();

		$("input").addClass("ui-widget-content ui-state-default ui-corner-all");
		$("form").addClass("ui-widget");
		$("#queryConditions").addClass("ui-corner-all");
		$("#queryConditions").hide();
		$("#sortConditions").addClass("ui-corner-all");
		$("#sortConditions").hide();
		$(".butHelp").button({icons: {primary: "ui-icon-help"}, text:false});

		$.ajaxSetup ({
			cache: false
		});

		var ajax_load = "<img src='img/load.gif' alt='loading...' />";

		//  load() functions
		$("#getOntNmae").click(function(){
			var loadUrl = "<%=request.getContextPath()%>/get_ontology/"+ontId.value;
			$("#result").html(ajax_load).load(loadUrl);
		});

		var row_id=0;

		$("#addCond").click(function() {
			$("#queryConditions").show();
			var loadUrl = "/getConditionRow/"+row_id;
			console.log("<%=request.getContextPath()%>"+loadUrl);
			$.get("<%=request.getContextPath()%>"+loadUrl,{},
					function(data){
						$("#lastRow").before(data);
						$(".stripeTable tr:odd").addClass("ui-widget-content");
						$(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
						var col_name="#inTerm"+(row_id-1)+" input";
						$(col_name).flushCache();

						//	   $(col_name).autocomplete('/OntoSolr/select', {
						$(col_name).autocomplete('https://ontomate.rgd.mcw.edu/OntoSolr/select', {
									extraParams:{
										'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5  synonym_str^2 synonym^2 def^1',
										'fq': 'NOT cat:(CUSTOM HP MP)',
										'wt': 'velocity',
										'bf': 'term_len_l^.01',
										'v.template': 'termmatch',
										'cacheLength': 0
									},
									max:20
								}
						);
						$(col_name).focus(function(){$(col_name).attr("autocomplete","off");});
						$(col_name).focusout(function(){$(col_name).attr("autocomplete","on");});
					});

			row_id=row_id +1;
			row_count = row_count +1;
		});

		var sort_row_id=0;

		$("#addSort").click(function() {
			$("#sortConditions").show();
			var loadUrl = "/getSortCondRow/"+sort_row_id;
			$.get("<%=request.getContextPath()%>"+loadUrl, {},
					function(data){
						$("#lastSortRow").before(data);
						$(".stripeTable1 tr:odd").addClass("ui-widget-content");
						$(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
					});

			sort_row_id=sort_row_id +1;
			sort_row_count = sort_row_count +1;
		});

		$("#helpPMID").click(function() {
			var dialog = $("<div></div>")
					.html("Three options: <br>1. One PMID. <br> 2. Multiple comma or space separated PMIDs. <br> 3. Start_PMID to End_PMID.")
					.dialog({title: 'Enter PMID', modal:'true', width:400, resizable:false});
		});

		$("#helpOntoID").click(function() {
			var dialog = $("<div></div>")
					.html('Two options:<br>1. Enter an ontology term.<br>2. Enter a RGD gene')
					.dialog({title: 'Term or ID', modal:'true', width:400, resizable:false});
		});
		$('.nav-item').click(function () {

		});
		$("#butShowFields").click(function() {
			$('#fieldTable').toggle();
		});
//	$('#fieldTable').hide();
//	$("#addSort").click();
		$("#addCond").click();
		window.setTimeout(addAnotherRow,500);
		$("#aboutLink").click(function () {
			$("#queryForm").hide();
			$("#features").hide();
			$("#about").show();
		})
		$("#featuresLink").click(function () {
			$("#queryForm").hide();
			$("#about").hide();
			$("#features").show();
		})
		$("#formLink").click(function () {
			$("#about").hide();
			$("#features").hide();
			$("#queryForm").show();

		})
	});

	function addAnotherRow() {
		$("#addCond").click();
	}

	function removeRow(rowId) {
		row_count = row_count -1;
		$('#condRow'+rowId).remove();
		$(".stripeTable tr").removeClass("ui-widget-content");
		$(".stripeTable tr:odd").addClass("ui-widget-content");
		if (row_count ==0) $("#queryConditions").hide();
	}

	function removeSortRow(rowId) {
		sort_row_count = sort_row_count -1;
		$('#sortRow'+rowId).remove();
		$(".stripeTable1 tr").removeClass("ui-widget-content");
		$(".stripeTable1 tr:odd").addClass("ui-widget-content");
		if (sort_row_count ==0) $("#sortConditions").hide();
	}

	function update_autocomplete(obj_name, ont_cat) {
		$(obj_name).flushCache();
		$(obj_name).unautocomplete();
		//  $(obj_name).autocomplete('/OntoSolr/select', {
		$(obj_name).autocomplete('https://ontomate.rgd.mcw.edu/OntoSolr/select', {
					extraParams:{
						'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5 synonym_str^2 synonym^2 def^1',
						'fq': 'cat:'+ (ont_cat=="ontology"?"(NOT CUSTOM NOT HP)": ont_cat.substring(0,ont_cat.length-5).toUpperCase()),
						'bf': 'term_len_l^.003',
						'wt': 'velocity',
						'v.template': 'termmatch',
						'cacheLength': 0
					},
					max: 20
				}

		);
	}
	function myToggleFunction() {
		var x = document.getElementById("qb-options");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}
</script>


<div class="container">
<div class="jumbotron" style="text-align: center">
	<h1 class="display-4">OntoMate</h1>
	<hr class="my-4">
	<p class="lead" style="color:#2865A3">An ontology-driven, concept-based literature search engine developed at RGD.</p>
</div>
	<div class="card" id="queryForm">
		<div class="card-body">
			<div  class="form-group" align="center">

				<!--h1>OntoMate</h1>
				<p>An ontology-driven, concept-based literature search engine developed at RGD.</p-->
				<form:form id="qForm" action="/QueryBuilder/getResult/" method="get"
						   commandName="queryString" target="_blank">
					<table id="queryConditions" border="0" class="table stripeTable">
						<thead>
						<tr class="ui-widget-header" align="center">
							<td>Boolean Opt.</td>
							<td>Not</td>
							<td>Term Category</td>
							<td>Term or Ontology ID <span class="badge badge-secondary" id="helpOntoID" style="cursor:hand">?</span>
							</td>
							<td></td>
						</tr>
						</thead>
						<tbody>
						<tr id="lastRow"></tr>

						</tbody>
					</table>
					To seach for all values of a category, enter * in the value box.<br>
					<button type="button" id="addCond" class="btn btn-light button">Add term
						condition</button>
					<p>&nbsp;</p>
					<br>
					<table  id="sortConditions" border="0" class="table table-striped ">
						<thead>
						<tr  align="center">
							<td>Sort By</td>
							<td>Order</td>
							<td></td>
						</tr>
						</thead>
						<tbody>
						<tr id="lastSortRow"></tr>
						</tbody>
					</table>
					By default, results are sorted by relevance.<br>
					<button type="button" id="addSort" class="btn btn-light button">Change
						sorting condition</button>
					<p>&nbsp</p>
					<a href="#" onclick="myToggleFunction()"><h3>Advanced Search Options</h3></a>
					<p>&nbsp</p>
					<div class="container" id="qb-options" style="width:70%; align:center">
					<table class="table" id="fieldTable">
						<tbody>
						<tr>
							<td style="vertical-align:bottom">Date(yyyy-mm-dd):</td>
							<td>
								<div class="form-row">
									<div class="col-auto">
										From
										<form:input class="form-control" id="dateFrom" path="qDateFrom"  />
									</div>
									<div class="col-auto">
										To <form:input class="form-control" id="dateTo" path="qDateTo" />
									</div>
								</div>
							</td>

						</tr>
						<tr>
							<td style="vertical-align: bottom">PMIDs:</td>
							<td>
								<div class="row">
									<div class="col">
										<form:input class="form-control" id="pmid" path="qPMID"  /></div>
									<div class="col">
										<span class="badge badge-secondary butHelp" id="helpPMID" style="cursor:hand">?</span>
									</div>
								</div>
							</td>

						</tr>
						<tr>
							<td style="vertical-align: bottom">All fields:</td>
							<td><form:input class="form-control" path="qString"  /></td>
						</tr>
						<tr>
							<td style="vertical-align: bottom">Title:</td>
							<td><form:input class="form-control" path="qTitleStr"  /></td>
						</tr>
						<tr>
							<td style="vertical-align: bottom">Author:</td>
							<td><form:input class="form-control" path="qAuthorStr"  /></td>
						</tr>
						<tr>
							<td style="vertical-align: bottom">Abstract:</td>
							<td><form:input  path="qAbstractStr" class="form-control"
							/></td>
						</tr>
						</tbody>
					</table>
					</div>


					<table border="0">
						<tr>
							<td>
							<div class="row" align="center">
								<div class="column" style="padding-right: 50px">
									<button type="button" class="btn btn-secondary">Clear Form</button>
								</div>
								<div class="column">
									<button type="button" class="btn btn-secondary" style="font-weight:bold ;">Search OntoMate</button>
								</div>
							</div>
							</td>
							<!--td colspan="2"><a href="<%=request.getContextPath()%>" id="aClear"
								   class="btn btn-secondary form-control">Clear</a></td>

							<td><button id="search"  type="submit" value="Search"
										class="btn btn-secondary">Search</button></td-->
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footerarea.jsp"%>