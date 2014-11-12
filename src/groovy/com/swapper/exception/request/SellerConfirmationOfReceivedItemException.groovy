/**
 * 
 */
package com.swapper.exception.request

import com.swapper.exception.ServiceException
import com.swapper.user.Person

/**
 * @author vbledar
 *
 */
class SellerConfirmationOfReceivedItemException extends ServiceException {

	private Person user
//	private MonetaryRequest request
	
	public SellerConfirmationOfReceivedItemException() {
		
	}
	
//	public SellerConfirmationOfReceivedItemException(User user, MonetaryRequest request) {
//		this.user = user
//		this.request = request
//	}
	
	public String getMessage() {
		return 'User [' + user.username + '], which is a seller in request [' + request.id + '], attempted to confirm receival of requested item.'
	}
}
