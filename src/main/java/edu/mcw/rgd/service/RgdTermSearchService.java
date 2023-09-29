package edu.mcw.rgd.service;


import edu.mcw.rgd.Utils.BasicUtils;

import java.net.URI;

;

public class RgdTermSearchService {

	public static String[] getGeneRgdIds(String geneQueryString) {
		return getGeneRgdIds(geneQueryString, false);
	}
	
	public static String[] getGeneRgdIds(String geneQueryString, boolean isForHuman) {
		geneQueryString = geneQueryString.replace(",", " ");
		String solrQueryString = "q=" + (isForHuman ? "species_s:(human) AND " : "") + "(term_str:("+
	geneQueryString +") OR id_s:(" + geneQueryString + ")) AND cat:(RGD_GENE)&fl=id_s&wt=csv&csv.header=false&rows=1000000&csv.newline= ";
		try {
		//	URI uri = new URI("http","localhost:8080", "/OntoSolr/collection1/select", solrQueryString, null);
			URI uri = new URI("https","dev.rgd.mcw.edu", "/solr/OntoSolr/collection1/select", solrQueryString, null);
			String value = BasicUtils.restGet(uri.toString(), null);
			return value.split(" ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		String queryStr = "A2m 2004";
		String[] rgdIds = RgdTermSearchService.getGeneRgdIds(queryStr);
		for (String rgdid : rgdIds) {
			System.out.println(rgdIds);
		}
	}
}
