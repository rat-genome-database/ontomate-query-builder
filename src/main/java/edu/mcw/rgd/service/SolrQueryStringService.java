package edu.mcw.rgd.service;

import java.util.HashMap;

public class SolrQueryStringService {

	public enum FieldType {
		TEXT_FIELD, DATE_FIELD, ONT_FIELD, NUMERIC_FIELD, ONT_ID
	};

	public static HashMap<String, String> SolrTermIDMap = null;
	public static HashMap<String, String> SolrOntoIndexMap = null;
	public static HashMap<String, String> OntoCatLabelMap = null;

	private static String ADDITIONAL_GENE_COND = "(text:(gene OR protein OR locus OR mutation OR variant OR splice OR insertion OR deletion OR SNP) AND ";

	public static HashMap<String, String> getOntoCatLabelMap() {
		if (OntoCatLabelMap == null) {
			OntoCatLabelMap = new HashMap<String, String>();
			OntoCatLabelMap.put("RDO", "Disease");
			OntoCatLabelMap.put("RS", "Rat_Strain");
			OntoCatLabelMap.put("XDB", "xdb_id");
			OntoCatLabelMap.put("rgd_obj_term", "rgd_obj_id");
			OntoCatLabelMap.put("organism_term", "organism_ncbi_id");
			OntoCatLabelMap.put("SO", "Sequence_Ontology");
			OntoCatLabelMap.put("GO", "GO_Term");
			OntoCatLabelMap.put("PW", "Pathway_Ontology");
			OntoCatLabelMap.put("MA", "Mouse_Anatomy");
			OntoCatLabelMap.put("CL", "Clinical_Measurement");
			OntoCatLabelMap.put("CC", "Cellular_Component");
			OntoCatLabelMap.put("MF", "Mollecular_Function");
			OntoCatLabelMap.put("BP", "Biological_Process");
			OntoCatLabelMap.put("MP", "Mammalian_Phenotype");
			OntoCatLabelMap.put("CMO", "Clinical_Measurement");
			OntoCatLabelMap.put("MMO", "Measurement_Method");
			OntoCatLabelMap.put("XCO", "Experimental_Condition");
			OntoCatLabelMap.put("HP", "Human_Phenotype");
			OntoCatLabelMap.put("XP", "Human_Phenotype");
			OntoCatLabelMap.put("nbo_term", "nbo_id");
			OntoCatLabelMap.put("CHEBI", "Chemical_Element");
			OntoCatLabelMap.put("RGD_GENE", "Gene");
			OntoCatLabelMap.put("rdo_term", "Disease");
			OntoCatLabelMap.put("rs_term", "Rat_Strain");
			OntoCatLabelMap.put("xdb_term", "xdb_id");
			OntoCatLabelMap.put("rgd_obj_term", "rgd_obj_id");
			OntoCatLabelMap.put("organism_term", "organism_ncbi_id");
			OntoCatLabelMap.put("so_term", "Sequence_Ontology");
			OntoCatLabelMap.put("go_term", "GO_Term");
			OntoCatLabelMap.put("pw_term", "Pathway_Ontology");
			OntoCatLabelMap.put("ma_term", "Mouse_Anatomy");
			OntoCatLabelMap.put("cl_term", "Clinical_Measurement");
			OntoCatLabelMap.put("cc_term", "Cellular_Component");
			OntoCatLabelMap.put("mf_term", "Mollecular_Function");
			OntoCatLabelMap.put("bp_term", "Biological_Process");
			OntoCatLabelMap.put("hp_term", "Human_Phenotype");
			OntoCatLabelMap.put("mp_term", "Mammalian_Phenotype");
			OntoCatLabelMap.put("cmo_term", "Clinical_Measurement");
			OntoCatLabelMap.put("mmo_term", "Measurement_Method");
			OntoCatLabelMap.put("xco_term", "Experimental_Condition");
			OntoCatLabelMap.put("nbo_term", "nbo_id");
			OntoCatLabelMap.put("chebi_term", "Chemical_Element");
			OntoCatLabelMap.put("rgd_gene_term", "Gene");
			
			OntoCatLabelMap.put("ZFA", "Zebrafish");
			OntoCatLabelMap.put("zfa_term", "Zebrafish");

		}
		return OntoCatLabelMap;
	}

