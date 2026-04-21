Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B731F99B;
	Tue, 21 Apr 2026 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795069; cv=none; b=DiwOArlXjuwwIDWwEGdLMJiCgOnKP1px4eksQCUubIjDjo6hmlfmkK4NmqFn55aimUULDIRRCAd5uhi2rRTl/UI6K835tG/euTKHBgvowN2AfMyBhAnENF0JQxfQ+87zI9h8XsESPFkZKUHUPjskEvw8fWvvjwS6y0I+KFEijZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795069; c=relaxed/simple;
	bh=3qk+IB3lY1ax5Jo/wlajR8HjBuToQPII40ATciAhAAk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nrsfO/ZxWZAQx7t1y45I+i0RaBn17QOv/XiWFQc9OjB+M02K6j028cjvT9OXyB6H5Y6PLS9lbpuyvJzMai4DvBNMRnFk8qz+8BIIHa7MGTUxR9fNZgCJpPH9Nfct3KogfgZfRoEDWVO6ihzsVbZgbCz3iK1rXD5LOyXqJJxYlcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvZq/9YO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvZq/9YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776795067; x=1808331067;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=3qk+IB3lY1ax5Jo/wlajR8HjBuToQPII40ATciAhAAk=;
  b=kvZq/9YOX61KDCiGEsarp9CIH7fjDQrZQCiJDSL20r2etLSmv+8UWyQ1
   qaNw8JtXJWKB+f4WgQq5NOmzYlU5ZBR+x9dOue6Rq2YNTguMOdgQy5VyS
   T+hNw8cdBJVy8zLB/YIAp3nXLP3ExLLeDepyVoibse29ZL1dCDM0trA4U
   lrpF1zOgq1w6EnTUMCG+Be2AarShvwwUXITI13YGOgsbBcYJrl9qahKsd
   IxHi4rup5aht9NMRUh7HRDA3lO1DhIDIqi74DJvefup1ax07FJjEpH0XY
   590p/aaRdv7UYaP6R215wj/Y72aK67yx33sCFFw1C2Bz0tHG3vmpdvmGR
   g==;
X-CSE-ConnectionGUID: NirLTJw0QVOklxporugn7Q==
X-CSE-MsgGUID: q6dfLff1Tyawak7GzpywRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77614600"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77614600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:11:06 -0700
X-CSE-ConnectionGUID: HMdUCqnbRZalMbhRoTkLyA==
X-CSE-MsgGUID: ayQcjClWTLGdMsS+Iw8ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227773900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:10:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Apr 2026 21:10:56 +0300 (EEST)
To: Markus Probst <markus.probst@posteo.de>
cc: Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
    Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
In-Reply-To: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
Message-ID: <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>  <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>  <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1911329950-1776794494=:972"
Content-ID: <9de3baa3-50d2-e027-b347-adcf2e0ba0f0@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1911329950-1776794494=:972
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6c89e77d-6fd5-9c62-9534-0015dd34db7a@linux.intel.com>

On Tue, 21 Apr 2026, Markus Probst wrote:

> On Tue, 2026-04-21 at 14:59 +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 20 Apr 2026, Markus Probst wrote:
> >=20
> > > Add a initial synology microp driver, written in Rust.
> > > The driver targets a microcontroller found in Synology NAS devices. I=
t
> > > currently only supports controlling of the power led, status led, ale=
rt
> > > led and usb led. Other components such as fan control or handling
> > > on-device buttons will be added once the required rust abstractions a=
re
> > > there.
> > >=20
> > > This driver can be used both on arm and x86, thus it goes into the ro=
ot
> > > directory of drivers/platform.
> > >=20
> > > Tested successfully on a Synology DS923+.
> > >=20
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > >  MAINTAINERS                                        |   6 +
> > >  drivers/platform/Kconfig                           |   2 +
> > >  drivers/platform/Makefile                          |   1 +
> > >  drivers/platform/synology_microp/Kconfig           |  13 +
> > >  drivers/platform/synology_microp/Makefile          |   3 +
> > >  drivers/platform/synology_microp/TODO              |   7 +
> > >  drivers/platform/synology_microp/command.rs        |  54 ++++
> > >  drivers/platform/synology_microp/led.rs            | 281 +++++++++++=
++++++++++
> > >  drivers/platform/synology_microp/model.rs          |  49 ++++
> > >  .../platform/synology_microp/synology_microp.rs    | 110 ++++++++
> > >  10 files changed, 526 insertions(+)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c1c686846cdd..49f08290eed0 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -25555,6 +25555,12 @@ F:=09drivers/dma-buf/sync_*
> > >  F:=09include/linux/sync_file.h
> > >  F:=09include/uapi/linux/sync_file.h
> > > =20
> > > +SYNOLOGY MICROP DRIVER
> > > +M:=09Markus Probst <markus.probst@posteo.de>
> >=20
> > You should probably add:
> >=20
> > L:=09platform-driver-x86@vger.kernel.org
> >=20
> > Through which tree the patches to this driver are generally expected to=
 be=20
> > picked up?
>
> I suppose platform-drivers-x86.

Okay (with the platform drivers maintainer hat on). Just don't expect me=20
to have deep Rust knowledge.

> The driver itself can be used both on
> x86 and arm64. Although I also have seen Synology devices with PowerPC
> (no device with PowerPC is supported in the driver yet).=20

In practice platform drivers scope has already expanded beyond x86 so the=
=20
platform-drivers-x86 list naming is just a historic artifact.

> > > +S:=09Maintained
> > > +F:=09Documentation/devicetree/bindings/embedded-controller/synology,=
ds1825p-microp.yaml
> > > +F:=09drivers/platform/synology_microp/
> > > +
> > >  SYNOPSYS ARC ARCHITECTURE
> > >  M:=09Vineet Gupta <vgupta@kernel.org>
> > >  L:=09linux-snps-arc@lists.infradead.org

> > > diff --git a/drivers/platform/synology_microp/TODO b/drivers/platform=
/synology_microp/TODO
> > > new file mode 100644
> > > index 000000000000..1961a33115db
> > > --- /dev/null
> > > +++ b/drivers/platform/synology_microp/TODO
> > > @@ -0,0 +1,7 @@
> > > +TODO:
> > > +- add missing components:
> > > +  - handle on-device buttons (Power, Factory reset, "USB Copy")
> > > +  - handle fan failure
> > > +  - beeper
> > > +  - fan speed control
> > > +  - correctly perform device power-off and restart on Synology devic=
es
> >=20
> > Is this TODO list really needed within the kernel distribution?
>
> Not really. Although it indicates the current state of the driver.
>=20
> > If you planning on add these features (relatively) soon yourself (perha=
ps=20
> > depending on when the rust infra required for these features becomes=20
> > available), the list would not be that useful for other developers at a=
ll.
>
> Yes. Also I haven't seen anyone work on input, hwmon, reboot/sysoff
> rust abstractions yet, so I will likely need to add those as well.

Lets not include the TODO file then.

> > > +/// Blink delay measured using video recording on DS923+ for Power a=
nd Status Led.
> > > +///
> > > +/// We assume it is the same for all other leds and models.
> > > +const BLINK_DELAY: usize =3D 167;
> >=20
> > On C side time related consts are required to include the unit in their=
=20
> > name. Perhaps Rust code should also follow this convention?
>
> How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> through the already existing type alias `kernel::time::Msecs` for u32.

I don't have opinion on this with my limited Rust knowledge (it just=20
stuck to my eye how non-specific that original one looked). If Rust=20
can do things even better as Miguel seems to imply, please look at those=20
directions.

--=20
 i.
--8323328-1911329950-1776794494=:972--
