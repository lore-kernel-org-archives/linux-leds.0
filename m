From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 07/16] dell-smbios: don't return an SMBIOS buffer from
 dell_smbios_send_request()
Date: Tue, 9 Feb 2016 14:27:36 +0100
Message-ID: <20160209132736.GA7443@eudyptula.hq.kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
 <20160208184456.GM1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160208184456.GM1779@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > An SMBIOS buffer pointer does not need to be returned by
> > dell_smbios_send_request(), because SMBIOS call results are stored =
in
> > the buffer passed as input.
>=20
> This should come before 6/16, update the commit message to reflect th=
e module
> exported buffer (not the one passed as input), or possibly just merge=
 this patch
> and 6/16 as correcting the use of SMBIOS buffer within the module.

I have only now noticed that I phrased the commit message for this patc=
h
rather unfortunately as it inappropriately conveyed my reasoning.  What
I meant by "the buffer passed as input" was not "the buffer passed as a=
n
argument to dell_smbios_send_request()", but rather "the buffer passed
to the SMI handler".  In other words, there is no reason to return a
buffer from dell_smbios_send_request(), because each caller will simply
find their output in the same buffer they used to provide input (no
matter whether the latter is passed as a function argument or accessed
using a module-wide variable).

Anyway, as even the above explanation is hardly a stellar demonstration
of clarity, I believe your idea of resolving this issue may simply be
the best one, thanks.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
