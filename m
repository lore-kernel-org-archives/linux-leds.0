From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 07/16] dell-smbios: don't return an SMBIOS buffer from
 dell_smbios_send_request()
Date: Tue, 9 Feb 2016 18:34:42 +0100
Message-ID: <20160209173442.GA8256@eudyptula.hq.kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
 <20160208184456.GM1779@malice.jf.intel.com>
 <20160209132736.GA7443@eudyptula.hq.kempniu.pl>
 <20160209165027.GA1309@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160209165027.GA1309@dvhart-mobl5.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > > > An SMBIOS buffer pointer does not need to be returned by
> > > > dell_smbios_send_request(), because SMBIOS call results are sto=
red in
> > > > the buffer passed as input.
> In my tree, I reworded this as:
>=20
>     dell-smbios: don't return an SMBIOS buffer from dell_smbios_send_=
request()
>=20
>     An SMBIOS buffer pointer does not need to be returned by
>     dell_smbios_send_request(), because SMBIOS call results are store=
d in
>     the buffer exported by the module.
>=20
> Is that acceptable?

Sure, thanks.  I saw the edited commit message in your tree before
sending my previous message and I liked it.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
