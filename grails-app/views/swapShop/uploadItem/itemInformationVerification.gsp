<%@ page import="com.swapper.enums.item.ItemExchangeType;"%>
<%@ page import="com.swapper.domain.commands.*" %>
<%@ page import="com.swapper.item.Item" %>

<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:message code="upload.item.flow.step.verification"/>
            </h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 5]"/>
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="row">
            <!-- Item images -->
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-sm-12">
                        <ul id="item-images" class="jCycle-swap-pics">
                            <g:each in="${itemInstance?.photos}" var="photo">
                                <li>
                                    <img src="${photo?.url}" class="img-responsive img-thumbnail" style="max-width: 200px; max-height: 200px;"/>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
						
                <div class="spacer5"></div>
						
                <div class="row">
                    <div class="col-sm-12">
                        <ul id="item-images-nav" style="width: 200px; max-height: 200px; overflow-x: hidden; overflow-y: auto; margin: 0px">
                            <g:each in="${itemInstance?.photos}" var="photo">
                                <li>
                                    <a href="#">
                                        <sw:photoCommand photo="${photo}" size="s" cssClass="pull-left img-thumbnail" cssStyle="width: 48px; height: 48px;"/>
                                    </a>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>
				
            <!-- Item information -->
            <div class="col-sm-8">
							
            <div class="row">
                <div class="col-sm-12 font-medium">
                    <label class="text-muted to-uppercase"><g:message code="item.status.label" default="Status"/></label>
                </div>
                <div class="col-sm-12 font-medium">
                    <strong class="to-uppercase">${itemInstance?.itemStatusType?.description }</strong>
                </div>
            </div>
						
            <div class="spacer5"></div>
						
						<div class="row">
							<div class="col-sm-12 font-medium">
								<label class="text-muted to-uppercase"><g:message code="item.condition.label" default="Condition:"/></label>
							</div>
							<div class="col-sm-12 font-medium">
								<strong class="to-uppercase">${itemInstance?.itemConditionType?.description}</strong>
							</div>
						</div>
						
						<div class="spacer5"></div>
						
						<div class="row">
							<div class="col-sm-12 font-medium">
								<label class="text-muted to-uppercase"><g:message code="item.exchange.type.label" default="Exchange Type:"/></label>
							</div>
							<div class="col-sm-12 font-medium">
								<strong class="to-uppercase">${itemInstance?.itemExchangeType?.description }</strong>
							</div>
						</div>
								
								
						<g:if test="${itemInstance?.itemExchangeType == ItemExchangeType.SELL || itemInstance?.itemExchangeType == ItemExchangeType.SWAPORSELL}">
							<div class="spacer5"></div>
							
							<div class="row">
								<div class="col-sm-12 font-medium">
									<label class="text-muted to-uppercase"><g:message code="item.price.label" default="Desired Price:"/></label>
								</div>
								<div class="col-sm-12 font-medium">
									<strong>&euro; ${itemInstance?.price}</strong>
