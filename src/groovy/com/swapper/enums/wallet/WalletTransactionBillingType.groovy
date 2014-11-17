/**
 * 
 */
package com.swapper.enums.wallet

/**
 * @author Bledar
 * 
 * This enumeration defines the status that a
 * wallet transaction can have.
 */
public enum WalletTransactionBillingType {

	SWAP_REQUESTER('Swap Request - Requester'),
	SWAP_OTHERPARTY('Swap Request - Other Party'),
	BUY_REQUESTER('Buy Request - Requester'),
	BUY_OTHERPARTY('Buy Request - Other Party')	

	private final String alt

	private WalletTransactionBillingType(String alt){
		this.alt = alt
	}
}
