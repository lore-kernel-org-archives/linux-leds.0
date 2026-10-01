Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69594A2A52
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860340; cv=none; b=Dm9eniKkf1ebzmRj9BxV7skSeWK+GVfQMtkeSOkKlUFVDhlcgwZumYngPW35qm+tEM9zPqpAFKjTRcuhnohEYz1eXxM6iTkDWVjNyxIvZ/38K/5piOkotTFmLVmIsg3riLFuq5HyJ7oLSSZd4C3dMGrC4VGFlk3aV9eoi60p1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860340; c=relaxed/simple;
	bh=BsRBADmHgV5KwSOX9hmUJ6UPXxtxbzGC19aVOIoiUPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqEUoUSy4KUs8oTGT3OgpQ1WGVg6tnMuKKjjewgNHQptprXXfuWpqnxqT2OR0sVV8I9px4IqpFAdd7rAI0EmgxYrwjjrJWYOrgQDXOa5yl1JAzE3ybuM82mZUSyBc/pyXy7CGQ0PsjYP3HCMKffZIH9orBv8+c5W2Deu0qoLA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=PF00u/vj; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="PF00u/vj"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261001131209f6bc4a1b67000207c3
        for <linux-leds@vger.kernel.org>;
        Thu, 01 Oct 2026 15:12:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1hDuk17IH6xWBmbMLugqKre/N/RZQgbZxW0fTL4CXGk=;
 b=PF00u/vjsLGLg++K203swBOZZDtCcQ2tSh64G1qwDckIq1p8UdhoHzm7hZCYA7n6LeuwME
 EYmhkyovGL3qT4U+qeblef+mqXq4yR4ZPw1hf6cztBkD8iRXnNDJtASuhKJ2+A/hIqBIqq8C
 VPqgvLKjQbC+saImqmQwJJO+aj7bduJPWW4UqwtzUvKQN67WbSRcggZM3VkYan5cQLADI/Ax
 9+z3ksQVBhckYppXuu9yJCivMDFW0FC+34scZ44lczHVMun2pAS8+zhlswUXJ8wkErVLRu10
 IwN3eJ0khC4kwq/CrKtcwXDFukAsM2vA6KGzZplDLUIC/mjEPWH5ghGw==;
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
Subject: [PATCH v4 0/4] leds: trigger: netdev: fix sysfs_update_group() races
Date: Thu,  1 Oct 2026 15:11:59 +0200
Message-ID: <20261001131206.2513248-1-alexander.sverdlin@siemens.com>
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
v4:
- introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
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

 drivers/leds/trigger/ledtrig-netdev.c | 132 ++++++++++++++++++--------
 1 file changed, 93 insertions(+), 39 deletions(-)

-- 
2.55.0

