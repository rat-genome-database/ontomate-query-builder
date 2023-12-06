<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<style>
tr.alt td {
 backtround: #ecf6fc;
 }
</style>
<head>
	<link rel="stylesheet" href="/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="/solr/OntoSolr/admin/file?file=/velocity/main.css&contentType=text/css"/>
	<link rel="stylesheet" href="/solr/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.css&contentType=text/css" type="text/css" />
	<script type="text/javascript" src="/QueryBuilder/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.js"></script>
  	<script type="text/javascript" src="/solr/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.js&contentType=text/javascript"></script>



	<script type="text/javascript">
 
	var row_count=0;
	var sort_row_count = 0;
 
$(document).ready(function(){
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
	    $.get("<%=request.getContextPath()%>"+loadUrl, {},
				function(data){
					$("#lastRow").before(data);
					$(".stripeTable tr:odd").addClass("ui-widget-content");
					$(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
					var col_name="#inTerm"+(row_id-1)+" input";
					$(col_name).flushCache();
				
				//	   $(col_name).autocomplete('/OntoSolr/select', {
					$(col_name).autocomplete('/solr/OntoSolr/select', {
						extraParams:{
				             'qf': 'term_en^5 term_str^3 term^3 synonym_en^4.5  synonym_str^2 synonym^2 def^1',
 				             'fq': 'NOT cat:(CUSTOM HP MP)',
				             'wt': 'velocity',
				             'bf': 'term_len_l^.01',
				             'v.template': 'termmatch',
				             'cacheLength': 0
				           },
				           max: 20
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
	
	$("#butShowFields").click(function() {
		$('#fieldTable').toggle();
	});
//	$('#fieldTable').hide();
//	$("#addSort").click();
	$("#addCond").click();
	window.setTimeout(addAnotherRow,500)
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
	$(obj_name).autocomplete('/solr/OntoSolr/select', {
		extraParams:{
          'qf': 'term_en^5 term_str^3 term^3 synonym_en^4.5 synonym_str^2 synonym^2 def^1',
          'fq': 'cat:'+ (ont_cat=="ontology"?"(NOT CUSTOM NOT HP NOT MP)": ont_cat.substring(0,ont_cat.length-5).toUpperCase()),
          'bf': 'term_len_l^.003',
          'wt': 'velocity',
          'v.template': 'termmatch',
          'cacheLength': 0
        },
        max: 20
      }
	   
   );
}

</script>
	<title>Home of Query Builder</title>
</head>
<body>
<div  align="center">
<h2>OntoMate QueryBuilder (SkyGen)</h2>
		<form:form id="qForm" action="/QueryBuilder/getGeneticsResult/" method="get"
			commandName="queryString" target="_blank">
			<table id="queryConditions" border="2" class="stripeTable">
				<thead>
					<tr class="ui-widget-header" align="center">
						<td>Boolean Opt.</td>
						<td>Not</td>
						<td>Term Category</td>
						<td>Term or<br>Ontology ID
							<button id="helpOntoID" type="button" class="butHelp"></button></td>
						<td />
					</tr>
				</thead>
				<tbody>
					<tr id="lastRow"></tr>

				</tbody>
			</table>
				To seach for all values of a category, enter * in the value box.<br>
			<table>
			<tr>
			<td>
			<button type="button" id="addCond" class="button">Add term
				condition</button>		
			</td>
			<td>
			<input id="search0" type="submit" value="Search"
					class="button" />
			</td>
			</tr>
			</table>
			<p>&nbsp</p>
			<br>
			<table id="sortConditions" border="2" class="stripeTable1">
				<thead>
					<tr class="ui-widget-header" align="center">
						<td>Sort By</td>
						<td>Order</td>
						<td />
					</tr>
				</thead>
				<tbody>
					<tr id="lastSortRow"></tr>
				</tbody>
			</table>
				By default, results are sorted by relevance.<br>
			<button type="button" id="addSort" class="button">Change
				sorting condition</button>
			<p>&nbsp</p>
			<table border="0" id="fieldTable">
				<tbody>
					<tr>
						<td>Date(yyyy-mm-dd):</td>
						<td><form:input id="dateFrom" path="qDateFrom" size="10" />
							to <form:input id="dateTo" path="qDateTo" size="10" /></td>
					</tr>
					<tr>
						<td>PMIDs:</td>
						<td><form:input id="pmid" path="qPMID" size="60" /></td>
						<td><button id="helpPMID" type="button" class="butHelp" /></button></td>
					</tr>
					<tr>
						<td>All fields:</td>
						<td><form:input path="qString" size="60" /></td>
					</tr>
					<tr>
						<td>Title:</td>
						<td><form:input path="qTitleStr" size="60" /></td>
					</tr>
					<tr>
						<td>Author:</td>
						<td><form:input path="qAuthorStr" size="60" /></td>
					</tr>
					<tr>
						<td>Abstract:</td>
						<td><form:input path="qAbstractStr" class="ui-widget-content"
								size="60" /></td>
					</tr>
				</tbody>
			</table>
			<p>&nbsp</p>
			<table border="0">
				<tr>
					<td><a href="<%=request.getContextPath()%>" id="aClear"
						class="button">Clear</a></td>
					<td width="200"></td>
					<td><input id="search" type="submit" value="Search"
						class="button" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
