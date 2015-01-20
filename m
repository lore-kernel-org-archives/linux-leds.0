From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Tue, 20 Jan 2015 14:33:19 +0100
Message-ID: <CAMuHMdWAVFsVwGFVkPGBCW9hfStbOeFxF44SESkyw7ta9yXcog@mail.gmail.com>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch>
	<54B9259C.3070403@ti.com>
	<20150116191734.GB31577@lunn.ch>
	<54BE258A.10808@ti.com>
	<20150120132613.GJ2938@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:46843 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbATNdV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 20 Jan 2015 08:33:21 -0500
In-Reply-To: <20150120132613.GJ2938@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "R, Vignesh" <vigneshr@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux ARM <linux-arm-kernel@lists.infradead.org>, Imre Kaloz <kaloz@openwrt.org>, Matthew.Fatheree@belkin.com, Sekhar Nori <nsekhar@ti.com>

On Tue, Jan 20, 2015 at 2:26 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> led-gpio looks like more work, but i don't see why it should not be
> possible. One thing i do need to check is that if the brightness is
> set to 255 the output is not set to 255/256 on and you have a regular

is set to 255/256?

> glitch. For an LED that does not really matter, but for GPIO it would
> not be good.

Indeed.

Gr{oetje,eeting}s,

                        Geert, who had a quick look at the data sheet recently

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
