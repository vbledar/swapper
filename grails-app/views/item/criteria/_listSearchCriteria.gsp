
<div class="row">
    <div class="col-sm-12">
        <div class="searchCriterio">
            <blockquote>
                <label>${criterio.shortDescription}</label>
                <br>
                <g:set var="selectedCriterio" value="${item?.getAttributeIfSelected(criterio?.id)}"/>
                <div class="btn-group flat-btn-group" data-toggle="buttons">
                    <g:radioGroup values="${criterio?.searchCriteriaAttributes*.id}" labels="${criterio?.searchCriteriaAttributes*.descr}" name="listcriteria.${criterio?.id}" value="${selectedCriterio.toLong()}">
                        <label class="btn btn-primary ${selectedCriterio.toLong() == criterio?.id ? 'active' : ''}">
                            ${it?.label} ${it?.radio}
                        </label>
                    </g:radioGroup>
                </div>
            </blockquote>
        </div>
    </div>
</div>