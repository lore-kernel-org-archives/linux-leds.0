Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642A242D9B;
	Thu, 20 Aug 2026 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246579; cv=pass; b=J0Q9FhP/YixjqmZCkQfhxvQFpA4jp7cPqxdXnUYyQg8tpaM5YV4Jrl1beYRdDzJHcfEkTg3LsqNL3nqS6MMzivyxEkuAbfYWYyXFt12bpzD7mqNmIujJyDJv97Y9UYFxyLi8sXB1GisycplwZ3UzH0ocGmCSkxECb0+CdBWKtt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246579; c=relaxed/simple;
	bh=DgQwQ1cxAi254c7COCivt5HRnDZ/K+FbF8CKn5NZ19s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j8bJRNNm2WcOASP+iR8hyQkotC2gWovDfYparzdKcDzNNQdU4NuiGqc4z36eBwnL3CJAaSrXdqQWa56fan9ATmTwUxKwmJgZZLpDJ26x9qITYiELLB+ZairE7XKjmN38dFc2IjRqdveLqcWpr6GOIhTbuS8PGA8GODJimVOqXm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Hzy2EL74; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Hzy2EL74"
ARC-Seal: i=1; a=rsa-sha256; t=1787246546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j63rlPCZ7qXwsORTByovS8tKpbTVX3h/tMyyiBXhtlm1iImLtYOnTDptVDq3n8XCxrPxgvVwfkYjOYmG3JsuOvQHmkpZIsZwMCNWGJ8K1PB2LfgkeFbM/FCe8d7V6PWEuS9Q8FAz1Kw3q+2KpE/Ij3eCxKhRT4xBuauXGi3kuXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246546; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oLoBLfcnQOiBM0HnBq3tHqQoRY0DT0UwbxP2exDjGlk=; 
	b=UOpds7qQgOFLGeCnh6CAidp/fqNwPlXwEWb7C6208E8Y1Bqi+Egp7mnPdGF4qzBT0M+OiRFTXcJAv1bfe2NhX9vK0Z1YGRClkv9ae1bLm1iFHlAEluXzybKrW8eRtBB+CHPIu/1FaFfXgbmElDFOIHj+fatV9QHo6zlIrdCKDGM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246546;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=oLoBLfcnQOiBM0HnBq3tHqQoRY0DT0UwbxP2exDjGlk=;
	b=Hzy2EL74CsMyjL/CmtmJthsFw83ebTBrCKnjMm4O+JYiD5eyo/KlotluxABiafGB
	ufIlnYdETZNaOPas3c0xWVY/pFLx0ZKZol2skxgEfyg1uq5yg9/BlJSq9cFFq/eAr0A
	VKScMzFoqFxz2vNsl8xviyzt204ZLkXrguCzd90Cm5aYxDohxM3q/qS8pXbFQqt8+7Z
	AmzenGgG2S/OIGYAnVkK2lw3aLhnb3lxEL/7vwHnq1gCTZjwrrynL4Y6caOG1tDWZ5X
	eJXGX39QkPiBcD3IHC0GLrUrwnvy/TmIMKlu1IsNf/ByojNkkolFhJ2w+vXAvrnJx6v
	iMxMzBrt3w==
Received: by mx.zohomail.com with SMTPS id 1787246543649820.309477607566;
	Thu, 20 Aug 2026 10:22:23 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v5 00/12] leds: Add support for hardware-initiated hardware
 control trigger transition
Date: Fri, 21 Aug 2026 01:21:55 +0800
Message-Id: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQ0Q6CIBQG4FdpXEfDgyB21Xu0LhQPSistUKs53
 z3Utlqbl//28/3jDMSjs+jJfjMQh731tqlDENsN0VVWl0htETIBBpIJJukFC09bZ8sSHa0edGk
 VNJWZhEgpnReGhNc3h8Y+Z/l4WrLv8jPqduKmRmV927jXPN3D1FtWZKRWV3qgjGpQOo6Z4Nrwg
 2vqcndtkEwjPf8ySZSuMzwwwuRCJADIJf4x8ZdRDNaZODAmTRB0libS/DLj8meH9y4ctf0cYhz
 fswpBkXIBAAA=
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

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
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
 drivers/leds/led-class.c                           |  40 ++-
 drivers/leds/led-triggers.c                        | 152 +++++++++++-
 drivers/leds/leds-cros_ec.c                        |   6 +
 drivers/leds/leds-turris-omnia.c                   |   7 +
 drivers/leds/leds.h                                |   2 +
 drivers/leds/trigger/Kconfig                       |  10 +
 drivers/leds/trigger/ledtrig-netdev.c              |   8 +
 drivers/platform/x86/lenovo/Kconfig                |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       | 270 +++++++++++++++++----
 include/linux/leds.h                               |  19 ++
 13 files changed, 549 insertions(+), 66 deletions(-)
---
base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf

Thanks,
Rong

