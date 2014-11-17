<div class="row">
    <div class="col-sm-12">
        <div class="searchCriterio">
            <blockquote>
                <label>${criterio.shortDescription}</label>
                <br>
                <div class="btn-group flat-btn-group" data-toggle="buttons">
                    <g:set var="stp" value="${1/criterio.step}" />
                    <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attr" status="i">
                        <g:if test="${i > 0 && i % 13 == 0}">
                            <br>
                        </g:if>
                        <g:set var="attr_val" value="${Double.valueOf(attr).doubleValue()}"/>
                        <g:set var="active" value="${item?.findRangeAttributeIfSelected(criterio.id, attr_val) ? 'active' : ''}"/>
                        <label class="btn btn-primary ${active}">
                            ${attr_val}
                            <g:if test="${active}">
                                <g:radio name="rangecriteria.${criterio.id}" value="${attr_val}" checked="checked"/>
                            </g:if>
                            <g:else>
                                <g:radio name="rangecriteria.${criterio.id}" value="${attr_val}"/>
                            </g:else>
                        </label>
                    </g:each>
                </div>
            </blockquote>
        </div>
    </div>
</div>