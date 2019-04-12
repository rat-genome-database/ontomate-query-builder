<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr id="condRow${rowId}"  align="center" class="ui-widget-header" >
<td>
  <c:if test="${rowId!=0}">
  <div class="row">
    <div class="col">
<form:radiobutton class="form-input-check" path="queryString.qFieldConditions[${rowId}].booleanOpt" value="AND"/>AND
    </div>
    <div class="col">
<form:radiobutton class="form-input-check" path="queryString.qFieldConditions[${rowId}].booleanOpt" value="OR"/>OR
      </div>
  </div>
  </c:if>
</td>
<td>
  <c:if test="${rowId!=0}">
<form:checkbox class="form-input-check" path="queryString.qFieldConditions[${rowId}].notCondition"/>Not
  </c:if>
</td>
<td id="selOnt${rowId}">
<form:select class="form-control" path="queryString.qFieldConditions[${rowId}].fieldName" onchange='update_autocomplete("#inTerm${rowId} input", $(this).val());'>
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
</td>
<td id="inTerm${rowId}" style="padding-right:0">
<form:input  path="queryString.qFieldConditions[${rowId}].fieldValue" class="ont-auto-complete form-control"/>
</td>
<td >
  <span class="badge badge-secondary butRemove" style="cursor:hand;font-weight: bold;color:red" onclick="removeRow('${rowId}')">Hello</span>

  <!--button type="button" onclick="removeRow('$-{rowId}')" class="butRemove form-control"><span style="color:red;font-weight: bold">x</span></button-->
</td>
			
