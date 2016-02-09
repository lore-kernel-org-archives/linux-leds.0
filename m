From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 07/16] dell-smbios: don't return an SMBIOS buffer from
 dell_smbios_send_request()
Date: Tue, 9 Feb 2016 08:50:27 -0800
Message-ID: <20160209165027.GA1309@dvhart-mobl5.amr.corp.intel.com>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
 <20160208184456.GM1779@malice.jf.intel.com>
 <20160209132736.GA7443@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160209132736.GA7443@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Feb 09, 2016 at 02:27:36PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > > An SMBIOS buffer pointer does not need to be returned by
> > > dell_smbios_send_request(), because SMBIOS call results are store=
d in
> > > the buffer passed as input.
> >=20
> > This should come before 6/16, update the commit message to reflect =
the module
> > exported buffer (not the one passed as input), or possibly just mer=
ge this patch
> > and 6/16 as correcting the use of SMBIOS buffer within the module.
>=20
> I have only now noticed that I phrased the commit message for this pa=
tch
> rather unfortunately as it inappropriately conveyed my reasoning.  Wh=
at
> I meant by "the buffer passed as input" was not "the buffer passed as=
 an
> argument to dell_smbios_send_request()", but rather "the buffer passe=
d
> to the SMI handler".  In other words, there is no reason to return a
> buffer from dell_smbios_send_request(), because each caller will simp=
ly
> find their output in the same buffer they used to provide input (no
> matter whether the latter is passed as a function argument or accesse=
d
> using a module-wide variable).
>=20
> Anyway, as even the above explanation is hardly a stellar demonstrati=
on
> of clarity, I believe your idea of resolving this issue may simply be
> the best one, thanks.

In my tree, I reworded this as:

    dell-smbios: don't return an SMBIOS buffer from dell_smbios_send_re=
quest()

    An SMBIOS buffer pointer does not need to be returned by
    dell_smbios_send_request(), because SMBIOS call results are stored =
in
    the buffer exported by the module.

Is that acceptable?

--=20
Darren Hart
Intel Open Source Technology Center
