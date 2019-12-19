var regexp = {"username":/[\u4e00-\u9fa5]/     /*全中文的验证*/
}


/**
 * 该方法用于做通用验证效果。
 * 使用方式：只要提供验证正则表达式变量，以及验证id即可
 * 例如：var params = [{"criterion":regexp.username,"yangzhengid":"demoName"},
                        {"criterion":regexp.username,"yangzhengid":"demoAge"} ];
        var result = getresult(params);
 *
 * @param params
 * @returns {boolean}
 */
function getresult(params) {
    var result = true;
    for(var i=0 ; i<params.length ; i++){

        if(!( params[i].criterion.test($("#"+params[i].yangzhengid).val()))){
            result = false;
            toastr["error"]("请按照规范编写");
            $("#"+params[i].yangzhengid+"_div").addClass($("#"+params[i].yangzhengid+"_div").attr("class") + " has-error");
            break;
        }else{
            $("#"+params[i].yangzhengid+"_div").attr("class","form-group");
        }
    }
    return result;
}