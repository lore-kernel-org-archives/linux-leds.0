From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Thu, 21 Jan 2016 14:06:03 +0100
Message-ID: <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121083559.GM7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > A total of four functions have something to do with the SMBIOS buff=
er:
> >=20
> >   * get_buffer()
> >   * clear_buffer()
> >   * release_buffer()
> >   * dell_send_request()
> >=20
> > This rework is a chance to make them all consistent, i.e. remove th=
e
> > SMBIOS buffer from their argument lists.  This way we can "signal" =
this
> > API's users that there is only one SMBIOS buffer ever involved whil=
e
> > still removing the extern and EXPORT_SYMBOL_GPL for the buffer.  BT=
W, I
> > also see little point in returning the buffer from dell_send_reques=
t()
> > as none of its callers in dell-laptop assign its return value to
> > anything (i.e. there is no "buffer =3D dell_send_request(buffer, ..=
=2E)" in
> > the code).
> >=20
> > To sum up, I'd suggest that function prototypes could look like thi=
s:
> >=20
> >     struct calling_interface_buffer *dell_smbios_get_buffer(void);
> >     void dell_smbios_clear_buffer(void);
> >     void dell_smbios_release_buffer(void);
> >     void dell_smbios_send_request(int class, int select);
> >=20
> > What do you think?
> >=20
>=20
> In other scenario functions should do something like this:
>=20
> struct buf *buf_alloc(void);
> buf_clear(struct buf *buf);
> buf_free(struct buf *buf);
> buf_do_something(struct buf *buf, ...);
>=20
> But here I do not know how hard is to create alloc/free functions and
> what is cost for creating that buffer in first 4GB memory...

I'm guessing the cost is negligible, given that SMBIOS calls are not
present in any hot path.  Writing these functions is also pretty
straightforward, but the inconvenience of this approach is that it
forces the callers to do the error-checking for each buf_alloc() call.
It also seems pretty inefficient - notice we only need 36 bytes for the
calling interface buffer, yet we would be allocating a whole page in
each buf_alloc() call.

On the other hand, I believe returning a separate buffer for each
buf_alloc() caller makes it possible to drop buffer_mutex altogether.
Yet, the approach I suggested is more similar to what the Dell-supplied
dcdbas driver does internally (it manages a single, resizable buffer,
which is protected by a mutex and controllable from userspace through
sysfs), which is why I think it's a good idea to stick to that concept
for consistency.

As this patch series already touches a lot of code, I would like to
avoid changing the underlying concepts as much as possible.  If that's
okay with you, I'll post a v2 which includes your suggestion to make th=
e
buffer pointer static while keeping the interface similar to the
original one.  If you would really like me to take a different path,
please let me know and I'll comply.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
