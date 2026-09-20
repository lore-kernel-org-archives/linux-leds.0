Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1846F4B8;
	Sun, 20 Sep 2026 19:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933292; cv=pass; b=VgspzDMLvNKhKDD1xzfYjR/h2iaND7xoEtQk3T0JHPgWM+AY8JOfoqrqRcwjsplor6c6tW6VJqpKAWu+uAx9dNyFb/jsCkTUoiqws1Vm5eP2cvG+9/urK3+Y9JQxJ+Z+k1PqBACfaX1ZTnFhAa0ORsS+ACXdWigjCkUP9D0FR0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933292; c=relaxed/simple;
	bh=mauiSdjOeEpD8dIDuxTvQjuGXWV77WBxtg0mwzPjNLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TCn8h+TunF79uhFk1twZthJ8EQf/2iShXJapn5ElUQeGZ8TxKUFvzlFwZMVObEVMhSSe0PVtT8wr6L36UzkV3TkJe2KRvorUUr0umBBLENfE+VzwJ9BxszEdVBkWbHobuISVqiznlv0hYw2uHUwuiCDVZlBlWwbdRoR2wY9+DGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YnlxX88K; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YnlxX88K"
ARC-Seal: i=1; a=rsa-sha256; t=1789933224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b4T9GnOi6/0npYkaVS5M5rSdQt+HoOgrAGOX+YgcLXFEkHoQ6zr2AxPrqSOJCY0yEOvUk6lAfinCUd2CbsdStWcqWAmLiBCFYSpYeHiWJLuhKPYzx2qvDs7htlCR6y2s3X41lytd+8t+/ESqdMs5I2qufdBEMwh2c3eoV1H0uEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933224; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCfUpcAEWIBQZd2qGaQPf9DzhbMgTwS/5DowjCTEoM4=; 
	b=cgw4qNqG70xI0EXbGJKTfwDqrGSm4385hVcRWdUFoQIfnp2bwtUK85HuvcRNmZCzjUVwJvZta0Two7+f1W8ccOlhT2a5CH2qrAvJQJ0viYawy+rpaXImUnCUuDtCVzXv3IQejhMkLhkW7x1rVPEluzgCpguxuIrc0OJecRlGd8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933224;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=XCfUpcAEWIBQZd2qGaQPf9DzhbMgTwS/5DowjCTEoM4=;
	b=YnlxX88KPI/FUbk2mAUAtXfk9A1vjCR8tTSwEaPRsl7b82RQCP3/qhGkm49WIU59
	oUISaKgA7o38LcPWJfja5cOQ7mI64cT2RzaCQh75A0rvl/bYLO+E+bCnBwsbsSEVwZY
	BIvi7Yb/bbfVZTq+lHI2nwAAvqyabRWWg10ywWRwFpP7zU+NuyoQa+7gY4h8r2Wjuhc
	JEi6222Efh0eLbHWxm8MZW9pEXmUVdy8TQYJLVRpaOdzAXNcOe/EhryqNExsFJ6MsKF
	8LdXc4T+pBvBNmOFI3BwT2ZfDi+Ni7WWfx6NZECqkoeJ6GAN0hWdQgdauPsTXX0sepg
	d3/KPH4D5w==
Received: by smtp.zohomail.com with SMTPS id 1789933223615730.014236065983;
	Sun, 20 Sep 2026 12:40:23 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v7 00/13] leds: Add support for hardware-initiated hardware
 control trigger transition
Date: Mon, 21 Sep 2026 03:40:14 +0800
Message-Id: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33RwU7EIBAG4FfZcBZDoQywJ9/DeGhhaDHaKnSrZ
 tN3F7Ym3TSpx0mG7x/yX0nCGDCR8+lKIs4hhXHIg3o4Eds3Q4c0uDwTzjgwyYC+oUt0iqHrMNL
 +i65bjhpogFda29Z5kl9/RPTh+yY/v6xzurSvaKfClY0+pGmMP7fomZe9NQUqfZgyc8qo5drWN
 ZPCevEUx6F7fB+RlJBZbIyqzDEjMiN9K6XiHAXgjqk3RjN+zNSZ8UYht41R4PeMvGN4dczIzAh
 kzIGtGyNgx8DGmP+ugfIpCUZYp7RW6o5Z1gYifl5yxdNfLcvyC0+Q9KgAAgAA
X-Change-ID: 20260506-leds-trigger-hw-changed-96a62188cbdf
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Some laptops can tune their keyboard backlight according to ambient
light sensors (auto mode). This capability is essentially a hardware
control trigger. Meanwhile, such laptops also offer a shrotcut for
cycling through brightness levels and auto mode. For example, on
ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
levels in the following sequence:

  1 => 2 => 0 => auto => 1 ...

