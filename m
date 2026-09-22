Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3953F6A1;
	Tue, 22 Sep 2026 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079266; cv=pass; b=Wn98PgzNaWZ6A8aCzPRJXziJcMsS48BdwSHmIhismkZya9c3s//KPOEVS0PK0SggDkfhR2ZZqDPVk1+aLDHrsBNMDqk1F26cMHm0naztAZPWPMB3x7oJHVWAF1XaW1uTn/tlB/xkxqSFJgh+4wfKEtXOG22sqlKn4Zjgc3IdMog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079266; c=relaxed/simple;
	bh=ItC/WOIGz/+9Z3DRvJiptzUh/E+i6CU4Zl51qimby8I=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DTBTM9+NFHy/HXUr7/ampli1+fb827BvTTnxkFO9JJgaJX/zi+kssDaDpuyxyabiN/oPbyv0oShbVQ3++4NFwB6ltnp8hEnBV0o8Gs23phXxazBTQ+IV3YODUCLv9xWjnZEUUMwc5M5832KZXwgoSwrHqIQ4dAtEgU6ouXX3m+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=TJtcbljO; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="TJtcbljO"
ARC-Seal: i=1; a=rsa-sha256; t=1790079237; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aTMtecq66GEbcSCJHh2uXnbs8RncIRCPlu6sgeDhTp5NQi7uunVp9dgEiCBwX7W2crajtP4dk3M5Z3S10T5r4GY7TUqIUW8wvTeIY8eLUkXdcOb3D4l5Ydj7siqMjUSeOHFK8Vc1BvAdk9IVSJcu2GqJw/J0njoUEfUXI/q9cFE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790079237; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WTY8umljDuBBQA9Lw88PYGLNFht5h0rDj1fQi8NtK3k=; 
	b=h/+6zhxo6NmS0f5qHrWw3sYOuxdogUt4U3lBLpplAyQiwiOlOYGYUrYAjJuuqMZ6JwWpNqFGZKe8L2gGtbPciKKtU70ZcKFuTQEqEX4+yLDtagJh6cdGxm9Z1VYPCjrzpEY+sp1nXnnFKMb+0G1muIF07Otzlj+atAyD9qVSmo4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790079237;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=WTY8umljDuBBQA9Lw88PYGLNFht5h0rDj1fQi8NtK3k=;
	b=TJtcbljOf5P6HGrM94SI31/BbSwrsrcBg+zV0gV4jEcJ5q1PHzThJJ9IKzbmRnEC
	hqW5AT3ITyjLSeJA5l/C7ZJk97ns1/+XYTZ/nnjsenHuz5qp4nC5QchGlikybYhxZVA
	5YfVDrR6bz4y9MjNaCRwvIhhIK4/Fg9khvgmDLTOUNiWYQ3AnHZfZUpdCWXSDKHVLCf
	OHbdsjahG/QZf3CuUuJUubAzeTe3AecVchXgCx5XvlfFlyM1K+90cTcqb2QCm7pBBi+
	MA+vVwwDoPC+MA4JiUbxOhPeQlIim51hUMEwvIpqRPMqRkypTmAJFqhHzfo8MlCaNw6
	Ggognhxwhw==
Received: by smtp.zohomail.com with SMTPS id 1790079234890282.0810227676957;
	Tue, 22 Sep 2026 05:13:54 -0700 (PDT)
