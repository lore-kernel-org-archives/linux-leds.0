From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Wed, 20 Jan 2016 10:21:07 +0100
Message-ID: <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160116151922.GA5060@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > +extern struct calling_interface_buffer *buffer;
> > +extern struct calling_interface_token *da_tokens;
>=20
> Better hide this variable in dell-smbios.c code ...
>=20
> > +void clear_buffer(void);
> > +void get_buffer(void);
> > +void release_buffer(void);
>=20
> ... and let those functions to get parameter to buffer.
>=20
> E.g. get_buffer will return buffer and other two functions will take
> buffer parameter.

Before I spam everyone with another set of 15 patches, I'd like to
discuss this a bit further.  There is no point in passing the buffer to
release_buffer(), because it only unlocks a mutex.  I also see no point
in passing the buffer to clear_buffer() and dell_send_request(), becaus=
e
there is always just one buffer to operate on.

A total of four functions have something to do with the SMBIOS buffer:

  * get_buffer()
  * clear_buffer()
  * release_buffer()
  * dell_send_request()

This rework is a chance to make them all consistent, i.e. remove the
SMBIOS buffer from their argument lists.  This way we can "signal" this
API's users that there is only one SMBIOS buffer ever involved while
still removing the extern and EXPORT_SYMBOL_GPL for the buffer.  BTW, I
also see little point in returning the buffer from dell_send_request()
as none of its callers in dell-laptop assign its return value to
anything (i.e. there is no "buffer =3D dell_send_request(buffer, ...)" =
in
the code).

To sum up, I'd suggest that function prototypes could look like this:

    struct calling_interface_buffer *dell_smbios_get_buffer(void);
    void dell_smbios_clear_buffer(void);
    void dell_smbios_release_buffer(void);
    void dell_smbios_send_request(int class, int select);

What do you think?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
