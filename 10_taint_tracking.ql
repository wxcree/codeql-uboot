/**
 * @kind path-problem
 */
//查询从网络中传过来的整数到memcpy参数中的污染流
import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("ntoh(s|l|ll)") and
      this = mi.getExpr()
    )
  }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) { source.asExpr() instanceof NetworkByteSwap }
  //isSource 源头为NetworkByteSwap数据集内数据 污点源
  //instanceof是否属于<value> instanceof <myclass>
  override predicate isSink(DataFlow::Node sink) {
    //isSink 是否为参数 污点聚集点
    exists(FunctionCall call |
      call.getTarget().getName() = "memcpy" and
      sink.asExpr() = call.getArgument(2)
      //第3个参数为sink
    )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"
