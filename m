From: Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org
Subject: Re: [PATCH][input-led] Defer input led work to workqueue
Date: Tue, 26 Aug 2014 14:51:10 -0400
Message-ID: <4017.1409079070@turing-police.cc.vt.edu>
References: <20140826015453.GA5235@type.youpi.perso.aquilenet.fr> (sfid-20140826_040254_816162_A52F1B31)
            <1409040095.2489.3.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1409079070_3277P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Your message of "Tue, 26 Aug 2014 10:01:35 +0200."
             <1409040095.2489.3.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Samuel Thibault <samuel.thibault-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Sabrina Dubroca <sd-y1jBWg8GRStKuXlAQpz2QA@public.gmane.org>, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--==_Exmh_1409079070_3277P
Content-Type: text/plain; charset=us-ascii

On Tue, 26 Aug 2014 10:01:35 +0200, Johannes Berg said:
> On Tue, 2014-08-26 at 03:54 +0200, Samuel Thibault wrote:
>
> > +	vt_led_wq = alloc_workqueue("input_leds", WQ_UNBOUND, 0);
> > +	if (!vt_led_wq)
> > +		return -ENOMEM;
>
> Does this really need a separate workqueue rather than just using
> schedule_work()? There doesn't seem to be much point in having its own
> workqueue really, to me.

As I noted in another email, the patch works. Whether it's *correct* I can't
tell. :)

--==_Exmh_1409079070_3277P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBU/zXHQdmEQWDXROgAQINFQ//dWiwOqohKLs4RbmF9EHitZl7R3T3K5e1
Mt2fmsqi923zNt7AsIZPOZ6d5H3u4LIjs0U27zb9Wv2FJ2hJ4/6JZGBr12xsq5WG
opOBLwOzYmWxo+ADJiNp5r05Y2NlCY8Ab6x9ba855TjUGp4wOO4PjAON33bY3H8e
qL7HrQb77fQXFauRbY9Wl3ZeIo7xmYwDg9PsXynRrJw1RsatvjpRU01+3uL8KZzc
VaVEiAGgFJ7kM4/8qgLs6y/h3MHtw60zDG8SGNAKgqfvShbYoryJcUnuhABPj4wC
4e0Ch4gGg3WL6MpU+Q8/ErDNbyB14YFeEtgyzKOMhhzvAvE8wcEgCzdITtCmpqH3
PhdgADNgBht3uw0Uau+M7PZveopYUX+LcP8HKPu0mgEWLHyqJRX6IMOfcLENGPQd
I1oBBoQPoC0WyVw+/FjTavm05VXSXqZ2GMgI2/EN+7j17nMYrSaIU4NZG3/mzXlc
8AsCrcn/y8Js9nOcySRiiaZM9CaL0I5uTRZsS1H2Lt2sPDLnP/83Nn0A0vNtovI2
ByQ1a2Rup8f4GRdlYd1X7sWFWGL4E7J36LOrwEYcas0MHbe7ZbBJDilFK9AisX6y
7tcGhtNCWKvGo1fmt63TbIuSrJQiwtew27JuAQsttwSi4e96BedsW+JPt+Zh5Rz1
rhB9FxDFwWU=
=F1N7
-----END PGP SIGNATURE-----

--==_Exmh_1409079070_3277P--
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
