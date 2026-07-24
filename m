Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733125B0A2;
	Fri, 24 Jul 2026 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913721; cv=none; b=GLzvcO7VZrMuM+MO90dgmvXAQGRBi217BwuNm5hvXMUF5TCI0wg9piRqTLeSHC/MKvqGeRDwmUGIeiuOrQn3ST4ChF/yLQQyXacl24sV7WJNi76cJIvnJiBqZLoBA9JL3B7ad97fkDL0pSNnv02WoYIcdWeMGwyf45k8Rdbc15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913721; c=relaxed/simple;
	bh=ZErP9uW2fgvLliLpTOkh8+7ss0oK6IsV1/xQLtPfMs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEgnULj/QDnH+ee7HgyKq3hbKJJ9EyAGLrxVAk+LLIoqb/QqcBwT7vDYvjpfe0vA98u5Yy94A/LJmPB7UV5j3K1IDjPIUA0XgYA3GuxNd2R/nRcpNruAoYg+FGAsBubh2CJYK1xNkaEYqJS7LEi9P+Dzc8QHeVknsvO5eYtxa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfpLcA91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfpLcA91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43981F000E9;
	Fri, 24 Jul 2026 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784913720;
	bh=lLDI+2dA8ADwSUytGzzHLsi3eJyN7SZDCHx1cAN+OdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfpLcA917r9+aIisU6XJ1g4N5w2C53A65isoTd4Zw9nNrv5Iw1ijvAPAzA46+wrm+
	 3YRvCH9/SofAxR4VIJd69ESLNfEX8JKjG3FXqV8CJoO0tnzmmlatErUyCovpnk+MvB
	 l2TH86HZQMHgDKTiEfbOnQw4Ov8VRKiNE896MXLguks0ghDN20IGxrH+Ol90Lnvanq
	 EL+0oXWkcXY+5v8w4Mf/j0s7yWd3mWw/MG4TBX90DgkCu19Tl2tY+q1FT7WWYhLRem
	 dtkf3XGH1mO4ep+1wqCB61QSc1s5X55TeMordhM79jisIY14ZaSGk0RvwjCbL1DQUn
	 59VzdqnH8LsDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260724-synology_microp_initial-v18-2-fb2f49f10e77@posteo.de>
References: <20260724-synology_microp_initial-v18-0-fb2f49f10e77@posteo.de>
 <20260724-synology_microp_initial-v18-2-fb2f49f10e77@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 17:21:59 +0000
Message-Id: <20260724172159.C43981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The dynamically formatted `name` CString for the alert LED is drop=
ped immediately after initialization, leaving a dangling pointer in the LED=
 subsystem.
- [High] The serdev device is never opened, causing subsequent LED operatio=
ns to hang the kernel worker thread indefinitely.
- [High] The `blink_set` callback sleeps by acquiring a Mutex and waiting f=
or synchronous serial I/O, but it is called from an RCU read-side critical =
section.
- [High] Incorrect struct field declaration order causes `power_name` to be=
 freed before the `power` LED device is unregistered.
- [Medium] Hardware blinking is not disabled when setting a solid brightnes=
s level, preventing the LED from turning on solidly.
- [Medium] The driver lacks a device-level lock to serialize commands sent =
to the microcontroller over the shared serdev bus, allowing concurrent LED =
updates to interleave.
--

--- Patch [2]: [PATCH v18 2/2] platform: Add initial synology microp driver=
 ---
commit 7eb4c67aa911615ee8b6562c3f14a129d9b90280
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver
   =20
Add a initial synology microp driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led. Other components such as fan control or handling
on-device buttons will be added once the required rust abstractions are
there.

> diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platfo=
rm/synology_microp/command.rs
> new file mode 100644
> index 0000000000000..490719490391c
> --- /dev/null
> +++ b/drivers/platform/synology_microp/command.rs
> @@ -0,0 +1,54 @@
[ ... ]
> +impl Command {
> +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> +        dev.write_all(

[Severity: Medium]
Since multiple LEDs can be updated concurrently, does this write_all() call
need a device-level lock to prevent interleaving commands on the shared ser=
dev
bus?

> +            match self {
[ ... ]
> +            },
> +            0,
> +        )?;
> +        dev.wait_until_sent(0);

[Severity: High]
Could this code cause a BUG by sleeping in an atomic context?

When the LED core invokes blink_set() (for instance, via a timer trigger),
it holds an rwlock and executes in an RCU read-side critical section. The
wait_until_sent() call performs a sleeping wait, which could cause a panic
or instability when called from that atomic context.

Additionally, could this block indefinitely if dev.open() hasn't been calle=
d?

> +        Ok(())
> +    }
> +}
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
> new file mode 100644
> index 0000000000000..01cad98616fdf
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs
> @@ -0,0 +1,304 @@
[ ... ]
> +#[pin_data]
> +pub(crate) struct Data<'bound> {
> +    #[pin]
> +    status: led::MultiColorDevice<'bound, StatusLedHandler>,
> +    power_name: CString,
> +    #[pin]
> +    power: led::Device<'bound, LedHandler>,

