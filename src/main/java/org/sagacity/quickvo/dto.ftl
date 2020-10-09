/**
 *@Generated by sagacity-quickvo 4.16
 */
package ${quickVO.voPackage};

import java.io.Serializable;
<#if (quickVO.swaggerModel)>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
</#if>
<#if (quickVO.lombok)>
import lombok.*;
</#if>
<#if (quickVO.imports?exists && quickVO.imports?size>0)>
<#list quickVO.imports as import>
import ${import};
</#list>
</#if>

/**
 * @project <#if (quickVO.projectName?exists)>${quickVO.projectName}</#if>
 * @version <#if (quickVO.version?exists)>${quickVO.version}</#if>
 * <#if (quickVO.tableRemark?exists && quickVO.tableRemark!='')>,Remark:${quickVO.tableRemark}</#if>  
 */
<#if (quickVO.swaggerModel)>
@ApiModel(value="${quickVO.voName}"<#if (quickVO.tableRemark?exists && quickVO.tableRemark!='')>,description="${quickVO.tableRemark}"</#if>)
</#if>
<#if (quickVO.lombok)>
@Data
<#if (quickVO.lombokChain)>
@Accessors(fluent = true)
</#if>
</#if>
public class ${quickVO.voName} implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = ${quickVO.abstractVOSerialUID}L;
	
/*---begin-auto-generate-don't-update-this-area--*/	
<#list quickVO.columns as column>
	/**
	 * ${column.colRemark!""}
	 */
	<#if (quickVO.swaggerModel)>
	@ApiModelProperty(value="${column.colRemark}"<#if (column.nullable=='0')>,allowEmptyValue=false<#else>,allowEmptyValue=true</#if>)
	</#if>
	private ${column.resultType} ${column.colJavaName?uncap_first};
	
</#list>
<#if (quickVO.lombok==false)>
<#list quickVO.columns as column>
	
	/**
	 *@param ${column.colJavaName?uncap_first} the ${column.colJavaName?uncap_first} to set
	 */
	<#if (quickVO.returnSelf==true)>
	public ${quickVO.voName} set${column.colJavaName?cap_first}(${column.resultType} ${column.colJavaName?uncap_first}) {
		this.${column.colJavaName?uncap_first}=${column.colJavaName?uncap_first};
		return this;
	}
	<#else>
	public void set${column.colJavaName?cap_first}(${column.resultType} ${column.colJavaName?uncap_first}) {
		this.${column.colJavaName?uncap_first}=${column.colJavaName?uncap_first};
	}
	</#if>
		
	/**
	 *@return the ${column.colJavaName}
	 */
	public ${column.resultType} get${column.colJavaName?cap_first}() {
	    return this.${column.colJavaName?uncap_first};
	}
</#list>
</#if>
/*---end-auto-generate-don't-update-this-area--*/	
}