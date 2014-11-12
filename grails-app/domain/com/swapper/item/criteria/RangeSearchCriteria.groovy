package com.swapper.item.criteria

class RangeSearchCriteria extends SearchCriteria{

    double min
    double max
    double step

    static constraints = {
        max(validator: {val, obj ->
            return val > obj.min
        })
    }

    static mapping = {
        cache usage: 'nonstrict-read-write'
        category cache:  'nonstrict-read-write'
    }
    
    boolean acceptableValue(def val){

        double dv

        if(!(val instanceof Double))
            try{
                dv = new Double(val)
            }catch (Exception e){
               return false
            }
        else dv = val

        if(dv >= min && dv <= max && (dv - min) % step == 0)
            return true
        
        return false
        
    }
}
