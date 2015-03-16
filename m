From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] leds: Add arbitrary pattern trigger
Date: Mon, 16 Mar 2015 13:40:18 +0100
Message-ID: <1426509618.26437.43.camel@x220>
References: <1424334377.11286.3.camel@localhost>
	 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
	 <20150310080042.GA27585@amd> <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
	 <20150310192226.GB11260@amd> <1426086614.59115.14.camel@localhost>
	 <20150311190255.GA20247@amd> <1426500410.11707.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:60784 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751170AbbCPMkV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Mon, 16 Mar 2015 08:40:21 -0400
In-Reply-To: <1426500410.11707.6.camel@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Bryan Wu <cooloney@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Just a license nit.

On Mon, 2015-03-16 at 11:06 +0100, Rapha=C3=ABl Teysseyre wrote:
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-pattern.c

> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

This states that the license is GPL v2.

> +MODULE_LICENSE("GPL");

And
    MODULE_LICENSE("GPL v2");

would match that statement.


Paul Bolle
