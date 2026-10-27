Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100842;
	b=HSfgelODQV2NsNHzURhDC+ki+zGfuTZHqF8xxccX/YwEuVn+5FmjwqnM2PAeRPVcWnvU
	 o+0Rs8cW7sJe8Fv73Eua5qkI5YNPTr5nehaDZ3S+GRUOXnU6nL+XCNf4k0cv78JWEisiA
	 veIPrmzR6Zs8l2cfO/8U+mY3cU+7wcojDhkssIQ1pRnToQ8lsJsTekLbuXtbPVxaT8h1f
	 CKhgqcu8CQMoi4fMDe4rg+HEX70fdHsm5D3ERIeZeqDyFsRSVlwNoIs9vM1mhQfSbu6BP
	 0yZOxVLIKVt1uzX9HZboVzpi80Z52Ek8F71Gl9lzZY5ZY1lh2YO3QzaAR0mWzfhnA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100842;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=C1UwBGolQPjZYIOlTjwKI53Ig/Ixu2xTIOtSgZjJ3/k=;
	b=hzlabHubYHmGSbsMLVN5BT5LnfUCgULbwhBFqjT6Pw6NHgEfcLChhofse5qv4u3Nrf3m
	 2nfhO0QrS8vVnWuvY+jX5ViYNfZK4oA5YecLOmjov32/dFJsbcIs0hKwsCq65qBYguGGj
	 bOoWlESFlhYYo4ci+MPjqQkIpkGqHaRHxS2y7JRvyJZ6L09FkneYExfZI5/Ytot5wUqIZ
	 7DmhjhYECUXHPgdEDtI82sB5JbOmd5Hi+SQY9tZVpEi1IhzX25yN3v0ypwu+TNvOOqaZu
	 eULgqSodZyyBi3i5KY1OnAeezqrgrJXvzHDRpcauNRDTVqj0eIMJ6VcKxfNOK7vwSHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b="GuAU9/2B";
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A526606B5A5
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A526606B5A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=GuAU9/2B
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261027113353290d9e038600020706
        for <linux-leds@vger.kernel.org>;
        Tue, 27 Oct 2026 12:33:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C1UwBGolQPjZYIOlTjwKI53Ig/Ixu2xTIOtSgZjJ3/k=;
 b=GuAU9/2BFRn2EhosY7BFwkjbiXoJn5bra56WNLOKg3d3F55x22+FVCf6HvUFwx+hgWG0ju
 tZRmZhw0CL6dd3EIfoaalXE8HAX94FkmjVarLhJ9bc2qHz1F2aGVDq7T1GvIetFfUm9cizAj
 3MoFbVQqOf1Yf/i2WhsgvzGOIYsE5neLFsgl5rHZ10mm86ayb+0RlxfazHmPpDweu5ChEmC1
 9Ib9238MBHV2O8pkB3ETafpqnkQg2QK0c6zn+p9jotu504f7wsBkMaSOObm6Od4rjw5oWadD
 AOXLE2wRXiVAdztw8pVv8wa8/kYII+ABFqLSFaWg3g/empsc6+27Vl/Q==;
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 3/5] leds: trigger: netdev: Fix sysfs_update_group() races
Date: Tue, 27 Oct 2026 12:33:43 +0100
Message-ID: <20261027113349.383147-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The link_speed attribute group was listed in netdev_led_trigger.groups,
so the LED core creates and destroys it via device_add_groups() /
device_remove_groups() in led_trigger_set() (under trigger_lock), while
the trigger also refreshes it with sysfs_update_group() from
netdev_trig_notify() and device_name writes. With no shared lock this was
observed as a sysfs splat when the trigger is re-armed during PHY link-up:

  sysfs: cannot create duplicate filename '...green:lan/link_10'

    CPU 0 (led_trigger_set)        CPU 1 (linkwatch workqueue)
    -----------------------        ---------------------------
    activate():
      register_netdevice_notifier()
    .                              netdev_trig_notify(NETDEV_CHANGE):
    .                                sysfs_update_group() creates "link_10"
    device_add_groups()
      creates "link_10"  <- EEXIST!

The mirror case (device_remove_groups() racing the notifier) leaves an
orphaned sysfs file pointing at freed trigger_data, i.e. a UAF.

Manage the group in the trigger: drop it from netdev_led_trigger.groups
and create/destroy it in activate()/deactivate(), so the LED core never
touches it. The two remaining refreshers, netdev_trig_notify() and
device_name_store(), are serialized against each other by a dedicated
attr_lock, and the is_visible callback takes trigger_data->lock for its
supported_link_modes read. sysfs_update_group() is never called under
trigger_data->lock, so it cannot deadlock against a concurrent link_*
store that takes that lock.

