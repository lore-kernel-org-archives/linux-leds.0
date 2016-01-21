From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Thu, 21 Jan 2016 14:14:50 +0100
Message-ID: <20160121131450.GE7192@pali>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
 <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32775 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759002AbcAUNOy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 08:14:54 -0500
Content-Disposition: inline
In-Reply-To: <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 21 January 2016 14:06:03 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> > > A total of four functions have something to do with the SMBIOS bu=
ffer:
> > >=20
> > >   * get_buffer()
> > >   * clear_buffer()
> > >   * release_buffer()
> > >   * dell_send_request()
> > >=20
> > > This rework is a chance to make them all consistent, i.e. remove =
the
> > > SMBIOS buffer from their argument lists.  This way we can "signal=
" this
> > > API's users that there is only one SMBIOS buffer ever involved wh=
ile
> > > still removing the extern and EXPORT_SYMBOL_GPL for the buffer.  =
BTW, I
> > > also see little point in returning the buffer from dell_send_requ=
est()
> > > as none of its callers in dell-laptop assign its return value to
> > > anything (i.e. there is no "buffer =3D dell_send_request(buffer, =
=2E..)" in
> > > the code).
> > >=20
> > > To sum up, I'd suggest that function prototypes could look like t=
his:
> > >=20
> > >     struct calling_interface_buffer *dell_smbios_get_buffer(void)=
;
> > >     void dell_smbios_clear_buffer(void);
> > >     void dell_smbios_release_buffer(void);
> > >     void dell_smbios_send_request(int class, int select);
> > >=20
> > > What do you think?
> > >=20
> >=20
> > In other scenario functions should do something like this:
> >=20
> > struct buf *buf_alloc(void);
> > buf_clear(struct buf *buf);
> > buf_free(struct buf *buf);
> > buf_do_something(struct buf *buf, ...);
> >=20
> > But here I do not know how hard is to create alloc/free functions a=
nd
> > what is cost for creating that buffer in first 4GB memory...
>=20
> I'm guessing the cost is negligible, given that SMBIOS calls are not
> present in any hot path.  Writing these functions is also pretty
> straightforward, but the inconvenience of this approach is that it
> forces the callers to do the error-checking for each buf_alloc() call=
=2E
> It also seems pretty inefficient - notice we only need 36 bytes for t=
he
> calling interface buffer, yet we would be allocating a whole page in
> each buf_alloc() call.
>=20
> On the other hand, I believe returning a separate buffer for each
> buf_alloc() caller makes it possible to drop buffer_mutex altogether.
> Yet, the approach I suggested is more similar to what the Dell-suppli=
ed
> dcdbas driver does internally (it manages a single, resizable buffer,
> which is protected by a mutex and controllable from userspace through
> sysfs), which is why I think it's a good idea to stick to that concep=
t
> for consistency.
>=20
> As this patch series already touches a lot of code, I would like to
> avoid changing the underlying concepts as much as possible.  If that'=
s
> okay with you, I'll post a v2 which includes your suggestion to make =
the
> buffer pointer static while keeping the interface similar to the
> original one.  If you would really like me to take a different path,
> please let me know and I'll comply.
>=20

Another idea:

What about passing struct calling_interface_buffer from caller allocate=
d
memory (either from stack or kernel alloc) to dell-smbios which will
copy it into own buffer under 4GB and then pass it to dcdbas?

This will avoid to use that get/release function and there will be only
one send_request.

But I will let decision for API to other people as I do not know what
the best API to use here...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
