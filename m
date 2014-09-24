From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 0/4] LED triggers for USB host and device
Date: Wed, 24 Sep 2014 17:18:30 -0500
Message-ID: <20140924221830.GA27914@saruman>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
 <1411591401-5874-1-git-send-email-sojka@merica.cz>
 <20140924205936.GC17997@saruman>
 <20140924214155.GA30689@kroah.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140924214155.GA30689-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.vokac-veUE7cmDK2A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 11:41:55PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 24, 2014 at 03:59:36PM -0500, Felipe Balbi wrote:
> > On Wed, Sep 24, 2014 at 10:43:17PM +0200, Michal Sojka wrote:
> > > This adds LED triggers for USB host and device. First two patches
> > > refactor UDC drivers as requested by Felipe Balbi, the next renames a
> > > file and the last is the actual implementation of the LED triggers.
> > >=20
> > > Changes from v5:
> > > - Refactoring of USB gadget completion split into two patches (Filipe
> > >   Balbi)
> > > - Removed check for non-NULL req->completion (Filipe Balbi)
> > >=20
> > > Changes from v4:
> > > - Added performance numbers to the commit message of the last patch
> > >   (greg k-h).
> > > - Replaced BUG_ON with pr_err (Alan Stern, greg k-h).
> > > - Used proper coding style for switch statement (greg k-h).
> > > - Added comment about NULL argument (greg k-h).
> > > - EXPORT_SYMBOL changed to EXPORT_SYMBOL_GPL (greg k-h).
> > > - Both triggers are now registerd even if host or gagdet subsystem
> > >   is not enabled (Bryan Wu, greg k-h).
> > >=20
> > > Changes from v3:
> > > - usb_gadget_giveback_request() moved outside of CONFIG_HAS_DMA
> > >   conditioned block.
> > > - Added kernel-doc for usb_gadget_giveback_request() (Felipe Balbi).
> > > - Removed outdated comment (Alan Stern).
> > > - req->complete =3D=3D NULL is now a bug. Previously, this was ignored
> > >   (Alan Stern).
> > > - File rename moved to a separate commit (greg k-h).
> > >=20
> > > Changes from v2:
> > > - Host/gadget triggers merged to a single file in usb/common/ (Felipe
> > >   Balbi).
> > > - UDC drivers refactored so that LED trigger works for all of them.
> > >=20
> > > Changes from v1:
> > > - Moved from drivers/leds/ to drivers/usb/.
> > > - Improved Kconfig help.
> > > - Linked with other modules rather than being standalone modules.
> > >=20
> > > Michal Sojka (4):
> > >   usb: gadget: Introduce usb_gadget_giveback_request()
> > >   usb: gadget: Refactor request completion
> > >   usb: Rename usb-common.c
> > >   usb: Add LED triggers for USB activity
> >=20
> > Greg, how do you want to handle this one as it touched both host and
> > gadget ? I could wait until you apply this series to your usb-next and
> > based my pull request on that. That'll work as long as it doesn't take
> > too long for this to be merged.
>=20
> I can just take this now, for 3.18-rc1, you've already sent me your
> patches for that release, so there shouldn't be any conflicts, right?

that's better. Can you wait 1 day though ? I can run these through my
build tests.

--=20
balbi

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUI0M2AAoJEIaOsuA1yqRE/kgP/RK3piOAbrAJSMStNnP5EjJD
ATpUTsgpoY0nOKh6QTdD/820DzHyP1E5Jni75fdjEQk1OO91BqJQyGifaKCNPc3d
8Qw+ngLB5CJT9ce9vsFv1vTc7QTcynP2f4qP2OeIObTGOj1JWI16atE/FuLGsYxr
BTHro4xztpfoIr91z5SkjgbHhsvQ7QIr++xrsvvC5Gx5l4Ho2Gjslwx9Fn4qrzF2
sEpuhkaQN/5j3vlZrIGcHlaCAfMeQHRwaEDCqdbgCf7cg7TkufTlni0EDuXx4yJV
M8yVlOoJUEnrSSp6HAhF3MjW1pd9S7er4H2qPuIH002IY3ax7W2TGbvzU53n7ahE
Y4dDo29+cg2qk35TPbzhH4CzEBQ8UmR8/zJccI8RFeLA6ndq5VkZYqKMP+XyGuNM
2jStxCN0pNMP35QjOQOQP6+79MPYkOzEpRmGSp5wRurIeCQcrVkMXbTqJolbXssL
YXqdk36WtjZh3j2KEevC14mt+oC7JjXW4KFpebroiEGFyrHEuuR3/RDMsLDLVkte
Tlt5DuIH4rXU0T/4fz9MZWiHuBrOFTLGWCgzTyj6gNrd4CAdvqdJ47GbzSc8QFia
7cSOa+pHXzsPd4r1qB6zZj7G3n6RoS7toTCtQ3w98KwGpz2xwD2lPNKHX1qnS+Bk
DEJ9C72Lr5HNqHOOnr4g
=ZrZH
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
