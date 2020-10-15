/**
 *@Generated by sagacity-quickvo 4.16
 */
package ${quickVO.entityPackage};

import java.io.Serializable;
import java.util.List;
import java.util.ArrayList;
import org.sagacity.sqltoy.config.annotation.Entity;
import org.sagacity.sqltoy.config.annotation.SqlToyEntity;
<#if (quickVO.selectFields==true)>
import org.sagacity.sqltoy.callback.SelectFields;
</#if>
<#if (quickVO.type=="TABLE")>
import org.sagacity.sqltoy.config.annotation.Id;
</#if>
import org.sagacity.sqltoy.config.annotation.Column;
<#if (quickVO.swaggerModel)>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
</#if>
<#if (quickVO.hasBusinessId==true)>
import org.sagacity.sqltoy.config.annotation.BusinessId;
</#if>
<#if (quickVO.imports?exists && quickVO.imports?size>0)>
<#list quickVO.imports as import>
import ${import};
</#list>
</#if>
<#if (quickVO.exportTables?exists)>
import org.sagacity.sqltoy.config.annotation.OneToMany;
<#list quickVO.exportTables as exportTable>
import ${quickVO.entityPackage}.${exportTable.pkRefTableJavaName?cap_first};
</#list>
</#if>

/**
 * @project <#if (quickVO.projectName?exists)>${quickVO.projectName}</#if>
 * @version <#if (quickVO.version?exists)>${quickVO.version}</#if>
 * Table: ${quickVO.tableName}<#if (quickVO.tableRemark?exists && quickVO.tableRemark!='')>,Remark:${quickVO.tableRemark}</#if>  
 */
