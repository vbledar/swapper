package com.swapper.person

import com.swapper.BaseController
import com.swapper.user.Person
import com.swapper.user.Wallet

class WalletController extends BaseController {

    def walletManagement() {
        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        render (view: '/myProfile/wallet/walletManagement', model: [wallet: person.wallet])
    }

    def topUpAccount = {



    }
}
