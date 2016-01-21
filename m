From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Thu, 21 Jan 2016 09:35:59 +0100
Message-ID: <20160121083559.GM7192@pali>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33263 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbcAUIgD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 03:36:03 -0500
Content-Disposition: inline
In-Reply-To: <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 20 January 2016 10:21:07 Micha=C5=82 K=C4=99pie=C5=84 wrot=
e:
> > > +extern struct calling_interface_buffer *buffer;
> > > +extern struct calling_interface_token *da_tokens;
> >=20
> > Better hide this variable in dell-smbios.c code ...
> >=20
> > > +void clear_buffer(void);
> > > +void get_buffer(void);
> > > +void release_buffer(void);
> >=20
> > ... and let those functions to get parameter to buffer.
> >=20
> > E.g. get_buffer will return buffer and other two functions will tak=
e
> > buffer parameter.
>=20
> Before I spam everyone with another set of 15 patches, I'd like to
> discuss this a bit further.  There is no point in passing the buffer =
to
> release_buffer(), because it only unlocks a mutex.  I also see no poi=
nt
> in passing the buffer to clear_buffer() and dell_send_request(), beca=
use
> there is always just one buffer to operate on.
>=20
> A total of four functions have something to do with the SMBIOS buffer=
:
>=20
>   * get_buffer()
>   * clear_buffer()
>   * release_buffer()
>   * dell_send_request()
>=20
> This rework is a chance to make them all consistent, i.e. remove the
> SMBIOS buffer from their argument lists.  This way we can "signal" th=
is
> API's users that there is only one SMBIOS buffer ever involved while
> still removing the extern and EXPORT_SYMBOL_GPL for the buffer.  BTW,=
 I
> also see little point in returning the buffer from dell_send_request(=
)
> as none of its callers in dell-laptop assign its return value to
> anything (i.e. there is no "buffer =3D dell_send_request(buffer, ...)=
" in
> the code).
>=20
> To sum up, I'd suggest that function prototypes could look like this:
>=20
>     struct calling_interface_buffer *dell_smbios_get_buffer(void);
>     void dell_smbios_clear_buffer(void);
>     void dell_smbios_release_buffer(void);
>     void dell_smbios_send_request(int class, int select);
>=20
> What do you think?
>=20

In other scenario functions should do something like this:

struct buf *buf_alloc(void);
buf_clear(struct buf *buf);
buf_free(struct buf *buf);
buf_do_something(struct buf *buf, ...);

But here I do not know how hard is to create alloc/free functions and
what is cost for creating that buffer in first 4GB memory...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