Recent ThinkPad models should have similar sequence too.

However, there are some issues preventing us from using a private
hardware control trigger:

1. We want a mechanism to tell userspace which trigger is the hardware
   control one, so that userspace can determine if auto mode is on/off,
   as well as turing it on/off programmatically without obtaining the
   trigger's name via other channels
2. Writing brightness has the side effect of disabling hardware control,
   but the hardware control trigger remains active, resulting in the
   software and hardware being out of sync. Most LED drivers that
   supports hardware control also suffer from the same issue
3. Turing on/off auto mode via the shortcut cannot activate/deactivate
   the corresponding hardware control trigger, making the software state
   out of sync
4. Even with #3 solved, deactivating the hardware control trigger has
   the side effect of emitting LED_OFF, breaking the shortcut cycle,
   especially "auto => 1"

This series tries to demonstrate a path on solving these issues:

- Introduce an attribute "trigger_may_offload_to_hw", so that userspace
  can determine:
  - if the LED device supports hardware control (supported => visible)
  - which trigger is the hardware control trigger selected by the LED
    device and offloaded to hardware ("[foo_trigger]")
    - A callback hw_offloaded() is added so that LED triggers can report
      their hardware control state
- Remove hardware control trigger when writing brightness
- Add led_trigger_notify_hw_control_changed() interface, so that LED
  drivers can notify the LED core about hardware-initiated hardware
  control transitions. The LED core will then determine if the
  transition is allowed and switching between "none" (i.e., no trigger)
  and the device's private trigger accordingly
  - This capability is restricted to the device's private trigger. If
    the current trigger is neither the private trigger nor "none", no
    transition will be made
  - This interface is gated behind Kconfig LEDS_TRIGGERS_HW_CHANGED and
    LED device flag LED_TRIG_HW_CHANGED
- Tune the logic of trigger deactivation so that it won't emit LED_OFF
  when the deactivation is triggered by hardware

The last three patches are included in the series to demonstrate how
these interfaces are supposed to be utilized, so that ideapad-laptop
can expose the auto mode of ThinkBook's keyboard backlight. They can be
submitted separately once the dust settles, if preferred.

[ Summary of other approaches ]

< custom attribute >

Pros:
- simplicity, KISS
- no need to touch the LED core
- extensible as long as it has a sensor-neutral name
  - a sensor-related name could potentially lead to a mess if a future
    device implements auto mode based on multiple different sensors

Cons:
- must have zero influence on brightness_set[_blocking] callbacks
  in order not to break triggers
  - potential interference with triggers and the brightness attribute,
    can't solve #2
- weird semantic (an attribute other than "brightness" and "trigger"
  changes the brightness)

< private hardware control trigger (this series) >

Pros:
- mutually exclusive with other triggers and the brightness attribute
  (hence less chaos)
- semantic correctness
- acts as an aggregate switch to turn on/off auto mode even a future
  device implements auto mode based on multiple different sensors
  - extensibility (through trigger attributes)

Cons:
- complexity

[ Previous discussion threads ]

https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com
https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Add a new patch to the series to collect existing trigger attribute
  stuff together into led-triggers.c (thanks Lee Jones)
- Leave all new attribute stuff at led-triggers.c (ditto)
- Rename the offloaded() callback to hw_offloaded() (ditto)
- Rename the trigger_may_offload attribute to
  trigger_may_offload_to_hw (ditto)
- Use "[foo_trigger]" to represent a selected and offloaded trigger, and
  no longer use a dedicated container to represent selected but not
  offloaded ones (ditto)
- Remove messages mainly for debugging (ditto)
- Inline led_trigger_{init,destroy}_hw_changed() into led-class.c by
  exporting led_trigger_hw_control_changed_worker() (ditto)
- Rephrase some comments and messages (ditto)
- Constify device attribute trigger_may_offload_to_hw
- Address a concern from Sashiko
  - Fix printf format string
  - https://sashiko.dev/#/patchset/20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe?part=11
- Link to v6: https://patch.msgid.link/20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe

Changes in v6:
- New patch in the series to address a concern from Sashiko
  - [PATCH 1] leds: class: Always protect brightness_show() with led_access
  - https://sashiko.dev/#/patchset/20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=7
- Update Date: and KernelVersion: for the document of
  /sys/class/leds/<led>/trigger_may_offload
