<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<tr id="sortRow${rowId}"  align="center">
<td>
<form:select class="form-control" path="queryString.qSortConditions[${rowId}].fieldName">
  <option value="p_date">Publication Date</option>
  <option value="pmid_l">PubMed ID</option>
</form:select>
</td>
<td>
<form:radiobutton  path="queryString.qSortConditions[${rowId}].sortingOrder" class="form-input-check" value="asc"/>Asc
<form:radiobutton path="queryString.qSortConditions[${rowId}].sortingOrder" class="form-input-check" value="desc"/>Desc
</td>
<td>
  <span class="badge badge-secondary butRemove" style="cursor:hand;background-color: red" onclick="removeSortRow('${rowId}')"><strong>x</strong></span>
<!--button type="button" onclick="removeSortRow('$-{rowId}')" class="butRemove"></button-->
</td>
			
