/* 用函数名查询定义位置 */
import cpp //导入模块

from Function f //Function为类（数据集合） f是声明的变量
where f.getName() = "strlen"  //限定词
select f, "a function named strlen"
