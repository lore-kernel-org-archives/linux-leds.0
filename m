From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [RESEND PATCH 3/4] leds: leds-ns2: handle can_sleep GPIOs
Date: Fri, 26 Jun 2015 19:10:28 +0200
Message-ID: <20150626171028.GL4853@kw.sim.vm.gnt>
References: <1434640650-28086-1-git-send-email-simon.guinot@sequanux.org>
 <1434640650-28086-4-git-send-email-simon.guinot@sequanux.org>
 <558ABC35.1010801@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZP5/UaesXwhUwRsu"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:44194 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752097AbbFZRKc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 26 Jun 2015 13:10:32 -0400
Content-Disposition: inline
In-Reply-To: <558ABC35.1010801@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Bryan Wu <cooloney@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-leds@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--ZP5/UaesXwhUwRsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 04:18:29PM +0200, Jacek Anaszewski wrote:
> On 06/18/2015 05:17 PM, Simon Guinot wrote:
> >On the board n090401 (Seagate NAS 4-Bay), some of the LEDs are handled
> >by the leds-ns2 driver. This LEDs are connected to an I2C GPIO expander
> >(PCA95554PW) which means that GPIO access may sleep. This patch makes
> >leds-ns2 compatible with such GPIOs by using the *_cansleep() variant of
> >the GPIO functions. As a drawback this functions can't be used safely in
> >a timer context (with the timer LED trigger for example). To fix this
> >issue, a workqueue mechanism (copied from the leds-gpio driver) is used.
> >
> >Note that this patch also updates slightly the ns2_led_sata_store
> >function. The LED state is now retrieved from cached values instead of
> >reading the GPIOs previously. This prevents ns2_led_sata_store from
> >working with a stale LED state (which may happen when a delayed work
> >is pending).
> >
> >Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> >Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
> >---
> >  drivers/leds/leds-ns2.c | 56 ++++++++++++++++++++++++++++++++++++-----=
--------
> >  1 file changed, 42 insertions(+), 14 deletions(-)
> >
>=20
> >
> >+static void ns2_led_work(struct work_struct *work)
> >+{
> >+	struct ns2_led_data *led_dat =3D
> >+		container_of(work, struct ns2_led_data, work);
> >+	int i =3D led_dat->new_mode_index;
> >+
> >+	write_lock(&led_dat->rw_lock);
> >+
> >+	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> >+	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> >+
> >+	write_unlock(&led_dat->rw_lock);
> >+}
> >+
>=20
> I've just realized that this can break one of the basic rules:
> no sleeping should occur while holding a spinlock. Did you
> consider this?

Well, if I did, I can't say I have done a good job here :/

You have to know that this code is used on a large number of boards.
Thus, I have to thank you for spotting this bug. As a relief, this don't
actually lead to a bug with the configuration we are using: UP machine
and !CONFIG_SMP.

It should be simple to fix it because using a spinlock in ns2_led_work()
is not needed. The GPIO writing calls are protected by the workqueue
itself: a single instance is running at a time. We are only let with the
new_mode_index reading which must be made coherent.

Note that the very same issue also applies to ns2_led_get_mode(). And
again using a lock here is not needed either. This function is only
called once at probe time and there is no possible concurrency.

I'll fix all this issues with the v2.

Thanks.

Simon

--ZP5/UaesXwhUwRsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlWNh4QACgkQgtp0PDeOcDoCtACfU8Qvyk7W3PrUB3r2sE9qZ08O
BvQAoJVqUNs9wyc3qgz1gx4ngSAsUkX4
=bUP6
-----END PGP SIGNATURE-----

--ZP5/UaesXwhUwRsu--
