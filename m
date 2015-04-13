From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Mon, 13 Apr 2015 12:16:19 +0200
Message-ID: <20150413101619.GL1509@kw.sim.vm.gnt>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda>
 <20150410195224.GJ1509@kw.sim.vm.gnt>
 <552B71B7.3000100@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yoe7IL09ITZIjxDV"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:40551 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752094AbbDMKQY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 13 Apr 2015 06:16:24 -0400
Content-Disposition: inline
In-Reply-To: <552B71B7.3000100@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org


--Yoe7IL09ITZIjxDV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 09:35:19AM +0200, Jacek Anaszewski wrote:
> On 04/10/2015 09:52 PM, Simon Guinot wrote:
> >On Fri, Apr 10, 2015 at 06:50:34PM +0300, Dan Carpenter wrote:
> >>I've looked at this some more.  Most of the places which call
> >>of_property_read_u32_index() check the return code.  The ones that don't
> >>mostly initialize their values going in.  The remainder introduce static
> >>checker warnings like:
> >>
> >>	drivers/clk/ti/divider.c:472 ti_clk_get_div_table()
> >>	error: potentially using uninitialized 'val'.
> >>
> >>These warnings cause me pain.  It calls of_get_property() earlier so
> >>it won't return -EINVAL.  I don't know if it can return -ENODATA or
> >>-EOVERFLOW?
> >>
> >>I guess not.
> >
> >I think it can't. Above, we are calling of_property_count_u32_elems() to
> >count the number of u32 elements in the "timers" property. After we are
> >ensuring that there is three u32 elements available per timer. That's
> >why the return codes for the three of_property_read_u32_index() calls
> >are not checked.
>=20
> After looking at Documentation/devicetree/bindings/leds/leds-netxbig.txt
> I noticed inconsistency: timers property is defined as required, but
> the comment over the call to of_property_count_u32_elems says that it
> is optional.
>=20
> I think that DT documentation should be changed to make the property
> optional. How do you think?

Thanks for spotting this. At first, I wrote the binding document. And
since there is always "blink timers" defined with this LED mechanism,
I made the property mandatory. But after, in the code, I made it
optional because there is no point in discarding a LED if timers are
missing.

I'll update the documentation accordingly.

>=20
> Besides, I am wondering if we shouldn't check if the values read are
> sane? In such a case initializing delay_on and delay_off to 0 would be
> useful. We could check if both delays don't equal 0, which could happen
> if the of_property_read_u32_index returned negative value because of
> providing values out of bounds or not numerical values.

Well, here I didn't checked too much intentionally. IMO, calling
of_property_count_u32_elems() is enough to make sure that the following
u32 read will succeed. After that, there is not real way to check if a
delay value is sane, or not. To make work an hardware timer, correct
values have to be defined in the DT. If not, then this hardware timer
will be either broken or not reachable. It is not really harmful.

Now, I can see, that I have also missed a check on the timer "mode"
value. And since mode is used as an array index, I think it is a little
bit more serious...

Dan, given that the patches adding DT support for the leds-netxbig
driver have not been merged with Linux v4.1, I propose you drop your
patch. Instead, I'll send a v2, trying to take into account all the
comments here.

Thanks for the review and the comments.

Simon

--Yoe7IL09ITZIjxDV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUrl3MACgkQgtp0PDeOcDoOYwCgnkajHCL5qX4vrmnoCLPCpnOn
zRAAoJEqlX+VwHdYUcd0SDwFn6pgxSab
=7BCj
-----END PGP SIGNATURE-----

--Yoe7IL09ITZIjxDV--