Message-ID: <93454a754b630da3cca593f76bb03123b0fe4995.camel@rong.moe>
Subject: Re: [PATCH v6 04/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
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
In-Reply-To: <20260922103224.GD2730113@google.com>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>
	 <20260910150535.GG1051768@google.com>
	 <cdecf33094742331552a4b86d43673cdf1590bf2.camel@rong.moe>
	 <20260922103224.GD2730113@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:08:43 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Tue, 2026-09-22 at 11:32 +0100, Lee Jones wrote:
> On Fri, 11 Sep 2026, Rong Zhang wrote:
>=20
> > Hi Lee,
> >=20
> > Thanks for your review.
> >=20
> > On Thu, 2026-09-10 at 16:05 +0100, Lee Jones wrote:
> > > On Wed, 02 Sep 2026, Rong Zhang wrote:
> > >=20
> > > > There are multiple triggers implementing hardware control. However,=
 the
> > > > LED trigger core doesn't really know the hardware control (offloade=
d)
> > > > state since the coordination is done directly between the trigger a=
nd
> > > > the LED driver. It can only assume private triggers as offloaded an=
d
> > > > generic ones as not offloaded.
> > > >=20
> > > > Add an offloaded() callback so that triggers can report their offlo=
aded
> > > > states to the LED trigger core. When unimplemented, it defaults to =
true
> > > > for private triggers and false for generic ones to keep the current
> > > > behavior unchanged.
> > > >=20
> > > > With that, provide a new attribute "trigger_may_offload", so that
> > > > userspace can determine:
> > > >=20
> > > > - if the LED device supports hardware control (supported =3D> visib=
le)
> > > > - which trigger is the hardware control trigger selected by the LED
> > > >   device
> > > > - if the trigger is selected ("<foo_trigger>")
> > > > - if the trigger is offloaded ("[foo_trigger]")
> > > >=20
> > > > Note: the documentation describes the attribute as "returning a lis=
t"
> > > > despite the LED core currently only supports one hardware control
> > > > trigger per LED device. This is intentional to make the attribute
> > > > extensible in the future without breaking userspace.
> > > >=20
> > > > Acked-by: Ike Panhc <ikepanhc@gmail.com>
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > ---
> > > > Changes in v6:
> > > > - Update Date: and KernelVersion: for the document of
> > > >   /sys/class/leds/<led>/trigger_may_offload
> > > >=20
> > > > Changes in v3:
> > > > - Rearrange the series so that the code using the offloaded() callb=
ack is
> > > >   introduced before the driver implementation (thanks Thomas Wei=C3=
=9Fschuh)
> > > > - Reword documentation (ditto)
> > > > - Adopt guard() and lockdep (ditto)
> > > > - Adopt __led_trigger_is_hw_controlled() from newly-integrated PATC=
H 1
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-class-led | 22 +++++++++++++++++++=
+++
> > > >  Documentation/leds/leds-class.rst         | 20 +++++++++++++++++++=
+
> > > >  drivers/leds/led-class.c                  | 22 +++++++++++++++++++=
+++
> > > >  drivers/leds/led-triggers.c               | 30 +++++++++++++++++++=
+++++++++++
> > > >  drivers/leds/leds.h                       |  2 ++
> > > >  include/linux/leds.h                      |  1 +
> > > >  6 files changed, 97 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentat=
ion/ABI/testing/sysfs-class-led
> > > > index d4c918cc11a1..e3605fc55fa8 100644
> > > > --- a/Documentation/ABI/testing/sysfs-class-led
> > > > +++ b/Documentation/ABI/testing/sysfs-class-led
> > > > @@ -78,6 +78,28 @@ Description:
> > > >  		(which would often be configured in the device tree for the
> > > >  		hardware).
> > > > =20
> > > > +What:		/sys/class/leds/<led>/trigger_may_offload
> > >=20
> > > *_to_hw?
> >=20
> > ACK.
> >=20
> > >=20
> > > > +Date:		September 2026
> > > > +KernelVersion:	7.4
> > > > +Contact:	linux-leds@vger.kernel.org
> > > > +Description:
> > > > +		Names and states of triggers that may be offloaded to hardware.
> > > > +		Such triggers are also called "hardware control trigger" in some
> > > > +		context.
> > > > +
> > > > +		Only exists when the LED supports trigger offload.
> > > > +
> > > > +		Reading this file returns a list of triggers that are capable to
> > > > +		be offloaded. The optional brackets around the trigger name
> > > > +		indicate the state of the current trigger:
> > > > +
> > > > +		- `foo_trigger`: the trigger is not selected.
> > > > +		- `<foo_trigger>`: the trigger is selected, but falls back to
> > > > +		  software blink for some reason (e.g., incompatible trigger
> > > > +		  parameters)
> > > > +		- `[foo_trigger]`: the trigger is selected and offloaded to
> > > > +		  hardware.
> > > > +
> > > >  What:		/sys/class/leds/<led>/inverted
> > > >  Date:		January 2011
> > > >  KernelVersion:	2.6.38
> > > > diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds=
/leds-class.rst
> > > > index 3913966cfdac..2d41a6db602c 100644
> > > > --- a/Documentation/leds/leds-class.rst
> > > > +++ b/Documentation/leds/leds-class.rst
> > > > @@ -242,6 +242,9 @@ ops and needs to declare specific support for t=
he supported triggers.
> > > > =20
> > > >  With hw control we refer to the LED driven by hardware.
> > > > =20
> > > > +A sysfs attribute `trigger_may_offload` is provided for userspace =
to
> > > > +query supported triggers and their states.
> > > > +
> > > >  LED driver must define the following value to support hw control:
> > > > =20
> > > >      - hw_control_trigger:
> > > > @@ -298,6 +301,15 @@ LED driver must implement the following API to=
 support hw control:
