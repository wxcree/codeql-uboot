/* 查找特定函数的调用位置 */
import cpp

from FunctionCall call, Function fun
//FunctionCall为编译时可确定的函数调用集合
where 
    call.getTarget() = fun and fun.getName() = "memcpy"
    //getTarget为获取调用的函数
    //and后限制被调用函数的名字
select call
