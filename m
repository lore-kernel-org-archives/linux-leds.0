Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374846C4AA
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392267; cv=none; b=H8CTMx0vz5OyA2E/HLTgf3n2JWKPM83Zt0HGTz/cgG82mouTVQUMX+ZjK1dO6sq6Q4zietN8I+5Y7Z07QLGPKmdH1tpJJHK3zeQYL9NJyQ1T45I+hw6fqwFaeKpCtyqt18k0pWR//grHs8Md/QGXww9BkViN84MSUHA8fccGWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392267; c=relaxed/simple;
	bh=HF/vcKA7wASTsFXFodiZsG3sqWtBqytFhS1ZbjKiv3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhz+Njaw+hvyJd358bDi6Dp7QEFCzqxJtUfh0Fzk/q5tSYA+ipqboX6KsMeeNIBYqugbobhKDKqmekqGpXUKGZAZY2EzVV2PZOwbnsd6VvI9mCOMyTDlvkxMdFZZ1MJ9pgDW6iguLjpb1cZZ1jX2DWCUYtUpTRtxEWXhZVf6fEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=LJMQm/cO; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="LJMQm/cO"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260914132413a0b527a9d80002070a
        for <linux-leds@vger.kernel.org>;
        Mon, 14 Sep 2026 15:24:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+ugNVkCh+thTQLmrHDUIY7tRStnooESAPRePSBpl0mM=;
 b=LJMQm/cOMZCwrFFkRP5GTa6kcWd9Jj0Dv1mopP1qK3DH8YhUKFMRFEep/I7AC/pAh9p5Nk
 bpKbCfoxgNEdjWuXg3aivoZM2SM/3iPvFAqR7RBntVY9P7B5Xmwl7RGzba3e1Om8HeRfX0Ut
 Mnyc6brc47G9Jxas1ly9fwWIaZZmumLdEDYPF2M91daNIMNHH5TZ9cdrqdB9r4nRzk3LP7BS
 KizixWUXehFZhlbiDhdlWglPoBqhXsymG6fE0YJ8c9K+yUaUko5WXbG++bCbz64AbsL40J1W
 sCh2hRR9AVrBANWOaeqw9km8AbQn6pwwak4bcBdNdLMIDJUa8NdKzpow==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] leds: trigger: netdev: fix sysfs_update_group() vs led_trigger_set() races
Date: Mon, 14 Sep 2026 15:23:51 +0200
Message-ID: <20260914132356.807004-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The netdev LED trigger calls sysfs_update_group() to refresh link_speed
attribute visibility on NETDEV_CHANGE events and device_name writes.  The
link_speed attribute group was listed in netdev_led_trigger.groups, so it
was also created and destroyed by the LED core via device_add_groups() /
device_remove_groups() in led_trigger_set(), which runs under
trigger_lock(W).  These two owners of the same group share no lock and are
not serialized against each other.

This was observed as a "cannot create duplicate filename" sysfs splat
during boot when the netdev trigger is re-armed while PHY link-up events
are being delivered concurrently:

  sysfs: cannot create duplicate filename '...green:lan/link_10'
  ...
  led_trigger_set
  led_trigger_write

Race 1: activate() vs NETDEV_CHANGE (confirmed with reproducer)

    CPU 0 (led_trigger_set)              CPU 1 (linkwatch workqueue)
    -----------------------              ---------------------------
    [holds trigger_lock(W)]
    activate():
      register_netdevice_notifier()
      <- returns
                                         netdev_trig_notify(NETDEV_CHANGE):
                                           sysfs_update_group()
                                             creates "link_10"
    device_add_groups()
      creates "link_10" <- EEXIST!

Race 2: device_remove_groups() vs NETDEV_CHANGE

    CPU 0 (led_trigger_set)              CPU 1 (linkwatch workqueue)
    -----------------------              ---------------------------
    [holds trigger_lock(W)]
    device_remove_groups()
      removes "link_10"
                                         netdev_trig_notify(NETDEV_CHANGE):
                                           sysfs_update_group()
                                             creates "link_10" <- ORPHANED
    deactivate()
      kfree(trigger_data) <- UAF via orphaned sysfs files

Serializing the trigger's sysfs_update_group() against the core under
trigger_lock is not viable: NETDEV_CHANGE is delivered from linkwatch with
rtnl_mutex held, whereas led_trigger_set() holds trigger_lock(W) and then
takes rtnl_mutex via activate() -> set_device_name().  Acquiring
trigger_lock from the NETDEV_CHANGE handler would invert that order and
deadlock.

