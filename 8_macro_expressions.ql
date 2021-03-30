/* 查询宏调用 */
import cpp

from MacroInvocation mi
//MacroInvocation宏调用集合
where mi.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select mi.getExpr()
//搜索表达式，比较了一下与7的结果，8在我这边是..?..:..显示问题？官方文档没看太明白，留个坑
