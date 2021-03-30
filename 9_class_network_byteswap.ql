/* 写自己的类 */
import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    // TODO: replace <class> and <var>
    exists(MacroInvocation mi |
        mi.getMacroName().regexpMatch("ntoh(s|l|ll)") and
        this = mi.getExpr()
        //Expr子类，数据集合为expr
    )
    //exixts引入临时变量，并检查是否满足特定条件
  }
}

from NetworkByteSwap n
select n, "Network byte swap"
