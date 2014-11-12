package com.swapper.system

class SysParam {

    public static final String MAX_ELEMENT_IN_VIEW_PARAM = "max-elements-in-view"

    String pName
    String pValue

    static constraints = {
        pName(unique: true)
    }

    static def createOrUpdate(String pName, String pValue){
        def cp = SysParam.findWhere(pName: pName)
        if(cp){
            cp.pValue = pValue
        }else{
            cp = new SysParam(pName: pName, pValue: pValue)
        }
        return cp.save(flush:true)
    }

    static String valueForName(String pName){
        return SysParam.findByPName(pName)?.pValue
    }
}
