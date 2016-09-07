From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch] leds: add driver for Mellanox systems leds
Date: Wed, 7 Sep 2016 13:01:28 +0000
Message-ID: <AM5PR0501MB209788B4D0A8A459075D1680A2F80@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
 <7c223316-4288-1a79-b8d5-67df583f1c0e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0080.outbound.protection.outlook.com ([104.47.2.80]:13369
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751527AbcIGPdP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Sep 2016 11:33:15 -0400
In-Reply-To: <7c223316-4288-1a79-b8d5-67df583f1c0e@samsung.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>

Hi Jacek,

Thank you for your comments.

> -----Original Message-----
> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> Sent: Wednesday, September 07, 2016 3:49 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; jiri@resnul=
li.us;
> Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [patch] leds: add driver for Mellanox systems leds
>=20
> Hi Vadim,
>=20
> On 09/07/2016 03:35 PM, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > This makes it possible to create a set of LEDs for Mellanox systems:
> > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > "msb7800", "msn2740", "msn2100".
> >
> > Driver obtains led devices according to system configuration, provided
> > through system DMI data, like fan1:green, fan1:red and creates devices
> > in
> > form: "devicename:colour:function".
> >
> > led setting is controlled through on board CPLD Lattice device.
> > For setting particular led off, solid, blink (blink requires
> > ledtrig-timer module):
> > echo 0 > /sys/class/leds/status\:green/brightness
> > echo 1 > /sys/class/leds/status\:green/brightness
> > echo timer > /sys/class/leds/status\:green/trigger
> >
>=20
> Thanks for the update, will review it soon.
>=20
> One important detail - please update patch version each time you're sendi=
ng a
> new one, like [PATCH v2].
>=20
Will do it in this format next time.
Thanks for this input.
Best regards,
Vadim.

> --
> Best regards,
> Jacek Anaszewski
