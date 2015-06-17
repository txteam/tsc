/*
 * 描          述:  <描述>
 * 修  改   人:  Administrator
 * 修改时间:  2014年5月24日
 * <修改描述:>
 */
package com.tx.component.task.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.core.Ordered;

import com.tx.core.util.MD5Utils;

/**
 * 事务定义<br/>
 * <功能详细描述>
 * 
 * @author  Administrator
 * @version  [版本号, 2014年5月24日]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
@Table(name = "TASK_DEFINITION")
public class TaskDefinition implements Ordered,Serializable{
    
    /** 注释内容 */
    private static final long serialVersionUID = -2388525566988400621L;

    /** 唯一键 */
    @Id
    private String id;
    
    /** 事务定义key */
    private String taskKey;
    
    /** 上级事务key */
    private String parentTaskKey;
    
    /** 事务名 */
    private String name;
    
    /** 描述 */
    private String description;
    
    /** 优先级 */
    private int priority;
    
    /** 下次执行时间：如果当前时间大于该事件，则事务可以被启动 */
    private Date nextExecuteDate;
    
    /** 最后执行时间：记录最后一次执行的时间 */
    private Date lastExecuteDate;
    
    /** 执行操作员 */
    private Date taskStartDate;
    
    /** 任务执行时间 */
    private Date taskEndDate;
    
    /** 耗时 */
    private long timeConsuming;
    
    /** 最后执行器的签名 */
    private String lastExecutorSignature;
    
    /** 
     * 在容器中判断，如果存在lock = true的情况，就认为事务正在执行中<br/>
     * 是否锁定 
     *     事务容器在激发后
     *     将会将所有事务修改为locked=true的状态
     * 待所有事务均执行完成后
     *     再将所有事务的状态修改为locked=false
     * 应用在启动时
     *     将判断事务是否存在锁定，如果存在锁定，比对锁定的电脑mac地址是否为当前电脑的签名
     *          当前电脑的签名为：当前电脑的所有mac地址的hashcode值+当前应用所在目录的hashcode值之和
     *     如果是
     */
    private boolean locked;
    
    /** 锁定事务的电脑签名值 */
    private String lockSignature;
    
    /** 
     * 任务状态
     *     容器在开始执行时，将所有到期可执行任务（待执行）的状态修改为：准备执行
     *     如果某条任务开始执行，首先调用独立事务，将任务状态修改为：执行中
     *     如果完成后，将任务修改为:执行完成
     * 在整个容器完成执行后
     *     将本次执行中的所有任务从执行完成修改为待执行
     */
    private TaskDefinitionStatusEnum status;
    
    /**
     * 任务类型
     */
    private TaskTypeEnum taskType;
    
    /** 最后一次任务执行结果 */
    private TaskExecuteResultEnum lastExecuteResult;
    
    @Override
    public int getOrder() {
        return priority;
    }
    
    /**
     * @return 返回 id
     */
    public String getId() {
        return id;
    }
    
    /**
     * @param 对id进行赋值
     */
    public void setId(String id) {
        this.id = id;
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
     * @return 返回 parentTaskKey
     */
    public String getParentTaskKey() {
        return parentTaskKey;
    }
    
    /**
     * @param 对parentTaskKey进行赋值
     */
    public void setParentTaskKey(String parentTaskKey) {
        this.parentTaskKey = parentTaskKey;
    }
    
    /**
     * @return 返回 name
     */
    public String getName() {
        return name;
    }
    
    /**
     * @param 对name进行赋值
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * @return 返回 description
     */
    public String getDescription() {
        return description;
    }
    
    /**
     * @param 对description进行赋值
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    /**
     * @return 返回 priority
     */
    public int getPriority() {
        return priority;
    }
    
    /**
     * @param 对priority进行赋值
     */
    public void setPriority(int priority) {
        this.priority = priority;
    }
    
    /**
     * @return 返回 nextExecuteDate
     */
    public Date getNextExecuteDate() {
        return nextExecuteDate;
    }
    
    /**
     * @param 对nextExecuteDate进行赋值
     */
    public void setNextExecuteDate(Date nextExecuteDate) {
        this.nextExecuteDate = nextExecuteDate;
    }
    
    /**
     * @return 返回 lastExecuteDate
     */
    public Date getLastExecuteDate() {
        return lastExecuteDate;
    }
    
    /**
     * @param 对lastExecuteDate进行赋值
     */
    public void setLastExecuteDate(Date lastExecuteDate) {
        this.lastExecuteDate = lastExecuteDate;
    }
    
    /**
     * @return 返回 locked
     */
    public boolean isLocked() {
        return locked;
    }
    
    /**
     * @param 对locked进行赋值
     */
    public void setLocked(boolean locked) {
        this.locked = locked;
    }
    
    /**
     * @return 返回 lockSignature
     */
    public String getLockSignature() {
        return lockSignature;
    }
    
    /**
     * @param 对lockSignature进行赋值
     */
    public void setLockSignature(String lockSignature) {
        this.lockSignature = lockSignature;
    }
    
    /**
     * @return 返回 status
     */
    public TaskDefinitionStatusEnum getStatus() {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(TaskDefinitionStatusEnum status) {
        this.status = status;
    }
    
    /**
     * @return 返回 taskType
     */
    public TaskTypeEnum getTaskType() {
        return taskType;
    }
    
    /**
     * @param 对taskType进行赋值
     */
    public void setTaskType(TaskTypeEnum taskType) {
        this.taskType = taskType;
    }
    
    /**
     * @return 返回 lastExecuteResult
     */
    public TaskExecuteResultEnum getLastExecuteResult() {
        return lastExecuteResult;
    }
    
    /**
     * @param 对lastExecuteResult进行赋值
     */
    public void setLastExecuteResult(TaskExecuteResultEnum lastExecuteResult) {
        this.lastExecuteResult = lastExecuteResult;
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
     * @return 返回 lastExecutorSignature
     */
    public String getLastExecutorSignature() {
        return lastExecutorSignature;
    }
    
    /**
     * @param 对lastExecutorSignature进行赋值
     */
    public void setLastExecutorSignature(String lastExecutorSignature) {
        this.lastExecutorSignature = lastExecutorSignature;
    }
}