Fix it by construction instead: drop the link_speed group from
netdev_led_trigger.groups and let the trigger own its lifecycle.  Create
it with sysfs_create_group() in activate() (before registering the
notifier) and remove it with sysfs_remove_group() in deactivate() (after
unregistering the notifier).  The LED core therefore never touches this
group, so sysfs_update_group() can no longer collide with
device_add_groups() / device_remove_groups() -- eliminating both races
above without taking trigger_lock, and hence without the rtnl_mutex
inversion.

The only remaining concurrency -- device_name_store() and
netdev_trig_notify() both calling sysfs_update_group() on the now
trigger-owned group -- stays serialized by trigger_data->lock.  Creating
the group before notifier registration and removing it after notifier
unregistration guarantees that no sysfs_update_group() can run while the
group is being created or destroyed.

Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link speed attribute")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 49 +++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 354d3b640fa53..89b48c522c227 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -337,9 +337,10 @@ static ssize_t device_name_store(struct device *dev,
 		return ret;
 
 	/*
-	 * Refresh link_speed visibility, serialized against netdev_trig_notify()
-	 * which may concurrently call sysfs_update_group() on the same group
-	 * while reading supported_link_modes via netdev_trig_link_speed_visible().
+	 * Refresh link_speed attribute visibility.  This trigger owns the
+	 * group (created in activate(), removed in deactivate()), so it is only
+	 * serialized against a concurrent sysfs_update_group() in
+	 * netdev_trig_notify() by trigger_data->lock.
 	 */
 	mutex_lock(&trigger_data->lock);
 	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
@@ -610,9 +611,14 @@ static const struct attribute_group netdev_trig_attrs_group = {
 	.attrs = netdev_trig_attrs,
 };
 
+/*
+ * The link_speed attribute group is not listed here: it is created and
+ * destroyed by activate() / deactivate() so that its sysfs_update_group()
+ * refreshes can never race with the LED core's device_add_groups() /
+ * device_remove_groups().
+ */
 static const struct attribute_group *netdev_trig_groups[] = {
 	&netdev_trig_attrs_group,
-	&netdev_trig_link_speed_attrs_group,
 	NULL,
 };
 
@@ -660,7 +666,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		fallthrough;
 	case NETDEV_CHANGE:
 		get_device_state(trigger_data);
-		/* Refresh link_speed visibility */
+		/*
+		 * Refresh link_speed attribute visibility.  The group is
+		 * owned by this trigger and never touched by the LED core, so
+		 * updating it here under trigger_data->lock cannot race with
+		 * device_add_groups() / device_remove_groups().
+		 */
 		if (evt == NETDEV_CHANGE)
 			sysfs_update_group(&led_cdev->dev->kobj,
 					   &netdev_trig_link_speed_attrs_group);
@@ -784,10 +795,29 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 
 	led_set_trigger_data(led_cdev, trigger_data);
 
+	/*
+	 * Own the link_speed attribute group here instead of listing it in
+	 * netdev_led_trigger.groups, so its later sysfs_update_group() refreshes
+	 * cannot race with the LED core's device_add_groups() /
+	 * device_remove_groups().  Create it before registering the notifier so
+	 * that a NETDEV_CHANGE cannot refresh a not-yet-created group.
+	 */
+	rc = sysfs_create_group(&led_cdev->dev->kobj,
+				&netdev_trig_link_speed_attrs_group);
+	if (rc)
+		goto err_free;
+
 	rc = register_netdevice_notifier(&trigger_data->notifier);
 	if (rc)
-		kfree(trigger_data);
+		goto err_remove_group;
 
+	return 0;
+
+err_remove_group:
+	sysfs_remove_group(&led_cdev->dev->kobj,
+			   &netdev_trig_link_speed_attrs_group);
+err_free:
+	kfree(trigger_data);
 	return rc;
 }
 
@@ -797,6 +827,13 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 
 	unregister_netdevice_notifier(&trigger_data->notifier);
 
+	/*
+	 * The notifier is gone, so no sysfs_update_group() can run concurrently
+	 * now; tear down the group we created in activate().
+	 */
+	sysfs_remove_group(&led_cdev->dev->kobj,
+			   &netdev_trig_link_speed_attrs_group);
+
 	cancel_delayed_work_sync(&trigger_data->work);
 
 	dev_put(trigger_data->net_dev);
-- 
2.55.0

