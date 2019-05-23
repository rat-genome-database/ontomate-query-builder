package edu.mcw.rgd.controller;

import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


import edu.mcw.rgd.service.PubMedReference;
import org.apache.commons.text.StringEscapeUtils;

/*import org.slf4j.Logger;
import org.slf4j.LoggerFactory;*/

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.util.AutoPopulatingList;
import org.springframework.web.bind.annotation.*;


import edu.mcw.rgd.Utils.BasicUtils;
import edu.mcw.rgd.dao.impl.AliasDAO;
import edu.mcw.rgd.dao.impl.GeneDAO;
import edu.mcw.rgd.dao.impl.OntologyXDAO;
import edu.mcw.rgd.dao.impl.OrthologDAO;
import edu.mcw.rgd.dao.impl.XdbIdDAO;
import edu.mcw.rgd.datamodel.Alias;
import edu.mcw.rgd.datamodel.Gene;
import edu.mcw.rgd.datamodel.Ortholog;
import edu.mcw.rgd.datamodel.XdbId;
import edu.mcw.rgd.datamodel.ontologyx.Term;
import edu.mcw.rgd.datamodel.ontologyx.TermSynonym;
import edu.mcw.rgd.model.BulkGeneString;
import edu.mcw.rgd.model.CuratableCondition;
import edu.mcw.rgd.model.CurationQueryString;
import edu.mcw.rgd.model.FieldQueryCondition;
import edu.mcw.rgd.model.FieldSortCondition;
import edu.mcw.rgd.model.OntoIdCondition;
import edu.mcw.rgd.model.OntoTermIdStr;
import edu.mcw.rgd.model.QueryString;
import edu.mcw.rgd.model.RefRgdIdCondition;
import edu.mcw.rgd.model.RgdIdCondition;
import edu.mcw.rgd.model.SolrQueryCondition;
import edu.mcw.rgd.service.PubMedDbService;
import edu.mcw.rgd.service.RgdTermSearchService;
import edu.mcw.rgd.service.SolrQueryStringService;
import edu.mcw.rgd.service.SolrQueryStringService.FieldType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class QueryFormController {
/*	private static final Logger logger = LoggerFactory
			.getLogger(QueryFormController.class);
*/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	/*	logger.info("Welcome home! the client locale is " + locale.toString());*/

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@ModelAttribute("queryString")
	public QueryString getQueryString() {
		QueryString qs = new QueryString();
		qs.setqFieldConditions(new AutoPopulatingList(FieldQueryCondition.class));
		qs.setqSortConditions(new AutoPopulatingList(FieldSortCondition.class));
		return qs;
	}

	@ModelAttribute("solrQueryCondition")
	public SolrQueryCondition getSolrQueryCondition() {
		SolrQueryCondition qs = new SolrQueryCondition();
		return qs;
	}

	@ModelAttribute("bulkGeneString")
	public BulkGeneString getBulkGeneString() {
		BulkGeneString qs = new BulkGeneString();
		return qs;
	}

	@ModelAttribute("curationQueryString")
	public CurationQueryString getCurationQueryString() {
		CurationQueryString qs = new CurationQueryString();
		qs.setqRgdIds(new AutoPopulatingList(RgdIdCondition.class));
		qs.setqOntoIds(new AutoPopulatingList(OntoIdCondition.class));
		qs.setqRefRgdIds(new AutoPopulatingList(RefRgdIdCondition.class));
		return qs;
	}

	@ModelAttribute("curatableCondition")
	public CuratableCondition getCuratableCondition() {
		CuratableCondition qs = new CuratableCondition();
		return qs;
	}

	@RequestMapping(value = "/get_ontology/{ontId}", method = RequestMethod.GET)
	public String getOntology(@PathVariable String ontId, Model model) {

		model.addAttribute("ontName", ontId.toUpperCase());

		return "selects";
	}

	@RequestMapping(value = "/getConditionRow/{rowId}", method = RequestMethod.GET)
	public String getConditionRow(@PathVariable String rowId, Model model) {

		model.addAttribute("rowId", rowId);

		return "ConditionRow";
	}

	@RequestMapping(value = "/getSortCondRow/{rowId}", method = RequestMethod.GET)
	public String getSortCondRow(@PathVariable String rowId, Model model) {

		model.addAttribute("rowSortId", rowId);

		return "SortCondRow";
	}

	@RequestMapping(value = "/addFields", method = RequestMethod.GET)
	public String addFields(@ModelAttribute QueryString queryString, Model model) {
		model.addAttribute("queryString", queryString);
		return "selects";
	}
/*	@RequestMapping(value = "/getOrganisms/{term}", method = RequestMethod.GET)
//	public String getOrganisms(@RequestBody @RequestParam("term") String term, Model model, HttpServletRequest request) throws Exception {
	public String getOrganisms(@RequestBody @PathVariable("term") String term, Model model) throws Exception {
		System.out.println("HELLO:" +term);
		String regex="[0-9]+";
		URI uri = new URI("http://hansen.rgd.mcw.edu:8080/solr/select?q=rat&facet.field=organism_term_s&wt=json" );
		String solrQueryStr = uri.toASCIIString();
		String terms= BasicUtils.restGet(solrQueryStr);
		JSONObject obj=new JSONObject(terms);
		JSONObject facetObj=new JSONObject(obj.get("facet_counts").toString());
		JSONObject orgObj= new JSONObject(facetObj.get("facet_fields").toString());
		JSONArray array=(JSONArray) orgObj.get("organism_term_s");
		Iterator i= array.iterator();
		List<Object> orgObjects= new ArrayList<>();
		List<String> organisms= new ArrayList<>();
		while (i.hasNext()){
			orgObjects.add(i.next());
		}
		for(Object org:orgObjects){
			if(!org.toString().matches(regex))
			organisms.add(org.toString());
		}
		model.addAttribute("organisms", organisms);
	return "getOrganisms";
	}*/
	@RequestMapping(value = "/getResult", method = RequestMethod.GET)
	public String getResult(
			@ModelAttribute("queryString") QueryString queryString, Model model) {

		String solrQString = "";
		String sortString = "";
		String messageLabel = ""; 
		String tmpStr = "";
		if (queryString.getqPMID()!=null && queryString.getqPMID().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("pmid",
					FieldType.NUMERIC_FIELD, queryString.getqPMID());
			solrQString += tmpStr;
			messageLabel += tmpStr;
		}

		if ( queryString.getqString()!=null && queryString.getqString().length() > 0){
			tmpStr = SolrQueryStringService.getQueryString("*",
					FieldType.TEXT_FIELD, queryString.getqString());
			solrQString += tmpStr;
			messageLabel += tmpStr;
		}
			

		if (queryString.getqAuthorStr()!=null && queryString.getqAuthorStr().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("authors",
					FieldType.TEXT_FIELD, queryString.getqAuthorStr());
			solrQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqTitleStr()!=null && queryString.getqTitleStr().length() > 0){
			tmpStr = SolrQueryStringService.getQueryString("title",
					FieldType.TEXT_FIELD, queryString.getqTitleStr());
			solrQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqAbstractStr()!=null && queryString.getqAbstractStr().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("abstract",
					FieldType.TEXT_FIELD, queryString.getqAbstractStr());
			solrQString += tmpStr;
			messageLabel += tmpStr;

		}

		if (  queryString.getqDateFrom()!=null && queryString.getqDateFrom().length() > 0
				||queryString.getqDateTo()!=null && queryString.getqDateTo().length() > 0)
		{
			tmpStr = SolrQueryStringService.getQueryString(
					"p_date",
					FieldType.DATE_FIELD,
					SolrQueryStringService.getDateRangeValue(
							queryString.getqDateFrom(),
							queryString.getqDateTo()));
			solrQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (solrQString.length() > 0) {
			solrQString += " ";
			messageLabel += "";
		}

		for (FieldQueryCondition fqc : queryString.getqFieldConditions()) {
			if (fqc.getFieldValue() != null && fqc.getFieldValue().length() > 0) {
				OntoTermIdStr termStr = new OntoTermIdStr(fqc.getFieldValue());
				if (termStr.getId() == null && !fqc.getFieldName().equals("mt_term") && !fqc.getFieldValue().equals("*")
						&& !fqc.getFieldName().equals("organism_term")) {
					// Try to guess a concept from the string using OntoSolr service
					String termCat = null;
					if (!fqc.getFieldName().equals("ontology")) {
						termCat = SolrQueryStringService.getTermCat(fqc.getFieldName());
						String fullTerm = guessConcept(fqc.getFieldValue(), termCat);
						if (fullTerm != null) {
							fqc.setFieldValue(fullTerm);
							termStr = new OntoTermIdStr(fqc.getFieldValue());
						}
					}else{
						Map<String, String> resultString=getSolrQueryString(fqc.getFieldValue());
						for(Map.Entry e:resultString.entrySet() ){
							if(e.getKey().equals("messageLabel")){
								messageLabel+= (String) e.getValue();
							}else{
								solrQString += (String) e.getValue();
							}
						}

						continue;
					}

				}
				
				if (fqc.getFieldName().equals("ontology")) {
					String fieldName = SolrQueryStringService.getIndexTermField(termStr.getCat());
					fqc.setFieldName(fieldName.equals("null_term") ? "*" : fieldName);
				}

				if (!fqc.getFieldValue().equals("*")){
				if (fqc.getFieldName().equals("rgd_gene_term")) {
					int iGeneRgdId =termStr.getId().intValue();
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"gene", getGeneQueryString(iGeneRgdId, " OR ", null, false, true));
					messageLabel +=	SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"gene", SolrQueryStringService.getHtmlValue(termStr.getTerm()));
				} else if (fqc.getFieldName().equals("mt_term")) {
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"mt_term", fqc.getFieldValue().replaceAll("\\s",""));
					messageLabel += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"Mutation", SolrQueryStringService.getHtmlValue(fqc.getFieldValue().replaceAll("\\s","")));
				} else if (fqc.getFieldName().equals("organism_term")) {
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"organism_term", fqc.getFieldValue()+"*"
									//.replaceAll("\\s","")
							);
					messageLabel += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"Organism", SolrQueryStringService.getHtmlValue(fqc.getFieldValue()
								//	.replaceAll("\\s","")
							));
				} else if (true || fqc.isIncludeSynonyms()) {

						/*
						 * extend to include all synonyms OntologyXDAO xdao =
						 * new OntologyXDAO(); try { solrQString += " (" +
						 * SolrQueryStringService.getQueryString("",
						 * fqc.isNotCondition(), fqc.getFieldName(),
						 * xdao.getTerm(fqc.getFieldValue()).getTerm());
						 * 
						 * List<TermSynonym> synonyms =
						 * xdao.getTermSynonyms(fqc.getFieldValue()); for
						 * (TermSynonym syn : synonyms) { solrQString +=
						 * SolrQueryStringService.getQueryString("OR",
						 * fqc.isNotCondition(), fqc.getFieldName(),
						 * syn.getName()); } solrQString += ")";
						 * 
						 * } catch (Exception e) { e.printStackTrace(); }
						 */
						messageLabel += SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								SolrQueryStringService.getOntoCatLabelMap().get(termStr.getCat()), SolrQueryStringService.getHtmlValue(termStr.getTerm()));

						// Try search for ont_id directly
						String idFieldName = SolrQueryStringService
								.getOntIDField(fqc.getFieldName());
						String qString = SolrQueryStringService.getQueryBooleans(fqc.getBooleanOpt(),
										fqc.isNotCondition()) + getTermQueryString(idFieldName, termStr, new StringBuilder(), " OR "); 
						solrQString += qString;
					} } else {

						messageLabel += SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								SolrQueryStringService.getOntoCatLabelMap().get(fqc.getFieldName()), "*");
						
						solrQString += SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								fqc.getFieldName().equals("rgd_gene_term") ? "gene" : fqc.getFieldName(), "*");
					}


				}
			
		}

		if (queryString.getqSortConditions().size() > 0) {
			for (FieldSortCondition fsc : queryString.getqSortConditions()) {
				if (fsc.getFieldName() != null && fsc.getSortingOrder() != null)
					sortString += (sortString.length() > 0 ? "," : "")
							+ fsc.getFieldName() + " " + fsc.getSortingOrder();
			}
//			solrQString = solrQString.trim() + "&sort=" + sortString;
		}
