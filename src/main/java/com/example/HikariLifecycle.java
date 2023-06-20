package com.example;

import com.zaxxer.hikari.HikariDataSource;
import com.zaxxer.hikari.pool.HikariPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.context.SmartLifecycle;
import org.springframework.stereotype.Component;

@Component
public class HikariLifecycle implements SmartLifecycle {

	private static final Logger logger = LoggerFactory.getLogger(HikariLifecycle.class);

	private final HikariDataSource dataSource;

	public HikariLifecycle(HikariDataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void start() {
		if (dataSource.getHikariPoolMXBean() instanceof HikariPool pool) {
			if (pool.poolState == HikariPool.POOL_SUSPENDED) {
				logger.info("hikari resume pool");
				pool.resumePool();
			}
		}
	}

	@Override
	public void stop() {
		if (dataSource.getHikariPoolMXBean() instanceof HikariPool pool) {
			if (pool.poolState == HikariPool.POOL_NORMAL) {
				logger.info("hikari suspend pool");
				pool.softEvictConnections();
				// Suspending the pool may be not enough since it does not close active connection
				// But close() or shutdown() do not seem to allow restarting the pool
				// So this is for now the best we can do
				pool.suspendPool();
			}
		}
	}

	@Override
	public boolean isRunning() {
		if (dataSource.getHikariPoolMXBean() instanceof HikariPool pool) {
			logger.info("hikari pool state: " + pool.poolState);
			return pool.poolState == 0;
		}
		return true;
	}
}
