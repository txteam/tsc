/*
 * 描          述:  <描述>
 * 修  改   人:  Administrator
 * 修改时间:  2014年5月24日
 * <修改描述:>
 */
package com.tx.component.task.model;

import java.util.Date;

import javax.persistence.Table;

import com.tx.component.servicelog.defaultimpl.TXBaseServiceLog;
import com.tx.core.exceptions.util.AssertUtils;

/**
 * 事务执行记录<br/>
 * <功能详细描述>
 * 
 * @author  Administrator
 * @version  [版本号, 2014年5月24日]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
@Table(name = "task_execute_log")
public class TaskExecuteLog extends TXBaseServiceLog {
    
    /** 记录id */
    private String taskKey;
    
    /** 执行事件 */
    private String taskName;
    
    /** 调度时间 */
    private Date scheduleDate;
    
    /** 实际执行时间 */
    private Date actualExecuteDate;
    
    /** 执行操作员 */
    private Date taskStartDate;
    
    /** 任务执行时间 */
    private Date taskEndDate;
    
    /** 耗时 */
    private long timeConsuming;
    
    /** 执行所在机器的签名 */
    private String signature;
    
    /** <默认构造函数> */
    public TaskExecuteLog() {
        super();
    }
    
    /** <默认构造函数> */
    public TaskExecuteLog(String signature, TaskDefinition task, Date scheduleDate,
            Date startDate, Date endDate) {
        super();
        AssertUtils.notNull(task, "task is null.");
        this.signature = signature;
        this.actualExecuteDate = new Date();
        this.scheduleDate = scheduleDate;
        this.taskKey = task.getTaskKey();
        this.taskName = task.getName();
        this.taskStartDate = startDate;
        this.taskEndDate = endDate;
        if(endDate != null && startDate != null){
            this.timeConsuming = endDate.getTime() - startDate.getTime();
        }
    }
    
    /**
     * @return 返回 taskKey
     */
    public String getTaskKey() {
        return taskKey;
    }
    
    /**
     * @param 对taskKey进行赋值
     */
    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }
    
    /**
     * @return 返回 taskName
     */
    public String getTaskName() {
        return taskName;
    }
    
    /**
     * @param 对taskName进行赋值
     */
    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
    
    /**
     * @return 返回 taskStartDate
     */
    public Date getTaskStartDate() {
        return taskStartDate;
    }
    
    /**
     * @param 对taskStartDate进行赋值
     */
    public void setTaskStartDate(Date taskStartDate) {
        this.taskStartDate = taskStartDate;
    }
    
    /**
     * @return 返回 taskEndDate
     */
    public Date getTaskEndDate() {
        return taskEndDate;
    }
    
    /**
     * @param 对taskEndDate进行赋值
     */
    public void setTaskEndDate(Date taskEndDate) {
        this.taskEndDate = taskEndDate;
    }
    
    /**
     * @return 返回 signature
     */
    public String getSignature() {
        return signature;
    }
    
    /**
     * @param 对signature进行赋值
     */
    public void setSignature(String signature) {
        this.signature = signature;
    }
    
    /**
     * @return 返回 timeConsuming
     */
    public long getTimeConsuming() {
        return timeConsuming;
    }
    
    /**
     * @param 对timeConsuming进行赋值
     */
    public void setTimeConsuming(long timeConsuming) {
        this.timeConsuming = timeConsuming;
    }
    
    /**
     * @return 返回 scheduleDate
     */
    public Date getScheduleDate() {
        return scheduleDate;
    }
    
    /**
     * @param 对scheduleDate进行赋值
     */
    public void setScheduleDate(Date scheduleDate) {
        this.scheduleDate = scheduleDate;
    }
    
    /**
     * @return 返回 actualExecuteDate
     */
    public Date getActualExecuteDate() {
        return actualExecuteDate;
    }
    
    /**
     * @param 对actualExecuteDate进行赋值
     */
    public void setActualExecuteDate(Date actualExecuteDate) {
        this.actualExecuteDate = actualExecuteDate;
    }
}
