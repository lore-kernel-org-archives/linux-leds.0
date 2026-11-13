Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580812;
	b=ifJs2XN9JgIUz6IqOCUv1R3daozK1ltMq+FszjLpOJGmM/IRxwSGZPP6ZZyoznrtoCgA
	 Z5qfWuDh9EduB6z3qPNnLhH1b08j+LyZMMSXoaEVj7dFdj1F2pwJxZmiwLQVfvJmZ4eQm
	 Dy7/Ah49CBlZ6JV6Ymjd1E4GG7DTfYFhz70UvqDIfSsPoekiVTczSfvdb5w/T7qa2S3d1
	 T/TB0Otq3/GPNju4gP7YaO/E9bReFdjP+BNAl5RKDwXqVezuwYpkoF66OMSCAP+K65ESF
	 ol6JmqucuYnPx3ruw+kfPF4ePVqOVocZD2iTFPG+821B+uEFKJL1rZioKbOFOZc0K8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580812;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=bAzO2jvsh+10OE+xcVZSWOnug3m6lHgzg9OsPp9k7zM=;
	b=dr/xxe23hjvv5EOBFud26U+B4jyRR9wmYxtgc1APTKKHIRO+0E6aoILFt+cAFmkLAaMU
	 /hFmIXPntuGIbOXQpqlg0HatT670Tiy3OK/z5u+3/OFQ0FBxu4ivqw6s7KF3zJOZLYi8T
	 SNdoT9cO/YTDzX/CU4i/hHk8ebbFFODsjpWUd+HBki1a0qXDT0P9/tJQsg4hQ4J3umlr6
	 F8Ge5Dtwfrk+CHoFXPmkz6srQ83qNMCAdfDNI+J5OVpb14GRBjy2FH3Ca59qi57CFxBz0
	 NIwGVyZo6QRmHVR28ppPae/3eP6KLH5gSZv3v5NPXuG7LLREVZ7VxZSgzkb1C17SNSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDbosVdi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B3606A327
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDbosVdi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F161F000C4;
	Fri, 13 Nov 2026 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580812;
	bh=bAzO2jvsh+10OE+xcVZSWOnug3m6lHgzg9OsPp9k7zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDbosVdixYXb2BTAH8C5wgZ+thlJZYkWsNJ5UCtcq5/LntONDb+Neb+OrHPq+63kT
	 HgPtqVNspKn9tcbdswcJtS+bXTDTA7u0qTJTnOnJ+szMBpofiAH82xzxHpHS4KwdkC
	 gBwAuO/ruUhZS/CvoYIQczL6r/pbB5cxcSqfqkXagFEtBvt9124Sgo5uPPBN23Cb/1
	 kco9KzslMFieFdBI4NFGM5Mi0f/PnJhIJ2BALGcjXAsfeNql92dgjJcr8wvoD060cp
	 zxvmFeIDP5UsZUuB/2cBwd88alZNqEg21DDlRldfSJ2T9kEBL4BQoYU5+ijvs9RJ9L
	 y+qL24eLyVpmw==
Date: Fri, 13 Nov 2026 14:40:08 +0000
From: Lee Jones <lee@kernel.org>
To: Ch1rpy <ch1rpys0116@gmail.com>
Cc: linux-leds@vger.kernel.org, pavel@kernel.org
Subject: Re: [PATCH 1/2] leds: flash: qcom: correct the cleanup indexing
Message-ID: <179370042783.793788.16881227943544790052@kernel.org>
References: <179350178518.4281.3598581494157134937@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179350178518.4281.3598581494157134937@gmail.com>
X-AI-Review-Draft: <179350178518.4281.3598581494157134937@gmail.com>

--- checkpatch.pl (1 issue) ---
Line 12: WARNING: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")'
----------------------------------

On Sun, 01 Nov 2026, Ch1rpy wrote:

> The cleanup of the flash controller walks the registered LEDs and frees
> the slots it finds. It counted the entries first and decremented the
> count before it used the index, so the last entry was left registered
> and the next registration reused the slot.
>
> Do not stop the cleanup on a NULL slot: torch-only LEDs and
> configurations without the V4L2 wrapper may leave NULL entries, which
> v4l2_flash_release() already accepts.

This commit message describes a completely different change (which appears to
already be upstream as commit 75565a889829 ("leds: flash: leds-qcom-flash:
Release all V4L2 flash devices")) from the brightness/intensity conversion
changes in the diff below.

> Fixes: 96a2e242a5dc ("leds: flash: qcom: Fix cleanup of LED flash
> device on the platform with multiple LEDs")

Please don't wrap Fixes: lines, also the commit ID doesn't match the
subject?  What on earth is going on with this commit?

> Original patch by slwyts <slwyts@foxmail.com>.
> Link: https://github.com/slwyts/Project-SunUEFI/commit/34a31774179abd53cb226e3726ed1f6234edcc82
>
> Signed-off-by: Ch1rpy <ch1rpys0116@gmail.com>

Please use your full, real name in the 'Signed-off-by:' tag (and 'From:'
header), as required by Documentation/process/submitting-patches.rst.

> ---
>  drivers/leds/flash/leds-qcom-flash.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
> index b03a6833e3e3..b5844504aefb 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -654,7 +654,11 @@ qcom_flash_intensity_to_led_brightness(struct v4l2_flash *v4l2_flash, s32 intens
>  	if (!current_ma)
>  		return LED_OFF;
>
> -	return (current_ma * LED_FULL) / led->max_torch_current_ma;
> +	/* brightness_set() converts back with integer division. Round this
> +	 * encoding up so an exact 5mA/channel control step is not lost to a
> +	 * second truncation. The PMIC still rounds current down to its step.
> +	 */

This is an incorrect multi-line comment format.

> +	return DIV_ROUND_UP(current_ma * LED_FULL, led->max_torch_current_ma);
>  }
>
>  static s32 qcom_flash_brightness_to_led_intensity(struct v4l2_flash *v4l2_flash,
> @@ -662,8 +666,19 @@ static s32 qcom_flash_brightness_to_led_intensity(struct v4l2_flash *v4l2_flash,
>  {
>  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>  	struct qcom_flash_led *led = flcdev_to_qcom_fled(fled_cdev);
> +	u32 current_ma, steps;
> +
> +	if (!brightness)
> +		return 0;
>
> -	return (brightness * led->max_torch_current_ma * UA_PER_MA) / LED_FULL;
> +	/* Mirror brightness_set() then set_flash_current(): the total mA are
> +	 * split per channel, and ITARGET=0 is a nonzero 5mA minimum. Return the
> +	 * quantized total, not the unrepresentable LED scale fraction. Thermal
> +	 * limiting can still reduce the current during brightness_set().
> +	 */
> +	current_ma = brightness * led->max_torch_current_ma / LED_FULL;
> +	steps = (current_ma * UA_PER_MA / led->chan_count + 1) / TORCH_IRES_UA;
> +	return max_t(u32, steps, 1) * TORCH_IRES_UA * led->chan_count;
>  }
>
>  static const struct v4l2_flash_ops qcom_v4l2_flash_ops = {
> -- 
> 2.54.0 (Apple Git-157)
>

-- 
Lee Jones