<%--									<g:if test="${ !itemInstance?.itemShipping?.noCosts }">--%>
<%--					             		<strong> --%>
<%--					             			+ &euro; <g:fieldValue bean="${itemInstance?.itemShipping }" field="domesticCosts" /> <g:message code="item.shipping.costs" default="Shipping Costs:" />--%>
<%--					                	</strong>--%>
<%--					           	 	</g:if>--%>
								</div>			
							</div>
							
							<div class="spacer5"></div>

							<div class="row">
								<div class="col-sm-12 font-medium">
									<label class="text-muted to-uppercase"><g:message code="item.shipping.costs" default="Shipping Costs:" /></label>
								</div>
								<div class="col-sm-12 font-medium">
									<g:if test="${ !itemShippingInstance?.noCosts }">
										<strong>&euro; ${itemShippingInstance?.shippingCosts}</strong>
									</g:if>
									<g:else>
										<strong class=""><g:message code="no.costs.label" default="No shipping costs applied." /></strong>
									</g:else>
								</div>
							</div>
						</g:if>
						
						<div class="spacer5"></div>
						
						<div class="row">
							<div class="col-sm-12">
								<ul class="nav nav-tabs nav-justified custom-navs">
									<li class="active"><a href="#productInfo" data-toggle="tab">Product Summary</a></li>
									<li><a href="#productDetails" data-toggle="tab">Product Details</a></li>
									<li><a href="#shippingInfos" data-toggle="tab">Shipping</a></li>
								</ul>
								<div class="tab-content custom-tab-content">
									<div class="tab-pane fade in active" id="productInfo">
										<div class="row">
											<div class="col-sm-12 font-medium">		
												<label class="text-muted to-uppercase"><g:message code="item.description.label" default="Description"/></label>
											</div>
											<div class="col-sm-12 font-medium">
												<strong>${itemInstance?.description}</strong>
											</div>
										</div>
										
										<div class="spacer5"></div>
										
										<div class="row">
											<div class="col-sm-12 font-medium">		
												<label class="text-muted to-uppercase"><g:message code="item.designer.info.label" default="Designer Info"/></label>
											</div>
											<div class="col-sm-12 font-medium">
												<g:if test="${!itemInstance.designer || itemInstance?.designer.trim().equalsIgnoreCase("")}">
													<strong>Designer information not provided.</strong>
												</g:if>
												<g:else>
													<strong>${itemInstance?.designer}</strong>
												</g:else>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="productDetails">
										<div class="row">
											<div class="col-sm-12 font-medium">
												<label class="text-muted"><g:message code="item.category.label" default="Category"/></label>
											</div>
											<div class="col-sm-12 font-medium">
												<strong>${itemInstance?.category?.name} (${itemInstance?.category?.parent?.name})</strong>
											</div>
										</div>
										<div class="row">
											<g:if test="${itemInstance.attrs.size() > 0}">
												<g:each in="${itemInstance.attrs}" var="attr">
													<div class="col-sm-12 font-medium">
														<label class="text-muted">${attr.searchCriteria.shortDescription}</label>
													</div> 
													<div class="col-sm-12 font-medium">
														<strong>
															<g:if test="${attr.attribute}">
							                                    ${attr.attribute.descr}
							                                </g:if>
							                                <g:elseif test="${attr.numberValue}">
							                                    ${attr.numberValue}
							                                </g:elseif>
							                                <g:elseif test="${attr.booleanValue != null}">
							                                    <sw:booleanDescription val="${attr.booleanValue}" />
							                                </g:elseif>
														</strong>
													</div>
												</g:each>
											</g:if>
										</div>
									</div>
									<div class="tab-pane fade" id="shippingInfos">
										<div class="row">
											<div class="col-sm-12 font-medium">
												<label class="text-muted"><g:message code="item.shipping.general.information" default="General Shipping Information"/></label>
											</div>
											<div class="col-sm-12 font-medium">
												<strong>${itemShippingInstance?.shippingInfo}</strong>
											</div>
										</div>

										<div class="spacer15"></div>

										<div class="row">
											<g:if test="${itemInstance.itemExchangeType != ItemExchangeType.SWAP }">
												<g:if test="${ itemInstance.itemExchangeType == ItemExchangeType.SELL|| itemInstance.itemExchangeType == ItemExchangeType.SWAPORSELL}">
													<g:if test="${!itemShippingInstance?.noCosts }">
														<div class="col-sm-12 font-medium">
															<label class="text-muted"><g:message code="item.shipping.costs.for.swap.or.buy" default="Domestic Costs"/></label>
														</div>
														<div class="col-sm-12 font-medium">
															<strong>&euro; ${itemShippingInstance?.shippingCosts}</strong>
														</div>
													</g:if>
												</g:if>
										    	<g:else>
													<g:if test="${itemShippingInstance?.noCosts }">
														<div class="col-sm-12 font-medium">
															<strong><g:message code="item.shipping.domestic.no.costs" default="No Costs Defined" /></strong>
														</div>
													</g:if>
												</g:else>
											</g:if>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<g:if test="${!userQualityUser}">
							<div class="full-line"></div>
							
							<div class="row">
								<div class="col-sm-12">
									<div class=" alert alert-warning font-medium">
										* <g:message code="item.upload.validation.required" />
									</div>
								</div>
							</div>
						</g:if>
					</div>
				</div>
			</div>
	</div>
</div>


<div class="row">
    <div class="col-sm-12 text-right">
        <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.cancel"/></button>
        <button id="previousStep" type="submit" class="btn btn-primary" name="previous"><span class="glyphicon glyphicon-chevron-left"></span> <g:message code="button.label.previous"/></button>
        <button id="nextStep" type="submit" class="btn btn-primary" name="next"><span class="glyphicon glyphicon-chevron-right"></span> <g:message code="button.label.save" /></button>
    </div>
</div>

<g:javascript>
	$(function() {

//		$('#item-images').cycle({
//            fx:     'turnDown',
//            speed:  'fast',
//            timeout: 0,
//            pager:  '#item-images-nav',
//            pagerAnchorBuilder: function(idx, slide) {
//                // return selector string for existing anchor
//                return '#item-images-nav li:eq(' + idx + ') a';
//            }
//        });

//        $('a.jColorbox-gallery').colorbox({ opacity:0.5 , rel:'group1' });

        $('#previousStep').off('click').on('click', function(event) {
            console.log('Next step action...');
            event.preventDefault();

            var dataInForm = $('#uploadItemForm').serializeArray();
            console.log("Serialized form data: " + dataInForm);

            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'previous')}';
            console.log(uploadItemUrl)
            $.post(uploadItemUrl, dataInForm, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                $('.swapshop-container').fadeOut(250, function() {
                    $(this).html(data);
                    $(this).fadeIn(250);
                });
            }).fail(function() {
                console.log('Post failed...');
            });
        });

        $('#nextStep').off('click').on('click', function(event) {
            console.log('Next step action...');
            event.preventDefault();

            var dataInForm = $('#uploadItemForm').serializeArray();
            console.log("Serialized form data: " + dataInForm);

            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'next')}';
            console.log(uploadItemUrl)
            $.post(uploadItemUrl, dataInForm, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                $('.swapshop-container').fadeOut(250, function() {
                    $(this).html(data);
                    $(this).fadeIn(250);
                })
            }).fail(function() {
                console.log('Post failed...');
            });
        });

	});
</g:javascript>