/**
 * 
 */
package com.swapper.exception.request


import com.swapper.exception.ServiceException

/**
 * @author vbledar
 *
 */
class RequestNotInCorrectStatusException extends ServiceException {

//	RequestStatus requiredStatus
//	RequestStatus actualStatus
	
	public RequestNotInCorrectStatusException() {
		
	}
	
//	public RequestNotInCorrectStatusException(RequestStatus requiredStatus, RequestStatus actualStatus) {
//		this.requiredStatus = requiredStatus
//		this.actualStatus = actualStatus
//	}
	
	@Override
	public String getMessage() {
//		return 'Request was found in status [' + this.actualStatus + '], but was required in status [' + this.actualStatus + '].'
        return ""
	}
}
