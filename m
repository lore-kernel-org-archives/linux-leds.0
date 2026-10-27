Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100841;
	b=vb06X0a3GBaRwXxA1DvzW7Hb8eQJPAmGUAf/3CVzwr+PcZDNIiQHG8DFeq1CJg00FeO4
	 0tCsBB562Cv3gwkdxfwH6M/EWLHq5ykSK04whn1rINnxtlwzV+fWEHBp6KcrW05flnyHL
	 3kTM/3kLj1TKYDRbLXa+FlRnMvnrwcwogtKYCu+1ye1xxA/Vec3GbwY73+bJpmvaMyxK5
	 xpi0suPI0rRpQB3zY/oZF09al4LNjyfv6QehOsizggZct5Xc5fSbNki9KH8VDw2tLCyp4
	 iRwluf8FUxzghjzdruxMTG6e1gbv6DoZcnyUoYGKF+q+UAs/xPVJxVpgTYhaNulQwJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100841;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=/8UNYZRLfX17A/rGH89AnZhCK05En4ZqGpei7ncmU5o=;
	b=PZt6cOKKs0CXbSZhCWFPxX8LVGL9OvIAA7EmEyRvb1uy3F84/Jlk42tXg1CEulAiB26T
	 7vbIzLH7yLAu5W9dB8Jom81ZNf3WWCQZCq8AjiontHLsSb0xz3rTOIf0kF7Hp79eEtrfe
	 Z9UHts4Bg1qfh7L0rlNA6OurlaD0TvXEf5R7U5NazW+Mb4+i+0s+Y2zpu8qPIA1cxj4lf
	 NETaa5qy9pg/FnAZVlg6WgGhLxL+xb/1xrhsoxDS6LQZy9gBKwbocR2MlIkcHjmRB7rvW
	 NUGMF5Lx/TrwBOVC1Fg8rIx9NAhutnYaUhcOZk18COSPdYBbQo3CkR0Gs7j9ak2ED7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=nDpC+cSL;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE0606B5A2
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDE0606B5A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=nDpC+cSL
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026102711335291680c48d3000207d7
        for <linux-leds@vger.kernel.org>;
        Tue, 27 Oct 2026 12:33:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/8UNYZRLfX17A/rGH89AnZhCK05En4ZqGpei7ncmU5o=;
 b=nDpC+cSLKZgkYoanKQ+Het0/rRNcy2utiuakyCW6FdFnPpiebdZ0vnxjHO9wzeOJjHd9te
 ktBbQpMfjCKJS3dvyNURByM7cD+2u0cdDFhZpzgXjxPBg5reVVBeB8T1rA/NgFVIn3wcy2Dp
 27uQ4WPmhmVWV6o1nY3KKPLwCqKr50f78/ZpHb6UOLs10ZeCRw1HNeyU4j9IwcdlksfnJ1iO
 Zt0swMGlYSiZw6r8g9uLAAIELxMUIxAn/FHF+U5mOnW4jaZqRgoutZ4zusIGg1Kl3Nnadwe6
 q0uc8mjOslXKBe4XTTVHrop0Ic6C+r7UB0xhFwTcDQyWQ7HoGukCr9vw==;
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
Subject: [PATCH v6 0/5] leds: trigger: netdev: fix sysfs_update_group() races
Date: Tue, 27 Oct 2026 12:33:40 +0100
Message-ID: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
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

The netdev LED trigger refreshes the link_speed attribute group with
sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
device_name writes and, indirectly, trigger (de)activation) that share no
common lock. On a board that emits PHY link events while the trigger is
being (re)armed during boot this is observed as a hard sysfs failure:

  sysfs: cannot create duplicate filename '...green:lan/link_10'
  ...
  led_trigger_set
  led_trigger_write

The window between activate() and device_add_groups() in led_trigger_set()
is narrow, so to reproduce it reliably I artificially widened it with the
debug patch below:

--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
+#include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/rwsem.h>
 #include <linux/leds.h>
@@ -223,6 +224,8 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		if (ret)
 			goto err_activate;

+		msleep(5000);
+
 		ret = device_add_groups(led_cdev->dev, trig->groups);
 		if (ret) {
 			dev_err(led_cdev->dev, "Failed to add trigger attributes\n");

With that msleep() in place, writing the trigger while a NETDEV_CHANGE is
delivered from the linkwatch workqueue reproduces the duplicate-filename
splat every time.

The whole series is LOCKDEP-verified.

Changelog:
v6:
- report invalid interval to user space
- fixed unlocked hw_control check in interval_store()
- added missing carrier_link_up check in netdev_trig_sw_blink()
v5:
- removed unset_device_name()
- https://lore.kernel.org/all/20261020124651.1987272-1-alexander.sverdlin@siemens.com/
v4:
- introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
- https://lore.kernel.org/all/20261001131206.2513248-1-alexander.sverdlin@siemens.com/
v3:
- introduced unset_device_name() as a counterpart of set_device_name()
- guard() has been converted to either explicit mutex_lock()/mutex_unlock()
  or scoped_guard()
- rebased onto next-20260925
- https://lore.kernel.org/all/20260929120902.2793138-1-alexander.sverdlin@siemens.com/
v2:
- addressed pre-existing issues found by Sashiko (patches 1&2)
- reduced verbosity both in comments and in commit messages
- patch 3 is a combined rework of patches 1&2 from v1
- dropped sync from cancel_delayed_work() (worker now takes the lock)
- https://lore.kernel.org/all/20260921093249.3481413-1-alexander.sverdlin@siemens.com/
v1:
- https://lore.kernel.org/all/20260914132356.807004-1-alexander.sverdlin@siemens.com/


Alexander Sverdlin (5):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Report invalid interval to user space
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 140 ++++++++++++++++++--------
 1 file changed, 96 insertions(+), 44 deletions(-)

-- 
2.56.0

