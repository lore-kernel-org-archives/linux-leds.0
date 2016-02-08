From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 07/16] dell-smbios: don't return an SMBIOS buffer from
 dell_smbios_send_request()
Date: Mon, 8 Feb 2016 10:44:56 -0800
Message-ID: <20160208184456.GM1779@malice.jf.intel.com>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 22, 2016 at 03:27:19PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> An SMBIOS buffer pointer does not need to be returned by
> dell_smbios_send_request(), because SMBIOS call results are stored in
> the buffer passed as input.

This should come before 6/16, update the commit message to reflect the =
module
exported buffer (not the one passed as input), or possibly just merge t=
his patch
and 6/16 as correcting the use of SMBIOS buffer within the module.

--=20
Darren Hart
Intel Open Source Technology Center
