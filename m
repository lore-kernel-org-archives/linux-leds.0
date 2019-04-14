From: Pavel Machek <pavel@ucw.cz>
Subject: Re: INFO: task hung in do_exit
Date: Sun, 14 Apr 2019 09:59:15 +0200
Message-ID: <20190414075915.GA29199@amd>
References: <000000000000e02bf505866414ae@google.com>
 <00000000000074e9d5058674a94f@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00000000000074e9d5058674a94f@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: syzbot <syzbot+9880e421ec82313d6527@syzkaller.appspotmail.com>
Cc: amitoj1606@gmail.com, ap420073@gmail.com, avagin@gmail.com, dbueso@suse.de, ebiederm@xmission.com, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mm@kvack.org, oleg@redhat.com, prsood@codeaurora.org, rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com, tj@kernel.org
List-Id: linux-leds@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-04-13 19:55:00, syzbot wrote:
> syzbot has bisected this bug to:
>=20
> commit 430e48ecf31f4f897047f22e02abdfa75730cad8
> Author: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> Date:   Thu Aug 10 16:28:09 2017 +0000
>=20
>     leds: lm3533: constify attribute_group structure
>=20
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D15f4cee320=
0000
> start commit:   8ee15f32 Merge tag 'dma-mapping-5.1-1' of git://git.infra=
d..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=3D17f4cee320=
0000

Is there human around? Please take your bot on the leash, this is
obviously bogus.
=20
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyy6FMACgkQMOfwapXb+vKFOwCfRgWU/WYanrFj17ZPDxKfLlwx
h+YAn3ywd9WkPk9NCik/4tydk6tI98bO
=aFTb
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