	public static HashMap<String, String> getTermIDMap() {
		if (SolrTermIDMap == null) {
			SolrTermIDMap = new HashMap<String, String>();
			SolrTermIDMap.put("rdo_term", "rdo_id");
			SolrTermIDMap.put("rs_term", "rs_id");
			SolrTermIDMap.put("xdb_term", "xdb_id");
			SolrTermIDMap.put("rgd_obj_term", "rgd_obj_id");
			SolrTermIDMap.put("organism_term", "organism_ncbi_id");
			SolrTermIDMap.put("so_term", "so_id");
			SolrTermIDMap.put("go_term", "go_id");
			SolrTermIDMap.put("pw_term", "pw_id");
			SolrTermIDMap.put("ma_term", "ma_id");
			SolrTermIDMap.put("cl_term", "cl_id");
			SolrTermIDMap.put("cc_term", "cc_id");
			SolrTermIDMap.put("mf_term", "mf_id");
			SolrTermIDMap.put("bp_term", "bp_id");
			SolrTermIDMap.put("hp_term", "hp_id");
			SolrTermIDMap.put("mp_term", "mp_id");
			SolrTermIDMap.put("cmo_term", "cmo_id");
			SolrTermIDMap.put("mmo_term", "mmo_id");
			SolrTermIDMap.put("xco_term", "xco_id");
			SolrTermIDMap.put("nbo_term", "nbo_id");
			SolrTermIDMap.put("chebi_term", "chebi_id");
			SolrTermIDMap.put("rgd_gene_term", "rgd_gene_id");
			
			SolrTermIDMap.put("zfa_term", "zfa_id");
		}
		return SolrTermIDMap;
	}

	public static HashMap<String, String> getOntoIndexMap() {
		if (SolrOntoIndexMap == null) {
			SolrOntoIndexMap = new HashMap<String, String>();
			SolrOntoIndexMap.put("RDO", "rdo");
			SolrOntoIndexMap.put("RS", "rs");
			SolrOntoIndexMap.put("SO", "so");
			SolrOntoIndexMap.put("PW", "pw");
			SolrOntoIndexMap.put("MA", "ma");
			SolrOntoIndexMap.put("CL", "cl");
			SolrOntoIndexMap.put("GO", "go");
			SolrOntoIndexMap.put("HP", "hp");
			SolrOntoIndexMap.put("XP", "hp");
			SolrOntoIndexMap.put("MP", "mp");
			SolrOntoIndexMap.put("CMO", "cmo");
			SolrOntoIndexMap.put("CMO", "cmo");
			SolrOntoIndexMap.put("MMO", "mmo");
			SolrOntoIndexMap.put("XCO", "xco");
			SolrOntoIndexMap.put("NBO", "nbo");
			SolrOntoIndexMap.put("CHEBI", "chebi");
			SolrOntoIndexMap.put("RGD_GENE", "rgd_gene");
			
			SolrOntoIndexMap.put("ZFA", "zfa");
		}
		return SolrOntoIndexMap;
	}

	public static String getIndexTermField(String ontCat) {
		return getOntoIndexMap().get(ontCat)+"_term";
	}
	
	public static String getIndexIdField(String ontCat) {
		return getOntoIndexMap().get(ontCat)+"_id";
	}
	
	public static String getTermCat(String fieldName){
		return fieldName.substring(0, fieldName.length()-5).toUpperCase();
	}
	
	public static String getOntIDField(String ontTermField) {
		return getTermIDMap().get(ontTermField);
	}
	
	public static String getOntIdField(String ontId) {
		String cat=ontId.substring(0, ontId.indexOf(':'));
		String ontCat= new String();
		if(cat.equals("DOID")){
			ontCat="RDO";
		}else{
			ontCat=cat;
	}
		return getIndexIdField(ontCat);
	}

