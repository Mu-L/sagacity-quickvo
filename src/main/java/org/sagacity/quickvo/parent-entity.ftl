/**
 *@Generated by sagacity-quickvo 4.16
 */
package ${quickVO.entityPackage};

import org.sagacity.sqltoy.config.annotation.SqlToyEntity;
<#if (quickVO.imports?exists && quickVO.imports?size>0)>
<#list quickVO.imports as import>
import ${import};
</#list>
</#if>
<#if (quickVO.exportTables?exists)>
import java.util.List;
</#if>
import ${quickVO.entityPackage}.${quickVO.abstractPath}.Abstract${quickVO.entityName};

/**
 * @project <#if (quickVO.projectName?exists)>${quickVO.projectName}</#if>
 * @author <#if (quickVO.author?exists)>${quickVO.author}</#if>
 * @version <#if (quickVO.version?exists)>${quickVO.version}</#if>
 * Table: ${quickVO.tableName}<#if (quickVO.tableRemark?exists && quickVO.tableRemark!='')>,Remark:${quickVO.tableRemark}</#if> 	
 */
@SqlToyEntity
public class ${quickVO.entityName} extends Abstract${quickVO.entityName} {	
	/**
	 * 
	 */
	private static final long serialVersionUID = ${quickVO.entitySerialUID}L;
	
	/** default constructor */
	public ${quickVO.entityName}() {
		super();
	}
	
<#if (quickVO.type=="TABLE")>	
	/*---begin-constructor-area---don't-update-this-area--*/
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

<#if (quickVO.exportTables?exists)>
<#list quickVO.exportTables as exportTable>
	/**
	 * mapping ${exportTable.pkRefTableName} data to ${quickVO.tableName} oneToMany List
	 */
	public void mapping${exportTable.pkRefTableJavaName?cap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s(List<${quickVO.entityName}> mainSet,List<${exportTable.pkRefTableJavaName?cap_first}> itemSet)
    {
    	if(mainSet==null || mainSet.isEmpty() || itemSet==null||itemSet.isEmpty())
    		return;
    	${quickVO.entityName} main;
    	${exportTable.pkRefTableJavaName?cap_first} item;
    	for(int i=0;i<mainSet.size();i++){
    		main=mainSet.get(i);
    		if(itemSet.size()==0)
    			break;
    		for(int j=0;j<itemSet.size();j++){
    			item=itemSet.get(j);
    			if(${exportTable.pkEqualsFkStr}){
    			  main.${exportTable.pkRefTableJavaName?uncap_first}<#if exportTable.pkRefTableJavaName?ends_with("s")>e</#if>s.add(item);
    			  itemSet.remove(j);
    			  j--;
    			}
    		}
    	}
    }
</#list>
</#if>
	/*---end-constructor-area---don't-update-this-area--*/
</#if>

	/**
     * @todo vo columns to String
     */
    @Override
	public String toString() {
		return super.toString();
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#clone()
	 */
	@Override
	public ${quickVO.entityName} clone() {
		try {
			return (${quickVO.entityName}) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}