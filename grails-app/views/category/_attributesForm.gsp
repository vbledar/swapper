
<g:if test="${criterio.instanceOf(com.swapper.item.criteria.ListSearchCriteria)}">
	<g:if test="${criterio.shortDescription?.equalsIgnoreCase('color')}">
		<div class="radioList color-selection-attribute" data-toggle="buttons" style="">
			<ul class="product-color-pop">
				<g:each in="${criterio.searchCriteriaAttributes}" var="attr">
					<g:if test="${"Multi".equalsIgnoreCase(attr?.descr)}">
						<li attribute-id="${attr.id}" style="" class="color-selection-item ${(itemInstance?.attrs.find {at -> at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.attribute.equals(attr)}) ? 'active' : ''}">
							<a href="#" class="color black-color-pop color-attribute-multi">
								<span>
									${attr?.descr}
								</span>
							</a>
						</li>
					</g:if>
					<g:elseif test="${"Other".equalsIgnoreCase(attr?.descr)}">
						<li attribute-id="${attr.id}" style="" class="color-selection-item ${(itemInstance?.attrs.find {at -> at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.attribute.equals(attr)}) ? 'active' : ''}">
							<a href="#" class="color black-color-pop">
								<span>
									${attr?.descr}
								</span>
							</a>
						</li>
					</g:elseif>
					<g:else>												
						<li attribute-id="${attr.id}" style="" class="color-selection-item ${(itemInstance?.attrs.find {at -> at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.attribute.equals(attr)}) ? 'active' : ''}">
							<a href="#" class="color black-color-pop" style="background-color: ${attr?.descr}">
								<span>
									${attr?.descr}
								</span>
							</a>
						</li>
					</g:else>
				</g:each>
			</ul>
		</div>
		<g:hiddenField id="color-selection-field" name="listcriteria.${criterio.id}" value=""/>
	</g:if>
	<g:else>
		<div class="radioList btn-group color-selection-attribute" data-toggle="buttons">
			<g:each in="${criterio.searchCriteriaAttributes}" var="attr">
				<label class="btn btn-default ${(itemInstance?.attrs.find {at -> at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.attribute.equals(attr)}) ? 'active' : ''}" style="margin-bottom: 5px;">
       				<input  type="radio" id="${attr.id}${criterio.id}" name="listcriteria.${criterio.id}" value="${attr.id}"
	       				checked="${(itemInstance?.attrs.find {at -> at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.attribute.equals(attr)}) ? 'true' : ''}"
        			>${attr?.descr}
   	    		</label>
        	</g:each>
        </div>
	</g:else>
</g:if>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.RangeSearchCriteria)}">
    <div class="radioList btn-group color-selection-attribute" data-toggle="buttons">
        <g:set var="stp" value="${1/criterio.step}" />
        <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attr">
            <g:set var="attr_val" value="${Double.valueOf(attr).doubleValue()}"/>
            <label for="${attr_val}${criterio.id}" style="margin-bottom: 5px; margin-left: 2px;"
            		class="btn btn-default ${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.numberValue != null && attr_val.equals(at.numberValue.doubleValue())}) ? 'active' : ''}">
            <g:radio id="${attr_val}${criterio.id}" value="${attr_val}" name="rangecriteria.${criterio.id}"
                     checked='${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.numberValue != null && attr_val.equals(at.numberValue.doubleValue())}) ? 'true' : ''}'/>
            ${attr_val}</label>
        </g:each>
    </div>
</g:elseif>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.RangeSearchCriteria)}">
    <div class="radioList btn-group" data-toggle="buttons">
        <g:set var="stp" value="${1/criterio.step}" />
        <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attr">
        	<g:set var="attr_val" value="${Double.valueOf(attr).doubleValue()}"/>
        	<label class="btn btn-primary">
      			<input  id="${attr_val}${criterio.id}"
        				type="radio" 
        				name="rangecriteria.${criterio.id}" 
        				value="${attr_val}"
        				checked="${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.numberValue != null && attr_val.equals(at.numberValue.doubleValue())}) ? 'true' : null}"
        		>${attr_val}
        	</label>
        </g:each>
    </div>
</g:elseif>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.BooleanSearchCriteria)}">
	<div class="radioList btn-group color-selection-attribute" data-toggle="buttons">        				
		<label class="btn btn-default ${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.booleanValue != null && Boolean.TRUE.equals(at.booleanValue)}) ? 'active' : ''}" style="margin-bottom: 5px;">
    					<input  type="radio" id="true${criterio.id}" name="booleancriteria.${criterio.id}" value="true"
     					checked="${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.booleanValue != null && Boolean.TRUE.equals(at.booleanValue)}) ? 'true' : ''}"
      				> <g:message code="dialog.yes.button" default="Yes" />
      		</label>
      		<label class="btn btn-default ${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.booleanValue != null && Boolean.FALSE.equals(at.booleanValue)}) ? 'active' : ''}" style="margin-bottom: 5px;">
    					<input  type="radio" id="false${criterio.id}" name="booleancriteria.${criterio.id}" value="false"
     					checked="${(itemInstance?.attrs.find {at -> return at.searchCriteria.id.longValue().equals(criterio.id.longValue()) && at.booleanValue != null && Boolean.FALSE.equals(at.booleanValue)}) ? 'true' : ''}"
      				> <g:message code="dialog.no.button" default="No" />
      		</label>
       </div>
</g:elseif>