- Implement workqueue deferal mechanism
  - Protects ideapad_kbd_bl_led_cdev_brightness_set() with the new mutex
    as well
  - No longer convert last_hw_brightness into atomic_t as it's not
    required now
  - https://msgid.link/e2b081dfd8f96511a73b86ab3ec75e5cd759b79b.camel@rong.moe
- Simplify the auto mode state preservation logic by converting
  `priv->kbd_bl.initialized' into a tristate integer
- Link to v5: https://patch.msgid.link/20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe

Changes in v5:
- Address a concern from Sashiko:
  - Non-atomic update of led_cdev->flags causes a data race that can
    drop the LED_UNREGISTERING flag
  - Fix it by synchronize the update with trigger_lock
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=8
- Address a concern from Sashiko:
  - led_trigger_notify_hw_control_changed() might sleep, but without any
    internal deferral mechanism or annotation
  - Annotate the method with might_sleep(), since the very first users
    of the interface, i.e., ideapad-laptop and (supposedly)
    thinkpad_acpi, will call the interface from work contexts. It does
    not deserve the overhead of internal deferral mechanism
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=9
- Update "Changes in v4" to include more details
- Link to v4: https://patch.msgid.link/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe

Changes in v4:
- Drop the RFC prefix
- Add a new patch in the series to address a concern from Sashiko
  - [PATCH v4 08/12] leds: trigger: Do not attach trigger to a removing LED
  - Without it, the following patch may expose a race condition if a
    future LED driver synchronizes led_classdev_unregister() and
    led_trigger_notify_hw_control_changed() poorly. The ideapad-laptop
    patches in the series doesn't expose the race condition though
  - In theory, the race condition can also be triggered by a userspace
    program writing to the "trigger" attribute right before
    device_unregister() is called
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe
- Address other concerns from Sashiko
  - Reject insane hardware brightness
  - Do not notify the LED trigger core when the registration of the
    private trigger has failed
- Enable LEDS_TRIGGERS_HW_CHANGED by default when
  LEDS_BRIGHTNESS_HW_CHANGED is enabled
- Add missing #include (Thanks Ilpo Järvinen)
- Remove needless #include (ditto)
- Remove needless code alignment (ditto)
- Link to v3: https://patch.msgid.link/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe

Changes in v3:
- Integrate https://lore.kernel.org/all/20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe/
  into the series
  - Adopt __led_trigger_is_hw_controlled() in the rest of the series
- Rearrange the series so that the code using the offloaded() callback is
  introduced before the driver implementation (thanks Thomas Weißschuh)
- Reword documentations and commit messages (ditto)
- Adopt guard() and lockdep (ditto)
- Address concerns from Sashiko
  - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
  - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
  - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
- Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
- Link to v2: https://patch.msgid.link/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe

Changes in v2:
- Restrict the led_trigger_notify_hw_control_changed() interface to
  private triggers only
  - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
    hw control trigger"), not relavant any more
- Gate the led_trigger_notify_hw_control_changed() interface behind
  Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
  LED_TRIG_HW_CHANGED
- Fix lock ordering inversion
- ideapad-laptop:
  - Only call led_trigger_notify_hw_control_changed() when needed
  - Serialize keyboard backlight notifications
- Reword commit messages and documentations
- Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.moe

---
Rong Zhang (13):
      leds: class: Always protect brightness_show() with led_access
      leds: trigger: Move led_trigger_is_hw_controlled() to the right place
      leds: class: Remove hardware control trigger when writing brightness
      leds: trigger: Move led_trigger_group to the right place
      leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
      leds: cros_ec: Implement hw_offloaded() trigger callback
      leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
      leds: trigger: netdev: Implement hw_offloaded() callback
      leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
      leds: trigger: Add led_trigger_notify_hw_control_changed() interface
      platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
      platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
      platform/x86: ideapad-laptop: Fully support auto keyboard backlight

 Documentation/ABI/testing/sysfs-class-led          |  28 ++-
 .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
 Documentation/leds/leds-class.rst                  |  72 ++++++
 drivers/leds/led-class.c                           |  46 ++--
 drivers/leds/led-triggers.c                        | 177 ++++++++++++-
 drivers/leds/leds-cros_ec.c                        |   6 +
 drivers/leds/leds-turris-omnia.c                   |   7 +
 drivers/leds/leds.h                                |   8 +-
 drivers/leds/trigger/Kconfig                       |  10 +
 drivers/leds/trigger/ledtrig-netdev.c              |   8 +
 drivers/platform/x86/lenovo/Kconfig                |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       | 279 +++++++++++++++++----
 include/linux/leds.h                               |  24 ++
 13 files changed, 570 insertions(+), 99 deletions(-)
---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf

Thanks,
Rong