> > > >                  Returns a pointer to a struct device or NULL if no=
thing
> > > >                  is currently attached.
> > > > =20
> > > > +LED trigger should implement the following API to indicate hw cont=
rol:
> > > > +    - offloaded:
> > >=20
> > > hw_offloaded?
> >=20
> > ACK.
> >=20
> > >=20
> > > > +                return a boolean indicating if the trigger is curr=
ently
> > > > +                offloaded to hardware.
> > > > +
> > > > +                If a trigger doesn't implement this callback, the =
default
> > > > +                value will be true for private triggers and false =
for generic
> > > > +                ones.
> > > > +
> > > >  LED driver can activate additional modes by default to workaround =
the
> > > >  impossibility of supporting each different mode on the supported t=
rigger.
> > > >  Examples are hardcoding the blink speed to a set interval, enable =
special
> > > > @@ -311,6 +323,14 @@ the end use hw_control_set to activate hw cont=
rol.
> > > >  A trigger can use hw_control_get to check if a LED is already in h=
w control
> > > >  and init their flags.
> > > > =20
> > > > +Alternatively, a private trigger can be implemented along with the=
 LED driver if
> > > > +the LED's hardware control doesn't fit any generic trigger. To ass=
ociate the
> > > > +private trigger with the LED classdev, their `trigger_type` must b=
e the same. To
> > > > +declare that the private trigger provides hardware control for the=
 associated
> > > > +LED classdev, set the `hw_control_trigger` string to the trigger's=
 name. Since
