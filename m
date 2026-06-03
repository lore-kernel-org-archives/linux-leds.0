Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326E34E75A;
	Wed,  3 Jun 2026 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450139; cv=none; b=QTANisKoXxqsFmoXUu1lqHbIjdeN0IZO3xY9GpQViJLJp79PDPRuHi6IMwoMmRek94YQGfzZxzGM1HOdFHyxy4NE9HssU2d4lYdNc5nvTeQ5UIS6tom9bbwtpECgbFMwjP+8wiSU6sbo3bU5nzvXLL8V5hZ2cqgNtMdEyr7I4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450139; c=relaxed/simple;
	bh=WobPN4Fh9dakInubHkHBBcWRNGUXgwzSaoFi1ZT/nZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYzPZFNFaKYnl0dU/ZYl3/AnSI5y3LbRc9J7F/sKS3gEDUTxLrVtPqYhVhSeIXwPt4m+f1hYp/fa5uNCpPfyU+njztuxwob569TXwtZPVf9ALjEaMTuh0JUglGI6mJTmhAPS7NZq0/tJgZKQPexcEirhfNMq54YYzHDmRf+Q8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0V2OPzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0V2OPzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1751A1F00898;
	Wed,  3 Jun 2026 01:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450138;
	bh=gjqzsK+rZOS9EFWpGBJWI2Q6g+KJXfazcg5mnpADFAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X0V2OPzkQk+MiV8Zamj0i0YZFPVA5lsC3h7A/p0dyjUg/3p9IutFoqvjsArHi5WXX
	 tf52BwAryKcGVIcTBbMF54GMaUnJVyJe4lEY4+jtGFZVmKrZcXEX0DU3qbNWy00SZ8
	 YKOOFhTFe/8bRdj3zSTI0K88Ngbfk3tzK2D+H0/IwR66qBvA/ZmjXouYv86Br5/53O
	 Vffk/2RGeJEKoasJVINEHQAfIGx+V2IHZRUBeNSs3ILLNuSbsQGRocfvYChUVqw8yc
	 BkYKNsoUpW5ZZjr/eoBhkkSIGaMDsNhNjZcz5LB6mOJWttHp1NasrMkBaNvFbcNgbb
	 /DCmoIcdtyvmg==
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
Subject: [PATCH net-next v2 08/11] net: sched: don't recurse on the netdev ops lock in qdiscs
Date: Tue,  2 Jun 2026 18:28:37 -0700
Message-ID: <20260603012840.2254293-9-kuba@kernel.org>
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

cbs_set_port_rate() and taprio_set_picos_per_byte() are reached from
two paths and both already hold the device's ops lock:

 *_change(), via tc_modify_qdisc() which calls netdev_lock_ops(dev)
    before dispatching to the qdisc ops.

 *_dev_notifier() on NETDEV_UP / NETDEV_CHANGE, where caller
    holds the ops lock across the notifier chain.

Switch to netif_get_link_ksettings() to avoid deadlock once
__ethtool_get_link_ksettings() starts taking the netdev lock.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/sched/sch_cbs.c    | 2 +-
 net/sched/sch_taprio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index b952353ec2a5..85b41ffc63ff 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -327,7 +327,7 @@ static void cbs_set_port_rate(struct net_device *dev, struct cbs_sched_data *q)
 	s64 port_rate;
 	int err;
 
-	err = __ethtool_get_link_ksettings(dev, &ecmd);
+	err = netif_get_link_ksettings(dev, &ecmd);
 	if (err < 0)
 		goto skip;
 
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index d6b981e5df11..e83cbce62a54 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -1299,7 +1299,7 @@ static void taprio_set_picos_per_byte(struct net_device *dev,
 	int picos_per_byte;
 	int err;
 
-	err = __ethtool_get_link_ksettings(dev, &ecmd);
+	err = netif_get_link_ksettings(dev, &ecmd);
 	if (err < 0)
 		goto skip;
 
-- 
2.54.0

