From: Pavel Machek <pavel@ucw.cz>
Subject: Re: PC Engines APU/APU2 led driver
Date: Sat, 16 Sep 2017 15:52:34 +0200
Message-ID: <20170916135234.GA9077@amd>
References: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
 <20170911061514.GA25933@amd>
 <24639eb3-9f93-5330-d3da-5b43b35c35f3@mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33265 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751211AbdIPNwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 16 Sep 2017 09:52:36 -0400
Content-Disposition: inline
In-Reply-To: <24639eb3-9f93-5330-d3da-5b43b35c35f3@mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>
Cc: linux-leds@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> static void __exit apu_led_exit(void)
> >> {
> >> 	platform_device_unregister(apu_led->pdev);
> >> 	platform_driver_unregister(&apu_led_driver);
> >> }
> >=20
> > Normally, I'd expect _exit() to be 'reverse' of _init(). That is I'd
> > expect reverese order there.
>=20
> That looked promising, but after inverting the order of the calls in
> apu_led_exit(), the problem is still there but with a slightly different
> backtrace:
>=20
> [   11.320368] BUG: unable to handle kernel paging request at
> ffffc900000b5618
> [   11.327702] IP: [<ffffffff811dd099>] ioread32+0x29/0x30
> [   11.333108] PGD 11a00e067 [   11.335708] PUD 11a00f067
> PMD 11a014067 [   11.339807] PTE 0
> [   11.341783]
> [   11.343364] Oops: 0000 [#1] PREEMPT SMP
> [   11.347305] Modules linked in: arc4 ath10k_pci ath10k_core ath
> mac80211 crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intele
> [   11.375310] CPU: 2 PID: 286 Comm: rmmod Not tainted 4.9.47 #37
> [   11.381342] Hardware name: PC Engines APU2/APU2, BIOS 4.0.7 02/28/2017
> [   11.388091] task: ffff880119af6540 task.stack: ffffc90000184000
> [   11.394168] RIP: 0010:[<ffffffff811dd099>]  [<ffffffff811dd099>]
> ioread32+0x29/0x30
> [   11.402044] RSP: 0018:ffffc90000187e40  EFLAGS: 00010292
> [   11.407567] RAX: 0000000000000000 RBX: ffff88011a1e4ac8 RCX:
> 0000000000001a22
> [   11.414966] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
> ffffc900000b5618
> [   11.422416] RBP: 0000000000000000 R08: 00000000000195a0 R09:
> ffff88011ed0e8c0
> [   11.429785] R10: ffffea0004686b80 R11: ffff88011a001c00 R12:
> 0000000000000008
> [   11.437184] R13: ffff88011a1ae480 R14: ffff88011a1ae460 R15:
> 00000000007c5010
> [   11.444535] FS:  00007f12f96ec700(0000) GS:ffff88011ed00000(0000)
> knlGS:0000000000000000
> [   11.452906] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   11.458842] CR2: ffffc900000b5618 CR3: 0000000115dee000 CR4:
> 00000000000406e0
> [   11.466308] Stack:
> [   11.468434]  ffffffffa00d1023 ffff88011a1e4ac8 ffff88011a1e4ba0
> ffffffffa005e076
> [   11.476255]  ffffc90000187e78 ffff8801196ab810 ffffffff812923c0
> ffff880119528dc0
> [   11.484073]  ffff88011a1ae4a0 ffff8801196ab810 ffffffffa00d11e8
> ffff8801196ab870
> [   11.491852] Call Trace:
> [   11.494427]  [<ffffffffa00d1023>] ? apu2_led_brightness_set+0x23/0x58
> [leds_apu]
> [   11.502178]  [<ffffffffa005e076>] ? led_classdev_unregister+0x46/0xa0
> [led_class]

Hmm. can you put debug prints where in brightness_set() it fails?

Is devm_() compatible with unregistering by hand?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm9LKIACgkQMOfwapXb+vK8ZQCgk8oIEoIyl7TLg2zZDR6Jhas0
VfYAn2rDt7T/YDMuUkTU/dw73JmjUJ8X
=xaFR
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
