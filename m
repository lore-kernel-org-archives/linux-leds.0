Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994C32ED21
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811391; cv=none; b=in6tvLvu0u5QkH5i+92kK7vZn8cpulmXED/j+mNsQXQn9DI8q5e2fTn1u75Mmqkt7I/fCYJgDNanDdc2/hKMB6Y6Ei2EcsJtrm/GOqGiT23rxHpguG11jJcm90PVSIJQwKLVfVIqFb5jdKoyc6mdb+UL9WeYeaJnG2n5OLmjjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811391; c=relaxed/simple;
	bh=M1W0dpYFWBDSPrOZE3SH+5PjTnAcF5pNKRmFAPSQGSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg/de8BXr+M3vRXcDSsswSHFJ48Z7E3TX+sw3HDkYqu6DGteiuu66K6251AjUl3wxles6m3kJNg0qYFJNTIwuDDt/WSAvJ+PjKdH2nZDUNGwiCh0jI5Nm1jVREbwYJ+j0mbgXRVVhWmtTWoy8nyRzyL9U9UOhElOgvTMWjdD+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyX7i-0001ln-Oq; Fri, 06 Mar 2026 16:29:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyX7f-0044Ng-2I;
	Fri, 06 Mar 2026 16:29:53 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyX7g-00000004CpP-3zqO;
	Fri, 06 Mar 2026 16:29:52 +0100
Date: Fri, 6 Mar 2026 16:29:52 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Pavel Machek <pavel@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aary8OPCveDNbbpP@pengutronix.de>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
 <20260306135505.GN183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306135505.GN183676@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

On Fri, 06 Mar 2026 13:55:05 +0000, Lee Jones wrote:
> On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> 
> > On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > > 
> > > The interface doesn't check the values and higher values may lead to
> > > unexpected color changes if the brightness is changed.
> > > 
> > > Clamp the intensity value to max_brightness.
> > 
> > This also brings a regression if somebody doesn't care about wrapping around.
> > It's possible to return an error instead, but still the user space will be
> > broken (in some rare weird cases).

If somebody in user space doesn't care about the wrap around for the
brightness value, the behavior will still differ between systems,
because the value for the wraparound for brightness depends on
max_brightness, which is driver specific and some drivers already
implement clamping on max_brightness.

Handling this in a coherent way at the API level leads to more
consistent behavior between different drivers.

Furthermore, intensity for multicolor LEDs behaves kind of like
brightness for single color LEDs and for these, the documentation
(Documentation/ABI/testing/sysfs-class-led) specifies that

	The [brightness] value is between 0 and
	/sys/class/leds/<led>/max_brightness

and

	Most LEDs don't have hardware brightness support, so will
	just be turned on for non-zero brightness settings.

With a wraparound behavior, writing (max_brightness + 1) to brightness
would lead to a wraparound and turn the LED off, which is against this
specification.

I agree that the behavior of intensity is undefined if it exceeds
max_brightness. Do you have an example of user space (or use case) that
relies on this behavior or is this a hypothetical case?

> > 
> > Again, I care even less about this change, but be always careful,
> > the main rule in the kernel "We do NOT break user space".
> 
> I'm going to remove this patch for now.
> 
> /tmp/next/build/drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
> /tmp/next/build/include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_434' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
>   706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> /tmp/next/build/include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
>   687 |                         prefix ## suffix();                             \
>       |                         ^~~~~~
> /tmp/next/build/include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
>   706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>    40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>       |         ^~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
>    98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>       |         ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
>   105 | #define min(x, y)       __careful_cmp(min, x, y)
>       |                         ^~~~~~~~~~~~~
> /tmp/next/build/drivers/leds/led-class-multicolor.c:51:38: note: in expansion of macro 'min'
>    51 |                 intensity_value[i] = min(intensity_value[i],
>       |               

I'm confused because you already applied [0] my patch that fixes this
exact error.

[0] https://lore.kernel.org/all/177273014112.321702.15159156714467402540.b4-ty@kernel.org/

Michael