[Severity: High]
Does this struct field declaration order cause a use-after-free during
device unbinding?

In Rust, struct fields are dropped in the order they are declared. Because
power_name is declared before power, the CString buffer for the name is fre=
ed
first. The kernel would be left with a dangling pointer in led_cdev->name w=
hile
the power LED device is still registered and active, which could lead to me=
mory
corruption if read concurrently before unregistration completes.

> +    alert: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> +    usb_copy: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> +    esata: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> +}
> +
> +impl<'bound> Data<'bound> {
> +    pub(super) fn register<'a>(
> +        dev: &'bound serdev::Device<Bound>,
> +        model: &'a Model,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        'bound: 'a,
> +    {
> +        pin_init_scope(move || {
> +            Ok(try_pin_init!(Self {
[ ... ]
> +                alert: {
> +                    if let Some(color) =3D model.led_alert {
> +                        let name =3D CString::try_from_fmt(fmt!(
> +                            "synology:{}:alarm",
> +                            color.as_c_str().to_str()?
> +                        ))?;
> +                        Some(KBox::pin_init(
> +                            led::DeviceBuilder::new().color(color).name(=
&name).build(

[Severity: High]
Is the dynamically formatted name CString dropped immediately after this
initialization block?

The local CString variable is passed as a reference to the builder but is
dropped at the end of the `if let` block. The LED classdev will retain a
dangling pointer to its freed buffer, leading to a use-after-free when the =
LED
subsystem accesses the name.

> +                                dev,
> +                                try_pin_init!(LedHandler {
> +                                    blink <- new_mutex!(false),
> +                                    command: Command::AlertLed,
> +                                }),
> +                            ),
> +                            GFP_KERNEL,
> +                        )?)
> +                    } else {
> +                        None
> +                    }
> +                },
[ ... ]
> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        _classdev: &led::Device<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        (self.command)(if brightness =3D=3D 0 {
> +            *blink =3D false;
> +            State::Off
> +        } else if *blink {
> +            State::Blink
> +        } else {
> +            State::On
> +        })

[Severity: Medium]
If the LED is currently blinking, does this logic prevent it from turning on
solidly?

When a solid brightness is requested and the blink state is true, the state
remains State::Blink. The blink state needs to be reset so the hardware can
stop blinking and remain solidly on.

> +        .write(dev)?;
> +
> +        Ok(())
> +    }
> +
> +    fn blink_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        _classdev: &led::Device<'bound, Self>,
> +        delay_on: &mut usize,
> +        delay_off: &mut usize,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();

[Severity: High]
Is it safe to acquire this sleeping Mutex here?

Since the blink_set() callback can be called from an RCU read-side critical
section by the LED core, acquiring a Mutex here could lead to a kernel pani=
c.

> +
> +        (self.command)(if *delay_on =3D=3D 0 && *delay_off !=3D 0 {
[ ... ]
> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        classdev: &led::MultiColorDevice<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        if brightness =3D=3D 0 {
> +            *blink =3D false;
> +        }
> +
> +        let amber_brightness =3D classdev.subleds()[1].brightness();
> +
> +        let (color, subled_brightness) =3D if amber_brightness =3D=3D 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].brightness())
> +        } else {
> +            (StatusLedColor::Amber, amber_brightness)
> +        };
> +
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness =3D=3D 0 {
> +                State::Off
> +            } else if *blink {
> +                State::Blink
> +            } else {
> +                State::On
> +            },

[Severity: Medium]
Does the multi-color status LED suffer from the same logic flaw as
LedHandler::brightness_set(), where the LED stays blinking instead of turni=
ng
solid when a solid brightness level is requested?

> +        )
> +        .write(dev)
> +    }
> +
> +    fn blink_set<'bound>(
> +        &self,
[ ... ]
> diff --git a/drivers/platform/synology_microp/synology_microp.rs b/driver=
s/platform/synology_microp/synology_microp.rs
> new file mode 100644
> index 0000000000000..f7168309e6116
> --- /dev/null
> +++ b/drivers/platform/synology_microp/synology_microp.rs
> @@ -0,0 +1,91 @@
[ ... ]
> +    fn probe<'bound>(
> +        dev: &'bound serdev::Device<device::Core<'_>>,
> +        model: Option<&'bound Model>,
> +    ) -> impl PinInit<Self::Data<'bound>, kernel::error::Error> + 'bound=
 {
> +        pin_init_scope(move || {
> +            let model =3D model.ok_or(EINVAL)?;
> +
> +            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
> +            dev.set_flow_control(false);
> +            dev.set_parity(serdev::Parity::None)?;
> +
> +            Ok(try_pin_init!(SynologyMicropDriver {

[Severity: High]
Is a call to dev.open() missing during this setup?

The probe function configures the serdev device but doesn't seem to open it.
When subsequent operations try to write to the bus, the closed tty port will
accept 0 bytes and cause the driver's write logic to hang forever.

> +                led <- led::Data::register(dev, model),
> +            }))
> +        })
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synology_m=
icrop_initial-v18-0-fb2f49f10e77@posteo.de?part=3D2
