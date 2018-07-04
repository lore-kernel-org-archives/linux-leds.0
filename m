From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 09:34:43 +0200
Message-ID: <20180704073443.GA9388@1wt.eu>
References: <20180703155328.GA18299@arbeit>
 <20180704065305.GA23509@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180704065305.GA23509@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andreas Klinger <ak@it-klinger.de>, jacek.anaszewski@gmail.com, ben.whitten@gmail.com, geert+renesas@glider.be, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On Wed, Jul 04, 2018 at 08:53:05AM +0200, Pavel Machek wrote:
> As I stated before, I don't think morse encoder belongs in kernel.

On the opposite, I think that the kernel needs to be a bit more autonomous
when it comes to reporting its own issues. Being able to report a panic
when userland cannot be accessed for example is the reason why we've seen
various features such as blinking keyboard LEDs for this.

> LED pattern trigger should be merged, instead.

Well, just like we have LED and LED triggers in the kernel, I think having
a generic way to use patterns could be nice and in this case Morse could be
one such pattern, but if that means it's limited to userland to configure
it then it sadly voids all of its benefits.

Last, as I showed on my previous mail in this thread, the Morse encoding
can be brought to 36 bytes, which is much less than even the registration
code needed to feed it. At some point we need to focus on code efficiency
and doing things right instead of how too many layers look like from far
away. While I don't need Morse right now I consider it as a nice addition
I would definitely enable by default on all my boards if it helps provide
details about what prevents my system from booting or what just killed it.

Cheers,
Willy
