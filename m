From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Add LED pattern trigger
Date: Fri, 3 Jan 2014 15:23:13 +0000
Message-ID: <20140103152313.4fd5c48f@alan.etchedpixels.co.uk>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
	<20131230162158.7420e811@alan.etchedpixels.co.uk>
	<BLU172-W451DF59115DB2B0A7F694AACC90@phx.gbl>
	<20140101201053.12be7d27@alan.etchedpixels.co.uk>
	<alpine.DEB.2.02.1401011423180.27645@nftneq.ynat.uz>
	<20140101230135.48f6f781@alan.etchedpixels.co.uk>
	<alpine.DEB.2.02.1401011547340.27645@nftneq.ynat.uz>
	<CAK5ve-KTQvJeLXmJt-NgPy6Ju+kBzWVoSQB7TKR9TW+mfD=bxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:33510 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbaACPXl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jan 2014 10:23:41 -0500
In-Reply-To: <CAK5ve-KTQvJeLXmJt-NgPy6Ju+kBzWVoSQB7TKR9TW+mfD=bxg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: David Lang <david@lang.hm>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

> Also for user space application, I think we don't have any user space
> LED library, if I'm wrong please correct me. Why there is no such
> library, since we don't need it.

No - rght now it is a case of "we don't have a kernel driver because we
don't need one"

> IMHO, firstly we should take this trigger into kernel, most time it
> works as a module. But we need to define a good interface between
> kernel and user space.

You need the interface defined first. To do that it needs to reflect the
actual hardware accelerated devices, and also to deal with resource
management for those devices if necessary (eg if they can only manage one
led of a set at a time).

Your API can't handle things like brightness level, cross-fades
(which require multiple LEDs handled as one unit) and the like.

So the starting point has to be the hardware accelerated devices, whether
you then support software emulation in kernel or user space is a follow
on discussion. What the kernel/user API is also has to be a follow on
discussion from understanding what the hardware accelerated devices can
do and what their limits are.

Alan
