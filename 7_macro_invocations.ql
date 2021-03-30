/* 查询宏调用 */
import cpp

from MacroInvocation mi
//MacroInvocation宏调用集合
where mi.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select mi
