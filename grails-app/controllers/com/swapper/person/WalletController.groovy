package com.swapper.person

import com.swapper.BaseController
import com.swapper.domain.commands.item.ItemCommand
import com.swapper.domain.commands.item.ItemShippingCommand
import com.swapper.payment.PaymentMethod
import com.swapper.user.Person
import com.swapper.wallet.TopUpScheme

class WalletController extends BaseController {

    def walletManagement() {
        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        render (view: '/wallet/walletManagement', model: [wallet: person.wallet])
    }

    /**
     * Render the personsSwapShop template.
     */
    def personsWallet() {
        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        render (template: '/wallet/personsWallet', model: [wallet: person.wallet])
    }

    def topUpAccountFlow = {

        /**
         * Initialization state.
         *
         * 1. load master categories
         * 2. item command instance creation
         * 3. item shipping command instnace creation
         * 4. determine if user has provided a paypal account
         */
        initialize {
            action {
                Person person = getLoggedInUserFromDatabase();
                if (!person) {
                    flash.error = message(code: "user.message.no.logged.in.user.found")
                    redirect(controller: "landing", action: "index")
                    return
                }

                flow.paymentMethods = person.getSortedPaymentMethods()
            }

            /**
             * On successfull initialization flow must proceed to basic item information step
             */
            on('success') {
                flow.topUpSchemes = TopUpScheme.findAll()
            }.to('topUpSchemeSelection')
        }

        /**
         * Step 1
         * Enter basic item information
         *
         * User can input item basic information like name, description, categories, etc...
         */
        topUpSchemeSelection {
            render(template: '/wallet/topUpAccount/topUpSchemeSelection')

            /**
             * On next action the item command must be validated.
             */
            on('next') {
                log.error params
                if (params.topUpSchemeSelection) {
                    flow.topUpSchemeSelection = params.topUpSchemeSelection
                } else {
                    flash.errorMessage = message(code: 'user.message.select.top.up.scheme')
                    return invalid()
                }
            }.to('paymentSelection')

            /**
             * On this step user can cancel the flow by selecting the cancel action.
             */
            on('cancel').to('finish')
            on('invalid').to('topUpSchemeSelection')
        }

        paymentSelection {
            render(template: '/wallet/topUpAccount/paymentSelection')

            on('next') {
                if (params.paymentMethodSelection) {
                    flow.paymentMethodSelection = params.paymentMethodSelection
                } else {
                    flash.errorMessage = message(code: 'user.message.select.payment.method')
                    return invalid()
                }

                log.error flow.topUpSchemeSelection
                flow.topUpSchemeSelected = TopUpScheme.findById(flow.topUpSchemeSelection)
                flow.paymentMethodSelected = PaymentMethod.findById(flow.paymentMethodSelection)
            }.to('verifySelection')

            on('previous') {
                if (params.paymentMethodSelection) {
                    flow.paymentMethodSelection = params.paymentMethodSelection
                }
            }.to('topUpSchemeSelection')

            on('cancel').to('finish')
            on('invalid').to('paymentSelection')
        }

        verifySelection {
            render(template: '/wallet/topUpAccount/verifySelection')

            on('next') {
                log.error "We are going to redirect somehow!"
            }.to('topUpSchemeSelection')

            on('previous') {
                if (params.paymentMethodSelection) {
                    flow.paymentMethodSelection = params.paymentMethodSelection
                }
            }.to('paymentSelection')

            on('cancel').to('finish')
        }

        finish {
            redirect (controller: "wallet", action: "walletManagement")
        }
    }

    def cancelTopUpAccount() {
        redirect(controller: 'wallet', action: 'personsWallet')
        return
    }
}
