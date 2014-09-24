From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 0/4] LED triggers for USB host and device
Date: Wed, 24 Sep 2014 15:59:36 -0500
Message-ID: <20140924205936.GC17997@saruman>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
 <1411591401-5874-1-git-send-email-sojka@merica.cz>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K3iCROrs1P5jLO0B"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411591401-5874-1-git-send-email-sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.vokac-veUE7cmDK2A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--K3iCROrs1P5jLO0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 10:43:17PM +0200, Michal Sojka wrote:
> This adds LED triggers for USB host and device. First two patches
> refactor UDC drivers as requested by Felipe Balbi, the next renames a
> file and the last is the actual implementation of the LED triggers.
>=20
> Changes from v5:
> - Refactoring of USB gadget completion split into two patches (Filipe
>   Balbi)
> - Removed check for non-NULL req->completion (Filipe Balbi)
>=20
> Changes from v4:
> - Added performance numbers to the commit message of the last patch
>   (greg k-h).
> - Replaced BUG_ON with pr_err (Alan Stern, greg k-h).
> - Used proper coding style for switch statement (greg k-h).
> - Added comment about NULL argument (greg k-h).
> - EXPORT_SYMBOL changed to EXPORT_SYMBOL_GPL (greg k-h).
> - Both triggers are now registerd even if host or gagdet subsystem
>   is not enabled (Bryan Wu, greg k-h).
>=20
> Changes from v3:
> - usb_gadget_giveback_request() moved outside of CONFIG_HAS_DMA
>   conditioned block.
> - Added kernel-doc for usb_gadget_giveback_request() (Felipe Balbi).
> - Removed outdated comment (Alan Stern).
> - req->complete =3D=3D NULL is now a bug. Previously, this was ignored
>   (Alan Stern).
> - File rename moved to a separate commit (greg k-h).
>=20
> Changes from v2:
> - Host/gadget triggers merged to a single file in usb/common/ (Felipe
>   Balbi).
> - UDC drivers refactored so that LED trigger works for all of them.
>=20
> Changes from v1:
> - Moved from drivers/leds/ to drivers/usb/.
> - Improved Kconfig help.
> - Linked with other modules rather than being standalone modules.
>=20
> Michal Sojka (4):
>   usb: gadget: Introduce usb_gadget_giveback_request()
>   usb: gadget: Refactor request completion
>   usb: Rename usb-common.c
>   usb: Add LED triggers for USB activity

Greg, how do you want to handle this one as it touched both host and
gadget ? I could wait until you apply this series to your usb-next and
based my pull request on that. That'll work as long as it doesn't take
too long for this to be merged.

cheers

--=20
balbi

--K3iCROrs1P5jLO0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIzC4AAoJEIaOsuA1yqRENIsP/ij0h/0d+LVJkaQ3aRnnA6SG
2me4trHH4zXGkde52omENJj5GeSQ1G+3tu//iQx7C6u+XtLDnHpEPBIs9h7Dg9MY
wygp5uRDPLSSXyBFCb6k666VJLeBBk1guTL9ypbWfe4i3AOS+cnY3Q1CuViQ5Bxb
TjliytztFr6JUuJm3dHZIUexZ7qv9hfZGorw86qhI2FZDfCPgQVEJiEChFLAhdCM
4H30CscgNWaLrBJXqk5/fx2EgOKvqO7VxkPZZyPUYDQTFgcSCzSr8EZaT6Fwi+BM
T91Y7CaFwypXwcUIoCt4JCcXY4CTAzyNoArKuU19yzu4ShDlpi1kxkiO7O/+AaBf
dX9C/yPsMQocj6cbZ1Yn/9Jbuca8Qhvq8TiRAlUyiL5VNBuzvKMtKJMGbfA+5ewr
qQ6duOwdx4olaqhQQ8/ivbH71HYkQzre8k87cd3lnrVjgBrvcdLn7emuuGTisQ9a
3Sc+uEGtZJi37oLf5plQopBTR/UhOSvdkflgyLASNNjVOY2825rEfeSW+OcrVOZ9
fg3Nbgo34Rhaio0BVlJYlivxjFBe7CK9NnvduxpospxhuzktrMc7kAgY7i8Vi4Fo
tsTS4PCOrPp2F4dLL6QFDwY0XybW7wgwAtjAdQA/8hfn5I6U0kLr/6cFwdMCMkNn
faVaeq0UaLNfu9cFgG/8
=6Ghy
-----END PGP SIGNATURE-----

--K3iCROrs1P5jLO0B--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
