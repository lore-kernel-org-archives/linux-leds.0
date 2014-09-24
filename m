From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 3/4] usb: Rename usb-common.c
Date: Wed, 24 Sep 2014 18:15:11 -0500
Message-ID: <20140924231511.GB27672@saruman>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
 <1411591401-5874-1-git-send-email-sojka@merica.cz>
 <1411591401-5874-4-git-send-email-sojka@merica.cz>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411591401-5874-4-git-send-email-sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.vokac-veUE7cmDK2A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 10:43:20PM +0200, Michal Sojka wrote:
> In the next commit, we will want the usb-common module to be composed of
> two object files. Since Kbuild cannot "append" another object to an
> existing one, we need to rename usb-common.c to something
> else (common.c) and create usb-common.o by linking the wanted objects
> together. Currently, usb-common.o comprises only common.o.
>=20
> Signed-off-by: Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>

for future reference, you can use git format-patch -M -C to detect
renames, the generated diff is far better ;-)

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

--=20
balbi

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUI1B/AAoJEIaOsuA1yqREQDEQAIO6xxHpF99I7CKrajWdfDOP
1Vkvxu/xtCbx05RsN6cShFIDXmq+lo9gvH/YzxGTqIj0HOoZA4hrQ9pECQolueFg
VrnJXaHChHKVvHRSRZcDtwadIxQu3WbXRLeK/8G1cJlX3pFs9X8O8n4uFtd3QNt8
1yegoy6OLWU+arXgTejcheYW6V6SJX5FIKKdCzvHSJQLPE7Jol4kFdCbuXa1+U3e
2wuqLFSssJRZbFbAMiNess52YQUdy3X7U2459Glzpk5BQ82wUSUsvi+7onkVDNZK
0hDzbwHxpXU1jXWtVRxmjW25wJwY1BCHrOikVtYX0mmUEhlY+bJ2lCTY9EQyBciO
OdsxZJ/Oze+ACDkZLHFXK8HNS+Xy9ZA/GcOP3nIo2UfDo9ITQrt0dpuHO7vi7sLN
RtEy6oxmmIbDVW6l8GfRshrZ976g7gkfMIyKg68kPCeB2/xeT9PKqwLElDb+7y0C
KOl9Tk9iACjOfUKNI0eQlo+Nb60D7AnicGEV93IXKucpUGw1OpDxTOo21bfg3IV9
O/YWClQz4jcVCEXILJjCFN0h2WJRWqFa/FMsZFbWoLpXiD5tQbHJIlLBctTOt1FL
rZxOB5LR/tlgcCNRw4xTBrF+SW4ps9tVrmwkKGNuw7AjdhSmWfavOQ2sZqMZrwqV
f1CfOkY5iFpEqSM5op1c
=cre3
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
