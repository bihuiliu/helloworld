******************************************************************
*                                                                *
*                     二、.dta文件读入与保存                     *
*                                                                *
******************************************************************
clear
cd "E:/直播课程/第2节数据读入与导出/dta文件读入与保存/"

*1.系统自带dta文件：
sysuse auto, clear 
save myauto.dta, replace


*2.电脑中已有的dta文件：	
use myauto.dta, clear
replace mpg = 1 in 1
save myauto.dta, replace


*3.从网络调取数据：
webuse lifeexp.dta, clear //从Stata网站上获取数据
save lifeexp.dta, replace
