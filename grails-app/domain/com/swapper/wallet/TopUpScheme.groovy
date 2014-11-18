package com.swapper.wallet

import com.swapper.domain.BaseRecord

class TopUpScheme extends BaseRecord {

	String title; // top up scheme title
	Integer points; // points gained when account is topuped by this scheme
	Double amount; // amount user must pay for this topup scheme
	String imageUrl; // if define the according image will be shown
	
    static constraints = {
		points (nullable: false)
		amount (nullable: false)
		imageUrl (nullable: true)
    }
}
