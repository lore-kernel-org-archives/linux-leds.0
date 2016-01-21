From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 13/14] dell-led: use dell_smbios_find_token() for finding
 mic DMI tokens
Date: Thu, 21 Jan 2016 16:00:51 +0100
Message-ID: <20160121150051.GB4684@eudyptula.hq.kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-14-git-send-email-kernel@kempniu.pl>
 <56A0B882.6020508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35584 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965382AbcAUPAz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 10:00:55 -0500
Received: by mail-lf0-f67.google.com with SMTP id c134so2446721lfb.2
        for <linux-leds@vger.kernel.org>; Thu, 21 Jan 2016 07:00:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56A0B882.6020508@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

> Thanks for the patches.
> They should probably be merged through linux-platform-drivers-x86.git=
=2E
>=20
> Feel free to add my
>=20
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>=20
> to 13/14 and 14/14.

Thanks for reviewing.  I will soon post a v2 of this series.  Given tha=
t
the only difference between v1 and v2 for dell-led will be a subtle
difference in API use, I'll allow myself to use your Acked-by for the
last two patches when I post v2.  Please let me know if that's
inappropriate.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