> > > > +both the LED classdev and the private trigger are in the same LED =
driver, it's
> > > > +not necessary for them to coordinate via `hw_control_*` callbacks.
> > > > +
> > > >  When the LED is in hw control, no software blink is possible and d=
oing so
> > > >  will effectively disable hw control.
> > > > =20
> > > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > > index 39cc2f3ea63f..7e571bd1de5b 100644
> > > > --- a/drivers/leds/led-class.c
> > > > +++ b/drivers/leds/led-class.c
> > > > @@ -96,8 +96,30 @@ static const struct bin_attribute *const led_tri=
gger_bin_attrs[] =3D {
> > > >  	&bin_attr_trigger,
> > > >  	NULL,
> > > >  };
> > > > +
> > > > +static DEVICE_ATTR_RO(trigger_may_offload);
> > > > +static struct attribute *led_trigger_attrs[] =3D {
> > > > +	&dev_attr_trigger_may_offload.attr,
> > > > +	NULL
> > > > +};
> > > > +
> > > > +static umode_t led_trigger_is_visible(struct kobject *kobj,
> > >=20
> > > Why doesn't all of this live in the triggers file as well?
> >=20
> > The current revision only exports trigger_may_offload() to coordinate t=
he
> > two files (led-class.c and led-trigger.c).
> >=20
> > If we had to move led_trigger_is_visible() into led-triggers.c, the
> > trigger_may_offload and led_trigger_attrs must be moved as well. Due to
> > the movement, we would have to export led_trigger_attrs and
> > led_trigger_is_visible() to fill led_trigger_group.
> >=20
> > in short, moving led_trigger_is_visible() requires exporting more
> > symbols.
> >=20
> > To make things tidier, how about moving led_trigger_group and
> > led_trigger_bin_attrs into led-triggers.c as well? In this manner we on=
ly
> > need to export led_trigger_group, and the #ifdef block here is
> > eliminated. What do you think?
>=20
> Sounds sensible.

Thanks for you opinion. I've taken that approach in v7 and sent it out.
See
https://lore.kernel.org/all/20260921-leds-trigger-hw-changed-v7-0-fe3cdb6de=
c51@rong.moe/

>=20
> > >=20
> > > > +				      struct attribute *attr,
> > > > +				      int idx)
> > > > +{
> > > > +	struct device *dev =3D kobj_to_dev(kobj);
> > > > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > > +
> > > > +	if (attr =3D=3D &dev_attr_trigger_may_offload.attr)
> > > > +		return led_cdev->hw_control_trigger ? attr->mode : 0;
> > > > +
> > > > +	return attr->mode;
> > > > +}
> > > > +
> > > >  static const struct attribute_group led_trigger_group =3D {
> > > >  	.bin_attrs =3D led_trigger_bin_attrs,
> > > > +	.attrs =3D led_trigger_attrs,
> > > > +	.is_visible =3D led_trigger_is_visible,
> > > >  };
> > > >  #endif
> > > > =20
> > > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-trigger=
s.c
> > > > index 804a04b326c4..de17a8bbb4d4 100644
> > > > --- a/drivers/leds/led-triggers.c
> > > > +++ b/drivers/leds/led-triggers.c
> > > > @@ -42,6 +42,10 @@ static bool __led_trigger_is_hw_controlled(struc=
t led_classdev *led_cdev)
> > > >  	if (!led_cdev->trigger)
> > > >  		return false;
> > > > =20
> > > > +	if (led_cdev->trigger->offloaded)
> > > > +		return led_cdev->trigger->offloaded(led_cdev);
> > > > +
> > > > +	/* Otherwise assume private triggers as always offloaded. */
> > >=20
> > > s/as/are/
> >=20
> > ACK.
> >=20
> > >=20
> > > >  	return led_cdev->trigger->trigger_type;
> > > >  }
> > > > =20
> > > > @@ -341,6 +345,32 @@ void led_trigger_set_default(struct led_classd=
ev *led_cdev)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(led_trigger_set_default);
> > > > =20
> > > > +ssize_t trigger_may_offload_show(struct device *dev,
> > > > +				 struct device_attribute *attr, char *buf)
> > > > +{
> > > > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > > +	struct led_trigger *trig;
> > > > +	bool hit, offloaded;
> > > > +	int len;
> > > > +
> > > > +	guard(mutex)(&led_cdev->led_access);
> > > > +	guard(rwsem_read)(&led_cdev->trigger_lock);
> > > > +
> > > > +	trig =3D led_cdev->trigger;
> > > > +
> > > > +	offloaded =3D __led_trigger_is_hw_controlled(led_cdev);
> > > > +	hit =3D offloaded || (trig && !strcmp(led_cdev->hw_control_trigge=
r, trig->name));
> > > > +
> > > > +	/* [offloaded] <active_but_not_offloaded> inactive */
> > >=20
> > > Why do they have to live in different 'containers'?
> >=20
> > The comment might be somewhat misleading...
> >=20
> > An LED device can never have an offloaded trigger and an active-but-not=
-
> > offloaded trigger at the same time. The comment just demonstrates how t=
he
> > output might look like.
> >=20
> > The output is multiplexed to help userspace determine two things in one
> > read:
> >=20
> > - The name of the LED device's hardware control trigger
> > - The state of the said trigger
> >=20
> > That being said, if the complexity is undesired, it's OK to convert the
> > attribute into a dumb one that only returns the plain name of the
> > hardware control trigger. In this manner we will need to provide an
> > additional attribute to expose the offloaded state. This can be achieve=
d
> > by adopting the attribute "offloaded" from netdev into led-triggers.c.
> > What do you think?
>=20
> My job is just to make you think about the problem.  I have no strong
> opinion one way or the other.  You are currently the expert of the code
> you are engineering.  What do YOU think?

After some careful considerations,=C2=A0I believe there is no use case when
userspace software needs to check if a trigger is active but not
offloaded. Therefore, I've removed the <active_but_not_offloaded>
container in v7. IOW, a trigger will be wrapped in a [offloaded]
container only when it's active and offloaded,=C2=A0otherwise it remains ba=
re.
In this manner, userspace software can parse
/sys/class/leds/<led>/trigger_may_offload_to_hw in the same way as
/sys/class/leds/<led>/trigger.

Thanks,
Rong
