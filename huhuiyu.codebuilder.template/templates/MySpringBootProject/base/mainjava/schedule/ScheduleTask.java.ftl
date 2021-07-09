package ${builderUtil.getSubPackage("schedule")};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import top.huhuiyu.api.spring.base.BaseResult;
import ${builderUtil.getSubPackage("dao")}.UtilsDAO;
import ${builderUtil.getSubPackage("service")}.UtilService;
import ${builderUtil.getSubPackage("service")}.WebSocketService;

/**
 * 定时任务
 * 
 * @author ${baseInfo.author}
 */
@Component
public class ScheduleTask {

  private static final Logger log = LoggerFactory.getLogger(ScheduleTask.class);

  @Autowired
  private UtilService utilService;
  @Autowired
  private WebSocketService webSocketService;
  @Autowired
  private UtilsDAO utilsDAO;

  @Scheduled(initialDelay = 3 * 1000, fixedDelay = 5 * 60 * 1000)
  public void deleteTokens() {
    try {
      log.debug("正在删除过期的token");
      int result = utilService.deleteTokens();
      log.debug("删除过期的token完成，数量为：{}", result);
    } catch (Exception ex) {
      log.error("删除过期的token发生错误", ex);
    }
  }

  @Scheduled(initialDelay = 5 * 1000, fixedDelay = 60 * 1000)
  public void timestamp() {
    try {
      log.debug("广播时间戳");
      BaseResult<Object> result = BaseResult.getBaseResult(true, 200, "时间戳广播信息");
      result.setResultData(utilsDAO.queryTimestamp());
      webSocketService.broadcast(result);
    } catch (Exception ex) {
      log.error("广播时间戳发生错误", ex);
    }
  }

  @Scheduled(initialDelay = 8 * 1000, fixedDelay = 60 * 1000)
  public void deleteIpBans() {
    try {
      log.debug("正在删除过期的ip被ban记录");
      int result = utilsDAO.deleteIpBan();
      log.debug("删除过期的ip被ban记录完成，数量为：{}", result);
    } catch (Exception ex) {
      log.error("删除过期的ip被ban记录发生错误", ex);
    }
  }
}