Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A72750FB
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784914528; cv=none; b=oxN5Yw1Yi7L1chDuQRY3DCT6S5Da1quaJwAsjqlU3QUoAUtbVHeJfX079HnlNT9mvYmh3/9raiuUQ1cpKyyNS7TgbOnzrU28XfLZd5JY0scKOvTesb9xCWBnVWMMYcjg9AuvM5JVb3wNYx0rX/R6WsN10S2+9kqu+8e7FFKocMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784914528; c=relaxed/simple;
	bh=gIqYCLWW7SUViLlR+dDm6uQMmJXfYZwAj+kvnXPRFlc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H+xukSUgNwPbu+5DWM2CZno0FmevswlCAIVDCtoQVUKAG2FGYAzJRh0UNkZ4wMJ2QFbArgn1Oc1sIuAADne3TXSf3y5jkwlq6/wvVX8uN+v1XPttkypqBld0irWyfd9rrnL3mFln8wszyffk8Lt7j+rKAAWveLK22zVFaSchRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XSeTE9st; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XSeTE9st"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3B5F024002A
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 19:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1784914523;
	bh=5GzFLcEQ0ql3ZRyTT0oSrfnTRlAsu9tOsP4CxPiOt0o=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=XSeTE9sthou2fB7xBJZPHs8/E4dAXrTiRWEnED7N0ZveXI0TVWphjkpyYWAliNM2u
	 Ew5GMveTFLqFMasG5IcMdrgm/Z/vYF/HbY6h7a9gyG9NVmiV6Hjh5PIy9SY/jolS7s
	 t7OH7ys9SIgg1xNNkeUr+U8b9ZnwBGSF/Xfs/czFhT0Yvd6fY8LgYPSrq4K0uCAnwO
	 Ebz28tevvOxoxhc9ey/v0Ko1xWi47pJsiWh9/dE6hZq2iIXwb11agciwZ4poHEv9dr
	 ksnfu4RImiUiKNTER7hxXEQfHqQiqOsXjXvswosedp6T0ARbrrAxuV4e2uUElCBw5l
	 TiwX282RabWcg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4h6FWG1YGfz6tyW;
	Fri, 24 Jul 2026 19:35:22 +0200 (CEST)
Message-ID: <f61a7665218e255f73679bd9ef478053d314a691.camel@posteo.de>
Subject: Re: [PATCH v18 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	ojeda@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
Date: Fri, 24 Jul 2026 17:35:22 +0000
In-Reply-To: <20260724172159.C43981F000E9@smtp.kernel.org>
References: <20260724-synology_microp_initial-v18-0-fb2f49f10e77@posteo.de>
	 <20260724-synology_microp_initial-v18-2-fb2f49f10e77@posteo.de>
	 <20260724172159.C43981F000E9@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ldWMoLMX7MD6c3WU0hme"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-ldWMoLMX7MD6c3WU0hme
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-24 at 17:21 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] The dynamically formatted `name` CString for the alert LED is dr=
opped immediately after initialization, leaving a dangling pointer in the L=
ED subsystem.
> - [High] The serdev device is never opened, causing subsequent LED operat=
ions to hang the kernel worker thread indefinitely.
> - [High] The `blink_set` callback sleeps by acquiring a Mutex and waiting=
 for synchronous serial I/O, but it is called from an RCU read-side critica=
l section.
> - [High] Incorrect struct field declaration order causes `power_name` to =
be freed before the `power` LED device is unregistered.
> - [Medium] Hardware blinking is not disabled when setting a solid brightn=
ess level, preventing the LED from turning on solidly.
> - [Medium] The driver lacks a device-level lock to serialize commands sen=
t to the microcontroller over the shared serdev bus, allowing concurrent LE=
D updates to interleave.
> --
>=20
> --- Patch [2]: [PATCH v18 2/2] platform: Add initial synology microp driv=
er ---
> commit 7eb4c67aa911615ee8b6562c3f14a129d9b90280
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> platform: Add initial synology microp driver
>    =20
> Add a initial synology microp driver, written in Rust.
> The driver targets a microcontroller found in Synology NAS devices. It
> currently only supports controlling of the power led, status led, alert
> led and usb led. Other components such as fan control or handling
> on-device buttons will be added once the required rust abstractions are
> there.
>=20
> > diff --git a/drivers/platform/synology_microp/command.rs b/drivers/plat=
form/synology_microp/command.rs
> > new file mode 100644
> > index 0000000000000..490719490391c
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/command.rs
> > @@ -0,0 +1,54 @@
> [ ... ]
> > +impl Command {
> > +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> > +        dev.write_all(
>=20
> [Severity: Medium]
> Since multiple LEDs can be updated concurrently, does this write_all() ca=
ll
> need a device-level lock to prevent interleaving commands on the shared s=
erdev
> bus?
>=20
> > +            match self {
> [ ... ]
> > +            },
> > +            0,
> > +        )?;
> > +        dev.wait_until_sent(0);
>=20
> [Severity: High]
> Could this code cause a BUG by sleeping in an atomic context?
>=20
> When the LED core invokes blink_set() (for instance, via a timer trigger)=
,
> it holds an rwlock and executes in an RCU read-side critical section. The
> wait_until_sent() call performs a sleeping wait, which could cause a pani=
c
> or instability when called from that atomic context.
BLOCKING =3D true is set in every LedOps implementation. Therefore
sleeping is allowed.
>=20
> Additionally, could this block indefinitely if dev.open() hasn't been cal=
led?
This function does not exist. The serdev rust abstraction opens it
automatically before probe.

Also if it isn't open, it would cause a null pointer dereference
instead of blocking indefinitely.
>=20
> > +        Ok(())
> > +    }
> > +}
> > diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform=
/synology_microp/led.rs
> > new file mode 100644
> > index 0000000000000..01cad98616fdf
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/led.rs
> > @@ -0,0 +1,304 @@
> [ ... ]
> > +#[pin_data]
> > +pub(crate) struct Data<'bound> {
> > +    #[pin]
> > +    status: led::MultiColorDevice<'bound, StatusLedHandler>,
> > +    power_name: CString,
> > +    #[pin]
> > +    power: led::Device<'bound, LedHandler>,
>=20
> [Severity: High]
> Does this struct field declaration order cause a use-after-free during
> device unbinding?
>=20
> In Rust, struct fields are dropped in the order they are declared. Becaus=
e
> power_name is declared before power, the CString buffer for the name is f=
reed
> first. The kernel would be left with a dangling pointer in led_cdev->name=
 while
