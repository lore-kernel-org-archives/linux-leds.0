Received: from qmail.kvaser.se (static-195-22-86-94.cust.tele2.se [195.22.86.94])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1B54D37A2
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.22.86.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603823; cv=none; b=derfS9rxZZetIwqdv4P+R2g/JoNVuSRYqLZHJXT7Sn66ZJ9gOcOVMYttT0YkAiRFy5JjKfwovB5Y9q/08SV1Ne0NqbQjevLYGwQcgcmwx/N2bK9a7TuV/ywoea3u1VQiXivsEOp55n2qwbckwzFnGda1fFaF0i45lsjmTwN2TSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603823; c=relaxed/simple;
	bh=FvZHZxB4lQlcQcP2OL5ZW+hAOPglJFtrRTIJZRi+8CE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PK1CEutaIEe34IAxndWIKf6GBwtkjv4ri5laLH9zSHud7FgLB5ShiqR7yljCovURzDD41U/8qFT3Ga+pkpbgTntw99uwAf1wLBN1yKbmp2T0nuL1eUCfom+31ZE8EUUndAGl2kFuLJEmJ4OUbeZKNxICG0D2Nby4Egz0F3mXMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kvaser.com; spf=pass smtp.mailfrom=kvaser.com; dkim=pass (2048-bit key) header.d=kvaser.com header.i=@kvaser.com header.b=cRFVi+VZ; arc=none smtp.client-ip=195.22.86.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kvaser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kvaser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kvaser.com header.i=@kvaser.com header.b="cRFVi+VZ"
Received: from larsgullin.kvaser.se (larsgullin.kvaser.se [10.0.3.101])
	by qmail.kvaser.se (Postfix) with ESMTP id 7BF6CE3016;
	Mon, 28 Sep 2026 15:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kvaser.com; s=qmail;
	t=1790603510; bh=FvZHZxB4lQlcQcP2OL5ZW+hAOPglJFtrRTIJZRi+8CE=;
	h=From:To:Cc:Subject:Date:From;
	b=cRFVi+VZWnJMB/68S8vmd+8CVDwcAF0fbu+3yg/1ZIXFvm2Af+gjRzQDC8wymxKky
	 X+2qqaB7WhMnLreafE/LQsMnXz53xdujsSbTabCMeHuwUzrG6IHw6Hczr9s3jv/OPO
	 kso68i7OMYFIo4N55ejHkEp9UmG+xYSgUHRyOFsxF+XV6AWkgiVfJ9IUNZEhQXwIiR
	 DK+4p0/vUqTJQIJmZsR5HiX0ogKice0v587ZyBsh5J3mRx8FodPCyMGGGvvsDeSTqe
	 ybKg0qKX2juZ25p+aFeFQ64H3f5X/I+MHXvlK3eptz6go5dgu6NwmxrUfD8eiHruCZ
	 RGltpjC3OJPhQ==
