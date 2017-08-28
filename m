From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt: bindings: Document DT bindings for Analog
 devices as3645a
Date: Mon, 28 Aug 2017 13:48:26 +0300
Message-ID: <46aaf723-a657-3b43-7be7-8d899d3db9c3@linux.intel.com>
References: <20170819212410.3084-1-sakari.ailus@linux.intel.com>
 <20170819212410.3084-2-sakari.ailus@linux.intel.com>
 <20170828103351.GF18012@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="657O4RNNq5hUhSDejv2brW1f2E6QAE8h7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170828103351.GF18012@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--657O4RNNq5hUhSDejv2brW1f2E6QAE8h7
Content-Type: multipart/mixed; boundary="1lh2qTPEfsfsPVV0tXUoWheoVvoXfDqO1";
 protected-headers="v1"
From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org,
 jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Message-ID: <46aaf723-a657-3b43-7be7-8d899d3db9c3-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt: bindings: Document DT bindings for Analog
 devices as3645a
References: <20170819212410.3084-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <20170819212410.3084-2-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <20170828103351.GF18012@amd>
In-Reply-To: <20170828103351.GF18012@amd>

--1lh2qTPEfsfsPVV0tXUoWheoVvoXfDqO1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

Thanks for the review!

On 08/28/17 13:33, Pavel Machek wrote:
> Hi!
>=20
>> +
>> +Ranges below noted as [a, b] are closed ranges between a and b, i.e. =
a
>> +and b are included in the range.
>=20
> Normally I've seen <a, b> for closed ranges, (a, b) for open
> ranges. Is that different in your country?

I guess there are different notations. :-) I've seen regular parentheses
being used for open ranges, too, but not < and >.

Open range is documented in a related well written Wikipedia article:

<URL:https://en.wikipedia.org/wiki/Open_range>

Are there such open ranges in Czechia? For instance, reindeer generally
roam freely in Finnish Lappland.

What comes to the patch, I guess "interval" could be a more appropriate
term to use in this case:

<URL:https://en.wikipedia.org/wiki/Interval_(mathematics)>

The patch is in line with the Wikipedia article in notation but not in
terminology. I'll send a fix.

--=20
Regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org


--1lh2qTPEfsfsPVV0tXUoWheoVvoXfDqO1--

--657O4RNNq5hUhSDejv2brW1f2E6QAE8h7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTw0Dd6DU8lp5I47+VtQDYbbijBkwUCWaP0+gAKCRBtQDYbbijB
kzeYAP9xdcH28zg2oBOcwflI5n5+08BmtbYA4kifizv5SrjbOgD9GupwKunplw3/
zOU1PnrPBG4mqZz0NOzxHTdUxYWling=
=CKza
-----END PGP SIGNATURE-----

--657O4RNNq5hUhSDejv2brW1f2E6QAE8h7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
