/*
 * 描          述:  <描述>
 * 修  改   人:  Administrator
 * 修改时间:  2014年6月19日
 * <修改描述:>
 */
package com.tx.component.task.model;

/**
 * 任务类型：
 *     DAY_START_SCHEDULE:每日任务调度器
 *     DAY_START_TASK:每日执行任务
 * <功能详细描述>
 * 
 * @author  Administrator
 * @version  [版本号, 2014年6月19日]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public enum TaskTypeEnum {
    /**
     * 调度任务
     */
    SCHEDULE_TASK,
    /**
     * 任务
     */
    TASK;
}
