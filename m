Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD03D3485;
	Thu, 24 Sep 2026 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250660; cv=pass; b=Kpit87sSIBY7gw4bUN9u+CLJE/QSMr08uHK9oPBcLJkK+bCPiFtf51QeDjbKVrqSEasW3f7XqP/YkK+7n5AXbZJhMQnNGfowGDTX2BsBw1Ueu6vN9VO/EKyCoyhr3I10Wyy6SYxiX+1TWd7TLogD2dwJ/wVe5Uj8XH0nJecnRRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250660; c=relaxed/simple;
	bh=eBaHN3Y/BWFH+RYMTiSSRGuCI4fa0Na4sl/rx/lOdY8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JZT8yX7APl8SOVr/PDgokorMysOL46rrGZps5RILUpghiabpYfL7m0L1oZGwpIPm75Kv4tKLSIQ9o/Gee6+Bc25ngNpGoA4u/pBpJ/s3WONXl1FocP1cFB0dtyV0Nc7w81BzYk8L3ldI0g2bWBi8M/PgCpvSvyKTUHX9rrAjywM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WudqXkQ9; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WudqXkQ9"
ARC-Seal: i=1; a=rsa-sha256; t=1790250640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MZi9eX2mkZ7Ir+vzqlkr3lBL5Ts7hiTYHYSILke34zTmx2D1NUQ4PMHr2r5GCGy4AZ4zCjuzg2eaKXUDTaRh6Po4baSJvQUoeXjBAmNzaSoxONVvGqDXmX8PyyUDG3t1Mp3blUSEwYTg+QN+JKDXBwLECF+sSXn1rXYi1/vF4QI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790250640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=szzgQ9yx9ieaZGMbPDCWaI5C0qscCyhncAmiXOLJGFY=; 
	b=ikUv3BZ1z/3dZXfjQ85ZqEdB60OzBktdFa5qMiaphpxh01qjsOCDuQgbLGkVEbzisazS3xfhDvhxD6NkIdGFufV2yQmGHCIsosHBpBnmjDPITm528WzoIKAeGb7/lRVmGU2RxNabV/wfoRLd65v/WavuvfIt1uA2RBc3psJyLCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790250640;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=szzgQ9yx9ieaZGMbPDCWaI5C0qscCyhncAmiXOLJGFY=;
	b=WudqXkQ99Bj2XjUhJrGbSvpYwLyKg546DsNAx51VDSDr53ku4Q/T2wtn7gMeaSF+
	10CfPxFYJxQx30Hk5AyOkp29UgtNdLyNoHH6lH+DgkSPhezixkryp2QYJ/QNOkKobOU
	U0HOUL95eGFTaFsKF1VSU55uCq+4WSTf88eG1lSl9uTNlfxHGFOT8XzVnuqfWtFKVEU
	+b5onmeaG3t14SHk43zlQJtttiHBmWpj3ocmuP/fIoaMLYJLlkOvAPYXTlnwc2sOPhN
	7HuTT6Xxik7KwHVPkdt/+c1/skg5t1AqKU52eqcLyYGTrxro/Lk22AGbQDEyLgJuhIw
	FJzBchHbrw==
Received: by smtp.zohomail.com with SMTPS id 179025063891131.335288653322777;
	Thu, 24 Sep 2026 04:50:38 -0700 (PDT)
Message-ID: <607266787ef89717b9c70fd86cc882761060dc00.camel@rong.moe>
Subject: Re: [PATCH v7 08/13] leds: trigger: netdev: Implement
 hw_offloaded() callback
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
In-Reply-To: <20260924085316.GB331088@google.com>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
		 <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>
		 <20260924085316.GB331088@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 19:47:29 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

Thanks for your review.

