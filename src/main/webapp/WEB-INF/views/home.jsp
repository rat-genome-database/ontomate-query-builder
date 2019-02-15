<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<style>
tr.alt td {
 background: #ecf6fc;
 }
</style>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type="text/css"/>

	<link rel="stylesheet" href="/QueryBuilder/css/jquery-ui-1.8.18.custom.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/QueryBuilder/css/qbuilder.css" type="text/css" />
    <script type="text/javascript" src="/QueryBuilder/js/jquery-1.7.1.min.js"></script>

	<link rel="stylesheet" type="text/css" href="/OntoSolr/admin/file?file=/velocity/main.css&contentType=text/css"/>
	<link rel="stylesheet" href="/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.css&contentType=text/css" type="text/css" />

	<script type="text/javascript" src="/QueryBuilder/js/jquery-ui-1.8.18.js"></script>
	<script type="text/javascript" src="/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.js&contentType=text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
		console.log("<%=request.getContextPath()%>"+loadUrl);
	    $.get("<%=request.getContextPath()%>"+loadUrl,{},
				function(data){
					$("#lastRow").before(data);
					$(".stripeTable tr:odd").addClass("ui-widget-content");
					$(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
					var col_name="#inTerm"+(row_id-1)+" input";
					$(col_name).flushCache();

				//	   $(col_name).autocomplete('/OntoSolr/select', {
					$(col_name).autocomplete('/OntoSolr/select', {
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
	$(obj_name).autocomplete('/OntoSolr/select', {
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

</script>
	<title>Home of Query Builder</title>
</head>
<!--body class="p-3 mb-2 bg-gradient-warning text-dark"-->
<body>
<div class="header" style="">
		<div class="container-fluid">
				<div class="row">
					<div class="col-auto" style="padding-right:0">
						<a class="navbar-brand" href="https://rgd.mcw.edu"><img src="/QueryBuilder/images/rgd_logo.png"></a>
						</div>
					<div class="col-auto" style="padding-left:0">
						<span style="padding-top:30px;padding-left:0;color:#24609c;font-size: 50px;">OntoMate</span>
						<br><small>An ontology-driven, concept-based literature search engine developed at RGD.</small>
					</div>

				</div>


			</div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light" >

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="#queryForm" id="formLink">OntoMate Query Builder <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#features" id="featuresLink">Features</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#about" id="aboutLink" >About OntoMate</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					RGD Tools
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Gene Annotator</a>
					<a class="dropdown-item" href="#">Genome Viewer</a>
					<a class="dropdown-item" href="#">InterViewer</a>
					<div class="dropdown-divider">JBrowse</div>
					<a class="dropdown-item" href="#">OLGA</a>
					<a class="dropdown-item" href="#">PhenoMiner</a>
					<a class="dropdown-item" href="#">RatMine</a>
					<a class="dropdown-item" href="#">Variant Visualizer</a>
				</div>
			</li>

		</ul>
		<!--form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form-->
	</div>
</nav>

<div class="container">

	<div class="card" id="queryForm">
		<div class="card-body">
		<div  class="form-group" align="center">

		<h2>QueryBuilder</h2>
			<p style="color:#24609c;font-weight: bold">Default Query terms</p><snall>Text:(gene OR protein OR locus OR mutation OR variant OR splice OR insertion OR deletion OR SNP) </snall>
			<h4>Plus</h4>
			<h4>User Query Terms</h4>
		<form:form id="qForm" action="/QueryBuilder/getResult/" method="get"
			commandName="queryString" target="_blank">
			<table id="queryConditions" border="2" class="table stripeTable">
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
			<table  id="sortConditions" border="2" class="table table-striped ">
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
			<p>&nbsp</p>
			<table border="0">
				<tr>
					<td><a href="<%=request.getContextPath()%>" id="aClear"
						class="btn btn-light button">Clear</a></td>
					<td width="200"></td>
					<td><button id="search"  type="submit" value="Search"
						class="btn btn-light button">Search</button></td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
</div>
</div>
<div class="card menu_item container" id="about">
	<div class="card-body">
		<div  class="jumbotron" >
			<h1 class="display-4">Welcome to OntoMate</h1>
			<p class="lead">An ontology-driven, concept-based literature search engine developed at RGD.</p>
			<hr class="my-4">
			<p class="lead">The Rat Genome Database (RGD) is the premier repository of rat genomic, genetic and physiologic data. Converting data from free text in the scientific literature to a structured format is one of the main tasks of all model organism databases. RGD spends considerable effort manually curating gene, Quantitative Trait Locus (QTL) and strain information. The rapidly growing volume of biomedical literature and the active research in the biological natural language processing (bioNLP) community have given RGD the impetus to adopt text-mining tools to improve curation efficiency. Recently, RGD has initiated a project to use OntoMate, an ontology-driven, concept-based literature search engine developed at RGD, as a replacement for the PubMed (http://www.ncbi.nlm.nih.gov/pubmed) search engine in the gene curation workflow. OntoMate tags abstracts with gene names, gene mutations, organism name and most of the 16 ontologies/vocabularies used at RGD. All terms/ entities tagged to an abstract are listed with the abstract in the search results. All listed terms are linked both to data entry boxes and a term browser in the curation tool. OntoMate also provides user-activated filters for species, date and other parameters relevant to the literature search. Using the system for literature search and import has streamlined the process compared to using PubMed. The system was built with a scalable and open architecture, including features specifically designed to accelerate the RGD gene curation process. With the use of bioNLP tools, RGD has added more automation to its curation workflow.
			</p>
		</div>
	</div>
	</div>
<div class="card menu_item container" id="features">
	<div class="card-body">
		<div  class="jumbotron" >
			<h1 class="display-4">OntoMate Features</h1>
			<hr class="my-4">
			<ul>
				<li>OntoMate is ontology driven, concept-based literature search engine.</li>
				<li>Easy to build queries to search for concepts with Query Builder.</li>
				<li>OntoMate also provides user-activated filters for species, date and other parameters relevant to the literature search
					Context analysis.</li>
				<li>OntoMate is integrated into RGD curation tool which makes curation easier.	</li>
				<li>Customized search models for curation purposes.</li>
				<li>Provide preliminary curation results.</li>
			</ul>
		</div>
		</div>
	</div>

</body>
</html>
