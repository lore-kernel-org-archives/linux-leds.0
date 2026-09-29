Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55351AFF5
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683752; cv=none; b=U6/wPAgpiMbqJINqtzsIkR3tg0O9r7izIdF4RvELIMBWOrLzt8tluO/uS2MRQyIoU27GCCYBXtgIqjV+v7s+4MoC3JqKFU8mvZ3gW4dzD8QUo7S200l6HrxnBSArvzIRPgjyKBgUxrBQ7Qp8dQYJ4bWD+nhgRqHQEYx8Q/WPZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683752; c=relaxed/simple;
	bh=gPpJc0gAwxmiHQ3k+AeGCthtBe3ZN02fkltHLrpKeF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MaiNSYRibPszcxzfwhM89Yg3hPrqn8GiRug8TNCVtzD4gWCdwVq+XyxAq/vHkun9pt+Iuy5GBhdmUNEHapZqOF7mmRKCDe1TDZYDZKPV/q+EygMdRx8BB8hf7mmeeWhsg0ahRazh0AgzG3AJSPFGzJU3w3pt6UW/fiylLEFubjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NLcyDgKr; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NLcyDgKr"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202609291209054be26bd924000207c2
        for <linux-leds@vger.kernel.org>;
        Tue, 29 Sep 2026 14:09:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qIuGYyrz5VWG0njHuoFGuWt3RfQaVhMgb00911U1KSE=;
 b=NLcyDgKrHabO0A94fhKXWdLn/MFxseYkzaGSncih1bu6QL4xYPfPCnXK7DvxZIPgptZ7LQ
 M8tGNTBuNvTngCgm0Nhjz6z5VtUcnbUTGc5XAuin45C0SvNqdlCVLj8c9KQp382pTat5Jdew
 3r/mblcTgiVRTbpYIZV/Xw/M4asq02d0Bb99g+toobWJFXE697FP1RW/Mi5jD4xyRnwrABJm
 lhKhMcUt8kdCRHO3SBn+7JH2+Xmi63+ZumuUZ7TJv7zj8eABzKJ1cDoT2B12w08efFstvTFk
 6SUXP/1xLrG7AECRiqB1JCut2591ZL/4kJY1a6PcpOZD1eOZ+/bWv1WQ==;
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
Subject: [PATCH v3 0/4] leds: trigger: netdev: fix sysfs_update_group() races
Date: Tue, 29 Sep 2026 14:08:50 +0200
Message-ID: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
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

The netdev LED trigger refreshes the link_speed attribute group with
sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
device_name writes and, indirectly, trigger (de)activation) that share no
common lock.  On a board that emits PHY link events while the trigger is
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

+               msleep(5000);
+
                 ret = device_add_groups(led_cdev->dev, trig->groups);
                 if (ret) {
                         dev_err(led_cdev->dev, "Failed to add trigger attributes\n");

With that msleep() in place, writing the trigger while a NETDEV_CHANGE is
delivered from the linkwatch workqueue reproduces the duplicate-filename
splat every time.

The whole series is LOCKDEP-verified.

Changelog:
v3:
- introduced unset_device_name() as a counterpart of set_device_name()
- guard() has been converted to either explicit mutex_lock()/mutex_unlock()
  or scoped_guard()
- rebased onto next-20260925
v2:
- addressed pre-existing issues found by Sashiko (patches 1&2)
- reduced verbosity both in comments and in commit messages
- patch 3 is a combined rework of patches 1&2 from v1
- dropped sync from cancel_delayed_work() (worker now takes the lock)
- https://lore.kernel.org/all/20260921093249.3481413-1-alexander.sverdlin@siemens.com/
v1:
- https://lore.kernel.org/all/20260914132356.807004-1-alexander.sverdlin@siemens.com/


Alexander Sverdlin (4):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 112 +++++++++++++++++++-------
 1 file changed, 81 insertions(+), 31 deletions(-)

-- 
2.55.0

