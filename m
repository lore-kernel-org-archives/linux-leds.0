From: Andrey Utkin <andrey_utkin@fastmail.com>
Subject: Re: [PATCH v3 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light
 effect led driver
Date: Fri, 8 Jul 2016 23:53:42 +0300
Message-ID: <20160708205342.GT5934@zver>
References: <cover.1468007377.git.hns@goldelico.com>
 <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54797 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753798AbcGHUya (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 8 Jul 2016 16:54:30 -0400
Content-Disposition: inline
In-Reply-To: <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org

On Fri, Jul 08, 2016 at 09:49:37PM +0200, H. Nikolaus Schaller wrote:
> +static int is31fl319x_microamp_to_cs(u32 microamp)
> +{
> +	switch (microamp) {
> +	default:
> +		WARN(1, "Invalid microamp setting");
> +	case 20000: return 0;
> +	case 15000: return 1;
> +	case 10000: return 2;
> +	case 5000:  return 3;
> +	case 40000: return 4;
> +	case 35000: return 5;
> +	case 30000: return 6;
> +	case 25000: return 7;
> +	}
> +}
> +
...
> +	regmap_write(is31->regmap, IS31FL319X_CONFIG2,
> +		     is31fl319x_microamp_to_cs(aggregated_led_microamp) << 4 |
> +		     is31->audio_gain_db / 3);

As I figured out by now, previous implementation of current setting (by
inline expression) was fine, this new one is just more obvious. So if
you wonder why it was replaced, I can say - "because of
misunderstanding". So switching back to that implementation is possible.

> +static struct i2c_driver is31fl319x_driver = {
> +	.driver   = {
> +		.name    = "leds-is31fl319x",
> +		.of_match_table = of_match_ptr(of_is31fl319x_leds_match),

Broken alignment :/ If this gets another iteration, i'll fix it.
