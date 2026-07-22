Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C81440A1F;
	Wed, 22 Jul 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738263; cv=pass; b=KnrSoYXlHZKrOfVNT++waK2MTFt+AzGXjYexmm2sbJ6zSe0BU5sGY43lRKUoAgQZXYpDw//HBWpUQUqYxs+rJeFn9KnhjZ4UN5UtVfLrk5pAckEdKdkNcQyPBYo10EazKABGcmcjgJ9Twv6yWKotvylWtbV23PO2m6GCAdFERDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738263; c=relaxed/simple;
	bh=F9sGgDdP97ntrZdX9pS1HAYZUppAVmPNkdrgDiuH3Ik=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qFckQrttt7d0ujm3PGHCKS4PTiyAhlWSNlau9/Wt8/7sIPmyuqVJ7FlZ0NtxJkIsgtWCxd3aPQO4v34tGJj+NP1k8snCqrLDk9Hr8Ya5lavaipmaUm75JvEM2s56yFxhsQ2ZFXZsVmt71iYwSQyXkYBWtpJC9tq5zms6CspDT8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QK8JLrug; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QK8JLrug"
ARC-Seal: i=1; a=rsa-sha256; t=1784738230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OL1Ve+DGL0WqquveixD2Y83mcPN2hNnlQlpFK4pFIMQ0V+JQNaVLiacEsyq51LXHOnYU2jGjq6qpSaQCFc+KDiXtvAWkbPpR/Lg2Xf0sHuuGmfxDUSCS9i1gwPE7SaupKTITe169Oxg8CFzXOqps3Sri8yKtCLialX0NzZOijLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784738230; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jJ1PGazpDSOuUb91837wghlBu1TBhgu1eryggs8yc4A=; 
	b=dW2bi7vADv8O7vnlDXP/yCrtpEztkoheFgp45kBOe916z8pyIjbKTBSiidQ7XDcrbKtA8nVFGj9VFWNcI4mLhhJ4eYOqVdF1fRClPw30InL8UneeFUKWbCQ0exAn4MWgAZEhUX+DkVE6ychh31u82fYxWhkzBpW1kIfu9v3HH/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784738230;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jJ1PGazpDSOuUb91837wghlBu1TBhgu1eryggs8yc4A=;
	b=QK8JLrug4x8BZukQaRZSyLnC+SR+JnoRaNIfTp+ssAkXJNtKji4ho8uj8kxWz9tU
	x8yylvesPZxy5JW6jP12M2fNff6UNP6ZtQS5OF8vprchDz1uoBq8FuRwlRzbgDHQjri
	/swYuHXEBV8aEKuRw/DWQnE7/vo7gzhqmwpIczPMCAgqtZP0CR9+B2nVIKqrFy2QonU
	ltcJ3/0Pg0J7vgeCKHEMP9QNJAXb5gmQS3AO+GuJm6mnDv5w/nfbXceAtNNYfR5fSj4
	3jFTyx6tuYSuh0yoqeTkU4nFAtejCytf+cpxp8fZ7vO9+FuUtPPt70Q/il4xk3tcvSi
	YCqt8t0Zbg==
Received: by mx.zohomail.com with SMTPS id 1784738229117212.46321746119304;
	Wed, 22 Jul 2026 09:37:09 -0700 (PDT)
Message-ID: <bb2a9c53669fde370f14cb9ef3e0a73fc729a5bb.camel@rong.moe>
Subject: Re: [PATCH RFC v3 00/11] leds: Add support for hardware-initiated
 hardware control trigger transition
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Benson Leung <bleung@chromium.org>, Guenter Roeck
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?=	 <kabel@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260722123913.GB11805@google.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
	 <20260722123913.GB11805@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 00:31:52 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Lee,

On Wed, 2026-07-22 at 13:39 +0100, Lee Jones wrote:
> Why is this still an RFC?

I plan to make it non-RFC in v4, after resolving concerns from Ilpo and
Sashiko.

Thanks,
Rong

