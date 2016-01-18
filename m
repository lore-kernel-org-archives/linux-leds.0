From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Mon, 18 Jan 2016 11:34:32 +0100
Message-ID: <20160118103432.GA2444@eudyptula.hq.kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34358 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754060AbcARKeh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jan 2016 05:34:37 -0500
Received: by mail-lf0-f67.google.com with SMTP id n70so27481625lfn.1
        for <linux-leds@vger.kernel.org>; Mon, 18 Jan 2016 02:34:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160116151922.GA5060@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Pali,

Thanks for taking a look.

> > +struct calling_interface_token {
> > +	u16 tokenID;
> > +	u16 location;
> > +	union {
> > +		u16 value;
> > +		u16 stringlength;
> > +	};
> > +};
>=20
> After patch 12/14 you do not need to define this struct in header fil=
e.

dell_smbios_find_token() returns a struct calling_interface_token *,
which can then be dereferenced by the caller.  See patch 13.

> > +extern struct calling_interface_buffer *buffer;
> > +extern struct calling_interface_token *da_tokens;
>=20
> Better hide this variable in dell-smbios.c code ...

Patch 12 makes da_tokens static, but I believe you were referring to
buffer.

> > +void clear_buffer(void);
> > +void get_buffer(void);
> > +void release_buffer(void);
>=20
> ... and let those functions to get parameter to buffer.
>=20
> E.g. get_buffer will return buffer and other two functions will take
> buffer parameter.

You're right.  My original approach looked tempting because it reduces
the amount of changes required in dell-laptop, but on second thought, i=
t
_assumes_ that users of this API would play nicely with the SMBIOS
buffer while your way _enforces_ it.

I will prepare a v2 including this suggestion within the next couple of
days.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
