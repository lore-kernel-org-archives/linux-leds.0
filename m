Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500422;
	b=goB0z/ToJOfDOyph0CaknsBqsTSExIHYjVIgOMJaXkU1M3Q+g0+t6sdS4/38vZrqekJu
	 00eW4DPZpxF5GHnY5wmS7G09p/Q9JEcxab7l7JAsZyC05gyXaeSftkiXIfODnbggD5/kA
	 FQaqBELheH0yAZjgEDSh+VV5pn6Mm0Z6/7E8SA4AVEiEV9l+RwssHjK/VJcdQARCDFyLx
	 eNzoC9DfL6vjPZ60268BAB43o07nTPAI6NJzKenocKuxRKM2PECjUaVrPVGtKULB9bkU9
	 PN3bObbhZ+MbELuo99MIBNhzvM8YAzG5fKMPUA9Pts4g0tsY8mY20X7IZkgX63AKyOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500422;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=Re4v7+cAh9NthZloUF4hCYD8bLLNdZ5nRSvONKgsAAw=;
	b=nNjrvuwwaYrh4/eHaBcJHPKpZQR4IuNnauhnAv7s6a0NhUpcVM45J0++jCIPNUDuJofE
	 B9ERSvgAcb+nscvcbT5wEFywRp0TkY1SC9720WmPgx4VvkK91hUBv4Fn2Kpd3kHE+2iP0
	 c9dx4iqtSlLz5Qo/qJLRZJpLV9qRJuB1TAU4GZvV1fshax3SNFc69Ec8oFdF18Y2l2ZyN
	 XvQXLIh2ONCvv9VsZ34miPz04ho9qwFhCtVIWFTqfT+ya5MAZPQIajlRZMBVmz79iYoVq
	 WNn3mrd+6zbEwFsmGmma1m0nY+/Utc+XJafpyOYVOTzO1Pb/m89D4twXtZuY77E27BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=ao1CQwsh;
	arc=none smtp.remote-ip=185.136.65.227
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D70606A33C
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D70606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=ao1CQwsh
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610201246532489b3bae3000207c9
        for <linux-leds@vger.kernel.org>;
        Tue, 20 Oct 2026 14:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Re4v7+cAh9NthZloUF4hCYD8bLLNdZ5nRSvONKgsAAw=;
 b=ao1CQwsh5HC5azTVV0PxpdsGAOBalMqhrXPLIDNVqFgmGxrt/YbI6QiPFCPRpHwtD9dqOa
 eJqkYUfCJcgWPYP+KXE6AJ8E9Lobr0PC887YRaZnZSwHxw91b17awUTJFmbx9jpoY8zzzLmM
 Vy4NzwSyamJLiTrekFeZe4+FvtjpASTJT5LbBR8P6++jZuX/gR+C5uS8MLAXPsiR/1hE3EJS
 tzvCS5fh3txdv8jpKWLiqIo/AO1dCn2qqVBFYFWOWTWeVK+YByyRbntLzB1xRNJhjbWeY3rd
 vKMgS/AzcCPkAIUQWaauP1Jg9F/MUPT+3KdJxgAwv1jwQWwB6jV1/Ocg==;
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
Subject: [PATCH v5 0/4] leds: trigger: netdev: fix sysfs_update_group() races
Date: Tue, 20 Oct 2026 14:46:44 +0200
Message-ID: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
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
v5:
- removed unset_device_name()
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


Alexander Sverdlin (4):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 123 ++++++++++++++++++--------
 1 file changed, 85 insertions(+), 38 deletions(-)

-- 
2.56.0

