Received: from qmail.kvaser.se (static-195-22-86-94.cust.tele2.se [195.22.86.94])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88DC390981;
	Tue,  6 Oct 2026 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.22.86.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269579; cv=none; b=ZW5bEQkOdPgXY2QzHKygEjrstIhCkdg+hE07vqJ768pFVPbaF3xhTIYb0o7Ozr2Hb4LT0uD5CYU2Kw/vMrTX1qiEGKXQtPLV9sKSfHG6RUY0LVnwBILqXFBjTayRiXcd14epbVbME1yJuf2TQ9ExC4OrK8tuBGHtmzyUzccw6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269579; c=relaxed/simple;
	bh=J8+6rIGLErPljvj6gVJ8DhsceoxHGriCDvswLriWPaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQLLkEayqRilLhyudrwby8maBcyn7c6Rq0ywMaykO2qnLXxaQM6Szf7/lmQfrYUd0bF+oi8flkrpY0p0RBav7ZjR2bynQGjYx7ILWlSPvx2jK9zVLoe5KAa4fN//C2TSVRXxntuarARz4P0CxHwIIlO9MjsTKXNuG5CsiEGk+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kvaser.com; spf=pass smtp.mailfrom=kvaser.com; dkim=pass (2048-bit key) header.d=kvaser.com header.i=@kvaser.com header.b=TUm23LAz; arc=none smtp.client-ip=195.22.86.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kvaser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kvaser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kvaser.com header.i=@kvaser.com header.b="TUm23LAz"
Received: from larsgullin.kvaser.se (larsgullin.kvaser.se [10.0.3.101])
	by qmail.kvaser.se (Postfix) with ESMTP id 0E0C0E3016;
	Tue,  6 Oct 2026 08:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kvaser.com; s=qmail;
	t=1791269202; bh=J8+6rIGLErPljvj6gVJ8DhsceoxHGriCDvswLriWPaE=;
	h=From:To:Cc:Subject:Date:From;
	b=TUm23LAzrK9S7Q57GJO1E/ahMJ+dk2Rd9SLbQVOIKg9dZcn729BQHn67zNusas4rv
	 5/zcchEbCX+zMyuQnXMtxFyfVCsm1a/yukzw/0Mpn+6h+x0zqcka7foVvDxSSLtTzX
	 3qmxYxcGSxBJpCXEwKkmrXLo0WRKvPy1IvSmH1ZygdS9KO8gkMapF5dryewTZh8kz2
	 jye8GyOvqwDtwQrCQtWAPpcEUJVVQJH/vcJ9rI2PL4MI9OXwWaXQFWo4PhrUP+oAdz
	 Zjy3HvaWtYJooiCKO83GtSQpwvO5TiGz0dCnqv/dyZIA+LebN/oXymrpDtBHqeF+3T
	 HXV97sZZN+pMg==
From: Marcus Flyckt <marcus.flyckt@kvaser.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcus Flyckt <marcus.flyckt@kvaser.com>,
	Jimmy Assarsson <extja@kvaser.com>
Subject: [PATCH v2] leds: trigger: netdev: Support devices in other network namespaces
Date: Tue,  6 Oct 2026 08:46:03 +0200
Message-ID: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdev LED trigger currently cannot resolve a network device that
has been moved into another network namespace.

For example:

  ip link add vm1 type veth peer vm2
  tools/leds/uledmon test:green:netdev &

  echo netdev > /sys/class/leds/test:green:netdev/trigger
  echo 1 > /sys/class/leds/test:green:netdev/link

  ip netns add ledns
  ip link set vm2 netns ledns
  ip netns exec ledns \
          sh -c 'echo vm2 > /sys/class/leds/test:green:netdev/device_name'

Before this change, the lookup fails because it is always performed in
the initial network namespace.

Resolve the device name in the network namespace of the task writing
device_name. Once resolved, follow the device through renames and
network namespace moves.

With the example above, bringing both ends up makes the LED reflect the
link state of vm2:

  ip link set vm1 up
  ip netns exec ledns ip link set vm2 up

A possibly confusing aspect of this change is that the feature uses the
global LED sysfs interface, which is not network namespace aware. The
namespace is therefore effectively selected by the task that last wrote
device_name.

