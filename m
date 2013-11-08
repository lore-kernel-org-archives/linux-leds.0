From: Joe Perches <joe@perches.com>
Subject: Re: PATCH] LEDS: tca6507 - fix up some comments.
Date: Thu, 07 Nov 2013 19:24:36 -0800
Message-ID: <1383881076.9263.64.camel@joe-AO722>
References: <20131101134120.13a44225@notabene.brown>
	 <CAK5ve-LzYLr0xuvNA3MX=pECPPfAkDFqExPpmQt8GF+9jf5uHg@mail.gmail.com>
	 <20131108142004.10e31655@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131108142004.10e31655@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Belisko Marek <marek.belisko@gmail.com>, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: linux-leds@vger.kernel.org

On Fri, 2013-11-08 at 14:20 +1100, NeilBrown wrote:
> In particular fix the capitalisation of GPIO and LED and
> correct TCA6507_MAKE_CPIO, but also rewrite the comment about
> platform-data to include reference to devicetree.

trivia:

> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
[]
> @@ -8,7 +8,7 @@
>   * double-blink.
>   *
>   * This driver can configure each line either as a 'GPIO' which is out-only
> - * (no pull-up) or as an LED with variable brightness and hardware-assisted
> + * (pull-up resistor required) or as an LED with variable brightness and hardware-assisted
>   * blinking.

Please rewrap the comment to 80 cols.
