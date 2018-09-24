From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 24 Sep 2018 16:54:52 -0700
Message-ID: <20180924235452.GI2523@minitux>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon 10 Sep 19:47 PDT 2018, Baolin Wang wrote:
[..]
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
> +What:		/sys/class/leds/<led>/repeat
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a pattern repeat number. -1 means repeat indefinitely,
> +		other negative numbers and number 0 are invalid.
> +
> +		This file will always return the originally written repeat
> +		number.

This captures the infinite case much better, thanks!

Given that 0 is described as invalid, does this imply that setting a new
pattern the repeat will be disabled? And hence if my hardware supports
only infinite or no-repeat setting a new pattern is the way to disable
further repeats (rather than just setting repeat = 0)?


Regardless, I believe the semantics of these two files will work fine
for my Qualcomm LPG driver.

Regards,
Bjorn
