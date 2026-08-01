Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858663B5314;
	Sat,  1 Aug 2026 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605265; cv=pass; b=hnAXZcJpQR/LldgtuICfT4tsWmayJQZHsmhOR28WyJVUlms1ru5g+wdmx1dmsrtAXJWPjJ+yT/DHHXGOqKphz+nYWRo6N3G1WHCfUJQWIPevIHvq4w1pTGyMnzHqYSU6R7MxsTPQ1yeJnDudCwoyT6IF23r6O+AUln5M3/UNvdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605265; c=relaxed/simple;
	bh=ihM19DscRQpYqlhGQIjc11Ay3BiAki43MjNTgmPCV5M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WD2LckdSaqPz91yHuw4YArj5ED/Wakwgbe/TxbhjmFlCtFN8fVb0IVvry16GBSpRiMxIYZ+bm8lPUuNLQNgMY+HVS5fYvSUELH1DqJiQVVvNF2JzG9CgP7amJGLl9sQ0uZdVXYnoQ3DYd3LumEsNBqawB5VvHW6aFWv28OEW5U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=D5wNmMvj; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="D5wNmMvj"
ARC-Seal: i=1; a=rsa-sha256; t=1785605237; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aXQJku+aljzAHduI2jCK8ez6+SiGZfudc4FS1+EiC8HHF+wlZLnZLCVZGqCD3Pf4KT4hOkHrVg/Q5weDyEkpbO/HdewHe2VzaQyj+K0aWmADS1VEPqB1E3CsdBw7i/B/k2fm/tGnuY4iiv441IlkzmmCDSYnV7Lkht7zgQqcRmc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605237; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4rqBngfC6WnEVKXJ9wwT84DoYwvAH5pNF1e3QOhezIE=; 
	b=E8xIIzhW8FZygilDexPNbflvVW6NYrZL83Z7cJt6hU5sdDA2Bshf92etqBDv/8//IRF02qYrA4ecotbA64vfz7iBAaJP83kb+hdmWTxnIBj4eGMGpXwlBq1IeoET5uiqii6GQPyxP7+2iT6GAJqkYm0OvazGAT8u0a1L2S/j9kA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605237;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4rqBngfC6WnEVKXJ9wwT84DoYwvAH5pNF1e3QOhezIE=;
	b=D5wNmMvjJNIUKVayWylFkHJWn4g5JIsDGcYiQZausXicRarYlg83NG+nPdwqbJ1a
	RXA0V3SG0u0wLG38Nw3DOaMjGlXw66mOOcLVEeQeWyF043rV2Gh/+6Ild0TQF2z0mxb
	emH/e4qCCfXyH7Uw+Llw+6bk3afwYolxrsXYsbSgVqfEW04XC6MG4yXMsuHFn5BWqLk
	qFxtzna1GK3WyuXY46d7L8uO9AjZraMCCiyC1LYA6VDc31/8mNe7PG8Dm7DhpKobgi/
	dk+R640y0qpFpTNCPQGsojvNO9MMR9cvkQd0Pe95By6bAnJDFxH20TzmDcxyhR05nR4
	9Vgaw8qI5Q==
Received: by mx.zohomail.com with SMTPS id 1785605236809328.8268075158388;
	Sat, 1 Aug 2026 10:27:16 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v4 00/12] leds: Add support for hardware-initiated hardware
 control trigger transition
Date: Sun, 02 Aug 2026 01:26:44 +0800
Message-Id: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBQFr2JYi6FQKHXlPYyLFj4tRouBipqmd
 xfahW66fMm8mQkF8BYCOu4m5CHaYN2QRrnfIdU3QwfY6rQRJVQQTgS+gQ549LbrwOP+hVdK41o
 0ghZSqlYblN4PD8a+F/P5su7wbK+gxqzLRG/D6PxnSUeaubUiCrlZiRQTrKhUZUk4U4advBu6w
 90BypHIfpqqqLc1LGm4aTmvKAUm4E8zz/MXQeBYRRYBAAA=
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
X-Mailer: b4 0.16-dev-2f6f2
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

- Introduce an attribute "trigger_may_offload", so that userspace can
  determine:
  - if the LED device supports hardware control (supported => visible)
  - which trigger is the hardware control trigger selected by the LED
    device
  - if the trigger is selected ("<foo_trigger>")
  - if the trigger is offloaded ("[foo_trigger]")
    - A callback offloaded() is added so that LED triggers can report
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

The last patch in the series depends on commit 5029bff09e79
("platform/x86: ideapad-laptop: Fix driver unregistration order") from
platform-drivers-x86/for-next. 

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

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Drop the RFC prefix
- Add a new patch in the series to address a concern from Sashiko
  - [PATCH v4 08/12] leds: trigger: Do not attach trigger to a removing LED
  - Without it, following patches will expose a race condition
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
Rong Zhang (12):
      leds: Move led_trigger_is_hw_controlled() to the right place
      leds: class: Remove hardware control trigger when writing brightness
      leds: trigger: Add offloaded() callback and provide trigger_may_offload attribute
      leds: cros_ec: Implement offloaded() trigger callback
      leds: turris-omnia: Implement offloaded() trigger callback and declare hw_control_trigger
      leds: trigger: netdev: Implement offloaded() callback
      leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
      leds: trigger: Do not attach trigger to a removing LED
      leds: trigger: Add led_trigger_notify_hw_control_changed() interface
      platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
      platform/x86: ideapad-laptop: Serialize keyboard backlight notifications
      platform/x86: ideapad-laptop: Fully support auto keyboard backlight

 Documentation/ABI/testing/sysfs-class-led          |  25 ++
 .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
 Documentation/leds/leds-class.rst                  |  72 ++++++
 drivers/leds/led-class.c                           |  39 ++-
 drivers/leds/led-triggers.c                        | 150 +++++++++++-
 drivers/leds/leds-cros_ec.c                        |   6 +
 drivers/leds/leds-turris-omnia.c                   |   7 +
 drivers/leds/leds.h                                |   2 +
 drivers/leds/trigger/Kconfig                       |  10 +
 drivers/leds/trigger/ledtrig-netdev.c              |   8 +
 drivers/platform/x86/lenovo/Kconfig                |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       | 270 +++++++++++++++++----
 include/linux/leds.h                               |  19 ++
 13 files changed, 546 insertions(+), 66 deletions(-)
---
base-commit: c7acedb2db001160b1ec41cdcc759dd664150666
change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf

Thanks,
Rong