Signed-off-by: Marcus Flyckt <marcus.flyckt@kvaser.com>
Reviewed-by: Jimmy Assarsson <extja@kvaser.com>
Tested-by: Jimmy Assarsson <extja@kvaser.com>
---
Changes in v2:
- Instead of taking a reference to a network namespace, use net_cookie
- Include used headers explicitly
- Use C-style comments

 drivers/leds/trigger/ledtrig-netdev.c | 50 +++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b0132484594..16357d45b3cd 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -22,10 +22,13 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/nsproxy.h>
 #include <linux/mutex.h>
 #include <linux/phy.h>
 #include <linux/rtnetlink.h>
+#include <linux/string.h>
 #include <linux/timer.h>
+#include <net/net_namespace.h>
 #include <net/netdev_lock.h>
 #include "../leds.h"
 
@@ -64,6 +67,8 @@ struct led_netdev_data {
 	struct led_classdev *led_cdev;
 	struct net_device *net_dev;
 
+	/* net namespace cookie associated with device_name */
+	u64 net_cookie;
 	char device_name[IFNAMSIZ];
 	atomic_t interval;
 	unsigned int last_activity;
@@ -274,7 +279,7 @@ static ssize_t device_name_show(struct device *dev,
 }
 
 static int set_device_name(struct led_netdev_data *trigger_data,
-			   const char *name, size_t size)
+			   struct net *net, const char *name, size_t size)
 {
 	struct net_device *new_dev = NULL;
 	char device_name[IFNAMSIZ];
@@ -294,9 +299,12 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	 */
 	rtnl_lock();
 	if (device_name[0]) {
-		new_dev = dev_get_by_name(&init_net, device_name);
+		trigger_data->net_cookie = net->net_cookie;
+		new_dev = dev_get_by_name(net, device_name);
 		if (new_dev)
 			netdev_lock_ops(new_dev);
+	} else {
+		trigger_data->net_cookie = 0;
 	}
 	mutex_lock(&trigger_data->lock);
 
@@ -331,7 +339,8 @@ static ssize_t device_name_store(struct device *dev,
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	int ret;
 
-	ret = set_device_name(trigger_data, buf, size);
+	ret = set_device_name(trigger_data, current->nsproxy->net_ns, buf,
+			      size);
 
 	if (ret < 0)
 		return ret;
@@ -616,15 +625,24 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		container_of(nb, struct led_netdev_data, notifier);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
 
-	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
-	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
-	    && evt != NETDEV_CHANGENAME)
+	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE &&
+	    evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER &&
+	    evt != NETDEV_CHANGENAME)
 		return NOTIFY_DONE;
 
-	if (!(dev == trigger_data->net_dev ||
-	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
-	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
-		return NOTIFY_DONE;
+	if (trigger_data->net_dev) {
+		if (dev != trigger_data->net_dev)
+			return NOTIFY_DONE;
+		/* Ignore namespace transfers */
+		if (evt == NETDEV_UNREGISTER &&
+		    dev->reg_state != NETREG_UNREGISTERING)
+			return NOTIFY_DONE;
+	} else {
+		if ((evt != NETDEV_REGISTER && evt != NETDEV_CHANGENAME) ||
+		    dev_net(dev)->net_cookie != trigger_data->net_cookie ||
+		    strcmp(dev->name, trigger_data->device_name) != 0)
+			return NOTIFY_DONE;
+	}
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
@@ -636,9 +654,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
 	switch (evt) {
 	case NETDEV_CHANGENAME:
 	case NETDEV_REGISTER:
-		dev_put(trigger_data->net_dev);
-		dev_hold(dev);
-		trigger_data->net_dev = dev;
+		if (!trigger_data->net_dev) {
+			dev_hold(dev);
+			trigger_data->net_dev = dev;
+		}
+		trigger_data->net_cookie = dev_net(dev)->net_cookie;
+		strscpy(trigger_data->device_name, dev->name, IFNAMSIZ);
 		if (evt == NETDEV_CHANGENAME)
 			get_device_state(trigger_data);
 		break;
@@ -765,7 +786,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 			const char *name = dev_name(dev);
 
 			trigger_data->hw_control = true;
-			set_device_name(trigger_data, name, strlen(name));
+			set_device_name(trigger_data, dev_net(to_net_dev(dev)),
+					name, strlen(name));
 
 			rc = led_cdev->hw_control_get(led_cdev, &mode);
 			if (!rc)
-- 
2.43.0

