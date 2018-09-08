From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v8 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 7 Sep 2018 22:02:08 -0700
Message-ID: <20180908050208.GY2523@minitux>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536027873.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue 04 Sep 04:01 PDT 2018, Baolin Wang wrote:

> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
[..]
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a hardware pattern for the LED, for LED hardware that
> +		supports autonomously controlling brightness over time, according
> +		to some preprogrammed hardware patterns.
> +
> +		Since different LED hardware can have different semantics of
> +		hardware patterns, each driver is expected to provide its own
> +		description for the hardware patterns in their ABI documentation
> +		file.
> +

So, after a full circle we're back at drivers with support for hardware
patterns should have their own ABI for setting that pattern.

The controls for my hardware is:
* a list of brightness values
* the rate of the pattern
* a flag to indicate that the pattern should be played from start
  to end, end to start or start to end to start
* a boolean indicating if the pattern should be played once or repeated
  indefinitely.

Given that the interface now is hw specific, what benefit is there to
attempt to cram these 4 knobs into "hw_pattern"? Or am I allowed to
create additional files for the latter three?

> +What:		/sys/class/leds/<led>/repeat
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a pattern repeat number. 0 means repeat indefinitely.
> +
> +		This file will always return the originally written repeat
> +		number.

I'm still convinced that this will confuse our users and to me it would
be more logical if this denotes the number of times the pattern should
be repeated, with e.g. negative numbers denoting infinite.

In particular I expect to have to explain why my driver expects that you
write 0 in the file named "repeat" to make it repeat and 1 to make it
not repeat.

Regards,
Bjorn
