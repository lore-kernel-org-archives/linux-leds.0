Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559B44CAE4
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392266; cv=none; b=QOx7ReRQFD5pkljfXQGrK7O+9MF9ZPSbjd18kB0HDSOrtxfgBRxCNzNBNQdfCt6pHJaJN7BWbqJNpahu6pOcFW4XfMJkFcR4W8fQbee4WjXWgjxjhJ6e/5ThcI/tYSqDfsF6OM5l4hrvDMRvr43sB0BsF5fU90UFGxxDbRwrld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392266; c=relaxed/simple;
	bh=ZBAPehVuJGmMUln2Ef36d5J6jnARy2g89ExbmqR0je4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cTY1gD+QNdSRvMhVcFJvHxb5fJy6Am8lDDlq+gPrXaMaT7oDy4WI9x6h9J2vslKdU2I6JY8q8ZG+TqbyAxTJxdr1SjneioIAQceENKMYkCvhzI9VqKMldBJtSQhB35axhklZemIjFTCMWHhgC9YH2mQM3xD0UoaQQSUJ/IZ2lXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=MvjfyFdo; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="MvjfyFdo"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260914132413b35cba9ff500020759
        for <linux-leds@vger.kernel.org>;
        Mon, 14 Sep 2026 15:24:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=82ARsrIz1SOwySMQdGBQrwndG2ys8JYEtbyvxgwpBik=;
 b=MvjfyFdoSWubcZO9clUYdeDj6BohUcn43bt7VHF/SusQavfUbiwgzjcGLPzr5aTTAOjTH9
 Xdp8jyZk3V057UNU2rroEScHQBlJyn3I5ABnmuUDgoZgPop1sdf+JGWyHECgsyGdy+xUEMT+
 GP3n9A/YBsXJkp3ORENEtNGaC6GJEOMumwMSZEnCZJSWH5LieVd6EIZquPhwpq3oAXOeLtP6
 A6GlQbeginQkR6paxgimxnygXskOJyvH2r1v5DhUSzQe0PvsPzVw/IaOK10Xr+6L7y1i9MYQ
 s8eVZfLZlaRTOrWIao221DdRpqDazEcIl9XtHo+gNCx3GAkOeJA61seA==;
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
Subject: [PATCH 0/3] leds: trigger: netdev: fix sysfs_update_group() races
Date: Mon, 14 Sep 2026 15:23:49 +0200
Message-ID: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Patches 1 and 2 close this really observed race.  Patch 1 serializes
device_name_store()'s sysfs_update_group() (and its is_visible callback's
read of ->supported_link_modes) against the notifier under
trigger_data->lock.  Patch 2 removes the remaining collision by construction:
the link_speed group is dropped from netdev_led_trigger.groups so the LED
core's device_add_groups() / device_remove_groups() no longer touch it, and
the trigger owns its lifecycle via sysfs_create_group() in activate() and
sysfs_remove_group() in deactivate().

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
splat every time; with patches 1 and 2 applied it no longer triggers.

Patch 3 addresses a separate race that I deduced by inspection but did not
try to reproduce in practice: netdev_led_attr_store() and interval_store()
mutate the shared trigger_data state (a non-atomic read-modify-write of
->mode, ->hw_control and set_baseline_state()) without holding
trigger_data->lock, so they can race with each other and with the notifier.
It is fixed by taking trigger_data->lock around those updates.

The netdev LED trigger refreshes the link_speed attribute group with
sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
device_name writes and, indirectly, trigger (de)activation) that share no
common lock.  On a board that emits PHY link events while the trigger is
being (re)armed during boot this is observed as a hard sysfs failure:

  sysfs: cannot create duplicate filename '...green:lan/link_10'
  ...
  led_trigger_set
  led_trigger_write

Patches 1 and 2 close this really observed race.  Patch 1 serializes
device_name_store()'s sysfs_update_group() (and its is_visible callback's
read of ->supported_link_modes) against the notifier under
trigger_data->lock.  Patch 2 removes the remaining collision by construction:
the link_speed group is dropped from netdev_led_trigger.groups so the LED
core's device_add_groups() / device_remove_groups() no longer touch it, and
the trigger owns its lifecycle via sysfs_create_group() in activate() and
sysfs_remove_group() in deactivate().

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
splat every time; with patches 1 and 2 applied it no longer triggers.

Patch 3 addresses a separate race that I deduced by inspection but did not
try to reproduce in practice: netdev_led_attr_store() and interval_store()
mutate the shared trigger_data state (a non-atomic read-modify-write of
->mode, ->hw_control and set_baseline_state()) without holding
trigger_data->lock, so they can race with each other and with the notifier.
It is fixed by taking trigger_data->lock around those updates.

The whole series is LOCKDEP-verified.

Alexander Sverdlin (3):
  leds: trigger: netdev: hold lock across sysfs_update_group() in
    device_name_store()
  leds: trigger: netdev: fix sysfs_update_group() vs led_trigger_set()
    races
  leds: trigger: netdev: serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 67 +++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 5 deletions(-)

-- 
2.55.0

