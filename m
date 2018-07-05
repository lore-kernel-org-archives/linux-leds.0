From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Thu, 5 Jul 2018 10:56:46 +0000
Message-ID: <6db92ee3e66a45338c187ad575a759c2@AcuMS.aculab.com>
References: <20180703155328.GA18299@arbeit> <20180704065305.GA23509@amd>
 <20180704073443.GA9388@1wt.eu> <20180704181916.GA10785@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704181916.GA10785@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>, Willy Tarreau <w@1wt.eu>
Cc: Andreas Klinger <ak@it-klinger.de>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "ben.whitten@gmail.com" <ben.whitten@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "pombredanne@nexb.com" <pombredanne@nexb.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

...
> > Well, just like we have LED and LED triggers in the kernel, I think having
> > a generic way to use patterns could be nice and in this case Morse could be
> > one such pattern, but if that means it's limited to userland to configure
> > it then it sadly voids all of its benefits.

I've been involved in a system that used morse for short error messages.
Unless you actually know morse it is completely hopeless.

With two leds next to each other you should be able to generate
a lot of easily identifiable patterns by repeating separate 4-bit
patterns (in sync) on both leds (at about 2Hz update).

	David