<#if (quickVO.swaggerModel)>
@ApiModel(value="${quickVO.entityName}"<#if (quickVO.tableRemark?exists && quickVO.tableRemark!='')>,description="${quickVO.tableRemark}"</#if>)
</#if>
@SqlToyEntity
@Entity(tableName="${quickVO.tableName}"<#if (quickVO.pkConstraint?exists)>,pk_constraint="${quickVO.pkConstraint}"</#if><#if (quickVO.schema?exists && quickVO.schema!='')>,schema="${quickVO.schema}"</#if>)
public class ${quickVO.entityName} implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = ${quickVO.entitySerialUID}L;
	
<#list quickVO.columns as column>
	/**
	 * jdbcType:${column.colType!""}
	 * ${column.colRemark!""}
	 */
	<#if (quickVO.swaggerModel)>
	@ApiModelProperty(value="${column.colRemark}"<#if (column.nullable=='0')>,allowEmptyValue=false<#else>,allowEmptyValue=true</#if>)
	</#if>
	<#if (column.pkFlag?exists && column.pkFlag=='1')>
	@Id<#if (column.businessIdConfig?exists)><#else><#if (quickVO.singlePk=='1')>(strategy="${column.strategy}"<#if (column.sequence?exists && column.sequence!='')>,sequence="${column.sequence}"</#if><#if (column.generator?exists && column.generator!='')>,generator="${column.generator}"</#if>)</#if></#if>
	</#if>
	<#if (column.businessIdConfig?exists)>
	<#assign businessId=column.businessIdConfig/>
	@BusinessId(generator="${businessId.generator}"<#if (businessId.signature?exists)>,signature="${businessId.signature}"</#if><#if (businessId.relatedColumns?exists)>,relatedColumns={<#list businessId.relatedColumns as relatedCol><#if (relatedCol_index>0)>,</#if>"${relatedCol}"</#list>}</#if><#if (businessId.length?exists)>,length=${businessId.length}</#if><#if (businessId.sequenceSize?exists)>,sequenceSize=${businessId.sequenceSize}</#if>)
	</#if>
	@Column(name="${column.colName}"<#if (column.precision?exists)>,length=${column.precision?c}L</#if><#if (column.defaultValue?exists)>,defaultValue="${column.defaultValue}"</#if>,type=java.sql.Types.<#if (column.dataType?upper_case=='INT')>INTEGER<#else>${column.dataType?upper_case}</#if>,nullable=<#if (column.nullable=='0')>false<#else>true</#if><#if column.autoIncrement=='true'>,autoIncrement=true</#if>)
	private ${column.resultType} ${column.colJavaName?uncap_first};
	
</#list>

<#if (quickVO.exportTables?exists)>
<#list quickVO.exportTables as exportTable>
	/**
	 * 主键关联子表信息
	 */
	@OneToMany(fields={${exportTable.pkColJavaName}},mappedTable="${exportTable.pkRefTableName}",mappedColumns={${exportTable.pkRefColName}},mappedFields={${exportTable.pkRefColJavaName}}<#if (exportTable.load?exists)>,load="${exportTable.load}"</#if><#if (exportTable.updateSql?exists)>,update="${exportTable.updateSql}"</#if><#if (exportTable.deleteRule==0)>,delete=false</#if>)
	private List<${exportTable.pkRefTableJavaName?cap_first}> ${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s=new ArrayList<${exportTable.pkRefTableJavaName?cap_first}>();

</#list>
</#if>
<#if (quickVO.type=='TABLE')>
	/** default constructor */
	public ${quickVO.entityName}() {
	}
	
<#if (quickVO.singlePk=='1'||quickVO.singlePk=='0')>
<#assign paramCnt="0"/> 
	/** pk constructor */
	public ${quickVO.entityName}(<#list quickVO.columns as column><#if (column.pkFlag=='1')><#if (paramCnt=='1')>,</#if><#assign paramCnt='1'/>${column.resultType} ${column.colJavaName?uncap_first}</#if></#list>)
	{
		<#list quickVO.columns as column>
		<#if (column.pkFlag=='1')>
		this.${column.colJavaName?uncap_first}=${column.colJavaName?uncap_first};
		</#if>
		</#list>
	}
</#if>

</#if>
<#list quickVO.columns as column>
	
	/**
	 *@param ${column.colJavaName?uncap_first} the ${column.colJavaName?uncap_first} to set
	 */
	<#if (quickVO.returnSelf==true)>
	public ${quickVO.entityName} set${column.colJavaName?cap_first}(${column.resultType} ${column.colJavaName?uncap_first}) {
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


<#if (quickVO.exportTables?exists)>
<#list quickVO.exportTables as exportTable>
	/**
	 * @return the ${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s
	 */
	public List<${exportTable.pkRefTableJavaName?cap_first}> get${exportTable.pkRefTableJavaName?cap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s() {
		return this.${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s;
	}
	
	public void set${exportTable.pkRefTableJavaName?cap_first}s(List<${exportTable.pkRefTableJavaName?cap_first}> ${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s)	{
		this.${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s=${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s;
	}
</#list>
</#if>

	/**
     * @todo vo columns to String
     */
    @Override
	public String toString() {
		StringBuilder columnsBuffer=new StringBuilder();
		<#list quickVO.columns as column>
		columnsBuffer.append("${column.colJavaName?uncap_first}=").append(get${column.colJavaName?cap_first}()).append("\n");
		</#list>
		return columnsBuffer.toString();
	}
	
<#if (quickVO.selectFields==true)>
	/**
	 * @TODO create entityQuery fields
	 */
	public static SelectFieldsImpl select() {
		return new SelectFieldsImpl();
	}
	
	public static class SelectFieldsImpl extends SelectFields {
		private List<String> fields = new ArrayList<String>();

		@Override
		public String[] getSelectFields() {
			String[] result = new String[fields.size()];
			fields.toArray(result);
			return result;
		}
		
<#list quickVO.columns as column>
	    public SelectFieldsImpl ${column.colJavaName?uncap_first}() {
	    	if (!fields.contains("${column.colJavaName?uncap_first}")) {
				fields.add("${column.colJavaName?uncap_first}");
			}
	    	return this;
	    }
    
</#list>
	}
	
	public static class Fields {
<#list quickVO.columns as column>
        /**
         * ${column.colRemark!""}
         */
    	public static String ${column.colJavaName?uncap_first}="${column.colJavaName?uncap_first}";
    
</#list>
	}
</#if>
}