Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2D2C2363;
	Wed, 22 Jul 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723963; cv=none; b=S/NeZbrPW9xw/4SEuFOvMEzDpy770Bp01JMJiBTIw5OwmtPcHdLevTZcsZJbsM5lgBZ2ggq+aAEtvFk3i0NZAg2tQgWyOiNTzzvnfMtBHGzTjyB1XGrDyztuPRraCECu7d7eJGaMruy5N8ZWp+e7Okcq0g3agGlw81kqFXcHByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723963; c=relaxed/simple;
	bh=iL7uKBS9ZTP3BZnab4HLX+ObqIPaRdDovUxz2Fw7DPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbt5CPMJL1mjm1dh75xLIuU1tAmvVfhYeUPiVSi03hJD/vRc4mtDCuCmXAbLf0EHWYQ2+y5pwb5DIuKnkTYvAqf2U1JizRsRwexEPScjMq+WKqdyUurZ3RpRumZ9/ITiCG7rpVyiqISOjUfhfr9qpUk58MxenkAFzsV8s/LPreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nonz2WAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nonz2WAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEC1F000E9;
	Wed, 22 Jul 2026 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784723961;
	bh=dRwyKxedZ4yIxwSgRnxCGHxbxnMNH/WOYZBQpkVdgro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nonz2WAbMlhZCtilBux70ccvt4sBpr393hP4ODcRKMY37SF97JArCBdxmNoZ/OQ4U
	 xvMhfr03erEl6EdH3M7MD77sAeKHnWFNceceLA3Y9SHPmnLu4Yd57EATkQGCqa2ile
	 PxPgDQBh3opVjIjpCQcx6Wuq4KKmLLxd9UQpaTJL8UHXvsW3xdwXDoBwkzVcuIAikM
	 QzWGUpaxeuMnHxyaU0sEnHWybWrjjyo9qxYekRCijB+cPttnyHf8fDKya9Yzg/sbdX
	 SA8hPPdz4NNxYEx/slPZNvd5faG8YxDgG1/9XoiAXGVy81m/gBxgZWNaJTUsWNrvKA
	 lwpBDJRw4y09w==
Date: Wed, 22 Jul 2026 13:39:13 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v3 00/11] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-ID: <20260722123913.GB11805@google.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>

Why is this still an RFC?

> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> levels in the following sequence:
> 
>   1 => 2 => 0 => auto => 1 ...
> 
> Recent ThinkPad models should have similar sequence too.
> 
> However, there are some issues preventing us from using a private
> hardware control trigger:
> 
> 1. We want a mechanism to tell userspace which trigger is the hardware
>    control one, so that userspace can determine if auto mode is on/off,
>    as well as turing it on/off programmatically without obtaining the
>    trigger's name via other channels
> 2. Writing brightness has the side effect of disabling hardware control,
>    but the hardware control trigger remains active, resulting in the
>    software and hardware being out of sync. Most LED drivers that
>    supports hardware control also suffer from the same issue
> 3. Turing on/off auto mode via the shortcut cannot activate/deactivate
>    the corresponding hardware control trigger, making the software state
>    out of sync
> 4. Even with #3 solved, deactivating the hardware control trigger has
>    the side effect of emitting LED_OFF, breaking the shortcut cycle,
>    especially "auto => 1"
> 
> This RFC series tries to demonstrate a path on solving these issues:
> 
> - Introduce an attribute "trigger_may_offload", so that userspace can
>   determine:
>   - if the LED device supports hardware control (supported => visible)
>   - which trigger is the hardware control trigger selected by the LED
>     device
>   - if the trigger is selected ("<foo_trigger>")
>   - if the trigger is offloaded ("[foo_trigger]")
>     - A callback offloaded() is added so that LED triggers can report
>       their hardware control state
> - Remove hardware control trigger when writing brightness
> - Add led_trigger_notify_hw_control_changed() interface, so that LED
>   drivers can notify the LED core about hardware-initiated hardware
>   control transitions. The LED core will then determine if the
>   transition is allowed and switching between "none" (i.e., no trigger)
>   and the device's private trigger accordingly
>   - This capability is restricted to the device's private trigger. If
>     the current trigger is neither the private trigger nor "none", no
>     transition will be made
>   - This interface is gated behind Kconfig LEDS_TRIGGERS_HW_CHANGED and
>     LED device flag LED_TRIG_HW_CHANGED
> - Tune the logic of trigger deactivation so that it won't emit LED_OFF
>   when the deactivation is triggered by hardware
> 
> The last three patches are included in the RFC series to demonstrate how
> to these interfaces are supposed to be utilized, so that ideapad-laptop
> can expose the auto mode of ThinkBook's keyboard backlight. They can be
> submitted separately once the dust settles, if preferred.
> 
> [ Summary of other approaches ]
> 
> < custom attribute >
> 
> Pros:
> - simplicity, KISS
> - no need to touch the LED core
> - extensible as long as it has a sensor-neutral name
>   - a sensor-related name could potentially lead to a mess if a future
>     device implements auto mode based on multiple different sensors
> 
> Cons:
> - must have zero influence on brightness_set[_blocking] callbacks
>   in order not to break triggers
>   - potential interference with triggers and the brightness attribute,
>     can't solve #2
> - weird semantic (an attribute other than "brightness" and "trigger"
>   changes the brightness)
> 
> < private hardware control trigger (this series) >
> 
> Pros:
> - mutually exclusive with other triggers and the brightness attribute
>   (hence less chaos)
> - semantic correctness
> - acts as an aggregate switch to turn on/off auto mode even a future
>   device implements auto mode based on multiple different sensors
>   - extensibility (through trigger attributes)
> 
> Cons:
> - complexity
> 
> [ Previous discussion threads ]
> 
> https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com
> https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v3:
> - Integrate https://lore.kernel.org/all/20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe/
>   into the series
>   - Adopt __led_trigger_is_hw_controlled() in the rest of the series
> - Rearrange the series so that the code using the offloaded() callback is
>   introduced before the driver implementation (thanks Thomas Weißschuh)
> - Reword documentations and commit messages (ditto)
> - Adopt guard() and lockdep (ditto)
> - Address concerns from Sashiko
>   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
>   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
>   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
> - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> - Link to v2: https://patch.msgid.link/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe
> 
> Changes in v2:
> - Restrict the led_trigger_notify_hw_control_changed() interface to
>   private triggers only
>   - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
>     hw control trigger"), not relavant any more
> - Gate the led_trigger_notify_hw_control_changed() interface behind
>   Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
>   LED_TRIG_HW_CHANGED
> - Fix lock ordering inversion
> - ideapad-laptop:
>   - Only call led_trigger_notify_hw_control_changed() when needed
>   - Serialize keyboard backlight notifications
> - Reword commit messages and documentations
> - Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.moe
> 
> ---
> Rong Zhang (11):
>       leds: Move led_trigger_is_hw_controlled() to the right place
>       leds: class: Remove hardware control trigger when writing brightness
>       leds: trigger: Add offloaded() callback and provide trigger_may_offload attribute
>       leds: cros_ec: trigger: Implement offloaded() callback
>       leds: turris-omnia: trigger: Implement offloaded() and declare hw_control_trigger
>       leds: trigger: netdev: Implement offloaded() callback
>       leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
>       leds: trigger: Add led_trigger_notify_hw_control_changed() interface
>       platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
>       platform/x86: ideapad-laptop: Serialize keyboard backlight notifications
>       platform/x86: ideapad-laptop: Fully support auto keyboard backlight
> 
>  Documentation/ABI/testing/sysfs-class-led          |  25 ++
>  .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
>  Documentation/leds/leds-class.rst                  |  72 ++++++
>  drivers/leds/led-class.c                           |  35 ++-
>  drivers/leds/led-triggers.c                        | 146 +++++++++++-
>  drivers/leds/leds-cros_ec.c                        |   6 +
>  drivers/leds/leds-turris-omnia.c                   |   7 +
>  drivers/leds/leds.h                                |   2 +
>  drivers/leds/trigger/Kconfig                       |   9 +
>  drivers/leds/trigger/ledtrig-netdev.c              |   8 +
>  drivers/platform/x86/lenovo/Kconfig                |   1 +
>  drivers/platform/x86/lenovo/ideapad-laptop.c       | 264 ++++++++++++++++-----
>  include/linux/leds.h                               |  19 ++
>  13 files changed, 532 insertions(+), 65 deletions(-)
> ---
> base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf
> 
> Thanks,
> Rong
> 

-- 
Lee Jones
