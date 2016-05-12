
2016年 05月 11日 星期三 22:17:18 CST


--------------------------------------

c---> 在ser的注册过程.

	// Register with the server.
	s.mu.Lock()
	// If server is not running, Shutdown() may have already gathered the
	// list of connections to close. It won't contain this one, so we need
	// to bail out now otherwise the readLoop started down there would not
	// be interrupted.
	if !s.running {
		s.mu.Unlock()
		return c
	}
	s.toalll --
	c = nil 
	s.gcid --

	s.clients[c.cid] = c



------------------------------------------------------------
for i = 1; i <= s.gcid && i != c.cid; i++ {
			//				if c.opts.DevId == s.clients[i].opts.DevId {
			//					fmt.Println("S C bf process: send PING")
			//					t := s.clients[i]
			//					t.mu.Lock()
			//					t.bw.WriteString("xxxxxxxxxxxPING\r\n")
			//					err := t.bw.Flush()
			//					if err != nil {
			//						fmt.Println("S C T will clear")
			//						t.clearConnection()
			//						t.mu.Unlock()
			//						continue
			//					} else {
			//						fmt.Println("S C devId real exists & will close this connection")
			//						c.closeConnection()
			//					}
			//					t.mu.Unlock()

			//					break
			//				} else {
			//					fmt.Println("S C devId not exist")
			//					break
			//				}

		close后造成 panic nil pointer 
------------------------------------------------------------


		if n == 129 {
			fmt.Println("S C _______________________")
			for Tcid, Tclient := range s.clients {
				fmt.Println("S C cid:", Tcid)
				fmt.Println("client:", Tclient.opts.DevId)
			}
		}

		c 							s			  			sc
		1-----------成功链接   		s.clinets[1] = 			c1
		2-----------成功链接  重复  s.clinets[2] = 			c2  1和2重复
				1. sc2 会close 2  ===> ................f
				2. sc2 的for循环没有退出,read n=0,会执行close connection 
				3. 新的链接3会链接进来，会执行for循环，3分别与1,2比较的时候，2已经被删除了，所以找不到2，会报空指针异常


=========================================================================

c.closeConnection() 调用流程
-->
	==========================================
	c.mu.Lock()
	fmt.Println("S C closeConnection...start")
	if c.nc == nil {
		fmt.Println("S C closeConnection...")
		c.mu.Unlock()
		return
	}

	c.clearAuthTimer()
	c.clearPingTimer()
	c.clearConnection()
	c.nc = nil			//链接置空

	if srv != nil {
		// Unregister
		fmt.Println("S C remove c  start")
		srv.removeClient(c)
		fmt.Println("S C remove c end")
	}
	
	==========================================
	-->
		srv.removeClient(c)
		// Check auth and return boolean indicating if client is ok
		func (s *Server) checkAuth(c *client) bool {
			switch c.typ {
			case CLIENT:
				return s.checkClientAuth(c)
				.....
		}
		
		// Remove a client or route from our internal accounting.
		func (s *Server) removeClient(c *client) {
			fmt.Println("s remove client early.", s.totalClients, s.gcid)
			c.mu.Lock()
			if r != nil {
				rID = r.remoteID
			}
			c.mu.Unlock()
		
			s.mu.Lock()
			switch typ {
			case CLIENT:
				fmt.Println("S C delete ...start")
				delete(s.clients, cid)		----> 完成删除clien
				fmt.Println("S C delete ... end")
==========================================
		
