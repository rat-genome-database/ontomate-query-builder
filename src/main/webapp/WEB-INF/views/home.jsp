<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%  String pageTitle =  "OntoMate - Publications search engine";
	String pageDescription ="OntoMate";
	String headContent = "";%>
<%@ include file="/common/headerarea.jsp"%>
<link rel="stylesheet" href="/QueryBuilder/css/jquery-ui-1.8.18.custom.css" type="text/css" media="all" />

<script type="text/javascript" src="/QueryBuilder/js/jquery-1.7.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/OntoSolr/admin/file?file=/velocity/main.css&contentType=text/css"/>
<link rel="stylesheet" href="/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.css&contentType=text/css" type="text/css" />

<script type="text/javascript" src="/QueryBuilder/js/jquery-ui-1.8.18.js"></script>
<script type="text/javascript" src="/OntoSolr/admin/file?file=/velocity/jquery.autocomplete.js&contentType=text/javascript"></script>
<!--script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script-->
<style>
	.jumbotron{
	/*	background:linear-gradient(to bottom, white 0%, #D6EAF8 100%); */
		background:linear-gradient(to bottom, white 0%, #D6EAF8 100%);
		background-color: #D1F2EB;
	}
</style>

<script type="text/javascript">

	var row_count=0;
	var sort_row_count = 0;

	$(document).ready(function(){
		$('#qb-options').hide();
		$('#qb-advancedSearchForm').hide();
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

		var row_id=1;

		$("#addCond").click(function() {
		//	$("#queryConditions").show();
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
										'v.template': 'termmatch1',
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
	//	$("#addCond").click();
	//	window.setTimeout(addAnotherRow,500);
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
	//	$(obj_name).flushCache();
	//	$(obj_name).unautocomplete();
		//  $(obj_name).autocomplete('/OntoSolr/select', {
		console.log(obj_name + '\t'+ ont_cat);
		$(obj_name).autocomplete('/OntoSolr/select', {
					extraParams:{
						'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5 synonym_str^2 synonym^2 def^1',
						'fq': 'cat:'+ (ont_cat=="ontology"?"(NOT CUSTOM NOT HP)": ont_cat.substring(0,ont_cat.length-5).toUpperCase()),
						'bf': 'term_len_l^.003',
						'wt': 'velocity',
						'v.template': 'termmatch1',
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
	function toggleQBAdvancedSearchForm() {
		var x = document.getElementById("qb-advancedSearchForm");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}



</script>
<div class="container-fluid">
	<div style="text-align: center">
	<p><span style="color:#24619c;font-size: 40px;text-decoration: none;"><img src="/QueryBuilder/common/logo.png" width="100px; height:100px"/>OntoMate </span> </p>
	<p class="lead" style="color:#2865A3">An ontology-driven, concept-based literature search engine developed at RGD.</p>
		</div>
	<hr>
<form:form id="qForm" action="/QueryBuilder/getResult/" method="get"  commandName="queryString" target="_blank">
	<div class="jumbotron">
		<div class="container">

		<div class="form-row row">
			<div class="form-group col-md-4" id="selOnt0">

					<form:select class="form-control form-control-lg" id="qb-ontology-select" path="qFieldConditions[0].fieldName" onchange='update_autocomplete("#qb-ac-input", $(this).val());'>
						<option value="ontology">Any ontology</option>
						<option value="bp_term">Biological Process</option>
						<option value="cl_term">Cell Ontology</option>
						<option value="cc_term">Cellular Component</option>
						<option value="chebi_term">CheBi Ontology</option>
						<option value="cmo_term">Clinical Measurement</option>
						<option value="rdo_term">Disease Ontology (RDO)</option>
						<option value="chebi_term">Drug and Chemical</option>
						<option value="xco_term">Experimental Condition</option>
						<option value="rgd_gene_term">Gene</option>
						<option value="mp_term">Mammalian Phenotype</option>
						<option value="mmo_term">Measurement Methods</option>
						<option value="mf_term">Molecular Function</option>
						<option value="ma_term">Mouse Anatomy</option>
						<option value="mt_term">Mutation</option>
						<option value="nbo_term">Neuro Behavioral</option>
						<option value="organism_term">Organism Ontology</option>
						<option value="pw_term">Pathway Ontology</option>
						<option value="rs_term">Rat Strain Ontology</option>
						<option value="zfa_term">Zebrafish Anatomy</option>
						<option value="so_term">Sequence Ontology</option>

					</form:select>

			</div>
			<div class="form-group col-md-8">
				<div class="input-group" >
					<form:input id="qb-ac-input" class="ont-auto-complete form-control form-control-lg border-secondary" type="search"  placeholder="Enter Search Term ...." path="qFieldConditions[0].fieldValue"/>

					<div class="input-group-append">

						<button class="btn btn-outline-secondary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				<small class="form-text text-muted">Examples: <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=hypertension" target="_blank">Hypertension</a>, <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=cancer" target="_blank">Cancer</a>, <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=a2m" target="_blank">A2m</a></small>
			</div>
		</div>
		</div>
		<div class="form-group col-md-12">
			<table class="table" >
				<tr id="lastRow">

				</tr>
			</table>
		</div>

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

		<div class="form-group col-md-12" style="text-align: center" >
			<div class="form-group" style="display: inline-block">
			<table style="alignment: center">
				<tr>
					<td><button type="button" id="addCond" class="btn btn-outline-secondary" style="">Add term
						condition</button></td>

					<td><!--button class="btn btn-outline-secondary" type="button" onclick="toggleQBAdvancedSearchForm()">Advanced Search</button-->
						<button class="btn btn-outline-secondary" type="button" onclick="myToggleFunction()">Advanced Search</button>

					</td>
					<td><!--button class="btn btn-outline-secondary" type="button" onclick="toggleQBAdvancedSearchForm()">Advanced Search</button-->
						<a href="<%=request.getContextPath()%>"
						  id="aClear"><button class="btn btn-outline-secondary">Clear Form</button></a>
					</td>
					<td><button class="btn btn-primary" type="submit">
						Search OntoMate
					</button></td>
				</tr>


			</table>
			</div>
		</div>
	</div>
	</form:form>

	<div class="container">
	<div class="row">
		<div class="col-md-4">
		<div class="card" style="width: 25rem;border:0">

			<div class="card-body">
				<h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c;">About</h5>
				<p class="card-text" style="color:grey">RGD has developed an ontology-driven, concept-based literature search engine, as a replacement for the PubMed (http://www.ncbi.nlm.nih.gov/pubmed) search engine in the gene curation workflow. OntoMate tags abstracts with gene names, gene mutations, organism name and most of the 16 ontologies/vocabularies used at RGD.</p>
				<!--a href="#" class="btn btn-primary">Go somewhere</a-->
			</div>
		</div>
		</div>
		<div class="col-md-4">
				<div class="card" style="width: 25rem;border:0">

				<div class="card-body">
					<h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c;">Features</h5>
					<p class="card-text" style="color:grey"></p>
					<ul style="margin-left: 0">
						<li style="color:grey;margin-left: 0">Easy to build queries to search for concepts</li>
						<li style="color:grey">OntoMate also provides user-activated filters for species.</li>
						<li style="color:grey">Date and other filters relevant to the literature search</li>
						<li style="color:grey">Information Annotated to Articles:Disease terms (CTD terms)
							Genes (using ABNER, A Biomedical Named Entity Recognizer)
							Rat strains (rat strain ontology)
							RGD genes
							Organisms (OrganismTagger)
							phenotype Ontology
							trait ontology
							Clinical terms
							All of the other ontologies used at RGD
						</li>
					</ul>
					<!--a href="#" class="btn btn-primary">Go somewhere</a-->
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 25rem;border:0">

				<div class="card-body" >
					<h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c">Publication</h5>
					<p class="card-text" style="color:grey">Click the below link to get the reference</p>
					<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4305386/" class="btn btn-primary" target="_blank">Go to PubMed</a>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>

<script>
	$(function () {
		var qbinput=$('#qb-ac-input');
		$(qbinput).autocomplete();
		$(qbinput).autocomplete('/OntoSolr/select', {
			extraParams:{
				'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5  synonym_str^2 synonym^2 def^1',
				'fq': 'NOT cat:(CUSTOM HP MP)',
				'wt': 'velocity',
				'bf': 'term_len_l^.01',
				'v.template': 'termmatch1',
				'cacheLength': 0
			},
			max:20
		});
		$(qbinput).focus(function(){$(qbinput).attr("autocomplete","off");});
		$(qbinput).focusout(function(){$(qbinput).attr("autocomplete","on");});
	});


</script>

<%@ include file="/common/footerarea.jsp"%>