	public static String getQueryString(String fieldName, FieldType fieldType,
			String fieldValue) {
		String queryString;
		
		if (fieldName==null) fieldName=" ";
		
		if (fieldName.equals("GENE")) {
			fieldName = "gene";
			queryString = " " +  (fieldName.equals("*") ? "(" : (fieldName + ":("))
					+ getValueQueryString(fieldType, fieldValue) + ")";
		//	queryString = ADDITIONAL_GENE_COND + queryString + ")";
		} else if (fieldName.equals("Gene")) {
			fieldName = "gene";
			queryString = " " +  (fieldName.equals("*") ? "(" : (fieldName + ":("))
					+ getValueQueryString(fieldType, fieldValue) + ")";
			queryString = "(" + queryString + ")";
		} else if (fieldName.equals("-")) {
			queryString = " (" + fieldValue + ")";
		} else
		{
			queryString = " " +  (fieldName.equals("*") ? "(" : (fieldName + ":("))
					+ getValueQueryString(fieldType, fieldValue) + ")";
			if (fieldName.equals("gene")) {
				queryString = "(" + queryString + "^10 OR text:("
						+ getValueQueryString(fieldType, fieldValue) + "))";
		//		queryString = ADDITIONAL_GENE_COND + queryString + ")";
			} 
		}
		return queryString;
	}

	public static String getValueQueryString(FieldType fieldType,
			String fieldValue) {
		if (fieldValue == null || fieldValue.equals("*"))
			return "*";
		fieldValue = fieldValue.trim();
		String queryString = fieldValue;
		switch (fieldType) {
		case TEXT_FIELD:
//			queryString = "\"" + fieldValue + "\"";
			queryString = fieldValue;
			break;
		case ONT_ID:
			queryString = "\"" + fieldValue + "\"";
			break;
		case DATE_FIELD:
		case ONT_FIELD:
			queryString = "[" + fieldValue + "]";
			break;
		case NUMERIC_FIELD:
			queryString = queryString.toLowerCase().replace(",", " ");
			if (queryString.contains("to")) {
				// It's a range
				String[] range = getRange(queryString);
				queryString = "[" + range[0] + " TO " + range[1] + "]";
			} else {
				String pattern = "\\s+";
				queryString = queryString.replaceAll(pattern, " OR ");
			}
		}
		return queryString;
	}

	public static String[] getRange(String rangeString) {
		rangeString = rangeString.toLowerCase().replace(" ", "");
		String[] range = new String[2];
		range[0] = "*";
		range[1] = "*";
		int pos = rangeString.indexOf("to");
		if (pos > 0)
			range[0] = rangeString.substring(0, pos);
		if (pos < rangeString.length() - 3)
			range[1] = rangeString.substring(pos + 2);
		return range;
	}

	public static String getDateRangeValue(String fromDate, String toDate) {
		if (fromDate == null)
			fromDate = "";
		if (toDate == null)
			toDate = "";
		if (fromDate.length() > 0 && toDate.length() == 0)
			return fromDate + "T00:00:00:000Z TO *";
		if (fromDate.length() > 0 && toDate.length() > 0)
			return fromDate + "T00:00:00:000Z TO " + toDate + "T23:59:59:999Z";
		if (fromDate.length() == 0 && toDate.length() > 0)
			return "* TO " + toDate + "T23:59:59:999Z";

		return "*";
	}

	public static String getQueryString(String boolOpt, boolean isNot,
			String fieldName, String fieldValue) {
		return getQueryString(boolOpt, isNot, fieldName, fieldValue,
				FieldType.TEXT_FIELD);
	}

	public static String getQueryString(String boolOpt, boolean isNot,
			String fieldName, String fieldValue, FieldType fieldType) {
		return getQueryBooleans(boolOpt, isNot)
				+ SolrQueryStringService.getQueryString(fieldName, fieldType,
						fieldValue);
	}

	public static String getQueryBooleans(String boolOpt, boolean isNot) {
		return " " + boolOpt + (isNot ? " -" : " ");
	}
	
	public static String finalQueryString(String rawQuery) {
		if (rawQuery.startsWith("OR ")) {
			rawQuery = rawQuery.substring(3);
		}
		if (rawQuery.startsWith("AND ")) {
			rawQuery = rawQuery.substring(4);
		}
		return rawQuery;
	}
	
	public static String getHtmlValue(String value) {
		return "<b>" + value.trim() + "</b>";
	}
	
	public static String addSpeciesCondition(int speciesKey, String condition) {
//		switch (speciesKey) {
//		case 3: //Rattus
//			return "(organism_ncbi_id:(10118 OR 10116) AND (" + condition + "))";
//		case 2: //Mouse
//			return "(organism_ncbi_id:(10090) AND (" + condition + "))";
//		}
		return condition;
	}
}
