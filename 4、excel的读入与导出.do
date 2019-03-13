******************************************************************
*                                                                *
*                       四、excel读入与导出                      *
*                                                                *
******************************************************************
clear
cd "E:/直播课程/第2节数据读入与导出/excel文件读入与导出/"

*1.单个文件的一个sheet
import excel using 利润表.xls, first case(lower) clear //将第一行设为变量名，并以小写字母形式显示变量


*2.单个文件的多个sheet
import excel using 利润表.xls, describe //给出该表内所有sheet的信息
return list
forvalues i=1/`r(N_worksheet)'{
	dis "this is `r(worksheet_`i')'"
	import excel using 利润表.xls, first case(lower) sheet(`r(worksheet_`i')') clear //读入单个sheet
	save 利润表_`i', replace
}
*每个子表单独保存为dta文件
clear
forvalues i = 1/`r(N_worksheet)' {
	append using 利润表_`i'
}
save 利润表.dta, replace



*3、读入特定的范围
import excel using 利润表1.xls, describe
import excel using 利润表1.xls, cellrange(A3:F12) clear //读入A3到F12
import excel using 利润表1.xls, cellrange(A2) first clear //旧版的国泰安中下载时可以选择不下载单位，读入时从A2开始读入，直接将中文作为变量名


import excel using 利润表2.xls, cellrange(A2) first clear
drop in 1
destring _all, replace //单位在下载时没有删除，可以读入后删除第一行然后将字符型转换为数值型

*多个文件的读入部分在循环中会涉及



*4、export excel
sysuse auto, clear
export excel using auto.xlsx, replace //直接导出
export excel using auto1.xlsx, replace first(variables) //导出第一行为变量名
export excel using auto2.xlsx, replace first(varlabels) //导出第一行为变量标签
export excel using auto.xlsx, cell(B2) sheet("newsheet", replace) first(variables) //将内容导出到newsheet中，从B2单元格开始导出数据
