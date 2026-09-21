Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F4476CE6
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983195; cv=none; b=XDHZ7qFk25FRbNJb9sFjArUDMEfDh9/fb2BPOawm5oReE1SqbZaiWElS9JRPL88MWKGb+uVcIltZdXVt+UtPS3rcjntw8uwEGd1CDeSUfINmqCiFDSEGM5a7HGo9In4w0s8rtiCyaxnNXLJfJAsueh7mlhDYFmgAZPSg52uG+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983195; c=relaxed/simple;
	bh=Dz06NXWuU+EnWrWE7XTA4ytYS4efcQrInWMWhIbJZrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scl7FRyIoDwPAN5EusiMv6cpGtvp7oqBNmABZKatCHOrG7m9BOZOjWqiK1VIcYXZ3EsP5CAz6iljztK0Ja/F3a56mJ1/70d0S3sHi/2UYrTLj099MN5yekHSJzLNIGXWJ12zFHr2ZzBhmwbu4+iRR7g6HonALEc2ydiBkIvMZ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Tko7g3zm; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Tko7g3zm"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260921093258d8e3890eb90002071a
        for <linux-leds@vger.kernel.org>;
        Mon, 21 Sep 2026 11:32:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b1wRbNxlwWjzN/IZUnhsSV6Ns7pCAKFvb5J/nSfORUg=;
 b=Tko7g3zmt5hGKzfnlPTVwKKvWlOq5mDB7Iy6aGVVyfSuCHbicNDARfLrL62WYwQrymasnw
 9WpGF6/fmJWk0Zj+R/TaWDsS4L4bkvLMS8P/wLOFuXWT2Z6RcAzoBpcy74oneJ1q6VTVMWmX
 WU6NZkNglFAdK4NixMXDLyyaUvT2KuykatDvakfHbIwM9Wy08OnU+oxoiDm0KZV2kZi9XVTu
 9bqy4LpbsQrHKlysHxuP+Tv2SkiKr3tbsNZjWLOoflCQ2dQ58YcPNviHlpyeVBljlg+hAqiK
 g7wwyn+xllxKd1q8Rdg0QTAbCzSq14yeu9iZAIRlSk1LSL4xAgLRZqwQ==;
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
Subject: [PATCH v2 0/4] leds: trigger: netdev: fix sysfs_update_group() races
Date: Mon, 21 Sep 2026 11:32:42 +0200
Message-ID: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
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
v2:
- addressed pre-existing issues found by Sashiko (patches 1&2)
- reduced verbosity both in comments and in commit messages
- patch 3 is a combined rework of patches 1&2 from v1
- dropped sync from cancel_delayed_work() (worker now takes the lock)
v1:
https://lore.kernel.org/all/20260914132356.807004-1-alexander.sverdlin@siemens.com/

Alexander Sverdlin (4):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 54 +++++++++++++++++++++------
 1 file changed, 43 insertions(+), 11 deletions(-)

-- 
2.55.0

