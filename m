Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC750347FC8;
	Wed,  3 Jun 2026 01:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450135; cv=none; b=c6yj876+2QPjhmqzmb3E8P2k0/XBHW7jio53p5qIMUeCNqzDLwHBa3mwbueV0ARaYlak4eJteSSL5/CzIJqSy+uEmNNiQCNPlavuxqlMfoA9kWnR3EFizUfAi5HmNgPh6M+VrCFDwhclUANMeBSx7Ed+lRfoenKDWp0jAXP04HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450135; c=relaxed/simple;
	bh=D5G3hp/qm+6VVwR3GLo5LJzm+Rw6JCz63Z37DW/57A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t291Khh0WafIpAgNOu5JogxXRfmLQDh8SK12rPhZppIinmO6M5By8xNQP6PeZH72pqJ8Hj9+BGItjdGgH0bRLwIFgDFbZ5hNps8L/JL15mlXprxAvNETX2z+FBQvYyh1bdxBuocaf3BEww75YopUqHx+YGBUUVvjVLxy/wiKTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdpLPt2a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdpLPt2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C824F1F0089B;
	Wed,  3 Jun 2026 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450134;
	bh=xtnDqTLiDgbMBdXP051T4NEpUOd6CZfAnzdfTQvczec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hdpLPt2aG2GRtMsJMCLTeGEhv/bNCKQ7vBEYSy8fkyEttOqZYOkV+uCh7axI6iyg9
	 CIA1E6UdMhi3ZjjvZUWhWzEluay2aqpdYEil15KkZaeJa/NiZYsmUZXKFhV7GAXGlj
	 e6Sfu6MhOeozz+gaOumQpY6Gw4V+aWW1A/Y7lA52H32151RRGSasyUOjJaS4s1/bTY
	 qhblEDnksKly9pydUfna2zuC3qGel6edB+bf97uno7Vxy7PA+6U9+v8/4H6OGq6keD
	 Ls+OkCGLEklgM9oFnoAoA9HaVA3gMObxSkCIyY5Bv+qfpnfvo0qDnOP+GEEutYF5Un
	 Y3C/smT+mzLGg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	jakub@cloudflare.com,
	maxime.chevallier@bootlin.com,
	nb@tipi-net.de,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	jv@jvosburgh.net,
	michael.chan@broadcom.com,
	jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	idosch@nvidia.com,
	razor@blackwall.org,
	hare@suse.de,
	jhasan@marvell.com,
	danieller@nvidia.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 05/11] net: bonding: don't recurse on the slave's netdev ops lock
Date: Tue,  2 Jun 2026 18:28:34 -0700
Message-ID: <20260603012840.2254293-6-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603012840.2254293-1-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bond_update_speed_duplex() calls __ethtool_get_link_ksettings() on
the slave, which will soon take the slave's ops lock. One of its
callers already holds it and the other three don't, so the function
would either deadlock or run unprotected depending on the path.

Make the helper expect the slave's ops lock held and switch to
netif_get_link_ksettings(). Wrap the three call sites that don't
already hold it:

  * bond_enslave() (rtnl held; core drops the lower's ops lock
    around ->ndo_add_slave).
  * bond_miimon_commit() (rtnl_trylock'd from the mii workqueue).
  * bond_ethtool_get_link_ksettings() (rtnl held via ethtool layer,
    bond device itself is not ops locked).

The call site which does already hold the ops lock is
bond_slave_netdev_event() via NETDEV_UP / NETDEV_CHANGE notifiers,
so it stays as-is.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/bonding/bond_main.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 82e779f7916b..0bcab797e468 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -787,6 +787,10 @@ int bond_set_carrier(struct bonding *bond)
  * values are invalid, set speed and duplex to -1,
  * and return. Return 1 if speed or duplex settings are
  * UNKNOWN; 0 otherwise.
+ *
+ * Caller must hold the slave's netdev ops lock. The notifier path
+ * (bond_netdev_event NETDEV_CHANGE/UP) reaches us with the slave's ops
+ * lock held; other call sites take it explicitly.
  */
 static int bond_update_speed_duplex(struct slave *slave)
 {
@@ -794,7 +798,7 @@ static int bond_update_speed_duplex(struct slave *slave)
 	struct ethtool_link_ksettings ecmd;
 	int res;
 
-	res = __ethtool_get_link_ksettings(slave_dev, &ecmd);
+	res = netif_get_link_ksettings(slave_dev, &ecmd);
 	if (res < 0)
 		goto speed_duplex_unknown;
 	if (ecmd.base.speed == 0 || ecmd.base.speed == ((__u32)-1))
@@ -2112,8 +2116,10 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	new_slave->delay = 0;
 	new_slave->link_failure_count = 0;
 
-	if (bond_update_speed_duplex(new_slave) &&
-	    bond_needs_speed_duplex(bond))
+	netdev_lock_ops(slave_dev);
+	res = bond_update_speed_duplex(new_slave);
+	netdev_unlock_ops(slave_dev);
+	if (res && bond_needs_speed_duplex(bond))
 		new_slave->link = BOND_LINK_DOWN;
 
 	new_slave->last_rx = jiffies -
@@ -2780,6 +2786,7 @@ static void bond_miimon_commit(struct bonding *bond)
 	struct slave *slave, *primary, *active;
 	bool do_failover = false;
 	struct list_head *iter;
+	int err;
 
 	ASSERT_RTNL();
 
@@ -2798,8 +2805,10 @@ static void bond_miimon_commit(struct bonding *bond)
 			continue;
 
 		case BOND_LINK_UP:
-			if (bond_update_speed_duplex(slave) &&
-			    bond_needs_speed_duplex(bond)) {
+			netdev_lock_ops(slave->dev);
+			err = bond_update_speed_duplex(slave);
+			netdev_unlock_ops(slave->dev);
+			if (err && bond_needs_speed_duplex(bond)) {
 				slave->link = BOND_LINK_DOWN;
 				if (net_ratelimit())
 					slave_warn(bond->dev, slave->dev,
@@ -5861,7 +5870,9 @@ static int bond_ethtool_get_link_ksettings(struct net_device *bond_dev,
 	 */
 	bond_for_each_slave(bond, slave, iter) {
 		if (bond_slave_can_tx(slave)) {
+			netdev_lock_ops(slave->dev);
 			bond_update_speed_duplex(slave);
+			netdev_unlock_ops(slave->dev);
 			if (slave->speed != SPEED_UNKNOWN) {
 				if (BOND_MODE(bond) == BOND_MODE_BROADCAST)
 					speed = bond_mode_bcast_speed(slave,
-- 
2.54.0

