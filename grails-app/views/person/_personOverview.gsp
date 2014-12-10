<g:if test="${person?.photo?.url}">
    <g:img uri="${person?.photo?.url}" class="img-thumbnail img-responsive" style="margin-left: auto; margin-right: auto; min-height: 150px; min-width: 150px;"/>
</g:if>

<g:link controller="item" action="personsItems" id="${person.id}">
    <h4>
        ${person.firstName} ${person.lastName}
    </h4>
</g:link>