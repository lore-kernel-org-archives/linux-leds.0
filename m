From: Pavel Machek <pavel@ucw.cz>
Subject: Re: WARNING in untrack_pfn
Date: Fri, 12 Apr 2019 15:01:12 +0200
Message-ID: <20190412130112.GA8384@amd>
References: <000000000000f70a0e0571ad8ffb@google.com>
 <0000000000007b03eb058653caea@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0000000000007b03eb058653caea@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>
Cc: Julia.Lawall@lip6.fr, bp@alien8.de, dan.j.williams@intel.com, dave.hansen@linux.intel.com, dave.jiang@intel.com, haozhong.zhang@intel.com, hpa@zytor.com, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, luto@kernel.org, mingo@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rkrcmar@redhat.com, rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
List-Id: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-04-12 04:42:01, syzbot wrote:
> syzbot has bisected this bug to:
>=20
> commit c68729119f4d2993bec3c9cb999ad76de5aeddba
> Author: Julia Lawall <Julia.Lawall@lip6.fr>
> Date:   Sat Jul 15 09:58:19 2017 +0000
>=20
>     leds: tlc591xx: add missing of_node_put
>=20
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D12cda0f320=
0000
> start commit:   23203e3f Merge branch 'akpm' (patches from Andrew)
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=3D11cda0f320=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16cda0f3200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D861a3573f4e78=
ba1
> dashboard link: https://syzkaller.appspot.com/bug?extid=3De1a4f80c370d238=
1e49f
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17836d15400=
000
>=20
> Reported-by: syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com
> Fixes: c68729119f4d ("leds: tlc591xx: add missing of_node_put")
>=20
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

Can you revert c68729119f4d2993bec3c9cb999ad76de5aeddba on master and
see  if it fixes the problem? Because this is hard to believe...

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlywjBgACgkQMOfwapXb+vLWKQCguQoG3ggo+j1BZ6gDxlNIyFgh
uvMAn1kVU1QNLZLQ6Y/kjmli9sytwygW
=BnKA
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
