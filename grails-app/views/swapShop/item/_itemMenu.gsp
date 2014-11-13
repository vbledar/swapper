<li role="presentation" class="${tabSelected ? '' : 'active'}">
    <a href="#basicTab" role="tab" data-toggle="tab">
        <span class="glyphicon glyphicon-file"></span>
        <br/>
        <g:message code="item.menu.basic.information"/>
    </a>
</li>
<li role="presentation" class="${'details'.equalsIgnoreCase(tabSelected) ? 'active' : ''}">
    <a href="#detailsTab" role="tab" data-toggle="tab">
        <span class="glyphicon glyphicon-list-alt"></span>
        <br>
        <g:message code="item.menu.detailed.information"/>
    </a>
</li>
<li role="presentation" class="${'shipping'.equalsIgnoreCase(tabSelected) ? 'active' : ''}">
    <a href="#shippingTab" role="tab" data-toggle="tab">
        <span class="glyphicon glyphicon-briefcase"></span>
        <br>
        <g:message code="item.menu.shipping.information"/>
    </a>
</li>
<li role="presentation" class="${'photos'.equalsIgnoreCase(tabSelected) ? 'active' : ''}">
    <a href="#photosTab" role="tab" data-toggle="tab">
        <span class="glyphicon glyphicon-camera"></span>
        <br>
        <g:message code="item.menu.photos"/>
    </a>
</li>
