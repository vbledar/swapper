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
public enum WalletTransactionOrigin {

	ADMIN('Administration'),
	REQUEST('Request'),
	DEPOSIT('Deposit')	

	private final String alt

	private WalletTransactionOrigin(String alt){
		this.alt = alt
	}
}
