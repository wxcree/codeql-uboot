import cpp

from FunctionCall call, Function fun
where 
    call.getTarget() = fun and
    fun.getName() = "memcpy"
select call
