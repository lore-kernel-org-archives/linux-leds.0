From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: leds-bcm6328: add more init configuration options
Date: Mon, 16 Nov 2015 16:03:28 +0100
Message-ID: <5649F040.6090002@samsung.com>
References: <5648C090.9060904@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22731 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbKPPDc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 10:03:32 -0500
In-reply-to: <5648C090.9060904@simon.arlott.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org

Hi Simon,

On 11/15/2015 06:27 PM, Simon Arlott wrote:
> commit 1d3ff22d633d35048c35c3deeead7ab116cebc32
> Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Date:   Thu Oct 8 12:35:55 2015 +0200
>
>      Documentation: leds: update DT bindings for leds-bcm6328
>
>      This patch adds latest DT bindings for leds-bcm6328 init registe=
r
>      configuration.
>
> commit 9f82c778ce17789a038351a411ff65cd41033c7a
> Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Date:   Thu Oct 8 12:35:54 2015 +0200
>
>      leds-bcm6328: add more init configuration options
>
>      This patch adds more init register configuration options:
>      - Serial LEDs multiplexing.
>      - Serial LEDs clock signal low/high polarity.
>      - Serial LEDs data signal low/high polarity.
>      - Serial LEDs shift direction inverted/normal.
>
> This was not a backwards-compatible change, because the driver is now
> turning off all of the serial LED options by default when previously
> it only turned off brcm,serial-leds and left the other options
> unchanged.
>
> There are currently no in-tree users of this binding, so any existing
> users will be broken by this change.
>

Please submit a patch fixing the issue in such cases, so that we could
discuss possible solutions to the problem.

--=20
Best Regards,
Jacek Anaszewski