On Thu, 2026-09-24 at 09:53 +0100, Lee Jones wrote:
> --- checkpatch.pl: clean (0 issues) ---
>=20
> On Mon, 21 Sep 2026, Rong Zhang wrote:
>=20
> > "netdev" can run in hardware control according to hardware capabilities
> > and trigger options.
> >=20
> > Implement hw_offloaded() callback to provide its hardware control state
> > to the LED core, and document the relation between the custom
> > "offloaded" attribute and the generic "trigger_may_offload_to_hw"
> > attribute.
> >=20
> > The callback mimics how the existing "offloaded" attribute does, i.e.,
> > locklessly reads hw_control, as it's just a hint and don't need to be
> > accurate.
> >=20
> > Acked-by: Ike Panhc <ikepanhc@gmail.com>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v7:
> > - Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)
> > - Rename the trigger_may_offload attribute to
> >   trigger_may_offload_to_hw (ditto)
> >=20
> > Changes in v3:
> > - Do not deprecate netdev's "offloaded" attribute (thanks Thomas
> >   Wei=C3=9Fschuh)
> > - Document the relation between the custom "offloaded" attribute and th=
e
> >   generic "trigger_may_offload" attribute (ditto)
> > ---
> >  Documentation/ABI/testing/sysfs-class-led                | 3 +++
> >  Documentation/ABI/testing/sysfs-class-led-trigger-netdev | 3 +++
> >  drivers/leds/trigger/ledtrig-netdev.c                    | 8 ++++++++
> >  3 files changed, 14 insertions(+)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/=
ABI/testing/sysfs-class-led
> > index 123e3a15b7d6..ea113fed10ef 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led
> > +++ b/Documentation/ABI/testing/sysfs-class-led
> > @@ -101,6 +101,9 @@ Description:
> >  		- `[foo_trigger]`: the trigger is selected and offloaded to
> >  		  hardware.
> > =20
> > +		The "netdev" trigger also provides a custom attribute to
> > +		indicate its state, see `/sys/class/leds/<led>/offloaded`.
> > +
> >  What:		/sys/class/leds/<led>/inverted
> >  Date:		January 2011
> >  KernelVersion:	2.6.38
> > diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b=
/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > index ed46b37ab8a2..203ea58396ed 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > @@ -75,6 +75,9 @@ Description:
> >  		If 1, the LED blinking in requested mode is offloaded to
> >  		hardware.
> > =20
> > +		LED trigger core also provides a generic attribute for this
> > +		purpose, see `/sys/class/leds/<led>/trigger_may_offload_to_hw`.
> > +
> >  What:		/sys/class/leds/<led>/link_10
> >  Date:		Jun 2023
> >  KernelVersion:	6.5
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigg=
er/ledtrig-netdev.c
> > index 5b4e92c14dbb..60409f054e22 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > @@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_cla=
ssdev *led_cdev)
> >  	kfree(trigger_data);
> >  }
> > =20
> > +static bool netdev_trig_hw_offloaded(struct led_classdev *led_cdev)
> > +{
> > +	struct led_netdev_data *trigger_data =3D led_get_trigger_data(led_cde=
v);
> > +
> > +	return trigger_data->hw_control;
>=20
> How sure are we that trigger_data can NEVER be NULL?

The hw_offloaded() callback is protected by led_cdev->trigger_lock, see
__led_trigger_is_hw_controlled().

trigger_data is set in the trigger's activate() callback, which is
protected by led_cdev->trigger_lock.

trigger_data is cleared in led_trigger_set() when removing the current
trigger, which is, again, protected by led_cdev->trigger_lock.

When CONFIG_LEDS_TRIGGERS=3Dn, the code is not built.

If the trigger is currently inactive, the callback cannot be called.

Therefore, it can never be NULL when we reach here.

Note that the trigger's DEVICE_ATTR_RO(offloaded) makes the same
assumption, too.

Thanks,
Rong

>=20
> > +}
> > +
> >  static struct led_trigger netdev_led_trigger =3D {
> >  	.name =3D "netdev",
> >  	.activate =3D netdev_trig_activate,
> >  	.deactivate =3D netdev_trig_deactivate,
> > +	.hw_offloaded =3D netdev_trig_hw_offloaded,
> >  	.groups =3D netdev_trig_groups,
> >  };
> > =20
> >=20
> > --=20
> > 2.55.0
> >=20
