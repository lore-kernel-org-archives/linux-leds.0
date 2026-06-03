Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E172E7377;
	Wed,  3 Jun 2026 01:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450129; cv=none; b=ad6TiwKYxWqHauyzH/AW+Su0rip/Yg6XhnncHSD5UWuVbBVrKXjYLBu7hguIygDGhCK87ClArPh5krQ/xrV6ZQaJeoCYvLcNIgWkHwak/dAul1fvV4xJG1UZaL/75uhYmvhBU8GVENC3X8IjbA0t9CQwP7Z1ElxJyJl6tWFzTcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450129; c=relaxed/simple;
	bh=dEGFOYjO4S1JkPj3GKMQH/aL0Vk5M8CzYuezgWewo1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0cErFDreDFfQU2pyXcHgIbNitq/BUq/huoQHL5J+2e1MYcI9Xb9nCUsoMMcFU6AAXGkMf2TSvxA9sYV8qRFUATx6NRxXT/SdykvJWjm6TXDZZpJlc8JyD38NWZt4u/tyQ2yy/1qmFI3HakoO+1mWCLVROJtVWcrEooIalA8ckA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT4qpd3u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT4qpd3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766821F00893;
	Wed,  3 Jun 2026 01:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450128;
	bh=hWkDGQ/3/sU3GIemiXrKZ3F/RMQcnTg11+gRqtyKsSE=;
	h=From:To:Cc:Subject:Date;
	b=iT4qpd3uUjw7fyicosVo1rE3HKc1VyVupRYMom6rp401HNzopqFNyawExs22tlboG
	 x6Xt6rcs28bjYup/cUr97Gxxac0BLeJgh5yTxwMLXvL0NGLrIa2DKipQJ/UWJBzQO2
	 92E/yVbUmBlZAAuegce26uD3uxk+94OSGgaCbDf5L6vhi0y8tP+XjVJz2N5PsTyNOJ
	 Wsl0V8YnnngiVqhlnWt1pplkgFP4YHsmLtT6lFMqtuxwSdiBqfWuh03dc4jR08xbyO
	 Jr/cDO0pEQNX8pUqcoWV2D0VxXfopCWLSDrNqucU20XHyOcPtiyBvsTAydZ3AJfHgn
	 dyHVFe+a2P2+w==
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
Subject: [PATCH net-next v2 00/11] net: ethtool: make sure __ethtool_get_link_ksettings() is ops-locked
Date: Tue,  2 Jun 2026 18:28:29 -0700
Message-ID: <20260603012840.2254293-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is prep for the series which will make most of the ethtool ops
run without rtnl_lock. The AI bots surfaced a number of callers of
__ethtool_get_link_ksettings() which need fixing, so I decided to
send that as a smaller prep-series. Each driver changed separately
for ease of review.

Full series unlocking ethtool ops AKA v1:: 
https://lore.kernel.org/20260528231637.251822-1-kuba@kernel.org

Jakub Kicinski (11):
  net: rename netdev_ops_assert_locked()
  net: ethtool: cmis_cdb: hold instance lock for ops locked devices
  net: document NETDEV_CHANGENAME as ops locked
  net: ethtool: add netif_get_link_ksettings() for correct ops-locked
    use
  net: bonding: don't recurse on the slave's netdev ops lock
  net: team: don't recurse on the port's netdev ops lock
  net: bridge: don't recurse on the port's netdev ops lock
  net: sched: don't recurse on the netdev ops lock in qdiscs
  leds: trigger: netdev: don't recurse on the netdev ops lock
  scsi: fcoe: don't recurse on the netdev's ops lock
  net: ethtool: make sure __ethtool_get_link_ksettings() is ops-locked

 Documentation/networking/netdevices.rst   |  1 +
 include/linux/ethtool.h                   |  2 ++
 include/net/netdev_lock.h                 | 12 ++++++--
 drivers/leds/trigger/ledtrig-netdev.c     | 37 +++++++++++++----------
 drivers/net/bonding/bond_main.c           | 21 ++++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c |  2 +-
 drivers/net/team/team_core.c              |  4 ++-
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c         |  3 ++
 drivers/scsi/fcoe/fcoe.c                  |  6 ++--
 drivers/scsi/fcoe/fcoe_transport.c        |  4 ++-
 net/bridge/br_if.c                        |  7 +++--
 net/core/dev.c                            | 26 ++++++++--------
 net/core/dev_addr_lists.c                 |  2 +-
 net/core/link_watch.c                     |  2 +-
 net/core/lock_debug.c                     |  3 +-
 net/core/netdev_queues.c                  |  2 +-
 net/ethtool/cmis_cdb.c                    |  3 ++
 net/ethtool/cmis_fw_update.c              |  8 ++---
 net/ethtool/ioctl.c                       | 21 +++++++++++--
 net/ethtool/linkinfo.c                    |  4 +--
 net/ethtool/linkmodes.c                   |  4 +--
 net/ethtool/module.c                      |  2 ++
 net/ethtool/netlink.c                     |  4 +--
 net/ipv6/addrconf.c                       |  2 +-
 net/sched/sch_cbs.c                       |  2 +-
 net/sched/sch_taprio.c                    |  2 +-
 net/xdp/xsk_buff_pool.c                   |  2 +-
 27 files changed, 121 insertions(+), 67 deletions(-)

-- 
2.54.0

