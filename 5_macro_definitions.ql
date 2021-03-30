/* 查找宏指令 */
import cpp

from Macro m 
//Macro为宏数据集的类
where m.getName().regexpMatch("ntoh(s|l|ll)") 
//可以使用正则表达式限制
select m

