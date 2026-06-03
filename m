Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD972E7377;
	Wed,  3 Jun 2026 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450140; cv=none; b=u/o6JQHHYU/8AnDhNJzAQFhKqWYOsFEJawkqQvLu7u6xO16pmid2NgyE6RRWZPmrKE9ZEZEX/EhgSZrvelAwKBB/JSIhDqg8n8DdrGB3hpXuaYRjJV8vnkWALEJu0ML9tcnZjPgfUioVtfY/kkNh6oj4rd7RY0FaIZvcDu359R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450140; c=relaxed/simple;
	bh=uYYflT8mnN1hoMAyawnvcRfKJoXPBQo0uO5HMaZM2/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZJ1qhALUrDQ9G0OsNG1f5qIG6WzPvkTPE+hRUwltcdvqwrLHVfhNcBUlt0Ppl8VE8WcfRcOkqYBsCKGQgP/b0OhVQAmqVRRxAZwVd29daCacSHFHC9p9BXidUobzOWkwPNRjmEgIMVjTDj09qbbsQfrV9tfQwwMERq0FKJsiJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoKVJ1Tu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoKVJ1Tu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369171F0089B;
	Wed,  3 Jun 2026 01:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450139;
	bh=EFlH32MOyerweymAlqSL3p78mdmC5oox7RKrhCgBChc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RoKVJ1TuFGZgdgVSJCcw8Z13qlYPOlVFfCAy3Q0jHSIeAqxEcGBTeH1cZNUPZwXzG
	 j8dAacARHIwNKLHO54PsHI6M9jZ9IcKRZjkaOuAUvVpRdrVEwylpOAXwg5QL06rVYI
	 JcIgsSeTf4xg/7DJIOTISXVQ234mNmXlkTUt74aGMJA1aG4u7slwWO530gOQRpj9S1
	 nfJNM15lnZTGaU7Al9DRABJdHvk7VIGTxmpmW1bpNjD6NsfyOOoHk8bgtChbatKJx7
	 ajauYAMLHkzTT5Bf/zsnNhhbMsh+FrbLV63jrGGa5154bumlMd8FAi8EClltnT0p/c
	 yOIgUVjSQDL5A==
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
Subject: [PATCH net-next v2 09/11] leds: trigger: netdev: don't recurse on the netdev ops lock
Date: Tue,  2 Jun 2026 18:28:38 -0700
Message-ID: <20260603012840.2254293-10-kuba@kernel.org>
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

get_device_state() calls __ethtool_get_link_ksettings() on the trigger's
netdev, which will soon take the dev's ops lock. Three of its callers
already hold that lock and one doesn't, so the function would either
deadlock or run unprotected depending on the path.

Make get_device_state() expect the dev's ops lock held and switch to
netif_get_link_ksettings():

  * netdev_trig_notify() NETDEV_UP / NETDEV_CHANGE / NETDEV_CHANGENAME
    arrive with the dev's ops lock held (per netdevices.rst).
  * set_device_name() does not hold the lock, take it explicitly.

Due to lock ordering we need to reshuffle the code in set_device_name()
a little bit. We need to find the device earlier on, so that we can
lock it before we take trigger_data->lock.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/leds/trigger/ledtrig-netdev.c | 37 +++++++++++++++------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 12cb3311ea22..64c078e997f2 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -26,6 +26,7 @@
 #include <linux/phy.h>
 #include <linux/rtnetlink.h>
 #include <linux/timer.h>
+#include <net/netdev_lock.h>
 #include "../leds.h"
 
 #define NETDEV_LED_DEFAULT_INTERVAL	50
@@ -228,7 +229,7 @@ static void get_device_state(struct led_netdev_data *trigger_data)
 
 	trigger_data->carrier_link_up = netif_carrier_ok(trigger_data->net_dev);
 
-	if (__ethtool_get_link_ksettings(trigger_data->net_dev, &cmd))
+	if (netif_get_link_ksettings(trigger_data->net_dev, &cmd))
 		return;
 
 	if (trigger_data->carrier_link_up) {
@@ -259,31 +260,33 @@ static ssize_t device_name_show(struct device *dev,
 static int set_device_name(struct led_netdev_data *trigger_data,
 			   const char *name, size_t size)
 {
+	struct net_device *new_dev = NULL;
+	char device_name[IFNAMSIZ];
+
 	if (size >= IFNAMSIZ)
 		return -EINVAL;
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
+	memcpy(device_name, name, size);
+	device_name[size] = 0;
+	if (size > 0 && device_name[size - 1] == '\n')
+		device_name[size - 1] = 0;
+
 	/*
-	 * Take RTNL lock before trigger_data lock to prevent potential
-	 * deadlock with netdev notifier registration.
+	 * Lock order: rtnl_lock -> netdev instance lock -> trigger_data lock.
 	 */
 	rtnl_lock();
+	if (device_name[0]) {
+		new_dev = dev_get_by_name(&init_net, device_name);
+		if (new_dev)
+			netdev_lock_ops(new_dev);
+	}
 	mutex_lock(&trigger_data->lock);
 
-	if (trigger_data->net_dev) {
-		dev_put(trigger_data->net_dev);
-		trigger_data->net_dev = NULL;
-	}
-
-	memcpy(trigger_data->device_name, name, size);
-	trigger_data->device_name[size] = 0;
-	if (size > 0 && trigger_data->device_name[size - 1] == '\n')
-		trigger_data->device_name[size - 1] = 0;
-
-	if (trigger_data->device_name[0] != 0)
-		trigger_data->net_dev =
-		    dev_get_by_name(&init_net, trigger_data->device_name);
+	dev_put(trigger_data->net_dev);
+	trigger_data->net_dev = new_dev;
+	strscpy(trigger_data->device_name, device_name);
 
 	trigger_data->carrier_link_up = false;
 	trigger_data->link_speed = SPEED_UNKNOWN;
@@ -298,6 +301,8 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 		set_baseline_state(trigger_data);
 
 	mutex_unlock(&trigger_data->lock);
+	if (new_dev)
+		netdev_unlock_ops(new_dev);
 	rtnl_unlock();
 
 	return 0;
-- 
2.54.0

