Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601192;
	b=AQAHxg/8eWsQF9QcJrOOZqhRNyXmtTk7j21Xjoje6FIHXWmyo844FlJlv0HwbBFegWM0
	 A+1VUiAnoyP9jb0aorZBSFR+kkvscuPE6XWWck4/MxIpPtW9r++8WnHZ0w4Y1jETlztUj
	 Be7uDPZjpP1BQ4kKq87S6W01O4YwqHnI63LjqhRzJLqOqqucxLu0fWvI7546vALJwcIBD
	 DKb0GdOwna6I+MsPa5gDmHeQMxa3fa60roRjr9868kp1r7CGJbmMkPInzLY3Szs23FVMU
	 kAgSuoj0CzSB8/OKWh/xTjjQhfowgoS2QqJJJk9Nb3f4TOZEc2LXZJ+Yg2BMTI+1blA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601192;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=MGcYZAvPW95sI3nVJ3s6cuFSva0jZA3zcoqbDvwfaDU=;
	b=nsEJ2CSq1F29OWB1HPCD303hjNBI10KNfV4rz+mT5JoZKtmvNtkg7Xa8KTEQlm9wulDu
	 zMUIjVBYudnPNM7AbfaqYVI6CGqHEBZatL76E+4BRf+/N5P89StHZKPMOnUUmfyl8tGBU
	 HLejaVoxSI+busKNC25HLdd3QO5U6CZ1jmMVjVQQNRY6PJ9dqnsjtjUrTex+jQ3tJ9KjF
	 TtgWt1MMoo3S6tedXsINevkkdzg/6cxu6VcE9PcGbFZkFijuzDHVpPhMoxxuSnv3B7v9o
	 6VLvDyI9WTrEQT9E+htT2APS6PEB/H41P9WsjhN3EkcmPFAuShuisOl6rsJRToDEkAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=TRc66Blx;
	arc=none smtp.remote-ip=185.136.65.225
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E81606A32D
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 20:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E81606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=TRc66Blx
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261113201940c5aaf07e69000207a7
        for <linux-leds@vger.kernel.org>;
        Fri, 13 Nov 2026 21:19:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MGcYZAvPW95sI3nVJ3s6cuFSva0jZA3zcoqbDvwfaDU=;
 b=TRc66BlxODqxhRFb8VytAzka2CLLBT2H9YI8u6+N0qwzavm70avW7INZEx9+2dUdrFzdWl
 DXs7qEaDKx+l3G1KFut6ilbX/MsaeBf7PGTGUO3Sm9FA3t0f5tAh3HVUwogkRZSL7al6/XAI
 G9MZqoR7OfO8PFUIYB6VE3Mod99iwGzg89NEzgSV6yI2Z85Jni9g0oP9VtS0qweo9yo7YA4f
 8B6sDP3/CQjkLmXNv8CJ5euYMKtk2SsisxyuH0+yXHE0ciydok+w8qLtln5J1v/xU2GsHgUh
 wWsWzvMtw6dbfpBrIB+ADsOaKuL9rZhySZlD3DZj6pVEvHjl4Jz5ohsw==;
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
Subject: [PATCH v7 2/3] leds: trigger: netdev: Fix sysfs_update_group() races
Date: Fri, 13 Nov 2026 21:19:31 +0100
Message-ID: <20261113201936.2645736-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
References: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
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
Acked-by: Lee Jones <lee@kernel.org>
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
index 2afe7372aad78..601c4d9e0198a 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -57,6 +57,8 @@
 
 struct led_netdev_data {
 	struct mutex lock;
+	/* Serializes link_speed group refreshes; never taken by attr stores */
+	struct mutex attr_lock;
 
 	struct delayed_work work;
 	struct notifier_block notifier;
@@ -338,8 +340,9 @@ static ssize_t device_name_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	/* Refresh link_speed visibility */
-	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
+	/* Serialize the link_speed visibility refresh against netdev_trig_notify() */
+	scoped_guard(mutex, &trigger_data->attr_lock)
+		sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
 
 	return size;
 }
@@ -561,22 +564,23 @@ static umode_t netdev_trig_link_speed_visible(struct kobject *kobj,
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
@@ -620,7 +624,6 @@ static const struct attribute_group netdev_trig_attrs_group = {
 
 static const struct attribute_group *netdev_trig_groups[] = {
 	&netdev_trig_attrs_group,
-	&netdev_trig_link_speed_attrs_group,
 	NULL,
 };
 
@@ -668,10 +671,6 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		fallthrough;
 	case NETDEV_CHANGE:
 		get_device_state(trigger_data);
-		/* Refresh link_speed visibility */
-		if (evt == NETDEV_CHANGE)
-			sysfs_update_group(&led_cdev->dev->kobj,
-					   &netdev_trig_link_speed_attrs_group);
 		break;
 	}
 
@@ -679,6 +678,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
 
 	mutex_unlock(&trigger_data->lock);
 
+	if (evt == NETDEV_CHANGE) {
+		scoped_guard(mutex, &trigger_data->attr_lock)
+			sysfs_update_group(&led_cdev->dev->kobj,
+					   &netdev_trig_link_speed_attrs_group);
+	}
+
 	return NOTIFY_DONE;
 }
 
@@ -759,6 +764,7 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 		return -ENOMEM;
 
 	mutex_init(&trigger_data->lock);
+	mutex_init(&trigger_data->attr_lock);
 
 	trigger_data->notifier.notifier_call = netdev_trig_notify;
 	trigger_data->notifier.priority = 10;
@@ -794,12 +800,23 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 
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
 
@@ -809,6 +826,9 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 
 	unregister_netdevice_notifier(&trigger_data->notifier);
 
+	sysfs_remove_group(&led_cdev->dev->kobj,
+			   &netdev_trig_link_speed_attrs_group);
+
 	cancel_delayed_work_sync(&trigger_data->work);
 
 	dev_put(trigger_data->net_dev);
-- 
2.56.0

