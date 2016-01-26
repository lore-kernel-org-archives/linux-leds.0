From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 01/16] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Tue, 26 Jan 2016 14:33:46 +0100
Message-ID: <20160126133346.GA23823@eudyptula.hq.kempniu.pl>
References: <1453472848-3118-2-git-send-email-kernel@kempniu.pl>
 <201601241024.msPP2mSE%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601241024.msPP2mSE%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> Hi Micha=C5=82,
>=20
> [auto build test ERROR on platform-drivers-x86/for-next]
> [also build test ERROR on v4.4 next-20160122]
> [if your patch is applied to the wrong git tree, please drop us a not=
e to help improving the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Micha-K-pie/Common-D=
ell-SMBIOS-API/20160122-223550
> base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x=
86.git for-next
> config: x86_64-randconfig-n0-01240935 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64=20
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/platform/x86/dell-smbios.c: In function 'dell_send_request=
':
> >> drivers/platform/x86/dell-smbios.c:71:16: error: implicit declarat=
ion of function 'virt_to_phys' [-Werror=3Dimplicit-function-declaration=
]
>      command.ebx =3D virt_to_phys(buffer);
>                    ^
>    cc1: some warnings being treated as errors

Nice catch, turns out I missed the <linux/io.h> include in
dell-smbios.c, but that only causes errors for non-SMP builds.

I'll keep that in mind for v3 of this series, if it happens.  If not,
I'll post a v3 of just this patch once the rest of the series gets
acked.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