>=20
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hardware
> > control trigger. Meanwhile, such laptops also offer a shrotcut for
> > cycling through brightness levels and auto mode. For example, on
> > ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> > levels in the following sequence:
> >=20
> >   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
> >=20
> > Recent ThinkPad models should have similar sequence too.
> >=20
> > However, there are some issues preventing us from using a private
> > hardware control trigger:
> >=20
> > 1. We want a mechanism to tell userspace which trigger is the hardware
> >    control one, so that userspace can determine if auto mode is on/off,
> >    as well as turing it on/off programmatically without obtaining the
> >    trigger's name via other channels
> > 2. Writing brightness has the side effect of disabling hardware control=
,
> >    but the hardware control trigger remains active, resulting in the
> >    software and hardware being out of sync. Most LED drivers that
> >    supports hardware control also suffer from the same issue
> > 3. Turing on/off auto mode via the shortcut cannot activate/deactivate
> >    the corresponding hardware control trigger, making the software stat=
e
> >    out of sync
> > 4. Even with #3 solved, deactivating the hardware control trigger has
> >    the side effect of emitting LED_OFF, breaking the shortcut cycle,
> >    especially "auto =3D> 1"
> >=20
> > This RFC series tries to demonstrate a path on solving these issues:
> >=20
> > - Introduce an attribute "trigger_may_offload", so that userspace can
> >   determine:
> >   - if the LED device supports hardware control (supported =3D> visible=
)
> >   - which trigger is the hardware control trigger selected by the LED
> >     device
> >   - if the trigger is selected ("<foo_trigger>")
> >   - if the trigger is offloaded ("[foo_trigger]")
> >     - A callback offloaded() is added so that LED triggers can report
> >       their hardware control state
> > - Remove hardware control trigger when writing brightness
> > - Add led_trigger_notify_hw_control_changed() interface, so that LED
> >   drivers can notify the LED core about hardware-initiated hardware
> >   control transitions. The LED core will then determine if the
> >   transition is allowed and switching between "none" (i.e., no trigger)
> >   and the device's private trigger accordingly
> >   - This capability is restricted to the device's private trigger. If
> >     the current trigger is neither the private trigger nor "none", no
> >     transition will be made
> >   - This interface is gated behind Kconfig LEDS_TRIGGERS_HW_CHANGED and
> >     LED device flag LED_TRIG_HW_CHANGED
> > - Tune the logic of trigger deactivation so that it won't emit LED_OFF
> >   when the deactivation is triggered by hardware
> >=20
> > The last three patches are included in the RFC series to demonstrate ho=
w
> > to these interfaces are supposed to be utilized, so that ideapad-laptop
> > can expose the auto mode of ThinkBook's keyboard backlight. They can be
> > submitted separately once the dust settles, if preferred.
> >=20
> > [ Summary of other approaches ]
> >=20
> > < custom attribute >
> >=20
> > Pros:
> > - simplicity, KISS
> > - no need to touch the LED core
> > - extensible as long as it has a sensor-neutral name
> >   - a sensor-related name could potentially lead to a mess if a future
> >     device implements auto mode based on multiple different sensors
> >=20
> > Cons:
> > - must have zero influence on brightness_set[_blocking] callbacks
> >   in order not to break triggers
> >   - potential interference with triggers and the brightness attribute,
> >     can't solve #2
> > - weird semantic (an attribute other than "brightness" and "trigger"
> >   changes the brightness)
> >=20
> > < private hardware control trigger (this series) >
> >=20
> > Pros:
> > - mutually exclusive with other triggers and the brightness attribute
> >   (hence less chaos)
> > - semantic correctness
> > - acts as an aggregate switch to turn on/off auto mode even a future
> >   device implements auto mode based on multiple different sensors
> >   - extensibility (through trigger attributes)
> >=20
> > Cons:
> > - complexity
> >=20
> > [ Previous discussion threads ]
> >=20
> > https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fast=
mail.com
> > https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.came=
l@rong.moe
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v3:
> > - Integrate https://lore.kernel.org/all/20260712-leds-hw-control-bright=
ness-set-v1-1-1de593b09d26@rong.moe/
> >   into the series
> >   - Adopt __led_trigger_is_hw_controlled() in the rest of the series
> > - Rearrange the series so that the code using the offloaded() callback =
is
> >   introduced before the driver implementation (thanks Thomas Wei=C3=9Fs=
chuh)
> > - Reword documentations and commit messages (ditto)
> > - Adopt guard() and lockdep (ditto)
> > - Address concerns from Sashiko
> >   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
> >   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
> >   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-=
0-c28c44053cf3%40rong.moe
> > - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> > - Link to v2: https://patch.msgid.link/20260618-leds-trigger-hw-changed=
-v2-0-c28c44053cf3@rong.moe
> >=20
> > Changes in v2:
> > - Restrict the led_trigger_notify_hw_control_changed() interface to
> >   private triggers only
> >   - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
> >     hw control trigger"), not relavant any more
> > - Gate the led_trigger_notify_hw_control_changed() interface behind
> >   Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
> >   LED_TRIG_HW_CHANGED
> > - Fix lock ordering inversion
> > - ideapad-laptop:
> >   - Only call led_trigger_notify_hw_control_changed() when needed
> >   - Serialize keyboard backlight notifications
> > - Reword commit messages and documentations
> > - Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.m=
oe
> >=20
> > ---
> > Rong Zhang (11):
> >       leds: Move led_trigger_is_hw_controlled() to the right place
> >       leds: class: Remove hardware control trigger when writing brightn=
ess
> >       leds: trigger: Add offloaded() callback and provide trigger_may_o=
ffload attribute
> >       leds: cros_ec: trigger: Implement offloaded() callback
> >       leds: turris-omnia: trigger: Implement offloaded() and declare hw=
_control_trigger
> >       leds: trigger: netdev: Implement offloaded() callback
> >       leds: trigger: Enforce strict checks in led_trigger_is_hw_control=
led()
> >       leds: trigger: Add led_trigger_notify_hw_control_changed() interf=
ace
> >       platform/x86: ideapad-laptop: Decouple hardware & classdev bright=
ness for keyboard backlight
> >       platform/x86: ideapad-laptop: Serialize keyboard backlight notifi=
cations
> >       platform/x86: ideapad-laptop: Fully support auto keyboard backlig=
ht
> >=20
> >  Documentation/ABI/testing/sysfs-class-led          |  25 ++
> >  .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
> >  Documentation/leds/leds-class.rst                  |  72 ++++++
> >  drivers/leds/led-class.c                           |  35 ++-
> >  drivers/leds/led-triggers.c                        | 146 +++++++++++-
> >  drivers/leds/leds-cros_ec.c                        |   6 +
> >  drivers/leds/leds-turris-omnia.c                   |   7 +
> >  drivers/leds/leds.h                                |   2 +
> >  drivers/leds/trigger/Kconfig                       |   9 +
> >  drivers/leds/trigger/ledtrig-netdev.c              |   8 +
> >  drivers/platform/x86/lenovo/Kconfig                |   1 +
> >  drivers/platform/x86/lenovo/ideapad-laptop.c       | 264 +++++++++++++=
+++-----
> >  include/linux/leds.h                               |  19 ++
> >  13 files changed, 532 insertions(+), 65 deletions(-)
> > ---
> > base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> > change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf
> >=20
> > Thanks,
> > Rong
> >=20
