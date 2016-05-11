
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




