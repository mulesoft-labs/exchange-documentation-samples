/**
* Internal mule module
*/
%dw 2.0

/**
* Calls a function that was bind in a given namespace with the specified arguments
*/
fun callFunction(namespace:String, functionName:String, arguments: Array<Any>) = native("mule::CallBindingFunctionValue")

/**
* Return the default value of a parameter from the specified function name in the given namespace
*/
fun getDefaultFunctionParameterValue(namespace:String, functionName:String, parameterName: String) = native("mule::GetDefaultFunctionParameterValue")

/**
* Returns the value of a given binding
*/
fun getValue(namespace:String, name:String) = native("mule::GetBindingValueFunctionValue")