From: Marcus Flyckt <marcus.flyckt@kvaser.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Marcus Flyckt <marcus.flyckt@kvaser.com>
Subject: [RFC PATCH] leds: trigger: netdev: Support devices in other network namespaces
Date: Mon, 28 Sep 2026 15:51:30 +0200
Message-ID: <20260928135130.1131749-1-marcus.flyckt@kvaser.com>
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
---
 drivers/leds/trigger/ledtrig-netdev.c | 73 ++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b0132484594..c60159f777e7 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -64,6 +64,8 @@ struct led_netdev_data {
 	struct led_classdev *led_cdev;
 	struct net_device *net_dev;
 
+	// net namespace associated with device_name
+	struct net *ns;
 	char device_name[IFNAMSIZ];
 	atomic_t interval;
 	unsigned int last_activity;
@@ -274,8 +276,9 @@ static ssize_t device_name_show(struct device *dev,
 }
 
 static int set_device_name(struct led_netdev_data *trigger_data,
-			   const char *name, size_t size)
+			   struct net *net, const char *name, size_t size)
 {
+	struct net *old_net;
 	struct net_device *new_dev = NULL;
 	char device_name[IFNAMSIZ];
 
@@ -293,10 +296,14 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	 * Lock order: rtnl_lock -> netdev instance lock -> trigger_data lock.
 	 */
 	rtnl_lock();
+	old_net = trigger_data->ns;
 	if (device_name[0]) {
-		new_dev = dev_get_by_name(&init_net, device_name);
+		trigger_data->ns = get_net(net);
+		new_dev = dev_get_by_name(trigger_data->ns, device_name);
 		if (new_dev)
 			netdev_lock_ops(new_dev);
+	} else {
+		trigger_data->ns = NULL;
 	}
 	mutex_lock(&trigger_data->lock);
 
@@ -319,6 +326,8 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	mutex_unlock(&trigger_data->lock);
 	if (new_dev)
 		netdev_unlock_ops(new_dev);
+	if (old_net)
+		put_net(old_net);
 	rtnl_unlock();
 
 	return 0;
@@ -331,7 +340,8 @@ static ssize_t device_name_store(struct device *dev,
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	int ret;
 
-	ret = set_device_name(trigger_data, buf, size);
+	ret = set_device_name(trigger_data, current->nsproxy->net_ns, buf,
+			      size);
 
 	if (ret < 0)
 		return ret;
@@ -616,15 +626,24 @@ static int netdev_trig_notify(struct notifier_block *nb,
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
+		// Ignore namespace transfers
+		if (evt == NETDEV_UNREGISTER &&
+		    dev->reg_state != NETREG_UNREGISTERING)
+			return NOTIFY_DONE;
+	} else {
+		if ((evt != NETDEV_REGISTER && evt != NETDEV_CHANGENAME) ||
+		    dev_net(dev) != trigger_data->ns ||
+		    strcmp(dev->name, trigger_data->device_name) != 0)
+			return NOTIFY_DONE;
+	}
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
@@ -635,12 +654,25 @@ static int netdev_trig_notify(struct notifier_block *nb,
 	trigger_data->duplex = DUPLEX_UNKNOWN;
 	switch (evt) {
 	case NETDEV_CHANGENAME:
+		if (!trigger_data->net_dev) {
+			dev_hold(dev);
+			trigger_data->net_dev = dev;
+		}
+		strscpy(trigger_data->device_name, dev->name, IFNAMSIZ);
+		get_device_state(trigger_data);
+		break;
 	case NETDEV_REGISTER:
-		dev_put(trigger_data->net_dev);
-		dev_hold(dev);
-		trigger_data->net_dev = dev;
-		if (evt == NETDEV_CHANGENAME)
-			get_device_state(trigger_data);
+		if (!trigger_data->net_dev) {
+			dev_hold(dev);
+			trigger_data->net_dev = dev;
+		}
+		if (trigger_data->ns != dev_net(dev)) {
+			struct net *old_net = trigger_data->ns;
+
+			trigger_data->ns = get_net(dev_net(dev));
+			put_net(old_net);
+		}
+		strscpy(trigger_data->device_name, dev->name, IFNAMSIZ);
 		break;
 	case NETDEV_UNREGISTER:
 		dev_put(trigger_data->net_dev);
@@ -765,7 +797,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 			const char *name = dev_name(dev);
 
 			trigger_data->hw_control = true;
-			set_device_name(trigger_data, name, strlen(name));
+			set_device_name(trigger_data, dev_net(to_net_dev(dev)),
+					name, strlen(name));
 
 			rc = led_cdev->hw_control_get(led_cdev, &mode);
 			if (!rc)
@@ -776,8 +809,11 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 	led_set_trigger_data(led_cdev, trigger_data);
 
 	rc = register_netdevice_notifier(&trigger_data->notifier);
-	if (rc)
+	if (rc) {
+		if (trigger_data->ns)
+			put_net(trigger_data->ns);
 		kfree(trigger_data);
+	}
 
 	return rc;
 }
@@ -792,6 +828,9 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 
 	dev_put(trigger_data->net_dev);
 
+	if (trigger_data->ns)
+		put_net(trigger_data->ns);
+
 	kfree(trigger_data);
 }
 
-- 
2.43.0

