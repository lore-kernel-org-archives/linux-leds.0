From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Thu, 21 Jan 2016 14:39:21 +0100
Message-ID: <20160121133921.GA4626@eudyptula.hq.kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
 <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
 <20160121131450.GE7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:34360 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759175AbcAUNj0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 08:39:26 -0500
Received: by mail-lb0-f194.google.com with SMTP id oe3so2025888lbb.1
        for <linux-leds@vger.kernel.org>; Thu, 21 Jan 2016 05:39:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160121131450.GE7192@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

> Another idea:
>=20
> What about passing struct calling_interface_buffer from caller alloca=
ted
> memory (either from stack or kernel alloc) to dell-smbios which will
> copy it into own buffer under 4GB and then pass it to dcdbas?
>=20
> This will avoid to use that get/release function and there will be on=
ly
> one send_request.

Well, yes, these two functions could then be ripped out, but the caller=
s
would have to do the error checking on their own.  Of course that's not
a bad thing per se, but it changes the currently used concept.

> But I will let decision for API to other people as I do not know what
> the best API to use here...

In order to avoid delaying this any further, I'll post a v2 soon and
hopefully it'll be good enough for your Acked-by.  If it turns out more
people have misgivings about it, I'll adjust the code.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
