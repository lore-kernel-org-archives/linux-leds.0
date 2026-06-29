Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E23B6366;
	Mon, 29 Jun 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744067; cv=none; b=J7mivFxaVTDXS/PTfaAzxG0rX/WCE6bs1YwEpGL8fMwXchkPkhxsqEJPVkk3ZQ84nArGAOYhWVuHLxtBkq/r8VshoMCTP5m7OkJs64grlxfHIGeoHXj43XrJ5BE7a3I6iRjE3BqphBt/SmCiAX7Asu1qnvgsKZLLWveqLp/teug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744067; c=relaxed/simple;
	bh=zML1gvT0XlSgy8Y/za7yL6PAACPGT2szAU9WfQIElw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6Dj6wTZYSfeKPdscdhydF2zQRU71yA0R385Y4plWY77nYczDoYZiLAjYZkB5wi+FgVnnduBFPcc7pYa8sf9kua+HqKTJYpw4UuJ90X3Eb6MrSP8/pD/NRT2WiPKbkVKHIcpS3Dd2Q3UWfC4zT18PfmHokSj8+c4VKEPorhz87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpq1rCG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpq1rCG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F581F000E9;
	Mon, 29 Jun 2026 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782744065;
	bh=q1erFdz+3qMjeDbnSBQLXiDrulVRRZUzPVbatloErpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpq1rCG7dDp1LjyWESLcXKybGf5N9EI+OOlTp+0YlzDpVAEEaUPvO+BFZl/Vkihvl
	 KheL1xoKJ2Pf5NESTi9WWMNAS9R4pSRvjDCQvp2PYJ7dXdch1UYGCJvwJ5/xUE5TJC
	 A8hyi9N4bx+AxcmjYhW6QrS4dRI4eS+eEGvCI6E1kN+7a8dkthIKcfjXbVlKGPmqd3
	 KXGaJQTDUmtbglq3ayyqTwJL1tzTnz78bE4Kv5gCMVihXo8ZeoLE7BsTtBAIpwPll4
	 MupQluKn8ZKSHAuzxvSGsx8mU0V/hkreoWXfhY8dMPBRob3kKQtNeFuWLwahSVslfZ
	 3ZrNGIZ6oLp9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-synology_microp_initial-v15-2-4b3d7367c7cf@posteo.de>
References: <20260629-synology_microp_initial-v15-0-4b3d7367c7cf@posteo.de>
 <20260629-synology_microp_initial-v15-2-4b3d7367c7cf@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 14:41:05 +0000
Message-Id: <20260629144105.91F581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The Kconfig symbol `SYNOLOGY_MICROP` depends on a non-existent sym=
bol `RUST_SERIAL_DEV_BUS_ABSTRACTIONS`.
- [High] The driver is compiled but not linked into a loadable module when =
configured as `CONFIG_SYNOLOGY_MICROP=3Dm`.
- [High] The `alert` LED's name string is allocated as a local variable and=
 dropped before the LED device finishes its lifetime, causing a Use-After-F=
ree.
- [High] The `power_name` string is dropped before the `power` LED device, =
creating a dangling pointer during teardown.
- [Medium] Writing a solid brightness value fails to disable hardware blink=
ing.
--

commit 9541fa00c8f64528a8c6eb20d425f6bc2c90bf38
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver

This patch adds an initial Rust-based driver for the microcontroller found
in Synology NAS devices. It currently supports controlling the power, statu=
s,
alert, and USB LEDs.

> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/=
synology_microp/Kconfig
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Kconfig
[ ... ]
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config SYNOLOGY_MICROP
> +	tristate "Synology Microp driver"
> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS

[Severity: High]
Does RUST_SERIAL_DEV_BUS_ABSTRACTIONS exist in the kernel tree? If not, this
driver cannot be enabled under any configuration and becomes dead code.

> diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platform=
/synology_microp/Makefile
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y +=3D synology_microp.o

[Severity: High]
If the driver is configured as a loadable module (CONFIG_SYNOLOGY_MICROP=3D=
m),
will this obj-y assignment compile the objects into a built-in archive
instead of linking them into a .ko module?

> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs
[ ... ]
> @@ -21,11 +21,18 @@ use crate::{
> =20
>  #[pin_data]
>  pub(crate) struct Data<'bound> {
>      #[pin]
>      status: led::MultiColorDevice<'bound, StatusLedHandler>,
>      power_name: CString,
>      #[pin]
>      power: led::Device<'bound, LedHandler>,

[Severity: High]
In Rust, struct fields are dropped top-to-bottom. Could power_name be freed
before the power LED device is unregistered? This might leave a dangling
pointer during driver teardown if the LED subsystem accesses the freed name.

[ ... ]
> @@ -71,21 +78,21 @@ impl<'bound> Data<'bound> {
>                  alert: {
>                      if let Some(color) =3D model.led_alert {
>                          let name =3D CString::try_from_fmt(fmt!(
>                              "synology:{}:alarm",
>                              color.as_c_str().to_str()?
>                          ))?;
>                          Some(KBox::pin_init(
>                              led::DeviceBuilder::new().color(color).name(=
&name).build(
>                                  dev,

[Severity: High]
Does passing a reference to the local name string here cause a use-after-fr=
ee?

The name variable is dropped at the end of the if let block, but the kernel
LED core may retain and access the pointer after probing finishes.

[ ... ]
> @@ -167,23 +174,23 @@ impl LedOps for LedHandler {
>      fn brightness_set<'bound>(
>          &self,
>          dev: &'bound Self::Bus,
>          _classdev: &led::Device<'bound, Self>,
>          brightness: u32,
>      ) -> Result<()> {
>          let mut blink =3D self.blink.lock();
>          (self.command)(if brightness =3D=3D 0 {
>              *blink =3D false;
>              State::Off
>          } else if *blink {
>              State::Blink
>          } else {
>              State::On
>          })

[Severity: Medium]
When a solid brightness (>0) is requested via sysfs, this logic preserves
the hardware blinking state. Does this violate the LED subsystem API, which
expects setting brightness to disable hardware blinking?

[ ... ]
> @@ -240,23 +247,23 @@ impl LedOps for StatusLedHandler {
>      fn brightness_set<'bound>(
>          &self,
>          dev: &'bound Self::Bus,
>          classdev: &led::MultiColorDevice<'bound, Self>,
>          brightness: u32,
>      ) -> Result<()> {
[ ... ]
>          Command::StatusLed(
>              color,
>              if subled_brightness =3D=3D 0 {
>                  State::Off
>              } else if *blink {
>                  State::Blink
>              } else {
>                  State::On
>              },
>          )

[Severity: Medium]
Similarly to LedHandler, does this fail to clear the blink state when
subled_brightness > 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-synology_m=
icrop_initial-v15-0-4b3d7367c7cf@posteo.de?part=3D2