Cc: stable@vger.kernel.org
Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link speed attribute")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v3:
- changed guard() to scoped_guard() and dev_put() to unset_device_name()
v2:
- this patch is a combined rework of patches 1&2 from v1

 drivers/leds/trigger/ledtrig-netdev.c | 74 +++++++++++++++++----------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index e72e850e0070f..bf9a5ec245a43 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -57,6 +57,8 @@
 
 struct led_netdev_data {
 	struct mutex lock;
+	/* Serializes link_speed group refreshes; never taken by attr stores */
+	struct mutex attr_lock;
 
 	struct delayed_work work;
 	struct notifier_block notifier;
@@ -336,8 +338,9 @@ static ssize_t device_name_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	/* Refresh link_speed visibility */
-	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
+	/* Serialize the link_speed visibility refresh against netdev_trig_notify() */
+	scoped_guard(mutex, &trigger_data->attr_lock)
+		sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
 
 	return size;
 }
@@ -544,22 +547,23 @@ static umode_t netdev_trig_link_speed_visible(struct kobject *kobj,
 	 * Stop at the first matching entry as we care only to check if a particular
 	 * speed is supported and not the kind.
 	 */
-	for_each_set_bit(mode, supported_link_modes, __ETHTOOL_LINK_MODE_MASK_NBITS) {
-		struct ethtool_link_ksettings link_ksettings;
-
-		ethtool_params_from_link_mode(&link_ksettings, mode);
-
-		CHECK_LINK_MODE_ATTR(10);
-		CHECK_LINK_MODE_ATTR(100);
-		CHECK_LINK_MODE_ATTR(1000);
-		CHECK_LINK_MODE_ATTR(2500);
-		CHECK_LINK_MODE_ATTR(5000);
-		CHECK_LINK_MODE_ATTR(10000);
-		CHECK_LINK_MODE_ATTR(25000);
-		CHECK_LINK_MODE_ATTR(40000);
-		CHECK_LINK_MODE_ATTR(50000);
-		CHECK_LINK_MODE_ATTR(100000);
-	}
+	scoped_guard(mutex, &trigger_data->lock)
+		for_each_set_bit(mode, supported_link_modes, __ETHTOOL_LINK_MODE_MASK_NBITS) {
+			struct ethtool_link_ksettings link_ksettings;
+
+			ethtool_params_from_link_mode(&link_ksettings, mode);
+
+			CHECK_LINK_MODE_ATTR(10);
+			CHECK_LINK_MODE_ATTR(100);
+			CHECK_LINK_MODE_ATTR(1000);
+			CHECK_LINK_MODE_ATTR(2500);
+			CHECK_LINK_MODE_ATTR(5000);
+			CHECK_LINK_MODE_ATTR(10000);
+			CHECK_LINK_MODE_ATTR(25000);
+			CHECK_LINK_MODE_ATTR(40000);
+			CHECK_LINK_MODE_ATTR(50000);
+			CHECK_LINK_MODE_ATTR(100000);
+		}
 
 	return 0;
 }
@@ -603,7 +607,6 @@ static const struct attribute_group netdev_trig_attrs_group = {
 
 static const struct attribute_group *netdev_trig_groups[] = {
 	&netdev_trig_attrs_group,
-	&netdev_trig_link_speed_attrs_group,
 	NULL,
 };
 
@@ -651,10 +654,6 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		fallthrough;
 	case NETDEV_CHANGE:
 		get_device_state(trigger_data);
-		/* Refresh link_speed visibility */
-		if (evt == NETDEV_CHANGE)
-			sysfs_update_group(&led_cdev->dev->kobj,
-					   &netdev_trig_link_speed_attrs_group);
 		break;
 	}
 
@@ -662,6 +661,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
 
 	mutex_unlock(&trigger_data->lock);
 
+	if (evt == NETDEV_CHANGE) {
+		scoped_guard(mutex, &trigger_data->attr_lock)
+			sysfs_update_group(&led_cdev->dev->kobj,
+					   &netdev_trig_link_speed_attrs_group);
+	}
+
 	return NOTIFY_DONE;
 }
 
@@ -749,6 +754,7 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 		return -ENOMEM;
 
 	mutex_init(&trigger_data->lock);
+	mutex_init(&trigger_data->attr_lock);
 
 	trigger_data->notifier.notifier_call = netdev_trig_notify;
 	trigger_data->notifier.priority = 10;
@@ -782,12 +788,23 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 
 	led_set_trigger_data(led_cdev, trigger_data);
 
+	rc = sysfs_create_group(&led_cdev->dev->kobj,
+				&netdev_trig_link_speed_attrs_group);
+	if (rc)
+		goto err_free;
+
 	rc = register_netdevice_notifier(&trigger_data->notifier);
-	if (rc) {
-		dev_put(trigger_data->net_dev);
-		kfree(trigger_data);
-	}
+	if (rc)
+		goto err_remove_group;
+
+	return 0;
 
+err_remove_group:
+	sysfs_remove_group(&led_cdev->dev->kobj,
+			   &netdev_trig_link_speed_attrs_group);
+err_free:
+	dev_put(trigger_data->net_dev);
+	kfree(trigger_data);
 	return rc;
 }
 
@@ -797,6 +814,9 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 
 	unregister_netdevice_notifier(&trigger_data->notifier);
 
+	sysfs_remove_group(&led_cdev->dev->kobj,
+			   &netdev_trig_link_speed_attrs_group);
+
 	cancel_delayed_work_sync(&trigger_data->work);
 
 	dev_put(trigger_data->net_dev);
-- 
2.56.0