System.out.println(solrQString);

		model.addAttribute("q", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(solrQString.trim())));
		model.addAttribute("sort", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(sortString.trim())));
		model.addAttribute("message_label", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(messageLabel.replaceAll("^\\s*(OR|AND)\\s*",""))));

		return "getResult";
	}
	public Map<String, String> getSolrQueryString(String fieldValue){
		List<String> fullterms= guessConcept1(fieldValue, null);
		String messageLabel = new String();
		String solrQString= new String();
		Map<String, String> resultString=new HashMap<>();
		Map<String , OntoTermIdStr> catMap= new HashMap<>();
		if (fullterms != null) {
			for(String t: fullterms){
              	OntoTermIdStr termStr = new OntoTermIdStr(t);
				if(!t.equals(""))
				catMap.putIfAbsent(termStr.getCat(), termStr);
	        }

			for(Map.Entry e: catMap.entrySet()){
				FieldQueryCondition fqc= new FieldQueryCondition();
				OntoTermIdStr termStr= (OntoTermIdStr) e.getValue();
				String fieldName = SolrQueryStringService.getIndexTermField(termStr.getCat());
				fqc.setFieldName(fieldName.equals("null_term") ? "*" : fieldName);

				if (fqc.getFieldName().equals("rgd_gene_term")) {
					int iGeneRgdId =termStr.getId().intValue();
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"gene", getGeneQueryString(iGeneRgdId, " OR ", null, false, true));
					messageLabel +=	SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"gene", SolrQueryStringService.getHtmlValue(termStr.getTerm()));
				} else if (fqc.getFieldName().equals("mt_term")) {
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"mt_term", fqc.getFieldValue().replaceAll("\\s",""));
					messageLabel += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"Mutation", SolrQueryStringService.getHtmlValue(fqc.getFieldValue().replaceAll("\\s","")));
				} else if (fqc.getFieldName().equals("organism_term")) {
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"organism_term", fqc.getFieldValue().replaceAll("\\s",""));
					messageLabel += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"Organism", SolrQueryStringService.getHtmlValue(fqc.getFieldValue().replaceAll("\\s","")));
				}else {

					messageLabel += SolrQueryStringService.getQueryString(
							"OR", fqc.isNotCondition(),
							SolrQueryStringService.getOntoCatLabelMap().get(termStr.getCat()), SolrQueryStringService.getHtmlValue(termStr.getTerm()));

					// Try search for ont_id directly
					String idFieldName = SolrQueryStringService
							.getOntIDField(fqc.getFieldName());
					String qString = SolrQueryStringService.getQueryBooleans("OR",
							fqc.isNotCondition()) + getTermQueryString(idFieldName, termStr, new StringBuilder(), " OR ");
					solrQString += qString;
				}

			}

			resultString.put("messageLabel", messageLabel);
			resultString.put("solrQString", solrQString);
		}
		return resultString;

	}
	@RequestMapping(value = "/getReferenceURL", method = RequestMethod.GET)
	public String getReferenceURL(@RequestParam String pubmedId, HttpServletResponse response , HttpServletRequest request) throws Exception {
		PubMedReference pubRef= new PubMedReference();
		int refRgdId=pubRef.getReferenceRgdId(pubmedId);
		System.out.print("REF RGD ID: "+refRgdId);
		response.getWriter().print(refRgdId);
		return null;
}
	@RequestMapping(value = "/getResultForCuration", method = RequestMethod.GET)
	public String getResultForCuration(
			@ModelAttribute("curationQueryString") CurationQueryString queryString, Model model) {
		String defaultBoolConn = " OR ";
//		String solrQString = "((-organism_term_s:(*)) OR (organism_term_s:(\"Rattus sp.\"^3 OR \"Rattus norvegicus\"^3 OR \"Homo sapiens\"^2 OR \"Mus musculus\"^1))) AND ((-mt_term:(*)) OR (mt_term:(*))^200)";
		String solrQString = "((-organism_term_s:(*)) OR (organism_term_s:(\"Rattus sp.\"^3 OR \"Rattus norvegicus\"^3 OR \"Homo sapiens\"^2 OR \"Mus musculus\"^1)))";
		String messageLabel = "";
		StringBuilder termMessageLabel = new StringBuilder();
		String geneMessageLabel = new String();
		
		/*logger.info("omid0 ======================================");
		logger.info(queryString.toString());
		logger.info("======================================");*/
		
		String singleGeneQStr = "";
		String allGeneQStr = "";
		try {
			for (RgdIdCondition ric : queryString.getqRgdIds()) {
				
			/*	logger.info("omid1 ======================================");
				logger.info(ric.toString());
				logger.info(ric.getRgdId());
				logger.info("======================================");*/
				
				
				if (ric.getRgdId() != null && ric.getRgdId().length() > 0) {
					int iRgdId = Integer.parseInt(ric.getRgdId());
					singleGeneQStr += getGeneQueryString(iRgdId, defaultBoolConn, termMessageLabel, queryString.getqLooseMatch(), true);
					if (singleGeneQStr.length() > 0) {
						allGeneQStr += secondLevelBooleanConnect(allGeneQStr, "gene:(" + singleGeneQStr + ") OR text:(" + singleGeneQStr + ")");
						geneMessageLabel += secondLevelBooleanConnect(geneMessageLabel, "(" + termMessageLabel + ")");
						termMessageLabel = new StringBuilder();
						singleGeneQStr = "";
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	/*	logger.info("omid2 ======================================");
		logger.info(queryString.getqGeneCond());
		logger.info("======================================");*/
		
		if (queryString.getqGeneCond() != null && queryString.getqGeneCond().length() > 0) {
			allGeneQStr = "(" + allGeneQStr + ")" + topLevelBooleanConnect(allGeneQStr, "gene:(" + queryString.getqGeneCond() + ") AND text:(" + queryString.getqGeneCond() + ")");
			geneMessageLabel = "(" + geneMessageLabel + ")" + topLevelBooleanConnect(geneMessageLabel, "(" + queryString.getqGeneCond() + ")");
		}

		if (allGeneQStr.length()>0) {
			solrQString += topLevelBooleanConnect(solrQString, "(" + allGeneQStr + ")");
			messageLabel += topLevelBooleanConnect(messageLabel, "(" + geneMessageLabel + ")");
		}
		
		XdbIdDAO xdao = new XdbIdDAO();
		String refQString = "";
		try {
			int i = queryString.getqRefRgdIds().size();
			for (RefRgdIdCondition rric : queryString.getqRefRgdIds()) {
				List<XdbId> pmids = xdao.getXdbIdsByRgdId(2, Integer.parseInt(rric.getRefRgdId()));
				if (pmids.size() > 0) {
					if (refQString.length() > 0) refQString += defaultBoolConn;
					refQString += pmids.get(0).getAccId() + "^" + i;
					i--;
				}
			}
			if (refQString.length() > 0) solrQString += topLevelBooleanConnect(solrQString, "pmid:(" + refQString + ")");
		} catch (Exception e) {
			e.printStackTrace();
		};

		termMessageLabel = new StringBuilder();
		String allOntoQStr = "";
		for (OntoIdCondition oic : queryString.getqOntoIds()) {
			if (oic.getOntoId() != null && oic.getOntoId().length() > 0) {
				OntoTermIdStr termStr = new OntoTermIdStr(oic.getOntoId());
				// Try search for ont_id directly
				String idFieldName = SolrQueryStringService
					.getOntIdField(oic.getOntoId());
				String qString = getTermQueryString(idFieldName, termStr, termMessageLabel, defaultBoolConn); 
				allOntoQStr += secondLevelBooleanConnect(allOntoQStr, qString);
			}
		}

		if (queryString.getqCond() != null && queryString.getqCond().length() > 0) {
			allOntoQStr = "(" + allOntoQStr + ")" + topLevelBooleanConnect(allOntoQStr, "(" + queryString.getqCond() + ")");
			termMessageLabel = new StringBuilder("(" + termMessageLabel.toString() + ")" + topLevelBooleanConnect(termMessageLabel.toString(), "(" + queryString.getqCond() + ")"));
		}

		if (allOntoQStr.length() > 0) solrQString += topLevelBooleanConnect(solrQString, "(" + allOntoQStr + ")");

		if (termMessageLabel.length() > 0) messageLabel += topLevelBooleanConnect(messageLabel, "(" + termMessageLabel.toString() + ")");

		
//		solrQString += " OR (title:\"not\")^-50";
//		solrQString += " OR (title:\"not\") OR -(title:\"not\")";
		System.out.println("Curation query String:" + solrQString);
		model.addAttribute("q", solrQString.trim());
		model.addAttribute("curHost", queryString.getCurHost().trim());
		model.addAttribute("message_label", messageLabel.toString());
		model.addAttribute("userKey", queryString.getUserKey().trim());
		model.addAttribute("userId", queryString.getUserId().trim());
		model.addAttribute("userFullName", queryString.getUserFullName().trim());
		
		
//		model.addAttribute("sort", StringEscapeUtils
//				.escapeHtml4(SolrQueryStringService
//						.finalQueryString(sortString.trim())));
		return "getResultForCuration";
	}

	@RequestMapping(value = "/getRgdCuration", method = RequestMethod.GET)
	public String getRgdCuration(
			@ModelAttribute("curationQueryString") CurationQueryString queryString, Model model) {
		for (OntoIdCondition oic : queryString.getqOntoIds()) {
			if (oic.getOntoId() != null && oic.getOntoId().length() > 0) {
				OntoTermIdStr termStr = new OntoTermIdStr(oic.getOntoId());
				// Try search for ont_id directly
				String idFieldName = SolrQueryStringService
					.getOntIdField(oic.getOntoId());
			}
		}

		try {
			for (RefRgdIdCondition rric : queryString.getqRefRgdIds()) {
				String pmid = rric.getRefRgdId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		};
		
		
		
		

//		model.addAttribute("q", solrQString.trim());
//		model.addAttribute("curHost", queryString.getCurHost().trim());
//		model.addAttribute("message_label", messageLabel);
		
		
		return "getResultForCuration";
	}

	private String topLevelBooleanConnect(String leftExp, String rightExp) {
		if (leftExp.length() > 0) return " AND " + rightExp;
		return rightExp;
	}

	private String secondLevelBooleanConnect(String leftExp, String rightExp) {
		if (leftExp.length() > 0) return " OR " + rightExp;
		return rightExp;
	}

	private String getTermQueryString(String idFieldName, OntoTermIdStr termStr, StringBuilder termMessageLabel, String defaultBoolConn) {
		String qString = " " + idFieldName
				+ ":("
				+ SolrQueryStringService.getValueQueryString(
				FieldType.ONT_ID, termStr.getFullId());
		    StringBuilder textQueryStr = new StringBuilder();
		    textQueryStr.append(getTermTextQueryStr(termStr.getFullId(), defaultBoolConn));
			OntologyXDAO xdao = new OntologyXDAO();
			try {
				termStr.setTerm(xdao.getTermByAccId(termStr.getFullId()).getTerm());
				termMessageLabel.append((termMessageLabel.length()>0 ? defaultBoolConn : "") +
						termStr.getTerm());
				List<Term> childTerms = xdao.getAllActiveTermDescendants(
								termStr.getFullId());
				for (Term term : childTerms) {
					qString += defaultBoolConn
							+ SolrQueryStringService
									.getValueQueryString(
											FieldType.ONT_ID,
											term.getAccId());
				    textQueryStr.append(defaultBoolConn).append(getTermTextQueryStr(term.getAccId(), defaultBoolConn));
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			};
//			return "(" + textQueryStr.toString() + ")";
//			return "(" + qString + ") OR text:(" + textQueryStr.toString() + "))";
			return "(" + qString + "))";
	}
	
	private String getTermTextQueryStr(String termOntId, String defaultBoolConn) {

		try {
			StringBuilder textQueryStr = new StringBuilder();
			OntologyXDAO xdao = new OntologyXDAO();
			Term term = xdao.getTermByAccId(termOntId);

			textQueryStr.append("\"").append(term.getTerm().toLowerCase().replaceAll("[=',\"<>?!@#$%^&*()-./:;\\[\\]]", "").trim()).append("\"");
			textQueryStr.append(defaultBoolConn).append(
					term.getTerm().toLowerCase().replaceAll("[=',\"<>?!@#$%^&*()-./:;]", "").trim().replaceAll("\\s+", " OR "));
			
			List<TermSynonym> synonyms = xdao.getTermSynonyms(termOntId);
			for (TermSynonym synonym : synonyms) {
				textQueryStr.append(defaultBoolConn).append("\"").append(synonym.getName().toLowerCase().replaceAll("[',\"<>?!@#$%^&*()-=./:;\\[\\]]", "").trim()).append("\"");
//				textQueryStr.append(defaultBoolConn).append("(").append(
//						synonym.getName().toLowerCase().replaceAll("\\s", " AND ")).append(")");
				textQueryStr.append(defaultBoolConn).append(
						synonym.getName().toLowerCase().replaceAll("[=',\"<>?!@#$%^&*()-./:;\\[\\]]", "").trim().replaceAll("\\s+", " OR "));
			}
			return textQueryStr.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
	}
	
	private String getGeneQueryString(int iRgdId, String defaultBoolConn, StringBuilder termMessageLabel, boolean looseMatch, boolean includeOrtholog) {
		StringBuilder geneQString = new StringBuilder();
		GeneDAO gdao = new GeneDAO();
		OrthologDAO odao = new OrthologDAO();
		try {
			Gene gene = gdao.getGene(iRgdId);
			if (termMessageLabel != null) termMessageLabel.append((termMessageLabel.length()>0 ? defaultBoolConn : "") +
					gene.getSymbol());
			if (gene != null) {
				if (geneQString.length() > 0) geneQString.append(defaultBoolConn);
				geneQString.append(SolrQueryStringService.addSpeciesCondition(gene.getSpeciesTypeKey(), 
						getGeneQueryString(gene, defaultBoolConn, looseMatch)));
				if (includeOrtholog) {
					List<Ortholog> ortList = odao.getOrthologsForSourceRgdId(iRgdId);
					if (ortList.size() > 0) {
						for (Ortholog ort : ortList) {
							gene = gdao.getGene(ort.getDestRgdId());
							geneQString.append(defaultBoolConn + SolrQueryStringService.addSpeciesCondition(ort.getDestSpeciesTypeKey(),
									getGeneQueryString(gene, defaultBoolConn, looseMatch)));
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return geneQString.toString();
	}
	
	private String getGeneQueryString(Gene gene, String defaultBoolean, boolean looseMatch) {
		try {
			int iRgdId = gene.getRgdId();
			String geneQString = "";
			AliasDAO adao = new AliasDAO();

			geneQString += 
					(looseMatch ? "(":"\"") +
					SolrQueryStringService.getValueQueryString(
							FieldType.TEXT_FIELD, gene.getName().replaceAll("[=',\"<>?!@#$%^&*()-./:;\\[\\]]", " ").trim())
					+ (looseMatch ? ")^15":"\"^5");
			if (gene.getSymbol().length()>2) {
				geneQString += defaultBoolean
						+ (looseMatch ? "(":"\"")
						+ SolrQueryStringService.getValueQueryString(
								FieldType.TEXT_FIELD, gene.getSymbol().replaceAll("[=',\"<>?!@#$%^&*()-./:;\\[\\]]", " ").trim()) 
								+ (looseMatch ? ")^15":"\"^5");
				}
					
			List<Alias> aliases = adao.getAliases(iRgdId, "old_gene_name");
			aliases.addAll(adao.getAliases(iRgdId, "old_gene_symbol"));
			if (aliases.size() > 0) {
				for (Alias alias : aliases) {
					if (alias.getValue() != null && alias.getValue().length()>2 
							&& !alias.getValue().startsWith("OTTHUM")
							&& !alias.getValue().startsWith("OTTMUS")) {
						geneQString += defaultBoolean
								+ (looseMatch ? "(":"\"")
								+ SolrQueryStringService.getValueQueryString(
										FieldType.TEXT_FIELD, alias.getValue().replaceAll("[=',\"<>?!@#$%^&*()-./:;\\[\\]]", " ").trim())
								+ (looseMatch ? ")":"\"")
								;
					}
				}
			}

			return geneQString;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	private String guessConcept(String termStr, String termCat) {
		
		String termStrBoolean = termStr.replaceAll(" ", " AND ");
		
		try {
			URI uri = new URI("http","localhost:8080", "/OntoSolr/select", "q=cat:(RDO RGD_GENE) OR term_str:(\""
		+termStr+"\")^50 OR synonym_str:(\"" + termStr + "\")^45 OR ("
					+ termStrBoolean + ")&defType=edismax&rows=1&qf=term_en^5+term_str^3+term^3+synonym_en^4.5++synonym_str^2+synonym^2+def^1"+
					(termCat == null ? "":"&fq=cat:"+termCat) + "&wt=velocity&bf=term_len_l^.001&v.template=termmatch&cacheLength=0", null);
			String ontoSolrQueryStr = uri.toASCIIString(); 

			String fullTerm = BasicUtils.restGet(ontoSolrQueryStr);

			return fullTerm;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private List<String> guessConcept1(String termStr, String termCat) {
		System.out.println("**************HOST NAME: "+ "localhost:8080");
		String termStrBoolean = termStr.replaceAll(" ", " AND ");
		List<String> fullterms= new ArrayList<>();
		try {
			URI uri = new URI("http","localhost:8080", "/OntoSolr/select", "q=cat:(RDO RGD_GENE) OR term_str:(\""
					+termStr+"\")^50 OR synonym_str:(\"" + termStr + "\")^45 OR ("
					+ termStrBoolean + ")&defType=edismax&qf=term_en^5+term_str^3+term^3+synonym_en^4.5++synonym_str^2+synonym^2+def^1"+
					(termCat == null ? "":"&fq=cat:"+termCat) + "&wt=velocity&bf=term_len_l^.001&v.template=termmatch&cacheLength=0", null);
			String ontoSolrQueryStr = uri.toASCIIString();

			List<String> fullTerms = BasicUtils.restGet1(ontoSolrQueryStr, null);

			return fullTerms;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/defineTerm", method = RequestMethod.GET)
	public String defineTerm(@ModelAttribute("solrQueryCondition") SolrQueryCondition qs, Model model) {
		String termStr = qs.getQ().toLowerCase().replaceAll("(associated|association| with|/| and | or |,)", " ").trim();
		String termStrBoolean = termStr.replaceAll(" +", " AND ");
		String termCat = null;

		try {
//			URI uri = new URI("http","fox.hmgc.mcw.edu", "/OntoSolr/select", "q=cat:(RDO^5 OR UMLS^4 OR HP^3 OR MP^2) AND (term_str:(\""
//		+termStr+"\")^50 OR synonym_str:(\"" + termStr + "\")^45 OR term_en:("
//					+ termStrBoolean + ")^20 OR synonym_en:(" + termStrBoolean + ") OR term_en:(" + termStr + ") ) AND def:(*)&defType=edismax&rows=1&qf=term_en^5+term_str^3+term^3+synonym_en^4.5++synonym_str^2+synonym^2+def^1"+
//					(termCat == null ? "":"&fq=cat:"+termCat) + "&wt=csv&fl=def&csv.header=false&csv.separator=|", null);
			URI uri = new URI("http","localhost:8080", "/OntoSolr/select", "q=(cat:(RDO^20 OR UMLS^15 OR HP^10 OR MP^2) AND (term_str:(\""
		+termStr+"\")^50 OR synonym_str:(\"" + termStr + "\")^45 OR term_en:("
					+ termStrBoolean + ")^20 OR synonym_en:(" + termStrBoolean + ") OR term_en:(" + termStr + ")  OR synonym_en:(" + termStr + ") ))&defType=edismax&rows=10&qf=term_en^30+term_str^50+term^30+synonym_en^4.5+synonym_str^2+synonym^2+def^1"+
					(termCat == null ? "":"&fq=cat:"+termCat) + "&wt=velocity&qf=&v.template=termdef&mm=75%", null);
			String ontoSolrQueryStr = uri.toASCIIString(); 

			String fullTerm = BasicUtils.restGet(ontoSolrQueryStr);

			model.addAttribute("message", fullTerm.trim());
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "");
		}
		return "SimpleMessage";
	}

	@RequestMapping(value = "/getCuratable", method = RequestMethod.GET)
	public String getCuratable(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		String curatable = PubMedDbService.getCuratableFromHbase(curCond);
		model.addAttribute("message", curatable);
		
		return "SimpleMessage";
	}

	@RequestMapping(value = "/setCuratable", method = RequestMethod.GET)
	public String setCuratable(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		String curatable = PubMedDbService.setCuratableToHbase(curCond.getPmId(), curCond.getCuratable());
		model.addAttribute("message", curatable);
		return "SimpleMessage";
	}

	@RequestMapping(value = "/addTermToBasket", method = RequestMethod.GET)
	public String addTermToBasket(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		return "SimpleMessage";
	}

	@RequestMapping(value = "/addPmidToBasket", method = RequestMethod.GET)
	public String addPmidToBasket(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setCuratedToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/setAbstractVisited", method = RequestMethod.GET)
	public String setAbstractVisited(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setVisitedToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/getAbstractVisited", method = RequestMethod.GET)
	public String getAbstractVisited(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		model.addAttribute("message", PubMedDbService.getVisitedFromHbase(curCond));
		return "SimpleMessage";
	}

	@RequestMapping(value = "/openPubmed", method = RequestMethod.GET)
	public String setOpenPubmed(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setOpenPubmedToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/openFullText", method = RequestMethod.GET)
	public String setOpenFullText(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setOpenFullTextToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/bulkGeneQuery", method = RequestMethod.POST)
	public String getBulkGeneQuery(@ModelAttribute("bulkGeneString") BulkGeneString genes, Model model) {
		String defaultBoolConn = " OR ";
		String[] rgdIds = RgdTermSearchService.getGeneRgdIds(genes.getqString());
		String solrQString = "";
		String messageLabel = "";
		StringBuilder termMessageLabel = new StringBuilder();
		String geneMessageLabel = new String();
		
		String singleGeneQStr = "";
		String allGeneQStr = "";
		try {
			for (String ric : rgdIds) {
				if (ric != null && ric.length() > 0) {
					int iRgdId = Integer.parseInt(ric);
					singleGeneQStr += getGeneQueryString(iRgdId, defaultBoolConn, termMessageLabel, false, false);
					if (singleGeneQStr.length() > 0) {
						allGeneQStr += secondLevelBooleanConnect(allGeneQStr, "gene:(" + singleGeneQStr + ") OR text:(" + singleGeneQStr + ")");
						geneMessageLabel += secondLevelBooleanConnect(geneMessageLabel, "(" + termMessageLabel + ")");
						termMessageLabel = new StringBuilder();
						singleGeneQStr = "";
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		solrQString += topLevelBooleanConnect(solrQString, "(" + allGeneQStr + ")");
		messageLabel += topLevelBooleanConnect(messageLabel, "(" + geneMessageLabel + ")");
		

		model.addAttribute("q", solrQString.trim());
		model.addAttribute("message_label", messageLabel.toString());
		return "getBulkGeneResult";
	} 

	@RequestMapping(value = "/geneticsGeneQuery", method = RequestMethod.GET)
	public String geneticsGeneQuery(@ModelAttribute("bulkGeneString") BulkGeneString genes, Model model) {
		List<String> rgdIds = new ArrayList<String>();
		for (String rgdId : RgdTermSearchService.getGeneRgdIds(genes.getqString(), true)) {
			if (rgdId != null && rgdId.trim().length() > 0) rgdIds.add(rgdId);
		}
		return getSkygenResult(rgdIds, (rgdIds.size() == 0 ? 
				Arrays.asList(genes.getqString().replace(",", " ").
				split(" ")) : null), new ArrayList<String>(), model);
	} 

	@RequestMapping(value = "/bulkGene", method = RequestMethod.GET)
	public String bulkGene(Locale locale, Model model) {
		return "bulkGeneForm";
	}
	
	
	@RequestMapping(value = "/geneticsHome", method = RequestMethod.GET)
	public String geneticsHome(Locale locale, Model model) {
		return "genetics_home";
	}
	
	@RequestMapping(value = "/getGeneticsResult", method = RequestMethod.GET)
	public String getGeneticsResult(
			@ModelAttribute("queryString") QueryString queryString, Model model) {
		String solrQString = "";
		String hlQString = "";
		String sortString = "";
		String messageLabel = ""; 
		String tmpStr = "";
		if (queryString.getqPMID().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("pmid",
					FieldType.NUMERIC_FIELD, queryString.getqPMID());
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqString().length() > 0){
			tmpStr = SolrQueryStringService.getQueryString("*",
					FieldType.TEXT_FIELD, queryString.getqString());
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}
			

		if (queryString.getqAuthorStr().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("authors",
					FieldType.TEXT_FIELD, queryString.getqAuthorStr());
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqTitleStr().length() > 0){
			tmpStr = SolrQueryStringService.getQueryString("title",
					FieldType.TEXT_FIELD, queryString.getqTitleStr());
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqAbstractStr().length() > 0) {
			tmpStr = SolrQueryStringService.getQueryString("abstract",
					FieldType.TEXT_FIELD, queryString.getqAbstractStr());
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (queryString.getqDateFrom().length() > 0
				|| queryString.getqDateTo().length() > 0)
		{
			tmpStr = SolrQueryStringService.getQueryString(
					"p_date",
					FieldType.DATE_FIELD,
					SolrQueryStringService.getDateRangeValue(
							queryString.getqDateFrom(),
							queryString.getqDateTo()));
			solrQString += tmpStr;
			hlQString += tmpStr;
			messageLabel += tmpStr;
		}

		if (solrQString.length() > 0) {
			solrQString += " ";
			messageLabel += "";
			hlQString += " ";
		}

		for (FieldQueryCondition fqc : queryString.getqFieldConditions()) {
			if (fqc.getFieldValue() != null && fqc.getFieldValue().length() > 0) {
				OntoTermIdStr termStr = new OntoTermIdStr(fqc.getFieldValue());
				if (termStr.getId() == null && !fqc.getFieldName().equals("mt_term") && !fqc.getFieldValue().equals("*")) {
					// Try to guess a concept from the string using OntoSolr service
					String termCat = null;
					if (!fqc.getFieldName().equals("ontology")) {
						termCat = SolrQueryStringService.getTermCat(fqc.getFieldName());
					}
					String fullTerm = guessConcept(fqc.getFieldValue(), termCat);
					if (fullTerm != null) {
						fqc.setFieldValue(fullTerm);
						termStr = new OntoTermIdStr(fqc.getFieldValue());
					}
				}
				
				if (fqc.getFieldName().equals("ontology")) {
					String fieldName = SolrQueryStringService.getIndexTermField(termStr.getCat());
					fqc.setFieldName(fieldName.equals("null_term") ? "*" : fieldName);
				}

				if (!fqc.getFieldValue().equals("*")) {
					
				if (fqc.getFieldName().equals("rgd_gene_term")) {
					int iGeneRgdId =termStr.getId().intValue();
					String mendelian_disease_ids = "*";
					try {
						URI uri = new URI("http","localhost:8080", "/OntoSolr/select", "q=mendelian+OR+inheritance+OR+familial+OR+genetic+OR+ancestral+OR+patrimonial+OR+familial&fq=cat:\"RDO\"&fl=id&wt=velocity&v.template=idstring&rows=1000000", null);
						String ontoSolrStr = uri.toASCIIString(); 
						mendelian_disease_ids = BasicUtils.restGet(ontoSolrStr, null);
					} catch (Exception e) {
						System.err.println("Exception in getting mendelian disease terms!");
						e.printStackTrace();
					}

					String basicGeneStr = getGeneQueryString(iGeneRgdId, " OR ", null, false, false);
					String geneStr = SolrQueryStringService.getQueryString(
							"", fqc.isNotCondition(),
							"GENE", basicGeneStr);
//					String keywordsGeneStr = SolrQueryStringService.getQueryString(
//							"", fqc.isNotCondition(),
//							"keywords", basicGeneStr);
//					String chemicalsGeneStr = SolrQueryStringService.getQueryString(
//							"", fqc.isNotCondition(),
//							"chemicals", basicGeneStr);
//					geneStr = "(" + geneStr + " OR " + keywordsGeneStr + " OR " + chemicalsGeneStr + ")";
					solrQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(), "-", "(((-organism_term_s:(*)) OR (organism_term_s:(\"Homo sapiens\"))) AND (rdo_id:("+mendelian_disease_ids+")^20000 OR rdo_id:(*)^10000 OR "+geneStr+") AND "+geneStr+")");
					messageLabel +=	SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"GENE", SolrQueryStringService.getHtmlValue(termStr.getTerm()));
					String hlqGeneStr = SolrQueryStringService.getQueryString(
							"", fqc.isNotCondition(),
							"Gene", basicGeneStr);
//					hlqGeneStr = "(" + hlqGeneStr + " OR " + keywordsGeneStr + " OR " + chemicalsGeneStr + ")";
					hlQString += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(), "-", "(rdo_id:("+mendelian_disease_ids+") OR "+hlqGeneStr+")");
				} else if (fqc.getFieldName().equals("mt_term")) {
					tmpStr = SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"mt_term", fqc.getFieldValue().replaceAll("\\s",""));
					solrQString += tmpStr;
					hlQString += tmpStr;
					messageLabel += SolrQueryStringService.getQueryString(
							fqc.getBooleanOpt(), fqc.isNotCondition(),
							"Mutation", SolrQueryStringService.getHtmlValue(fqc.getFieldValue().replaceAll("\\s","")));
				} else if (true || fqc.isIncludeSynonyms()) {

						/*
						 * extend to include all synonyms OntologyXDAO xdao =
						 * new OntologyXDAO(); try { solrQString += " (" +
						 * SolrQueryStringService.getQueryString("",
						 * fqc.isNotCondition(), fqc.getFieldName(),
						 * xdao.getTerm(fqc.getFieldValue()).getTerm());
						 * 
						 * List<TermSynonym> synonyms =
						 * xdao.getTermSynonyms(fqc.getFieldValue()); for
						 * (TermSynonym syn : synonyms) { solrQString +=
						 * SolrQueryStringService.getQueryString("OR",
						 * fqc.isNotCondition(), fqc.getFieldName(),
						 * syn.getName()); } solrQString += ")";
						 * 
						 * } catch (Exception e) { e.printStackTrace(); }
						 */
						messageLabel += SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								SolrQueryStringService.getOntoCatLabelMap().get(termStr.getCat()), SolrQueryStringService.getHtmlValue(termStr.getTerm()));

						// Try search for ont_id directly
						String idFieldName = SolrQueryStringService
								.getOntIDField(fqc.getFieldName());
						String qString = SolrQueryStringService.getQueryBooleans(fqc.getBooleanOpt(),
										fqc.isNotCondition()) + getTermQueryString(idFieldName, termStr, new StringBuilder(), " OR "); 
						solrQString += qString;
						hlQString += qString;
					} } else {
						messageLabel += SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								SolrQueryStringService.getOntoCatLabelMap().get(fqc.getFieldName()), "*");
						tmpStr = SolrQueryStringService.getQueryString(
								fqc.getBooleanOpt(), fqc.isNotCondition(),
								fqc.getFieldName().equals("rgd_gene_term") ? "gene" : fqc.getFieldName(), "*");
						solrQString += tmpStr;
						hlQString += tmpStr;
					}

				}
			
		}

		if (queryString.getqSortConditions().size() > 0) {
			for (FieldSortCondition fsc : queryString.getqSortConditions()) {
				if (fsc.getFieldName() != null && fsc.getSortingOrder() != null)
					sortString += (sortString.length() > 0 ? "," : "")
							+ fsc.getFieldName() + " " + fsc.getSortingOrder();
			}
//			solrQString = solrQString.trim() + "&sort=" + sortString;
		}

		model.addAttribute("q", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(solrQString.trim())));
		model.addAttribute("hlq", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(hlQString.trim())));
		model.addAttribute("sort", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(sortString.trim())));
		model.addAttribute("message_label", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(messageLabel.replaceAll("^\\s*(OR|AND)\\s*",""))));

		return "getGeneticsResult";
	}

	@RequestMapping(value = "/getSkygenResult", method = RequestMethod.POST)
	public String getSkygenResult(
			@ModelAttribute("curationQueryString") CurationQueryString queryString, Model model) {
		List<String> rgdIds = new ArrayList<String>();
		for (RgdIdCondition ric : queryString.getqRgdIds()) {
			if (ric.getRgdId() != null && ric.getRgdId().length() > 0) {
				rgdIds.add(ric.getRgdId());
			}
		}
		List<String> termAccs = new ArrayList<String>();
		for (OntoIdCondition oic : queryString.getqOntoIds()) {
			if (oic.getOntoId() != null && oic.getOntoId().length() > 0) {
				termAccs.add(oic.getOntoId());
			}
		}
		
		return getSkygenResult(rgdIds, null, termAccs, model);
	}
	
	public String getSkygenResult(List<String> rgdIds, List<String> geneTexts, List<String> termAccs, Model model) {
		String defaultBoolConn = " OR ";
//		String solrQString = "((-organism_term_s:(*)) OR (organism_term_s:(\"Rattus sp.\"^3 OR \"Rattus norvegicus\"^3 OR \"Homo sapiens\"^2 OR \"Mus musculus\"^1))) AND ((-mt_term:(*)) OR (mt_term:(*))^200)";
		String solrQString = "";
		String messageLabel = "";
		StringBuilder termMessageLabel = new StringBuilder();
		String geneMessageLabel = new String();
		
		String singleGeneQStr = "";
		String allGeneQStr = "";
		String hlQString = "";
		String mendelian_disease_ids = "*";
		try {
			URI uri = new URI("http","localhost:8080", "/OntoSolr/select", "q=mendelian+OR+inheritance+OR+familial+OR+genetic+OR+ancestral+OR+patrimonial+OR+familial&fq=cat:\"RDO\"&fl=id&wt=velocity&v.template=idstring&rows=1000000", null);
			String ontoSolrStr = uri.toASCIIString(); 
			mendelian_disease_ids = BasicUtils.restGet(ontoSolrStr, null);
		} catch (Exception e) {
			System.err.println("Exception in getting mendelian disease terms!");
			e.printStackTrace();
		}

		try {
			for (String ric : rgdIds) {
					int iRgdId = Integer.parseInt(ric);
					singleGeneQStr += getGeneQueryString(iRgdId, defaultBoolConn, termMessageLabel, false, true);
					if (singleGeneQStr.length() > 0) {
						allGeneQStr += secondLevelBooleanConnect(allGeneQStr, "gene:(" + singleGeneQStr + ") OR text:(" + singleGeneQStr + ")");
						geneMessageLabel += secondLevelBooleanConnect(geneMessageLabel, "(" + termMessageLabel + ")");
						termMessageLabel = new StringBuilder();
						singleGeneQStr = "";
					}
			}
			
			if (geneTexts != null) {
				for (String geneText : geneTexts) {
					allGeneQStr += secondLevelBooleanConnect(allGeneQStr, "gene:(" + geneText + ") OR text:(" + geneText + ")");
					geneMessageLabel += secondLevelBooleanConnect(geneMessageLabel, "(gene:(" + geneText + "))");
					termMessageLabel = new StringBuilder();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (allGeneQStr.length()>0) {
			String geneStr = SolrQueryStringService.getQueryString(
					"", false,
					"GENE", allGeneQStr);

			String hlqGeneStr = SolrQueryStringService.getQueryString(
					"", false,
					"Gene", allGeneQStr);

			solrQString += SolrQueryStringService.getQueryString(
					"", false, "-", "(((-organism_term_s:(*)) OR (organism_term_s:(\"Homo sapiens\"))) AND (rdo_id:("+mendelian_disease_ids+")^20000 OR rdo_id:(*)^10000 OR "+geneStr+") AND "+geneStr+")");

			hlQString += SolrQueryStringService.getQueryString(
					"", false, "-", "(rdo_id:("+mendelian_disease_ids+") OR "+hlqGeneStr+")");

//			solrQString += topLevelBooleanConnect(solrQString, "(" + allGeneQStr + ")");
			messageLabel += topLevelBooleanConnect(messageLabel, "(" + geneMessageLabel + ")");
		}
		
		termMessageLabel = new StringBuilder();
		String allOntoQStr = "";
		for (String oic : termAccs) {
				OntoTermIdStr termStr = new OntoTermIdStr(oic);
				// Try search for ont_id directly
				String idFieldName = SolrQueryStringService
					.getOntIdField(oic);
				String qString = getTermQueryString(idFieldName, termStr, termMessageLabel, defaultBoolConn); 
				allOntoQStr += secondLevelBooleanConnect(allOntoQStr, qString);
		}

//		if (queryString.getqCond().length() > 0) {
//			allOntoQStr = "(" + allOntoQStr + ")" + topLevelBooleanConnect(allOntoQStr, "(" + queryString.getqCond() + ")");
//			termMessageLabel = new StringBuilder("(" + termMessageLabel.toString() + ")" + topLevelBooleanConnect(termMessageLabel.toString(), "(" + queryString.getqCond() + ")"));
//		}

		if (allOntoQStr.length() > 0) {
			solrQString += topLevelBooleanConnect(solrQString, "(" + allOntoQStr + ")");
			hlQString += topLevelBooleanConnect(solrQString, "(" + allOntoQStr + ")");
		}

		if (termMessageLabel.length() > 0) messageLabel += topLevelBooleanConnect(messageLabel, "(" + termMessageLabel.toString() + ")");

		
		model.addAttribute("hlq", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(hlQString.trim())));
		model.addAttribute("q", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(solrQString.trim())));
		
		model.addAttribute("message_label", StringEscapeUtils
				.escapeHtml4(SolrQueryStringService
						.finalQueryString(messageLabel.replaceAll("^\\s*(OR|AND)\\s*",""))));
		
//		model.addAttribute("sort", StringEscapeUtils
//				.escapeHtml4(SolrQueryStringService
//						.finalQueryString(sortString.trim())));
		return "getSkygenResult";
	}

	@RequestMapping(value = "/setSkynetAbstractVisited", method = RequestMethod.GET)
	public String setSkynetAbstractVisited(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setSkynetVisitedToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/skynetOpenPubmed", method = RequestMethod.GET)
	public String setSkynetOpenPubmed(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setSkynetOpenPubmedToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/skynetOpenFullText", method = RequestMethod.GET)
	public String setSkynetOpenFullText(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		PubMedDbService.setSkynetOpenFullTextToHbase(curCond);
		model.addAttribute("message", curCond.getPmId());
		return "SimpleMessage";
	}

	@RequestMapping(value = "/getSkynetCuratable", method = RequestMethod.GET)
	public String getSkynetCuratable(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		String curatable = PubMedDbService.getSkynetCuratableFromHbase(curCond);
		model.addAttribute("message", curatable);
		
		return "SimpleMessage";
	}

	@RequestMapping(value = "/setSkynetCuratable", method = RequestMethod.GET)
	public String setSkynetCuratable(@ModelAttribute("CuratableCondition") CuratableCondition curCond, Model model) {
		String curatable = PubMedDbService.setSkynetCuratableToHbase(curCond.getPmId(), curCond.getCuratable());
		model.addAttribute("message", curatable);
		return "SimpleMessage";
	}
public static void main(String[] args){
	QueryFormController ctrl= new QueryFormController();
	ctrl.getSolrQueryString("hypertension");
	System.out.println("DONE!!!!");
}
}
