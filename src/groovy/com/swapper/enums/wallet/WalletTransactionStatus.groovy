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
public enum WalletTransactionStatus {

	NOT_CONFIRMED('Not Confirmed'),
	RESERVED('Reserved'),
	COMPLETED('Completed'),
	CANCELLED('Cancelled')	

	private final String alt

	private WalletTransactionStatus(String alt){
		this.alt = alt
	}
}