> the power LED device is still registered and active, which could lead to =
memory
> corruption if read concurrently before unregistration completes.
`power_name` only needs to outlive the initialization. It is copied by
the led subsystem on register.
>=20
> > +    alert: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> > +    usb_copy: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> > +    esata: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
> > +}
> > +
> > +impl<'bound> Data<'bound> {
> > +    pub(super) fn register<'a>(
> > +        dev: &'bound serdev::Device<Bound>,
> > +        model: &'a Model,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        'bound: 'a,
> > +    {
> > +        pin_init_scope(move || {
> > +            Ok(try_pin_init!(Self {
> [ ... ]
> > +                alert: {
> > +                    if let Some(color) =3D model.led_alert {
> > +                        let name =3D CString::try_from_fmt(fmt!(
> > +                            "synology:{}:alarm",
> > +                            color.as_c_str().to_str()?
> > +                        ))?;
> > +                        Some(KBox::pin_init(
> > +                            led::DeviceBuilder::new().color(color).nam=
e(&name).build(
>=20
> [Severity: High]
> Is the dynamically formatted name CString dropped immediately after this
> initialization block?
Yes.
>=20
> The local CString variable is passed as a reference to the builder but is
> dropped at the end of the `if let` block. The LED classdev will retain a
> dangling pointer to its freed buffer, leading to a use-after-free when th=
e LED
> subsystem accesses the name.
No, it will not retain a pointer. It copies the string in the
initialization.

>=20
> > +                                dev,
> > +                                try_pin_init!(LedHandler {
> > +                                    blink <- new_mutex!(false),
> > +                                    command: Command::AlertLed,
> > +                                }),
> > +                            ),
> > +                            GFP_KERNEL,
> > +                        )?)
> > +                    } else {
> > +                        None
> > +                    }
> > +                },
> [ ... ]
> > +    fn brightness_set<'bound>(
> > +        &self,
> > +        dev: &'bound Self::Bus,
> > +        _classdev: &led::Device<'bound, Self>,
> > +        brightness: u32,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
> > +        (self.command)(if brightness =3D=3D 0 {
> > +            *blink =3D false;
> > +            State::Off
> > +        } else if *blink {
> > +            State::Blink
> > +        } else {
> > +            State::On
> > +        })
>=20
> [Severity: Medium]
> If the LED is currently blinking, does this logic prevent it from turning=
 on
> solidly?
>=20
> When a solid brightness is requested and the blink state is true, the sta=
te
> remains State::Blink. The blink state needs to be reset so the hardware c=
an
> stop blinking and remain solidly on.
Led Subsystem documentation explicitly says
- "passing LED_OFF stops blinking"
- "passing LED_OFF stops hardware blinking"
- "To turn off blinking, use the API function led_brightness_set() with
brightness value LED_OFF, which should stop any software timers that
may have been required for blinking."

It is intended to continue blinking if a non-0 brightness is set.

See https://docs.kernel.org/leds/leds-class.html

>=20
> > +        .write(dev)?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn blink_set<'bound>(
> > +        &self,
> > +        dev: &'bound Self::Bus,
> > +        _classdev: &led::Device<'bound, Self>,
> > +        delay_on: &mut usize,
> > +        delay_off: &mut usize,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
>=20
> [Severity: High]
> Is it safe to acquire this sleeping Mutex here?
>=20
> Since the blink_set() callback can be called from an RCU read-side critic=
al
> section by the LED core, acquiring a Mutex here could lead to a kernel pa=
nic.
BLOCKING =3D true is set in every LedOps implementation. Therefore
sleeping is allowed.

>=20
> > +
> > +        (self.command)(if *delay_on =3D=3D 0 && *delay_off !=3D 0 {
> [ ... ]
> > +    fn brightness_set<'bound>(
> > +        &self,
> > +        dev: &'bound Self::Bus,
> > +        classdev: &led::MultiColorDevice<'bound, Self>,
> > +        brightness: u32,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
> > +        if brightness =3D=3D 0 {
> > +            *blink =3D false;
> > +        }
> > +
> > +        let amber_brightness =3D classdev.subleds()[1].brightness();
> > +
> > +        let (color, subled_brightness) =3D if amber_brightness =3D=3D =
0 {
> > +            (StatusLedColor::Green, classdev.subleds()[0].brightness()=
)
> > +        } else {
> > +            (StatusLedColor::Amber, amber_brightness)
> > +        };
> > +
> > +        Command::StatusLed(
> > +            color,
> > +            if subled_brightness =3D=3D 0 {
> > +                State::Off
> > +            } else if *blink {
> > +                State::Blink
> > +            } else {
> > +                State::On
> > +            },
>=20
> [Severity: Medium]
> Does the multi-color status LED suffer from the same logic flaw as
> LedHandler::brightness_set(), where the LED stays blinking instead of tur=
ning
> solid when a solid brightness level is requested?
As explained above, it is not a flaw.
>=20
> > +        )
> > +        .write(dev)
> > +    }
> > +
> > +    fn blink_set<'bound>(
> > +        &self,
> [ ... ]
> > diff --git a/drivers/platform/synology_microp/synology_microp.rs b/driv=
ers/platform/synology_microp/synology_microp.rs
> > new file mode 100644
> > index 0000000000000..f7168309e6116
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/synology_microp.rs
> > @@ -0,0 +1,91 @@
> [ ... ]
> > +    fn probe<'bound>(
> > +        dev: &'bound serdev::Device<device::Core<'_>>,
> > +        model: Option<&'bound Model>,
> > +    ) -> impl PinInit<Self::Data<'bound>, kernel::error::Error> + 'bou=
nd {
> > +        pin_init_scope(move || {
> > +            let model =3D model.ok_or(EINVAL)?;
> > +
> > +            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
> > +            dev.set_flow_control(false);
> > +            dev.set_parity(serdev::Parity::None)?;
> > +
> > +            Ok(try_pin_init!(SynologyMicropDriver {
>=20
> [Severity: High]
> Is a call to dev.open() missing during this setup?
This function does not exist. The serdev rust abstraction automatically
opens the device before probe.
>=20
> The probe function configures the serdev device but doesn't seem to open =
it.
> When subsequent operations try to write to the bus, the closed tty port w=
ill
> accept 0 bytes and cause the driver's write logic to hang forever.
Writing to a closed serdev device would case a null pointer
dereference, which does not happen in testing.
>=20
> > +                led <- led::Data::register(dev, model),
> > +            }))
> > +        })
> > +    }
> > +}

This review does not contain a single issue. All false positives.


--=-ldWMoLMX7MD6c3WU0hme
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpjolkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSQtoQAIwfZHTfOd5DDh4IvjIs
bEU/SBjUnIlUY59EwKlHgnSsVbftmmAEp4XzE217uCR1ucBs7xxbhRi9C2ynyuF7
JqhY0dl3u1cYUWxgZOubpvkHTnqWOz/5H1wBt6lSCN963rtBrLWqCofUScP+HuhZ
CThFGBFbhn8tOgc1wZwv9tQ9CcVSsIqRzxVXTNHmkDsLc6P4RlLlU91Mt5o5I+G+
0bVMyczwfJmMKjLRx5NCks6h8wFuYkmoatXJid/ippEOIaT0vPFC4B51H85LwA12
oBRYsLVdOqzAdi+7UfLaLxa11iCnq+Fh0yRzlcmAZpW93Kwz5e9ZBuGL+i2RB7B3
QRQJjaFhn110ZaDXMSf9KZIa0wF7MC6uveEARu2YMMMrY3+hziQEAZXzyfbEBK/v
asd4q3SMNQNw6w/kvA2n+BWcq3ZyTpWNzX6Tx5uK3/9mDng/TonYFYFofPqiewN5
lYkNvM60obpWh9Bov9RcnQFHp/yZWVCtG+EXvbMPxCOINaRMgf4EJm+KicZzRgOj
Cyy1oK/ycQR73X5usmkdZFtW8fVKzEwEGaRcIDdCcCAd5whBN3m/l5I3DaRZ/BRc
o1z75OaDFVlSHiIHGZYrLoe5zwh4yBtOU0QUGmDGOw9w7j8Sdd6D3MbvNSPyV8DC
8nqyqEUB596JJPgnnT4FO052
=sIDS
-----END PGP SIGNATURE-----

--=-ldWMoLMX7MD6c3WU0hme--
